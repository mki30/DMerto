using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;

public partial class Edit_LastTime : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);
            ddMetro_SelectedIndexChanged(ddMetro, EventArgs.Empty);
        }
    }

    void ShowData(int StnFromID, int StnToID)
    {
        try
        {
            using (StationLastTimeTableAdapter ta = new StationLastTimeTableAdapter())
            {

                DelhiMetro.StationLastTimeDataTable dt = ta.GetDataByStationFromIDStationToID(StnFromID, StnToID);
                if (dt.Rows.Count == 1)
                {
                    DelhiMetro.StationLastTimeRow dr = dt[0];
                    ddStnFrom.SelectedValue = dr.StationFromID.ToString();
                    ddStnTo.SelectedValue = dr.StationToID.ToString();
                    txtTime.Text = dr.IsLastTimeNull() ? "" : dr.LastTime.ToString("HH:mm");
                }
            }
        }
        catch(Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }

    void UpdateData(int StnFromID, int StnToID)
    {
        try
        {
            using (StationLastTimeTableAdapter ta = new StationLastTimeTableAdapter())
            {

                DelhiMetro.StationLastTimeDataTable dt = ta.GetDataByStationFromIDStationToID(StnFromID, StnToID);
                DelhiMetro.StationLastTimeRow dr = dt.Rows.Count == 0 ? dt.NewStationLastTimeRow() : dt[0];

                dr.StationFromID = StnFromID;
                dr.StationToID = StnToID;
                dr.LastTime = Cmn.ToDate(txtTime.Text);

                if (dt.Rows.Count == 0)
                    dt.Rows.Add(dr);

                ta.Update(dt);
                lblStatus.Text = "Saved";

                ShowList(Cmn.ToInt(ddMetro.SelectedValue));
            }
        }
        catch(Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }

    void ShowList(int MetroID)
    {
        using (StationLastTime1TableAdapter ta = new StationLastTime1TableAdapter())
        {
            DelhiMetro.StationLastTime1DataTable dt = ta.GetData(MetroID);

            lstStations.Items.Clear();
            foreach (DelhiMetro.StationLastTime1Row dr in dt.Rows)
            {
                lstStations.Items.Add(
                    new ListItem( 
                        dr.StnFromName + "-" 
                        + dr.StnToName + "   "
                        +  (dr.IsLastTimeNull() ? "" : dr.LastTime.ToString("HH:mm")),
                    
                        dr.StationFromID + "-" + dr.StationToID
                    ));
            }
        }
    }
    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MetroID = Cmn.ToInt(ddMetro.SelectedValue);
        ShowList(MetroID);
        
        Station.FillStationList(ddStnFrom, MetroID);
        Station.FillStationList(ddStnTo,MetroID);
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        UpdateData(Cmn.ToInt(ddStnFrom.SelectedValue), Cmn.ToInt(ddStnTo.SelectedValue));

    }
    protected void lstStations_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Value = lstStations.SelectedValue;
        int StationFromID = Cmn.ToInt(Value.Split('-')[0]);
        int StationToID = Cmn.ToInt(Value.Split('-')[1]);
        ShowData(StationFromID, StationToID); 
        
    }
}