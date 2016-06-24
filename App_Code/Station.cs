using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using DelhiMetroTableAdapters;

/// <summary>
/// Summary description for Station
/// </summary>
/// 
public static class GeoCodeCalc
{
    public const double EarthRadiusInMiles = 3956.0;
    public const double EarthRadiusInKilometers = 6367.0;

    public static double ToRadian(double val) { return val * (Math.PI / 180); }
    public static double DiffRadian(double val1, double val2) { return ToRadian(val2) - ToRadian(val1); }

    public static double CalcDistance(double lat1, double lng1, double lat2, double lng2)
    {
        return CalcDistance(lat1, lng1, lat2, lng2, GeoCodeCalcMeasurement.Miles);
    }

    public static double CalcDistance(double lat1, double lng1, double lat2, double lng2, GeoCodeCalcMeasurement m)
    {
        double radius = GeoCodeCalc.EarthRadiusInMiles;

        if (m == GeoCodeCalcMeasurement.Kilometers) { radius = GeoCodeCalc.EarthRadiusInKilometers; }
        return radius * 2 * Math.Asin(Math.Min(1, Math.Sqrt((Math.Pow(Math.Sin((DiffRadian(lat1, lat2)) / 2.0), 2.0) + Math.Cos(ToRadian(lat1)) * Math.Cos(ToRadian(lat2)) * Math.Pow(Math.Sin((DiffRadian(lng1, lng2)) / 2.0), 2.0)))));
    }
}

public enum GeoCodeCalcMeasurement : int
{
    Miles = 0,
    Kilometers = 1
}

public class Station
{
    public string Name = "";
    public string NameHindi = "";
    public int RouteID;
    public string RouteCode="";
    public int SerialNo;
    public bool IsInterchange;
    public int StationID;
    public string StationCode = "";
    public double Lat;
    public double Lng;
    public string Code;
    public DateTime? TimeFirst;
    public DateTime? TimeLast;
    public string Track = "";
    public int PlatformNumber;
    public double DistanceFromPreviousStation;
    public string RouteColor = "C0C0C0";
    public string Message = "";
    public string Phone = "";
    public int StationFirstID;
    public int StationLastID;
    public string  LastDestinationTime="";
    public int ParentStnID ;
    public int Connections;
    public int Date;
    
    public Station()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    static Station GetStation(DelhiMetro.StationRow dr )
    {
        return new Station()
                {
                    StationID = dr.ID,
                    Name = dr.DisplayName,
                    Phone= dr.Phone,
                    Lat = dr.IsLatNull()?0: dr.Lat,
                    Lng = dr.IsLngNull()?0: dr.Lng,
                    Code = dr.IsCodeNull()?"":dr.Code,
                    StationFirstID = dr.IsStnFirstIDNull() ? 0 : dr.StnFirstID,
                    StationLastID= dr.IsStnLastIDNull() ? 0 : dr.StnLastID,
                    ParentStnID=dr.IsParentStnIDNull()?0:dr.ParentStnID,
                    NameHindi = dr.IsHindiNameNull() ? "" : dr.HindiName
                };
    }

    public static Station GetStation(int StnID)
    {
        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetDataByID(StnID);
            if (dt.Rows.Count > 0)
                return GetStation(dt[0]);
        }

