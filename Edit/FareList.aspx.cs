using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DelhiMetroTableAdapters;
using System.Data;

public partial class Edit_FareList : System.Web.UI.Page
{
    DataBase db = new DataBase();
    string Error = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);

            ShowRoute();
            ShowList(Cmn.ToInt(ddlRoute.SelectedValue));
            ddShowList(Cmn.ToInt(ddlRoute.SelectedValue));


        }
    }


    void ShowFareList()
    {
        int MetroID = Cmn.ToInt(ddMetro.SelectedValue);
        int RouteID = Cmn.ToInt(ddlRoute.SelectedValue);
        List<Station> Stns = Station.GetStations1(MetroID, RouteID);

        StringBuilder str = new StringBuilder("<table cellpadding='0' cellspacing='1'><tr><td>");

        foreach (Station S in Stns)
        {
            str.Append("<td>" + S.Name);
        }

        using (FareTableAdapter ta = new FareTableAdapter())
        {
            DelhiMetro.FareDataTable dt = ta.GetData();
            foreach (Station SFrom in Stns)
            {
                str.Append("<tr><td>" + SFrom.Name);

                foreach (Station STo in Stns)
                {
                    if (SFrom.StationID == STo.StationID)
                    {
                        str.Append("<td style='background-color:green'>");
                        continue;
                    }

                    str.Append("<td>");
                    DelhiMetro.FareRow dr = dt.FindByStationFromIDStationToID(SFrom.StationID, STo.StationID);//MetroID,

                    str.Append("<a href='#' onclick='ShowDialog(\"FareEdit.aspx?StationFromID=" + SFrom.StationID + "&StationToID=" + STo.StationID + "&Fare=");

                    if (dr != null && !dr.IsFareNull())
                        str.Append(dr.Fare.ToString("00") + "\")'>" + dr.Fare.ToString("00") + "</a>");
                    else
                        str.Append("000\")' style='background-color:yellow'>00</a>");
                }
            }
        }

        str.Append("</table>");

        ltData.Text = str.ToString();
    }

    void ShowRoute()
    {

        try
        {

            string SQL = "select * from Route  where MetroID = 1";


            using (IDataReader dr = db.GetDataReader(SQL, ref Error))
            {
                while (dr.Read())
                {

                    ddlRoute.Items.Add((dr["RouteID"].ToString()));

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

    }
    void ShowList(int RouteID)
    {
        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetDataByRouteID(RouteID);

            lstStation.Items.Clear();
            foreach (DelhiMetro.StationRow dr in dt.Rows)
            {
                lstStation.Items.Add(new ListItem(dr.StationName.ToString()));

            }
        }
    }

    void ddShowList(int RouteID)
    {
        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetDataByRouteID(RouteID);

            ddlStationName.Items.Clear();

            foreach (DelhiMetro.StationRow dr in dt.Rows)
            {
                ddlStationName.Items.Add(new ListItem(dr.StationName.ToString()));

            }
        }
    }


    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowFareList();
    }

    protected void ddlRoute_SelectedIndexChanged(object sender, EventArgs e)
    {

        ShowList(Cmn.ToInt(ddlRoute.SelectedValue));
        ddShowList(Cmn.ToInt(ddlRoute.SelectedValue));
        ShowFareList();

        // FillFare(Cmn.ToInt(ddlRoute.SelectedValue));

    }


}