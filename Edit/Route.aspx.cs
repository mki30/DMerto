using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;
using System.Text;
using System.Data;

public partial class Edit_Route : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);
            ddMetro_SelectedIndexChanged(null, EventArgs.Empty);
        }
    }
    
    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {
        Global.SelectedMetro = Cmn.ToInt(ddMetro.SelectedValue);

        StringBuilder str = new StringBuilder("<table style='padding:0px;border-spacing:1px'><tr>");

        using (RouteTableAdapter ta = new RouteTableAdapter())
        {
            DelhiMetro.RouteDataTable dt = ta.GetDataByMetroID(Cmn.ToInt(ddMetro.SelectedValue));

            foreach (DataColumn col in dt.Columns)
            {
                str.Append("<th>" + col.ColumnName);
            }

            foreach (DelhiMetro.RouteRow dr in dt.Rows)
            {
                str.Append("<tr>");
                foreach (DataColumn col in dt.Columns)
                {
                    switch (col.ColumnName)
                    {
                        case "ID":
                            str.Append("<td><a href='#' onclick='ShowDialog(\"RouteEdit.aspx?RouteID=" + dr[col.Ordinal] + "\")'>" + dr[col.Ordinal] + "</a>");
                            break;
                        case "RouteColor":
                            str.Append("<td style='background-color:#" + dr[col.Ordinal] + "'>" + dr[col.Ordinal]);
                            break;

                        default:
                            str.Append("<td>" + dr[col.Ordinal].ToString() );
                            break;
                    }
                    
                }

            }

            str.Append("</table>");
        }

        lblData.Text = str.ToString();
    }
}