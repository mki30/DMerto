using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using DelhiMetroTableAdapters;
using RRA_Graph;

public partial class Data : BasePage
{
    StringBuilder str = new StringBuilder();
    DataBase db = new DataBase();
    

    protected new void Page_Load(object sender, EventArgs e)
    {
        string Action = Request.QueryString["Action"] != null ? Request.QueryString["Action"].ToString() : "";
        string Data1 = Request.QueryString["Data1"] != null ? Request.QueryString["Data1"].ToString() : "";
        string Data2 = Request.QueryString["Data2"] != null ? Request.QueryString["Data2"].ToString() : "";
        string Data3 = Request.QueryString["Data3"] != null ? Request.QueryString["Data3"].ToString() : "";
        string Data4 = Request.QueryString["Data4"] != null ? Request.QueryString["Data4"].ToString() : "";
        string Data5 = Request.QueryString["Data5"] != null ? Request.QueryString["Data5"].ToString() : "";
        string term = Request.QueryString["term"] != null ? Request.QueryString["term"].ToString() : "";


        string Error = "";    
        Boolean ApprendError = true;
        try
        {
            switch (Action)
            {
                case "GetBusRoute": GetBusRoute(Cmn.ToInt(Data1)); break;
                case "GetTouristsplace": GetBusRoute(Cmn.ToInt(Data1)); break;
                case "GET_PATH": GetPath(Cmn.ToInt(Data1), Cmn.ToInt(Data2)); break;
                case "GET_NETWORK": GetNetwork(Cmn.ToInt(Data1)); break;
                case "CONNECTSTATIONS": ConnectStations(Cmn.ToInt(Data1), Cmn.ToInt(Data2), Cmn.ToInt(Data3), Cmn.ToInt(Data4)); break;
                case "DISCONNECTSTATIONS": DisConnectStations(Cmn.ToInt(Data1), Cmn.ToInt(Data2)); break;
                case "CONNECTION_LIST": ConnectList(Cmn.ToInt(Data1)); break;
                case "STATION_INFO": StationInfo(Cmn.ToInt(Data1)); break;
                case "GET_ROUTE": GetPath(Cmn.ToInt(Data1)); break;
            }
        }
        catch (Exception ex)
        {
            Error = ex.Message + "-" + Error;
        }
        finally
        {
            db.Close();
            if (str.Length == 0 && Action != "GetServices")
                Error += "No Data Found";
            Response.Write( (ApprendError?Error + "~":"") + str.ToString());
        }
    }

    void ConnectList(int StationFromID)
    {
        string _str = "";
        string FromID = "";
        string FromName = "";
        
        DelhiMetro.StationConnection1DataTable dt =  Station.GetConnections(StationFromID);

        foreach (DelhiMetro.StationConnection1Row dr in dt.Rows)
        {
            if (FromID == "")
            {
                FromID = dr.StationFromID.ToString();
                FromName = dr.StnFromName;
            }

            var Clr = "FFFFFF";
            if (!dr.IsRouteColorNull())
                Clr = dr.RouteColor;

            _str += "<tr><td>" + dr.StationToID + "<td style='background-color:#" + Clr +"'>"
                + "<a href='#' onclick='SelectFromStation(" + dr.StationToID + ")'>" + Cmn.ProperCase(dr.StnToName) + "(" + Station.GetStationRoutes(dr.StationToID ) + ")</a>" 
                + "<td><a href='#' onclick='DeleteConnection(" + FromID  + "," + dr.StationToID + ")'>Delete</a>"
                + "<td><a href='#' onclick='ConnectStations(" + FromID + "," + dr.StationToID + ")'>Connect</a>";
        }
        
        str.Append(FromID + "-" + FromName + "-" + Station.GetStationRoutes(StationFromID));
        str.Append("<table cellpadding='0' cellspacing='1'><tr><th>ID<th>Name<th><th>");
        str.Append(_str);

        DelhiMetro.StationRow Stn = Station.GetClosetStation(StationFromID);
        if (Stn != null)
        {
            str.Append("<tr><td colspan='4'>&nbsp;<tr><td>" + Stn.ID + "<td>"
            + "<a href='#' onclick='SelectFromStation(" + Stn.ID + ")'>" + Cmn.ProperCase(Stn.DisplayName) + "(" + Station.GetStationRoutes(Stn.ID) + ")</a>"
            + "<td><a href='#' onclick='DeleteConnection(" + FromID + "," + Stn.ID + ")'>Delete</a>"
            + "<td><a href='#' onclick='ConnectStations(" + FromID + "," + Stn.ID + ")'>Connect</a>");
        }

        str.Append("</table>");
    }

    void DisConnectStations(int StationFromID, int StationToID)
    {
        str.Append(Station.DisConnectionStation(StationFromID, StationToID));
        str.Append(Station.DisConnectionStation(StationToID, StationFromID));
    }

    void ConnectStations(int MetroID,int StationFromID, int StationToID,int RouteID)
    {
        str.Append(Station.ConnectionStation(MetroID, StationFromID, StationToID, RouteID));
        str.Append(Station.ConnectionStation(MetroID, StationToID, StationFromID, RouteID));
    }

