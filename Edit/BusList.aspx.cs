using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;


public partial class Edit_BusList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);
            ddMetro_SelectedIndexChanged(null, EventArgs.Empty);
        }

        lstStops.Attributes.Add("onclick", "ShowBusEdit(this)");
    }

    void ShowList(int ID)
    {
        using (BusTableAdapter ta = new BusTableAdapter())
        {
            DelhiMetro.BusDataTable dt = ta.GetDataByMetroID(ID);

            lstStops.Items.Clear();
            foreach (DelhiMetro.BusRow dr in dt.Rows)
            {
                lstStops.Items.Add(new ListItem(dr.RouteNo,dr.ID.ToString() ));
            }
        }
    }

    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowList(Cmn.ToInt(ddMetro.SelectedValue));
    }
}