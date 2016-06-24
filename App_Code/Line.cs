using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;
using System.Web.UI.Adapters;
using System.Web.UI;
//using System.Web.UI.TemplateControl;


/// <summary>
/// Summary description for Line
/// </summary>
public class Line : BasePage
{
    public Line()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //void Distance()
    //{
    //    int i;
    //    double Distance;
    //    Station S;
    //    if (i > 0)
    //    {

    //        Distance += S.DistanceFromPreviousStation;
    //        Boolean AddTime = true;
    //        if (S.TimeFirst != null && sp.Path[i - 1].TimeFirst != null)
    //        {
    //            TimeSpan ts = Cmn.ToDate(Cmn.ToDate(S.TimeFirst).ToString("HH:mm:ss")) - Cmn.ToDate(Cmn.ToDate(sp.Path[i - 1].TimeFirst).ToString("HH:mm:ss"));

    //            if (ts.TotalSeconds > 0)
    //            {
                   
    //                AddTime = false;
    //            }
    //        }

           

            

    //    }
    //}

    public string GetLines(int LineID, Page page)
    {
        DataBase db = new DataBase();
        StringBuilder sb = new StringBuilder();
        String error = "", str = "";
       


        using (IDataReader dr = db.GetDataReader("Select * from Route where MetroID=1", ref error))
        {

            while (dr.Read())
            {
                if (LineID != 0 && LineID.ToString() != dr["ID"].ToString())

                    continue;

                str += "<table cellpadding='1' cellspacing='1' style='width:100%;white-space:nowrap;text-indent:3px;'>";
                str += "<caption style='background-color:#" + dr["RouteColor"] + "'>";
                str += "<img src='" + Cmn.GetRootPathVirtual + "/Images/Delhimetro/hd-bg-red.jpg' /> ";

               
                str += "<a href='" + page.ResolveClientUrl(@"~\line\")
                    + dr["RouteLongName"] + "'>" + dr["RouteLongName"] + " </a> </caption>";

                if (CurrentLanguage == Language.English)
                {

                    str += "<tr><th Width='5%'>ID<th  Width='18%'>StationName<th Width='5%'>Dis<th Width='10%'>Phone<th Width='10%'>Mobile<th Width='15%'>Opening<th Width='8%'>Connections<th Width='10%'>Layout<th Width='17%'>TouristsPlace";
                }
                else
                    str += "<tr><th Width='5%'>ID<th Width='18%'>स्टेशन<th Width='5%'>Dis<th Width='10%'>फोन<th Width='10%'>मोबाइल<th Width='15%'>उद्घाटन<th Width='8%'>कनेक्शन<th Width='10%'>लेआउट<th Width='17%'>पर्यटक प्लेस";
                double previosLat = 0;
                double previousLong = 0;
                double totaldis = 0;
                using (IDataReader dr1 = db.GetDataReader("Select * from Station where RouteID=" + dr["ID"] + " order by SeqNo", ref error))
                {
                  
                    while (dr1.Read())
                    {
                        str += "<tr><td>" + dr1["SeqNo"];
                        str += "<td><a href='" + page.ResolveClientUrl("~/station") + "/" + dr1["DisplayName"] + "'>"
                            + (CurrentLanguage == Language.English ? dr1["DisplayName"] : dr1["HindiName"]) + "</a>";

                        if (previosLat == 0)
                            previosLat = Cmn.ToDbl(dr1["Lat"]);
                        if (previousLong == 0)
                            previousLong = Cmn.ToDbl(dr1["Lng"]);

                        double distance = GeoCodeCalc.CalcDistance(previosLat, previousLong, Cmn.ToDbl(dr1["Lat"]), Cmn.ToDbl(dr1["Lng"]), GeoCodeCalcMeasurement.Kilometers);
                        totaldis = totaldis + distance;
                        str += "<td>" + totaldis.ToString("0.0");
                        str += "<td>" + dr1["Phone"];
                        str += "<td>" + dr1["Mobile"];
                        str += "<td>" + Cmn.ToDate(dr1["Opening"]).ToString("dd-MMM-yyyy");

                        Line L = new Line();

                        object connection = HttpContext.GetLocalResourceObject(page.AppRelativeVirtualPath, dr1["Connections"].ToString());
                        if (connection != null && connection.ToString() != "None" && connection.ToString() != "कोई नहीं")
                            str += "<td>" + "<a href='" + page.ResolveClientUrl(@"~\line\") + dr1["Connections"].ToString().Replace(" ", "_") + "'>"
                                + (connection != null ? connection.ToString() : "") + "</a>";

                        else
                            str += "<td>" + (connection != null ? connection.ToString() : "" + "</a>");

                        object data = HttpContext.GetLocalResourceObject(page.AppRelativeVirtualPath, dr1["Layout"].ToString());

                        str += "<td>" + (data != null ? data.ToString() : "");

                        str += "<td>";
                        using (IDataReader dr2 = db.GetDataReader("Select TouristPlaceName from Touristsplace where StationID =" + dr1["ID"], ref error))
                        {
                            while (dr2.Read())
                            {

                                object TouristPlaceName = HttpContext.GetLocalResourceObject(page.AppRelativeVirtualPath, dr2["TouristPlaceName"].ToString());
                                str += "<a href='" + page.ResolveClientUrl("#") + "/" + dr2["TouristPlaceName"] + "'>"
                                    + (TouristPlaceName != null ? TouristPlaceName.ToString() : "") + "</a>";
                            }
                            
                        }

                        //using (IDataReader dr3 = db.GetDataReader("Select * from StationConnection where MetroID=" + dr["MetroID"], ref error))
                        //{

                        //    foreach (DelhiMetro.StationConnectionRow dr in dt.Rows)
                        //    {
                        //        Station StnFrom = Station.GetStation(dr.StationFromID);
                        //        Station StnTo = Station.GetStation(dr.StationToID);

                        //        dr.Distance = GeoCodeCalc.CalcDistance(StnFrom.Lat, StnFrom.Lng, StnTo.Lat, StnTo.Lng, GeoCodeCalcMeasurement.Kilometers);
                        //    }
                        //    while (dr3.Read())
                        //    {
                        //        str += "<td>" + dr.["Distance"].t ;
                        //    }
                        //}
                    }
                }

                str += "</table><br/>";
            }

        }
        sb.Append(str);

        return sb.ToString();
    }
}