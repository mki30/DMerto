using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;

public partial class Edit_BusRouteList : System.Web.UI.Page
{
    new int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        ID = Request.QueryString["ID"] != null ? Cmn.ToInt(Request.QueryString["ID"]) : 0;
        lblRouteID.Text = Request.QueryString["RouteID"] != null ? Request.QueryString["RouteID"].ToString() : "0";

        if (!IsPostBack)
        {
            ShowData(ID, Cmn.ToInt(lblRouteID.Text));
        }
        lstBusRoute.Attributes.Add("onclick", "ShowBusRouteEdit(this)");
    }

    void ShowData(int ID, int RouteID)
    {
        try
        {
            using (BusRouteTableAdapter ta = new BusRouteTableAdapter())
            {
                DelhiMetro.BusRouteDataTable dt = ta.GetDataByBusID(RouteID);
                lstBusRoute.Items.Clear();
                foreach (DelhiMetro.BusRouteRow dr in dt.Rows)
                {
                    ListItem li = new ListItem(dr.SeqID.ToString() + "-" + dr.StopName, dr.ID.ToString());
                    lstBusRoute.Items.Add(li);

                    if (dr.ID == ID)
                        li.Selected = true;
                }
            }
        }
        catch 
        {
            //lblStatus.Text = ex.Message;
        }
    }

    void SwapSeq(int ID1, int ID2)
    {
        using (BusRouteTableAdapter ta = new BusRouteTableAdapter())
        {
            DelhiMetro.BusRouteDataTable dt1 = ta.GetDataByID(ID1);
            DelhiMetro.BusRouteDataTable dt2 = ta.GetDataByID(ID2);

            double Seq2 = dt2[0].SeqID;
            dt2[0].SeqID = dt1[0].SeqID;
            dt1[0].SeqID = Seq2;

            ta.Update(dt1);
            ta.Update(dt2);
            
        }
    }

    protected void btnMoveUp_Click(object sender, EventArgs e)
    {
        if (lstBusRoute.SelectedIndex > 0)
        {
            int ID1 = Cmn.ToInt(lstBusRoute.SelectedValue);
            int ID2 = Cmn.ToInt(lstBusRoute.Items[lstBusRoute.SelectedIndex-1].Value);
            SwapSeq(ID1, ID2);
            ShowData(ID1, Cmn.ToInt(lblRouteID.Text));
        }
    }

    protected void btnMoveDown_Click(object sender, EventArgs e)
    {
        if (lstBusRoute.SelectedIndex < lstBusRoute.Items.Count-1)
        {
            int ID1 = Cmn.ToInt(lstBusRoute.SelectedValue);
            int ID2 = Cmn.ToInt(lstBusRoute.Items[lstBusRoute.SelectedIndex + 1].Value);
            SwapSeq(ID1, ID2);
            ShowData(ID1, Cmn.ToInt(lblRouteID.Text));
        }
    }
    protected void btnAddStops_Click(object sender, EventArgs e)
    {
        string[] Stops =txtAddStops.Text.Split(',');
        

        int BusID = Cmn.ToInt(lblRouteID.Text);
        foreach (string s in Stops )
        {    
            
            string StopName = s.Trim().Replace("\t", "").Replace("\r", "");
            if (s != "")
            {
                AddStop(BusID,StopName);
            }
        }

        txtAddStops.Text = "";

      
        //ShowData(StationID);
    }
    void AddStop(int BusID, string StopName)
    {
        //int StationID = 0;
        try
        {
            using (BusRouteTableAdapter ta = new BusRouteTableAdapter())
            {
                DelhiMetro.BusRouteDataTable dt = ta.GetDataByBusIDandStopName(StopName,BusID);
                if (dt.Rows.Count == 0)
                {
                    DelhiMetro.BusRouteRow dr = dt.NewBusRouteRow();

                    dr.StopName = StopName;
                    dr.BusID = BusID;
                    using (BusRouteTableAdapter ta1 = new BusRouteTableAdapter())
                    {
                        dr.SeqID =(Cmn.ToDbl(ta.GetMaxSequenceID(BusID)) + 1);
                    }
                    dt.Rows.Add(dr);

                    ta.Update(dt);
                }

               
            }
        }
        catch 
        {
            
        }
        //Cmn.WriteClientScript(this, "parent.ShowBusStop("+ID+")");
        ShowData(ID,BusID);

        
    }
}