    void StationInfo(int StationID)
    {
        string Error = "";
        using (IDataReader dr = db.GetDataReader("select * from Station where ID=" + StationID, ref Error))
        {
            while (dr.Read())
            {
                str.Append(dr["ID"] + "^" //0
                    + "" + "^" //1
                    + "" + "^" //2
                    + dr["Code"] + "^" //3
                    + dr["StationName"] + "^" //4
                    + dr["DisplayName"] + "^" //5
                    + dr["Lat"] + "^" //6
                    + dr["Lng"] + "^" //7
                    + dr["Phone"] + "^" //8
                    + dr["Mobile"] + "^" //9
                    + dr["StationType"] + "^"//10
                    + dr["MetroID"] + "^"//11
                    + "~");
            }
        }

    }
    
    void GetPath(int RouteID)
    {
        DelhiMetro.RouteRow dr = Route.GetRoute(RouteID);

        if(dr!=null)
        {
            int StationFromID = dr.IsStationFirstIDNull() ? 0 : dr.StationFirstID;
            int StationToID = dr.IsStationLastIDNull() ? 0 : dr.StationLastID;
            if (StationFromID != 0 && StationToID != 0)
            {
                ShortPathHelper sp = new ShortPathHelper().GetPath(StationFromID, StationToID,true);
                BuildPath(sp.Path);
            }
        }
    }

    void BuildPath(List<Station> Path)
    {
        if (true)
        {

            int StnFirstID = 0;
            int StnLastID = 0;

            if (Path.Count > 0)
            {
                StnFirstID = Path[0].StationID;
                StnLastID = Path[Path.Count - 1].StationID;
            }

            using (StationTableAdapter ta = new StationTableAdapter())
            {

                foreach (Station S in Path)
                {
                    DelhiMetro.StationDataTable dt = ta.GetDataByID(S.StationID);
                    if (dt.Rows.Count == 1)
                    {
                        DelhiMetro.StationRow dr = dt[0];

                        dr.StnFirstID = StnFirstID;
                        dr.StnLastID = StnLastID;
                        ta.Update(dt);
                    }
                }
            }
        }

        foreach (Station S in Path)
        {

            str.Append(S.StationID + "^" //0
                    + S.Lat + "^" //1
                    + S.Lng + "^" //2
                    + S.RouteColor + "^" //3
                    + S.Name + "^" //4
                    + S.RouteCode + "^" //5
                    + "~");
        }
    }

    void GetPath(int StationFromID, int StationToID)
    {
        ShortPathHelper sp = new ShortPathHelper().GetPath(StationFromID, StationToID);
        BuildPath(sp.Path);
    }
    void GetTouristsplace(int StationID)
    {
        string Error = "";

        using (IDataReader dr = db.GetDataReader("select * from Touristsplace where StationID=" + StationID , ref Error))
        {
            while (dr.Read())
            {
                str.Append(dr["ID"] + "^" //0
                    + dr["StationID"] + "^" //1
                    + dr["Touristsplace"] + "^" //2
                    + dr["Lat"] + "^" //3
                    + dr["Lng"] + "^" //4
                    
                    + "~");
            }
        }
    }

    void GetBusRoute(int BusID)
    {
        string Error = "";

        using (IDataReader dr = db.GetDataReader("select * from BusRoute where BusID=" + BusID + " order by SeqID", ref Error))
        {
            while (dr.Read())
            {
                str.Append(dr["ID"] + "^" //0
                    + dr["SeqID"] + "^" //1
                    + dr["StopName"] + "^" //2
                    + dr["Lat"] + "^" //3
                    + dr["Lng"] + "^" //4
                    + dr["BusID"] + "^"//5
                    + "~");
            }
        }
    }

    void GetNetwork(int MetroID)
    {
        string Error="";

        using (IDataReader dr = db.GetDataReader("select * from Station where MetroID=" + (MetroID==0?Global.SelectedMetro:MetroID), ref Error))
        {
            while (dr.Read())
            {
                str.Append(dr["ID"] + "^" //0
                    + "" + "^" //1
                    + "" + "^" //2
                    + dr["Code"] + "^" //3
                    + dr["StationName"] + "^" //4
                    + dr["DisplayName"] + "^" //5
                    + dr["Lat"] + "^" //6
                    + dr["Lng"] + "^" //7
                    + dr["Phone"] + "^" //8
                    + dr["Mobile"] + "^" //9
                    + dr["StationType"] + "^"//10
                    + dr["MetroID"] + "^"//11
                    + "~");
            }
        }

        str.Append("$");

        Dictionary<string, string> StnConnections = new Dictionary<string, string>();

        string SQL="SELECT StationConnection.*, Route.RouteColor FROM StationConnection LEFT JOIN Route ON StationConnection.RouteID = Route.ID where StationConnection.MetroID=" + Global.SelectedMetro;

        using (IDataReader dr = db.GetDataReader(SQL, ref Error))
        {
            while (dr.Read())
            {
                string Key1 = dr["StationFromID"].ToString() + "^" + dr["StationToID"].ToString();
                string Color = dr["RouteColor"].ToString();
                if (Color == "")
                    Color = "000000";
                string Key2 = dr["StationToID"].ToString() + "^" + dr["StationFromID"].ToString();

                if (!StnConnections.ContainsKey(Key1) && !StnConnections.ContainsKey(Key2))
                {
                    StnConnections.Add(Key1, Color);
                }
            }
            
            foreach (KeyValuePair<string,string> kpv in StnConnections)
            {
                str.Append(kpv.Key + "^" + kpv.Value + "~");
            }
        }
    }

}