using System;
using System.Collections.Generic;

public partial class StationInfo : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        lblData.Text = "";

        List<Station> Stns = Station.GetStations(1);

        if (Data1 == "")
        {
            Title = "Delhi Metro - list of all station in delhi metro";
            lblData.Text = "<table cellpadding='2' cellspacing='1' ><tr><td>#<td>Name<td>Name Hindi<td>Line<td>Opening<td>Connections<td>Layout";
        }

        foreach (Station S in Stns)
        { 
            if(Data1!="")
            {
                if (Data1 == S.Name && S.ParentStnID==0)
                {
                    String stationname = "Station Name :";
                    String stationphone = "Station Phone:";
                    String stationroutes = "Station Routes:";
                    if (CurrentLanguage == Language.Hindi)
                    {
                        stationname = "स्टेशन :";
                        stationphone = "फोन :";
                        stationroutes = "मार्ग :";

                    }

                    Title = "Delhi Metro - " + S.Name + " Station Information";
                    lblData.Text += stationname+ (CurrentLanguage == Language.English ? S.Name : S.NameHindi) + "<br/>";
                    lblData.Text += stationphone + S.Phone + "<br/>";
                    lblData.Text += stationroutes + S.RouteCode + "<br/>";
                    lblData.Text += " <iframe id='frameMap' src='" + ResolveClientUrl(@"~/Map.htm") + "?Action=DelhiMetro&StationID=" + S.StationID + "' frameborder='0' style='width: 100%; height: 400px' align='Center'></iframe>";
                }
            }
            else
            {
                lblData.Text += "<tr><td><td><a href='" + ResolveClientUrl("~/station") + "/" + S.Name.ToString().Replace(" ", "_") + "'>" + S.Name.ToString().Replace(" ", "_") + "</a><td><td>"
                    + S.RouteCode + "<td><td><td>";
            }
        }
        if (Data1 == "")
        {
            lblData.Text += "</table>";
        }
    }
}