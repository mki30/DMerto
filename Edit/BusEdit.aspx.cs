using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;

public partial class Edit_BusEdit : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lblID.Text = Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "0";
        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);
            ShowData(Cmn.ToInt(lblID.Text));
        }

    }

    void ShowData(int ID)
    {
        try
        {
            using (BusTableAdapter ta = new BusTableAdapter())
            {
                DelhiMetro.BusDataTable dt = ta.GetDataByID(ID);
                if (dt.Rows.Count == 1)
                {
                    DelhiMetro.BusRow dr = dt[0];
                    ddMetro.SelectedValue = dr.MetroID.ToString();
                    txtRouteName.Text = dr.RouteNo;
                    txtFrom.Text = dr.From;
                    txtTo.Text = dr.To;
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
            using (BusTableAdapter ta = new BusTableAdapter())
            {
                DelhiMetro.BusDataTable dt = ta.GetDataByID(ID);
                DelhiMetro.BusRow dr = dt.Rows.Count == 0 ? dt.NewBusRow() : dt[0];


                dr.MetroID = Cmn.ToInt(ddMetro.SelectedValue);
                dr.RouteNo = txtRouteName.Text;
                dr.From = txtFrom.Text;
                dr.To = txtTo.Text;

                if (dt.Rows.Count == 0)
                    dt.Rows.Add(dr);

                ta.Update(dt);


                if (dr != null)
                    lblStatus.Text = "Data Saved";

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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Update(0);
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {


        try
        {

            using (BusTableAdapter ta = new BusTableAdapter())
            {
                DelhiMetro.BusDataTable dt = ta.GetDataByID(Cmn.ToInt(lblID.Text));
                foreach (DelhiMetro.BusRow dr in dt.Rows)
                    dr.Delete();

                ta.Update(dt);
                
            }
        }
        catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
      //  Cmn.WriteClientScript(this, "parent.ShowBusList(0)");
    }
}


