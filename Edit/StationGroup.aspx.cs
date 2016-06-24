using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;

public partial class Edit_StationGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);
            ddMetro_SelectedIndexChanged(ddMetro, EventArgs.Empty);
        }
    }

    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MetroID = Cmn.ToInt(ddMetro.SelectedValue);
        
        Station.FillStationList(lstStnParent, MetroID);
        Station.FillStationList(lstStnList, MetroID);
    }

    void ShowChildStns(int ParentStnID)
    {
        lstStnChild.Items.Clear();
        List<Station> StnList = Station.GetChildStation(ParentStnID);
        foreach (Station S in StnList)
        {
            lstStnChild.Items.Add(new ListItem(S.Name + "-"+S.StationID, S.StationID.ToString()));
        }
    }

    protected void lstStnParent_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowChildStns(Cmn.ToInt(lstStnParent.SelectedValue));
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        UpdateParent(Cmn.ToInt(lstStnParent.SelectedValue), Cmn.ToInt(lstStnList.SelectedValue));
        ShowChildStns(Cmn.ToInt(lstStnParent.SelectedValue));
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        UpdateParent(0, Cmn.ToInt(lstStnChild.SelectedValue));
        ShowChildStns(Cmn.ToInt(lstStnParent.SelectedValue ));
    }

    void UpdateParent(int ParentStnID,int ChildStnID)
    {
        try
        {
            using (StationTableAdapter ta = new StationTableAdapter())
            {
                DelhiMetro.StationDataTable dt = ta.GetDataByID(ChildStnID);
                DelhiMetro.StationRow dr = dt.Rows.Count == 0 ? dt.NewStationRow() : dt[0];

                dr.ParentStnID = ParentStnID;
              
                ta.Update(dt);

            }

        }
        catch
        {
          
        }
    }
}