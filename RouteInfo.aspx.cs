using System;
using System.Collections.Generic;
using System.Text;


public partial class RouteInfo : BasePage
{
    
    StringBuilder str = new StringBuilder();
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);

        ucStationSelection.CurrentLanguage = CurrentLanguage;
        ucStationSelection.IsLocalHost = IsLocalHost;

        StringBuilder str = new StringBuilder();

        if (Data1 == "" || Data2 == "")
        {
            Title = "Delhi Metro - Find Route between stations";
            MetaKeywords = "Delhi metro routes,  route map,   stations";

            string caption = "";
            if (Data1 == "")
                caption = CurrentLanguage == Language.English ? "Select Departure Station" : "से:";
            else
            {
                caption = Data1.Split('-')[0].Replace("_"," ")  + " < " + ( CurrentLanguage == Language.English ? "Select Destination Station" : "से:") + " >";
            }

            str.Append("<table cellpadding='2' cellspacing='1' style='width:100%;'>");
            str.Append("<caption><br/><b>" + caption + "</b><br/><br/></caption><tr>");

            List<Station> Stns = Station.GetStations(1);
            int ctr = 0;
            foreach (Station S in Stns)
            {   
                if (S.ParentStnID == 0)
                {
                    if (ctr % 28 == 0)
                    {
                        if (ctr > 0)
                            str.Append("</table>");

                        str.Append("<td valign='top'><table cellspacing='0'>");
                    }
                    ctr++;

                    string stnName = (CurrentLanguage == Language.English ? S.Name : S.NameHindi).Replace(" ", "_").Replace("-", "_");
                    string stnName2= (CurrentLanguage == Language.English ? S.Name : S.NameHindi);

                    str.Append("<tr><td style='border-bottom:1px solid white;background-color:#" + S.RouteColor + "'>&nbsp;&nbsp;<td><a href='" + ResolveUrl("~/route") + "/");
                    if (Data1 == "")
                        str.Append(stnName + "-" + S.StationID + "'>" + stnName2 + "</a>");
                    else
                    {
                        int StnIDFrom = Cmn.ToInt(Data1.Split('-')[1]);
                        ucStationSelection.StnFrom = StnIDFrom;
                        str.Append(Data1 + "/" + stnName + "-" + S.StationID + "'>" + stnName2 + "</a>");
                    }
                }
            }

            str.Append("</table></table>");

            lblData.Text = str.ToString();

        }
        else
        {
            Title = "Delhi Metro - Route from " + Data1.Split('-')[0] + " to " + Data2.Split('-')[0];
            
            int StnIDFrom = Cmn.ToInt(Data1.Split('-')[1]);
            int StnIDTo = Cmn.ToInt(Data2.Split('-')[1]);
            
            ucStationSelection.StnFrom = StnIDFrom;
            ucStationSelection.StnTo = StnIDTo;

            lblData.Text = "<td valign='top'>" + new Route().GetRoute(StnIDFrom, StnIDTo, this, IsLocalHost) + "</table>";

        }
        string URL = this.Request.Url.ToString().ToUpper();

        WriteClientScript("PageID=1;");
    }
}