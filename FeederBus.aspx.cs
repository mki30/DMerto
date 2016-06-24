using System;
using System.Web.Routing;
using System.Text;
using System.Data;
using DelhiMetroTableAdapters;


public partial class FeederBus : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {

        Title = "Delhi Metro - Feeder Bus " + Data1 + " to " + Data2;
        MetaKeywords = "Delhi metro Feeder Bus";
        MetaDescription = "Delhi Metro - Feeder Bus between " + Data1 + " and " + Data2;
        DataBase db = new DataBase();
        string error = "", routevia = "";
        String SQL = "SELECT * FROM BUS";
        StringBuilder str = new StringBuilder("<table     cellpadding='0' cellspacing='1'>");
        using (IDataReader dr = db.GetDataReader(SQL, ref error))
        {
            str.Append("<tr><th>ID<th>RouteNo.<th>From<th>To<th>Via<th>RL");
            while (dr.Read())
            {
                routevia = string.Empty;
                str.Append("<tr><td>" + (dr["ID"]));
                str.Append(" <td>" + (dr["RouteNo"]));
                str.Append(" <td>" + (dr["From"]));
                str.Append(" <td>" + (dr["To"]));
                using (IDataReader dr1 = db.GetDataReader("Select StopName from BusRoute where BusID="+dr["ID"] , ref error))
                {
                    while (dr1.Read())
                    {
                        routevia += dr1["StopName"].ToString() + ",";
                    }
                }
                str.Append(" <td>" + routevia);
                str.Append(" <td>" + (dr["RouteLength"]));
            }

        }
        str.Append("</table>");

        lblBusinfo.Text = str.ToString();



    }

}