using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class MetroFares :BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        
        
        if (Data1 == "")
        {
            Title = "Delhi Metro - Fares in delhi metro";
            
            lblData.Text =" ";
        }

        if (!IsPostBack)
        {
            Station.FillStationList(ddStationFromListEnglish, 1, true, IsLocalHost, true);
            Station.FillStationList(ddStationToListEnglish, 1, true, IsLocalHost, true);
            Station.FillStationList(ddStationFromListHindi, 1, true, IsLocalHost, true,true);
            Station.FillStationList(ddStationToListHindi, 1, true, IsLocalHost, true, true);
            
            ShowRoute();
        }

        panelEnglish.Visible = CurrentLanguage == Language.English;
        panelHindi.Visible = CurrentLanguage == Language.Hindi;

    }

    void ShowRoute()
    {
        Title = "Delhi Metro - Fare from " + Data1 + " to " + Data2;
        MetaKeywords = "Delhi metro fare, route fare, fare between stations";
        MetaDescription = "Delhi Metro - Fare between " + Data1 + " and " + Data2;

        int StnIDFrom = 0,StnIDTo = 0;
        
        List<Station> Stns = Station.GetStations(1);
        foreach (Station S in Stns)
        {
            if (S.Name == Data1) StnIDFrom = S.StationID;
            if (S.Name == Data2) StnIDTo = S.StationID;
        }

        lblData.Text = "Route not found";
        if (StnIDFrom != 0 && StnIDTo != 0)
        {

            ddStationFromListEnglish.SelectedValue = StnIDFrom.ToString();
            ddStationToListEnglish.SelectedValue = StnIDTo.ToString();

            ddStationFromListHindi.SelectedValue = StnIDFrom.ToString();
            ddStationToListHindi.SelectedValue = StnIDTo.ToString();

            Label lbl = CurrentLanguage == Language.English ? lblData : lblDataHindi;
            lbl.Text = "<td valign='top'>" + new Route().GetRoute(StnIDFrom, StnIDTo, this, IsLocalHost) + "</table>";
        }
    }
    
    protected void btnShowFare_Click(object sender, EventArgs e)
    {
        Response.Redirect(ResolveUrl(@"~\fare\" + ddStationFromListEnglish.SelectedItem.Text + @"\" + ddStationToListEnglish.SelectedItem.Text));
    }

    protected void btnShowFareHindi_Click(object sender, EventArgs e)
    {
        ddStationFromListEnglish.SelectedValue = ddStationFromListHindi.SelectedValue;
        ddStationToListEnglish.SelectedValue = ddStationToListHindi.SelectedValue;

        Response.Redirect(ResolveUrl(@"~\fare\" + ddStationFromListEnglish.SelectedItem.Text + @"\" + ddStationToListEnglish.SelectedItem.Text));
    }
}