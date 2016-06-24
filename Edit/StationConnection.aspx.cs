using System;
using RRA_Graph;

public partial class Edit_StationConnection : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {   
        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);

            string LastMetro = GetCookie("LastMetro");
            if (LastMetro != "")
                ddMetro.SelectedValue = LastMetro;

            ddMetro_SelectedIndexChanged(null, EventArgs.Empty);
        }

        lstFrom.Attributes.Add("onclick", "StationListClick(this)");
        lstTo.Attributes.Add("onclick", "StationListClick(this)");
        ddRouteList.Attributes.Add("onchange", "parent.ShowRoute(this)");

        
    }
   
    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MetroID = Cmn.ToInt(ddMetro.SelectedValue);
        Global.SelectedMetro = MetroID;
        SetCookie("LastMetro", ddMetro.SelectedValue);
        
        Station.FillStationList(lstFrom,MetroID);
        Station.FillStationList(lstTo,MetroID);
        Route.FillRouteList(ddRouteList);
        
    }
   
    protected void btnUpdateColor_Click(object sender, EventArgs e)
    {
        int StationFromID = Cmn.ToInt(txtStnFrom);
        int StationToID = Cmn.ToInt(txtStnTo);
        int MetroID=Cmn.ToInt(ddMetro.SelectedValue);

        ShortPathHelper sp = new ShortPathHelper().GetPath(StationFromID, StationToID);

        int RouteID = Cmn.ToInt(ddRouteList.SelectedValue);
        DataBase db = new DataBase();
        string Error = "";
        try
        {
            if (sp.Message == "")
            {
                for (int i = 1; i < sp.Path.Count; i++)
                {
                    StationFromID = sp.Path[i - 1].StationID;
                    StationToID = sp.Path[i].StationID;
                    Station.ConnectionStation(MetroID, StationFromID, StationToID, RouteID);
                    Station.ConnectionStation(MetroID, StationToID, StationFromID, RouteID);

                    if(i==1)
                        db.RunQuery("update Station set RouteID=" + RouteID + ",SeqNo=" + i + " where ID=" + sp.Path[0].StationID, ref Error);

                    db.RunQuery("update Station set RouteID=" + RouteID + ",SeqNo=" + (i+1) + " where  ID=" + StationToID, ref Error);
                }
            }
        }
        catch
        {
        }
        finally
        {
            db.Close();
        }

        Cmn.WriteClientScript(this, "parent.LoadNetwork(" + ddMetro.SelectedValue + ");");
        Route.FillRouteList(ddRouteList);// calling it again as colors are not retained on post back.
    }

    protected void ddRouteList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}