using System;
using System.Text;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;

public partial class _Default : BasePage
{
    int MetroID;
    StringBuilder str = new StringBuilder();
    protected new void Page_Load(object sender, EventArgs e)
    {
        Title = "Delhi Metro - Fare from " + Data1 + " to " + Data2;
        MetaKeywords = "Delhi metro fare, route fare, fare between stations";
        MetaDescription = "Delhi Metro - Fare between " + Data1 + " and " + Data2;


        lblFrom.Text = "From:";
        lblTo.Text = "To:";
        btnShow.Text = "Show";
        if (CurrentLanguage == Language.Hindi)
        {
            lblFrom.Text = "से:";
            lblTo.Text = "तक:";
            btnShow.Text = "दिखाना:";
        }
        
           
       
        base.Page_Load(sender, e);
        
        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);
            ddMetro.Visible = false;
            ddMetro_SelectedIndexChanged(null, EventArgs.Empty);

            ddStationFromListHindi.SelectedValue = ddStationFromList.SelectedValue = "85";//Dilshad Garden
            ddStationToListHindi.SelectedValue = ddStationToList.SelectedValue = "90";//Rithala
            lblData.Text = "<td valign='top'>" + new Route().GetRoute(Cmn.ToInt(ddStationFromList.SelectedValue), Cmn.ToInt(ddStationToList.SelectedValue), this, IsLocalHost) + "</table>";
           
        }

        ddStationFromList.Visible = CurrentLanguage == Language.English;
        ddStationToList.Visible = CurrentLanguage == Language.English;
        ddStationFromListHindi.Visible = CurrentLanguage == Language.Hindi;
        ddStationToListHindi.Visible = CurrentLanguage == Language.Hindi;

        string URL = this.Request.Url.ToString().ToUpper();
        if (URL.Contains("DELHIMETRORAIL"))
        {
            Title = "Delhi Metro Rail - route, time table, fare, first & last train";
            ddMetro.SelectedValue = "1";
        }

        MetaKeywords="Delhi Metro, First Train, Last Train, Delhi Metro Fare, DMRC, Delhi Metro Rail Corporation, DMRC Route Map, Metro Map, Metro Station Information, Metro Timings, Delhi Map";
        MetaDescription = "Find all information about Delhi Metro";
    }
        
    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {       
        MetroID = Cmn.ToInt(ddMetro.SelectedValue);
        Global.SelectedMetro = MetroID;
          ddStationToList.Items.Clear();

        Station.FillStationList(ddStationFromList, MetroID, true, IsLocalHost, true);
        Station.FillStationList(ddStationToList, MetroID, false, IsLocalHost, true);
        Station.FillStationList(ddStationFromListHindi, MetroID, true, IsLocalHost, true, true);
        Station.FillStationList(ddStationToListHindi, MetroID, false, IsLocalHost, true, true);
       
        if (IsLocalHost)
        {
            ddStationToList.Items.Add(new ListItem("", ""));
            ddStationToList.Items.Add(new ListItem("<All>", "0"));
        }        
    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        if (CurrentLanguage == Language.Hindi)
        {
            ddStationFromList.SelectedValue = ddStationFromListHindi.SelectedValue;
            ddStationToList.SelectedValue = ddStationToListHindi.SelectedValue;
        }
        lblData.Text = "<td valign='top'>" + new Route().GetRoute(Cmn.ToInt(ddStationFromList.SelectedValue), Cmn.ToInt(ddStationToList.SelectedValue), this, IsLocalHost) + "</table>";
        //Response.Redirect(ResolveUrl(@"~\route\" + ddStationFromList.SelectedItem.Text + @"\" + ddStationToList.SelectedItem.Text));
    }
}