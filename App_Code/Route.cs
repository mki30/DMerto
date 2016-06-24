using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DelhiMetroTableAdapters;
using System.Text;
using System.IO;
using System.Globalization;

/// <summary>
/// Summary description for Route
/// </summary>
public class Route :BasePage
{
    public new int ID;
    public string Name = "";
    public string RouteCode = "";
    public string Color = "c0c0c0";
    public int StationFirstID;
    public string StationFirstName= "";
    public int StationLastID;
    public string StationLastName = "";
    
	public Route()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static DelhiMetro.RouteRow GetRoute(int RouteID)
    {

        using (RouteTableAdapter ta = new RouteTableAdapter())
        {
            DelhiMetro.RouteDataTable dt = ta.GetDataByID(RouteID);
            if (dt.Rows.Count > 0)
                return dt[0];
        }

        return null;
    }

    public string GetRoute(int StationFromID,int StationToID,Page page,Boolean IsLocalHost=false)
    {
        string Culture = CultureInfo.CurrentCulture.TwoLetterISOLanguageName;
        string FileName = HttpContext.Current.Server.MapPath(@"~\Data\DelhiMetro\" + StationFromID + "-" + StationToID + "-" + Culture + ".txt");

        if(File.Exists(FileName))
            return File.ReadAllText(FileName);

        ShortPathHelper sp = new ShortPathHelper().GetPath(StationFromID, StationToID);

        StringBuilder str =new StringBuilder("<td valign='top'>");

        if (sp.Message == "")
        {
            //Response.Write("Total Distance " + shortpath.TotalPathDistance + "<br/>");

            DelhiMetro.FareDataTable dtFare = null;
            using (FareTableAdapter ta = new FareTableAdapter())
            {
                dtFare = ta.GetData();
            }
           double Distance = 0;
            DateTime TravelTime = DateTime.Today;
            Boolean IsAfterInterchange = false;

            StringBuilder strTemp = new StringBuilder();


            int StnFirstID = 0, StnLastID = 0;
            if (sp.Path.Count > 0)
            {

                StnFirstID = sp.Path[0].StationFirstID;
                StnLastID = sp.Path[sp.Path.Count - 1].StationLastID;

                Station StationFirst = Station.GetStation(StnFirstID);

                DateTime? TimeLastOfFirstStnToDest = Station.GetFirstStationTime(StnFirstID, StnLastID);
                if (TimeLastOfFirstStnToDest == null)
                {
                    StnFirstID = sp.Path[0].StationLastID;
                    StnLastID = sp.Path[sp.Path.Count - 1].StationFirstID;
                    TimeLastOfFirstStnToDest = Station.GetFirstStationTime(StnFirstID, StnLastID);
                }

                DateTime? TimeLastOfFirstStn = Station.GetLastTime(StnFirstID);

                for (int i = 0; i < sp.Path.Count; i++)
                {
                    Station S = sp.Path[i];

                    // if the the parent station has been selected and the next connection is to the child station via the 
                    // the interchange, then skip the first station.
                    if (sp.Path.Count > 1 && i == 0)
                    {
                        if (sp.Path[1].ParentStnID == StationFromID)
                            continue;
                    }

                    DelhiMetro.FareRow dr = dtFare.FindByStationFromIDStationToID(StationFromID, S.StationID);//Global.SelectedMetro,

                    if (i > 0)
                    {

                        Distance += S.DistanceFromPreviousStation;
                        Boolean AddTime = true;
                        if (S.TimeFirst != null && sp.Path[i - 1].TimeFirst != null)
                        {
                            TimeSpan ts = Cmn.ToDate(Cmn.ToDate(S.TimeFirst).ToString("HH:mm:ss")) - Cmn.ToDate(Cmn.ToDate(sp.Path[i - 1].TimeFirst).ToString("HH:mm:ss"));

                            if (ts.TotalSeconds > 0)
                            {
                                TravelTime = TravelTime.AddSeconds(ts.TotalSeconds);
                                AddTime = false;
                            }
                        }

                        if (AddTime)
                        {
                            TravelTime = TravelTime.AddSeconds(S.DistanceFromPreviousStation / 60 * 3600);
                            TravelTime = TravelTime.AddSeconds(30); // stoppage
                        }

                        if (i > 0 && sp.Path[i - 1].IsInterchange) // add inter change time if the previous connection was from a interchange station
                            TravelTime = TravelTime.AddSeconds(180); // stoppage

                    }
                    
                    DateTime? TimeLast = null;

                    if (TimeLastOfFirstStnToDest != null && TimeLastOfFirstStn != null && S.TimeLast != null)
                    {
                        DateTime A = Cmn.ToDate(Cmn.ToDate(TimeLastOfFirstStn).ToString("HH:mm:ss"));
                        DateTime B = Cmn.ToDate(Cmn.ToDate(S.TimeLast).ToString("HH:mm:ss"));

                        double d = (B - A).TotalMinutes;
                        TimeLast = Cmn.ToDate(TimeLastOfFirstStnToDest).AddMinutes(d);
                    }
                    string TimeFormat = IsLocalHost ? "HH:mm:ss" : "HH:mm";
                    // <a href='" + ResolveClientUrl("~/station") + "/" + S.Name + "'>" + S.Name + "</a>;//
                    strTemp.Append("<tr><td style='background-color:#" + S.RouteColor + "'>"
                        + S.SerialNo.ToString("00") + (IsLocalHost ? "-" + S.StationID : "")
                        + "<td><a href='" + page.ResolveClientUrl("~/station/" + S.Name.ToString().Replace(" ","_")) + "'>" 
                        + (CurrentLanguage==Language.English? S.Name :S.NameHindi)
                        + "</a>" + (IsLocalHost ? "(" + S.StationFirstID + "-" + S.StationLastID + ")" : "")
                        + "<td>" + (dr != null ? dr.Fare.ToString() : "")
                        + "<td>" + S.RouteCode
                        + "<td>" + S.PlatformNumber
                        + "<td>" + (i == 0 ? "" : S.Track == "L" ? "Left" : "Right")
                        + "<td>" + (S.TimeFirst != null ? Cmn.ToDate(S.TimeFirst).ToString(TimeFormat) : "")
                        + "<td>" + (S.TimeLast != null ? Cmn.ToDate(S.TimeLast).ToString(TimeFormat) : "")
                        + "<td>" + (IsAfterInterchange || S.IsInterchange ? "" : (TimeLast != null ? Cmn.ToDate(TimeLast).ToString(TimeFormat) : ""))
                        + "<td>" + Distance.ToString("0.0")
                        + "<td>" + TravelTime.ToString(TimeFormat)
                        );

                    // Stop at the parent station if the child station has been selected for route finding and the child station is connected via
                    // the interchange connection
                    if (S.ParentStnID == StationToID)
                        break;


                    if (S.IsInterchange)
                    {
                        strTemp.Append("<tr><td colspan='11' style='background-color:#c0c0c0;text-align:center'>Interchange" + (S.RouteID == 53 ? " walk" : " bridge"));
                        IsAfterInterchange = true;
                    }
                }

                str.Append("<table cellspacing='1' cellpadding='3'  style='margin:auto;width:600px;'>");
                str.Append("<caption style='text-align:left'>"
                    + "<br/>Phone No :<b>" + sp.Path[0].Phone + "</b>"
                + "</caption>");

                if(CurrentLanguage==Language.English)
                    str.Append("<tr><th>SNo.<th>Station<th>Fare<th>Line<th>PF<th>Alight<th>First<th>Last<th>Dest. Last<th>Dist<th>Time");
                else
                    str.Append("<tr><th>SNo.<th>स्टेशन<th>किराये<th>लाइन<th>प्लेटफार्म<th>उतरना<th>प्रथम मेट्रो<th>अंतिम<th>अंतिम मेट्रो<th>गंतव्य<th>Time");

                str.Append(strTemp.ToString());
                str.Append("</table>");
            }

            if (Global.SelectedMetro == 1)
            {
                //str.Append( "<tr><td colspan='11'>" + DelhiParking(StationFromID));
                str.Append(DelhiParking(StationFromID));
            }
        }

        if(sp.Message =="")
            File.WriteAllText(FileName, str.ToString());

        return sp.Message + str.ToString();
    }

    string DelhiParking(int StationID)
    {
        string str = "<br/><br/><center><table cellspacing='1' cellpadding='3' style='text-align:center'><tr><b>Vehicle parking charges</b></tr><tr><td  rowspan='2'>Vehicle<td colspan='3'>Daily hours<td rowspan='2'>Monthly <td colspan='2'>Night Charges (Extra)";
        str += "<tr><td>< 6 hrs.<td>< 12 hrs.<td>12 hrs.><td>Daily<td>Monthly";
        if (true)
        {

            str += "<tr><td>Car<td>10<td>15<td>25<td>625<td>25<td>625";
            str += "<tr><td>Bike<td>5<td>8<td>12<td>300<td>12<td>300";
            str += "<tr><td>Cycle<td>2<td>3<td>4<td>30<td>4<td>30";
        }
        else
        {
            str += "<tr><td>CAR/Taxi<td>10<td>15<td>25<td>625<td>25<td>625";
            str += "<tr><td>Motor Cycle / Scooter/ Auto-Rickshaw<td>5<td>8<td>12<td>300<td>12<td>300";
            str += "<tr><td>Cycle<td>2<td>3<td>4<td>30<td>4<td>30";
        }

        str += "</table></center>";

        return str;
    }

    public static List<Route> GetList(int MetroID)
    {
        DataBase db = new DataBase();

        List<Route> RouteList=new List<Route>();
        try
        {
            string Error = "";

            string SQL = "SELECT Route.*, Station.DisplayName as StationFirstName, Station_1.DisplayName as StationLastName"
                    + " FROM (Route LEFT JOIN Station ON Route.StationFirstID = Station.ID) LEFT JOIN Station AS Station_1 ON Route.StationLastID = Station_1.ID"
                    + " where Route.MetroID=0 or Route.MetroID= " + MetroID + " order by RouteShortName";
            
            using (IDataReader dr = db.GetDataReader(SQL, ref Error))
            {

                while (dr.Read())
                {
                    Route R = new Route()
                    {
                        ID = Cmn.ToInt(dr["ID"]),
                        Name = dr["RouteShortName"].ToString(),
                        RouteCode = dr["RouteCode"].ToString(),
                        Color = dr["RouteColor"].ToString(),
                        StationFirstID = Cmn.ToInt(dr["StationFirstID"]),
                        StationLastID = Cmn.ToInt(dr["StationLastID"]),
                        StationFirstName = Cmn.ProperCase( dr["StationFirstName"]),
                        StationLastName = Cmn.ProperCase(dr["StationLastName"])

                    };

                    RouteList.Add(R);
                }
            }
        }
        catch(Exception ex)
        {
            string e = ex.Message;
        }
        finally
        {
            db.Close();
        }

        return RouteList;
    }

    public static void FillRouteList(DropDownList dropdownlist)
    {
        dropdownlist.Items.Clear();

        List<Route> Routes = GetList(Global.SelectedMetro);

        foreach (Route R in Routes)
        {

            ListItem l = new ListItem(R.RouteCode + "-" + R.StationFirstName + "-" + R.StationLastName, R.ID.ToString());
            l.Attributes.CssStyle.Add("background-color", "#" + R.Color);

            if (Cmn.ToInt(R.Color) == 0)
                l.Attributes.CssStyle.Add("color", "white");

            dropdownlist.Items.Add(l);
        }
    }
}