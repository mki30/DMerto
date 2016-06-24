using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;

public partial class Edit_BusRoute : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblID.Text = Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "0";
            lblRouteID.Text = Request.QueryString["RouteID"] != null ? Request.QueryString["RouteID"].ToString() : "0";
            ShowData(Cmn.ToInt(lblID.Text));
        }
    }

    void ShowData(int ID)
    {
        try
        {
            using (BusRouteTableAdapter ta = new BusRouteTableAdapter())
            {
                DelhiMetro.BusRouteDataTable dt = ta.GetDataByID(ID);
                if (dt.Rows.Count == 1)
                {
                    DelhiMetro.BusRouteRow dr = dt[0];
                    lblRouteID.Text = dr.BusID.ToString();
                    lblSeqID.Text = dr.SeqID.ToString();
                    txtStopName.Text = dr.StopName;
                    txtLat.Text = dr.IsLatNull() ? "" : dr.Lat.ToString();
                    txtLng.Text = dr.IsLngNull()?"":dr.Lng.ToString();
                }
            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }

    void Update(int ID)
    {
        try
        {
            using (BusRouteTableAdapter ta = new BusRouteTableAdapter())
            {
                DelhiMetro.BusRouteDataTable dt = ta.GetDataByID(ID);
                DelhiMetro.BusRouteRow dr = dt.Rows.Count == 0 ? dt.NewBusRouteRow() : dt[0];

                dr.BusID = Cmn.ToInt(lblRouteID.Text);
                dr.StopName = txtStopName.Text;
                if (lblSeqID.Text=="0")
                {
                    lblSeqID.Text = (Cmn.ToDbl(ta.GetMaxSequenceID(dr.BusID)) + 1).ToString();
                }
                dr.SeqID = Cmn.ToDbl(lblSeqID.Text);
                dr.Lat = Cmn.ToDbl(txtLat.Text);
                dr.Lng = Cmn.ToDbl(txtLng.Text);

                if (dt.Rows.Count == 0)
                    dt.Rows.Add(dr);

                ta.Update(dt);
                
                if (dr != null)
                    lblStatus.Text = "Data Saved";

                if (ID == 0)
                {
                    ID = Cmn.ToInt(ta.MaxID());
                    lblID.Text = ID.ToString();
                }
                
                Cmn.WriteClientScript(this, "parent.ShowBusRouteList(" + ID + "," + dr.BusID + ")");

            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Update(Cmn.ToInt(lblID.Text));
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {

        try
        {

            using (BusRouteTableAdapter ta = new BusRouteTableAdapter())
            {
                DelhiMetro.BusRouteDataTable dt = ta.GetDataByID(Cmn.ToInt(lblID.Text));
                foreach (DelhiMetro.BusRouteRow dr in dt.Rows)
                    dr.Delete();

                ta.Update(dt);

            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        Cmn.WriteClientScript(this, "parent.ShowBusRouteList(0," + lblRouteID.Text + ")");
        //Cmn.WriteClientScript(this, "parent.ShowBusRouteEdit(0," + lblRouteID.Text + ")");
    }
    protected void btnAddAfter_Click(object sender, EventArgs e)
    {
        lblID.Text = "0";
        lblSeqID.Text = (Cmn.ToDbl(lblSeqID.Text) + .1).ToString();
        Update(0);
            
    }
}