        return null;
    }

    public static List<Station> GetChildStation(int ParentStnID)
    {
        List< Station> StnList = new List<Station>();
        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetDataByParentStnID(ParentStnID);
             foreach(DelhiMetro.StationRow dr in dt.Rows)
            {
                StnList.Add(GetStation( dr));
            }
            
        }

        return StnList;
    }
    
    public static List<DelhiMetro.StationConnection1Row> GetConnection(int StationFromID)
    {
        List<DelhiMetro.StationConnection1Row> StnList = new List<DelhiMetro.StationConnection1Row>();
        using (StationConnection1TableAdapter ta = new StationConnection1TableAdapter())
        {
            DelhiMetro.StationConnection1DataTable dt = ta.GetDataStnFromID(StationFromID);
            {
                foreach(DelhiMetro.StationConnection1Row dr in dt.Rows)
                {
                    StnList.Add(dr);
                }
            }
        }

        return StnList;
    }
        
    public static string GetStationRoutes(int StationID, DataBase _db = null)
    {
        DataBase db = _db == null ? new DataBase() : _db;
        string Routes = "", Error = "";
        try
        {

            string SQL = "SELECT Route.RouteCode, StationRoute.* FROM StationRoute LEFT JOIN Route ON StationRoute.RouteID = Route.ID where StationRoute.StationID=" + StationID;
            using (IDataReader dr = db.GetDataReader(SQL, ref Error))
            {
                while (dr.Read())
                {
                    Routes += dr["RouteCode"] + ",";
                }
            }
        }
        catch (Exception ex)
        {
            Error = ex.Message;
        }
        finally
        {
            if (_db == null)
                db.Close();
        }

        return Routes;
    }
    
    public static List<Station> GetStations(int MetroID)
    {
        List<Station> StnList = new List<Station>();
        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetDataByMetroID(MetroID);
            foreach (DelhiMetro.StationRow dr in dt.Rows)
            {
                StnList.Add(GetStation(dr));
            }
        }

        //try
        //{
        //    string Error = "";
        //    string SQL = "select * from Station where MetroID=" + MetroID + " order by DisplayName";

        //    using (IDataReader dr = db.GetDataReader(SQL, ref Error))
        //    {
        //        while (dr.Read())
        //        {
        //            int StnID = Cmn.ToInt(dr["ID"]);

        //            Stns.Add(new Station()
        //            {
        //                StationID=StnID ,
        //                Name=Cmn.ProperCase(dr["DisplayName"]),
        //                RouteCode = GetStationRoutes(StnID, db),
        //                ParentStnID
                        
        //            });
        //        }
        //    }
        //}
        //catch
        //{
        //}
        //finally
        //{
        //    db.Close();
        //}

        return StnList;
    }

    public static void FillStationList(ListControl _ListControl, int MetroID, Boolean ClearList = true,Boolean ShowRouteCode=true,Boolean ShowOnlyMasterStations=false,Boolean ShowHindiName=false)
    {
        if (ClearList)
            _ListControl.Items.Clear();

        List<Station> Stns = Station.GetStations(MetroID);

        foreach(Station S in Stns)
        {
            if (ShowOnlyMasterStations)
            {
                if (S.ParentStnID != 0)
                    continue;
            }

            _ListControl.Items.Add(new ListItem((ShowHindiName ? S.NameHindi : S.Name) + (ShowRouteCode ? "-" + S.RouteCode : ""), S.StationID.ToString()));
        }
        
    }

    public static DelhiMetro.StationConnection1Row GetConnection(int StationFromID, int StationToID)
    {
        using (StationConnection1TableAdapter ta = new StationConnection1TableAdapter())
        {
            DelhiMetro.StationConnection1DataTable dt = ta.GetDataByFromAndTo(StationFromID, StationToID);
            if (dt.Rows.Count > 0)
                return dt[0];
        }
        
        return null;
    }

    public static string ConnectionStation(int MetroID, int StationFromID, int StationToID, int RouteID)
    {
        string Error = "";
        if (StationFromID == StationToID)
            return "From & To Stations are same";

        try
        {
            using (StationConnectionTableAdapter ta = new StationConnectionTableAdapter())
            {
                DelhiMetro.StationConnectionDataTable dt = ta.GetDataByStnFromTo(StationFromID, StationToID);
                DelhiMetro.StationConnectionRow dr = dt.Rows.Count == 0 ? dt.NewStationConnectionRow() : dt[0];

                dr.StationFromID = StationFromID;
                dr.StationToID = StationToID;
                dr.MetroID = MetroID;
                dr.RouteID = RouteID;

                //update connection distance 
                Station StnFrom = Station.GetStation(dr.StationFromID);
                Station StnTo = Station.GetStation(dr.StationToID);
                dr.Distance = GeoCodeCalc.CalcDistance(StnFrom.Lat, StnFrom.Lng, StnTo.Lat, StnTo.Lng, GeoCodeCalcMeasurement.Kilometers);

                if (dt.Rows.Count == 0)
                    dt.Rows.Add(dr);

                ta.Update(dt);

                Error = "Data Saved";
            }

        }
        catch (Exception ex)
        {
            Error = ex.Message;
        }

        return Error;
    }

    public static DelhiMetro.StationRow GetClosetStation(int StnID)
    {
        DelhiMetro.StationRow Stn = null;
        double MinDist = 9999999;

        Station StnFrom = Station.GetStation(StnID);

        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetData();

            foreach (DelhiMetro.StationRow dr in dt.Rows)
            {
                if (dr.IsLatNull() || dr.IsLngNull() || dr.ID == StnID)
                    continue;

                double dist = GeoCodeCalc.CalcDistance(StnFrom.Lat, StnFrom.Lng, dr.Lat, dr.Lng, GeoCodeCalcMeasurement.Kilometers);
                if (dist < MinDist)
                {
                    MinDist = dist;
                    Stn = dr;
                }
            }
        }

        return Stn;
    }

    public static string DisConnectionStation(int StationFromID, int StationToID)
    {
        string Error = "";

        try
        {
            using (StationConnectionTableAdapter ta = new StationConnectionTableAdapter())
            {
                DelhiMetro.StationConnectionDataTable dt = ta.GetDataByStnFromTo(StationFromID, StationToID);

                if (dt.Rows.Count > 0)
                {
                    dt.Rows[0].Delete();
                    ta.Update(dt);
                }
                Error = "Deleted";
            }

        }
        catch (Exception ex)
        {
            Error = ex.Message;
        }
        return Error;
    }

    public static DelhiMetro.StationConnection1DataTable GetConnections(int StationID)
    {
        using (StationConnection1TableAdapter ta = new StationConnection1TableAdapter())
        {
            return ta.GetDataStnFromID(StationID);
        }
    }

    public static DateTime? GetFirstStationTime(int StnFirst,int StnLast)
    {
        using (StationLastTimeTableAdapter ta = new StationLastTimeTableAdapter())
        {
            DelhiMetro.StationLastTimeDataTable dt = ta.GetDataByStationFromIDStationToID(StnFirst, StnLast);
            if (dt.Rows.Count == 1)
                return dt[0].LastTime;
        }

        return null;
    }

    public static DateTime? GetLastTime(int StationID)
    {
        using (StationConnection1TableAdapter ta = new StationConnection1TableAdapter())
        {
            DelhiMetro.StationConnection1DataTable dt = ta.GetDataStnFromID(StationID);

            foreach (DelhiMetro.StationConnection1Row dr in dt.Rows)
            {
                if (dr.IsTimeLastNull())
                    return null;
                else
                    return dr.TimeLast;
            }

        }

        return null;
    }
}