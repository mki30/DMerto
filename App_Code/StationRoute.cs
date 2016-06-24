using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for StationRoute
/// </summary>
public class StationRoute
{
    public StationRoute()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static List<int> GetRouteList(int StationID)
    {
        DataBase db = new DataBase();

        List<int> RouteList = new List<int>();
        try
        {
            string Error = "";
            using (IDataReader dr = db.GetDataReader("select * from StationRoute where StationID=" + StationID , ref Error))
            {

                while (dr.Read())
                {
                    RouteList.Add(Cmn.ToInt(dr["RouteID"]));
                }
            }
        }
        catch
        {
        }
        finally
        {
            db.Close();
        }

        return RouteList;
    }
}