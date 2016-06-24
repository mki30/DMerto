using System;
using System.Data;

public partial class LineInfo : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        string error = "";
        MetaKeywords = "Delhi Metro, Different Line Information First Station to , Last Station";
        MetaDescription = "Find all information about Delhi Metro Line";

        lblLinesMap.Text = "<iframe id='frameMap' src='" + ResolveClientUrl(@"~\Map.htm") + "?Action=DelhiMetro' frameborder='0' style='width: 630px; height: 400px' align='Center'></iframe>";

        DataBase db = new DataBase();

        try
        {
            string LineNo = db.GetFieldValue("select RouteID from Route where RouteLongName='" + Data1.Replace("_"," ") + "'", ref error);
            lblRoute.Text = new Line().GetLines(Cmn.ToInt(LineNo), this);

            using (IDataReader dr = db.GetDataReader("Select * from Route where MetroID=1", ref error))
            {
                while (dr.Read())
                {
                    lblLines.Text += "<a href='" + ResolveClientUrl(@"~\line\") + dr["RouteLongName"].ToString().Replace(" ","_") + "'>" +(CurrentLanguage==Language.English ?  dr["RouteLongName"]:dr["RouteLongNameHindi"]) + "</a><hr/>";
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            db.Close();
        }

    }
}