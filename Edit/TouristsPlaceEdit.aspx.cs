using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;

public partial class Edit_TouristsPlaceEdit : BasePage
{
    // new int ID;
    protected new void Page_Load(object sender, EventArgs e)
    {
        int ID = Cmn.ToInt( QueryString("ID"));

        if (!IsPostBack)
        {
            ShowList();
            ShowData(ID);
        }
    }

    void ShowData(int ID)
    {
        try
        {
            using (TouristsplaceTableAdapter ta = new TouristsplaceTableAdapter())
            {
                DelhiMetro.TouristsplaceDataTable dt = ta.GetDataByID(ID);
                if (dt.Rows.Count == 1)
                {
                    DelhiMetro.TouristsplaceRow dr = dt[0];
                    lblID.Text = dr.ID.ToString();
                    txtStationID.Text = dr.IsStationIDNull() ? "" : dr.StationID.ToString();
                    txtTouristPlaceName.Text = dr.IsTouristPlaceNameNull() ? "" : dr.TouristPlaceName;
                    txtLat.Text = dr.IsLatNull() ? "" : dr.Lat.ToString();
                    txtLng.Text = dr.IsLngNull() ? "" : dr.Lng.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }

    void Update()
    {
        try
        {
            using (TouristsplaceTableAdapter ta = new TouristsplaceTableAdapter())
            {
                DelhiMetro.TouristsplaceDataTable dt = ta.GetDataByID(Cmn.ToInt(lblID.Text));
                DelhiMetro.TouristsplaceRow dr = dt.Rows.Count == 0 ? dt.NewTouristsplaceRow() : dt[0];
                
                dr.StationID = Cmn.ToInt(txtStationID.Text);
                dr.TouristPlaceName = txtTouristPlaceName.Text;
                dr.Lat = Cmn.ToDbl(txtLat.Text);
                dr.Lng = Cmn.ToDbl(txtLng.Text);

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

    void ShowList()
    {
        lstTouristsPlaceName.Items.Clear();

        using (TouristsplaceTableAdapter ta = new TouristsplaceTableAdapter())
        {
            DelhiMetro.TouristsplaceDataTable dt = ta.GetData();
                       
            foreach (DelhiMetro.TouristsplaceRow dr in dt.Rows)
            {
                lstTouristsPlaceName.Items.Add(new ListItem(dr.TouristPlaceName, dr.ID.ToString()));
            }
        }
    }
   
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        lblID.Text = "0";
        Update();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Update();
        ShowList();
    }

    protected void lstTouristsPlaceName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowData(Cmn.ToInt(lstTouristsPlaceName.SelectedValue));

        Cmn.WriteClientScript(this, "parent.Touristsplace(" + ID + "," + ")");
    }
}

