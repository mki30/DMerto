using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;

public partial class Edit_FareEdit : System.Web.UI.Page
{

    int StationFromID;
    int StationToID;
    protected void Page_Load(object sender, EventArgs e)
    {
        StationFromID = Request.QueryString["StationFromID"] != null ? Cmn.ToInt(Request.QueryString["StationFromID"]) : 0;
        StationToID = Request.QueryString["StationToID"] != null ? Cmn.ToInt(Request.QueryString["StationToID"]) : 0;
        lblFromStation.Text = Cmn.ProperCase(StationFromID);
        lblToStation.Text = Cmn.ProperCase(StationToID);        
        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetDataByID(StationFromID);
            if (dt.Rows.Count == 1)
            {
                DelhiMetro.StationRow dr = dt[0];               
                lblFromStation.Text = dr.DisplayName;
            }
           
        }
        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetDataByID(StationToID );
            if (dt.Rows.Count == 1)
            {
                DelhiMetro.StationRow dr = dt[0];
                lblToStation.Text = dr.DisplayName;
            }
        }

        if (!IsPostBack)
        {
            txtFare.Text = Request.QueryString["Fare"] != null ? Request.QueryString["Fare"].ToString() : "0";
        }
    }
   

    void UpdateFare()
    {
        Fare F = new Fare() { MetroID = 1, Amount = Cmn.ToDbl(txtFare.Text), StnFromID = StationFromID, StnToID = StationToID }.Save();
        lblStatus.Text=F.Message;
        lblStatus.Text += "Data Saved";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        UpdateFare();
    }
  
}