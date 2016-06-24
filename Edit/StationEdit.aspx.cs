using System;
using DelhiMetroTableAdapters;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Web.UI;

public partial class Edit_Station : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        lblStatus.Text = "";
        int StationID = Request.QueryString["StationID"] != null ? Cmn.ToInt(Request.QueryString["StationID"]) : 0;


        if (StationID != 0)
            lblID.Text = StationID.ToString();
        if (!IsPostBack)
        {
            Metro.FillList(ddMetro);
            ddMetro_SelectedIndexChanged(null, EventArgs.Empty);
        }

        if (!IsPostBack)
            ShowData(StationID);
        else
            CreateRouteCheckBox();

    }

    void ShowData(int StationID)
    {
        try
        {
            using (StationTableAdapter ta = new StationTableAdapter())
            {
                DelhiMetro.StationDataTable dt = ta.GetDataByID(StationID);
                if (dt.Rows.Count == 1)
                {
                    DelhiMetro.StationRow dr = dt[0];

                    if (ddMetro.SelectedValue != dr.MetroID.ToString())
                    {
                        ddMetro.SelectedValue = dr.MetroID.ToString();
                        ddMetro_SelectedIndexChanged(null, EventArgs.Empty);
                    }

                    txtCode.Text = dr.IsCodeNull() ? "" : dr.Code.ToString();
                    ddStationList.SelectedValue = dr.ID.ToString();
                    txtStationName.Text = dr.IsStationNameNull() ? "" : dr.StationName;
                    txtStationNameDisplay.Text = dr.IsDisplayNameNull() ? "" : dr.DisplayName;
                    txtLocalName.Text = dr.IsHindiNameNull() ? "" : dr.HindiName;
                    txtLat.Text = dr.IsLatNull() ? "" : dr.Lat.ToString();
                    txtLng.Text = dr.IsLngNull() ? "" : dr.Lng.ToString();
                    txtPhone.Text = dr.IsPhoneNull() ? "" : dr.Phone;
                    txtMobile.Text = dr.IsMobileNull() ? "" : dr.Mobile;
                    txtFromID.Text = dr.StnFirstID.ToString();
                    txtToID.Text = dr.StnLastID.ToString();
                    ddLayout.SelectedValue = dr.Layout.ToString();
                    txtDate.Text = dr.IsOpeningNull() ? "" : Cmn.ToDate(dr.Opening).ToString("MMM-dd-yyyy");
                    ddConnection.SelectedValue = dr.Connections.ToString();

                    if(!dr.IsRouteIDNull())
                        ddRouteList.SelectedValue= dr.RouteID.ToString();

                }
            }

            CreateRouteCheckBox();
            //lblRoute.Controls.Clear();
            //List<int> StationRouteList = StationRoute.GetRouteList(StationID);

            //List<CheckBox> chkList = new List<CheckBox>();


            //foreach (Control ctl in lblRoutes.Controls)
            //{
            //    if (ctl.GetType().Name == "CheckBox")
            //    {
            //        chkList.Add(ctl as CheckBox);
            //    }
            //}

            //foreach (CheckBox chk in chkList)
            //{
            //    int RouteID = Cmn.ToInt(chk.ID.Replace("chkRoute", ""));
            //    chk.Checked = StationRouteList.Contains(RouteID);

            //    if (chk.Checked)
            //    {
            //        lblRoutes.Controls.Remove(chk);
            //        lblRoute.Controls.Add(chk);
            //    }
            //}

            DelhiMetro.StationConnection1DataTable dtConnecion = Station.GetConnections(StationID);

            int ctr = 0;
            foreach (DelhiMetro.StationConnection1Row dr in dtConnecion.Rows)
            {
                ctr++;
                
                (FindControl("lblStationID"+ctr)as Label).Text   = dr.StationToID.ToString();
                (FindControl("lblStation"+ctr)as Label).Text = Cmn.ProperCase(dr.StnToName);
                (FindControl("txtTimeFirst"+ctr)as TextBox).Text = dr.IsTimeFirstNull() ? "" : dr.TimeFirst.ToString("HH:mm:ss");
                (FindControl("txtTimeLast" + ctr) as TextBox).Text = dr.IsTimeLastNull() ? "" : dr.TimeLast.ToString("HH:mm:ss");
                (FindControl("ddPlatform"+ctr)as DropDownList).SelectedValue = dr.IsPlatformNull() ? "0" : dr.Platform.ToString();
                (FindControl("ddlTrack"+ctr)as DropDownList).SelectedValue = dr.IsTrackNull() ? "0" : dr.Track.ToString();
            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }

    }

    void UpdateConnectionInfo(int StationFromID)
    {

        try
        {

            int ctr = 0;
            DelhiMetro.StationConnection1DataTable dtConnecion = Station.GetConnections(StationFromID);

            using (StationConnectionTableAdapter ta = new StationConnectionTableAdapter())
            {

                foreach (DelhiMetro.StationConnection1Row dr in dtConnecion.Rows)
                {
                    ctr++;

                    DelhiMetro.StationConnectionDataTable dt = ta.GetDataByStnFromTo(dr.StationFromID, dr.StationToID);
                   
                    if (dt.Rows.Count == 1)
                    {
                        DelhiMetro.StationConnectionRow drStn = dt[0];
                        drStn.TimeFirst = Cmn.ToDate((FindControl("txtTimeFirst" + ctr) as TextBox).Text);
                        drStn.TimeLast = Cmn.ToDate((FindControl("txtTimeLast" + ctr) as TextBox).Text);
                        drStn.Platform = Cmn.ToInt((FindControl("ddPlatform" + ctr) as DropDownList).SelectedValue);
                        drStn.Track = Cmn.ProperCase((FindControl("ddlTrack" + ctr) as DropDownList).SelectedValue);

                   
                        ta.Update(dt);
                        if (dr != null)
                            lblStatus.Text = "Data Saved";


                    }

                }
            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }

    }

    void UpdateData(int StationID)
    {
        try
        {
            using (StationTableAdapter ta = new StationTableAdapter())
            {
                DelhiMetro.StationDataTable dt = ta.GetDataByID(StationID);
                DelhiMetro.StationRow dr = dt.Rows.Count == 0 ? dt.NewStationRow() : dt[0];

                dr.Code = txtCode.Text;
                dr.MetroID = Cmn.ToInt(ddMetro.SelectedValue);
                dr.StationName = Cmn.ProperCase(txtStationName.Text);
                dr.DisplayName = Cmn.ProperCase(txtStationNameDisplay.Text);
                dr.HindiName = txtLocalName.Text;
                dr.Lat = Cmn.ToDbl(txtLat.Text);
                dr.Lng = Cmn.ToDbl(txtLng.Text);
                dr.Phone = txtPhone.Text;
                dr.Mobile = txtMobile.Text;
                dr.Code = txtCode.Text;
                dr.StnFirstID = Cmn.ToInt(txtFromID.Text);
                dr.StnLastID = Cmn.ToInt(txtToID.Text);
                dr.RouteID = Cmn.ToInt(ddRouteList.SelectedValue);
                dr.Layout = ddLayout.SelectedValue.ToString();
                dr.Opening = Cmn.ToDate(txtDate.Text);
                dr.Connections = ddConnection.SelectedValue.ToString();
                if (dt.Rows.Count == 0)
                    dt.Rows.Add(dr);

                ta.Update(dt);

                if (StationID == 0)
                {
                    StationID = Cmn.ToInt(ta.GetMaxID());
                }
                if (dr != null)
                    lblStatus.Text = "Data Saved";

            }

            UpdateRoute(StationID);
            UpdateConnectionInfo(StationID);
            ShowData(StationID);

            lblStatus.Text = "Data Saved";
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }

    void CreateRouteCheckBox()
    {
        //List<Route> RouteList = Route.GetList(Cmn.ToInt(ddMetro.SelectedValue));
        //lblRoutes.Controls.Clear();

        //foreach (Route R in RouteList)
        //{
        //    if (lblRoutes.FindControl("chkRoute" + R.ID) != null)
        //        continue;

        //    CheckBox chk = new CheckBox()
        //    {
        //        Text = R.RouteCode,
        //        ID = "chkRoute" + R.ID
        //    };

        //    chk.Width = Unit.Pixel(60);
        //    chk.Style.Add("padding", "2px");
        //    chk.Style.Add("margin", "1px");

        //    if (R.Color != "")
        //    {
        //        chk.BackColor = System.Drawing.ColorTranslator.FromHtml("#" + R.Color);
        //        chk.ForeColor = System.Drawing.ColorTranslator.FromHtml("#" + (Convert.ToUInt32("0x" + R.Color, 16) > Convert.ToUInt32("0x880000", 16) ? "000000" : "FFFFFF"));
        //    }

        //    lblRoutes.Controls.Add(chk);
        //    //lblRoutes.Controls.Add(new Literal(){Text="<br/>"});
        //}
    }



    void UpdateRoute(int StationID)
    {
        //DataBase db = new DataBase();
        //string Error = "";
        //try
        //{
        //    foreach (Control ctl in lblRoutes.Controls)
        //    {
        //        if (ctl.GetType().Name == "CheckBox")
        //        {
        //            CheckBox chk = ctl as CheckBox;
        //            int RouteID = Cmn.ToInt(chk.ID.Replace("chkRoute", ""));
        //            if (chk.Checked)
        //                db.RunQuery("insert into StationRoute (RouteID,StationID) values(" + RouteID + "," + StationID + ")", ref Error);
        //            else
        //                db.RunQuery("delete from StationRoute where RouteID=" + RouteID + " and StationID=" + StationID, ref Error);
        //        }
        //    }
        //}
        //catch (Exception ex)
        //{
        //    Response.Write(ex.Message);
        //}
        //finally
        //{
        //    db.Close();
        //}
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        UpdateData(Cmn.ToInt(ddStationList.SelectedValue));
        Cmn.WriteClientScript(this, "parent.LoadNetwork(" + ddMetro.SelectedValue + ");");
    }

    protected void ddStationList_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowData(Cmn.ToInt(ddStationList.SelectedValue));
    }

    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MetroID = Cmn.ToInt(ddMetro.SelectedValue);
        Station.FillStationList(ddStationList, MetroID);
        Route.FillRouteList(ddRouteList);
    }

    int AddStation(int MetroID, string StationName)
    {
        int StationID = 0;
        try
        {
            using (StationTableAdapter ta = new StationTableAdapter())
            {
                DelhiMetro.StationDataTable dt = ta.GetDataByStationNameAndMetro(StationName, MetroID);
                if (dt.Rows.Count == 0)
                {
                    DelhiMetro.StationRow dr = dt.NewStationRow();

                    dr.StationName = StationName;
                    dr.DisplayName = StationName;
                    dr.MetroID = MetroID;
                    dr.Lat = 0;
                    dr.Lng = 0;
                    dr.Phone = "";
                    dr.Mobile = "";
                    dt.Rows.Add(dr);

                    ta.Update(dt);
                }

                StationID = (int)ta.GetMaxID();
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }

        return StationID;
    }

    protected void btnStationAdd_Click(object sender, EventArgs e)
    {
        string[] Stations = txtStationsList.Text.Split('\n');

        int StationID = 0;
        foreach (string s in Stations)
        {
            string StnName = s.Trim().Replace("\t", "").Replace("\r", "");
            if (s != "")
            {
                StationID = AddStation(Cmn.ToInt(ddMetro.SelectedValue), StnName);
            }
        }

        txtStationsList.Text = "";

        ddMetro_SelectedIndexChanged(null, EventArgs.Empty);
        ShowData(StationID);
    }

    //List<int> GetSelectedRoutes(Boolean Uncheck = false)
    //{
    //    List<int> SelectedRoutes = new List<int>();
    //    foreach (Control ctl in lblRoutes.Controls)
    //    {
    //        if (ctl.GetType().Name == "CheckBox")
    //        {
    //            CheckBox chk = ctl as CheckBox;
    //            int RouteID = Cmn.ToInt(chk.ID.Replace("chkRoute", ""));
    //            if (chk.Checked) // create new station
    //            {
    //                SelectedRoutes.Add(RouteID);
    //                if (Uncheck)
    //                    chk.Checked = false;
    //            }
    //        }
    //    }

    //    return SelectedRoutes;
    //}

    //protected void btnSplit_Click(object sender, EventArgs e)
    //{
    //    List<int> SelectedRoutes = GetSelectedRoutes(true);
    //    double LngGap = 0.000376;
    //    for (int i = 0; i < SelectedRoutes.Count; i++)
    //    {
    //        CheckBox chk = lblRoutes.FindControl("chkRoute" + SelectedRoutes[i]) as CheckBox;
    //        chk.Checked = true;
    //        if (i == 0)
    //            UpdateData(Cmn.ToInt(ddStationList.SelectedValue));
    //        else
    //        {
    //            txtLng.Text = (Cmn.ToDbl(txtLng.Text) + LngGap).ToString();
    //            UpdateData(0);
    //        }

    //        chk.Checked = false;
    //    }

    //    Cmn.WriteClientScript(this, "parent.LoadNetwork(" + ddMetro.SelectedValue + ");");
    //}

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            int StationID = Cmn.ToInt(lblID.Text);
            using (StationTableAdapter ta = new StationTableAdapter())
            {
                DelhiMetro.StationDataTable dt = ta.GetDataByID(StationID);
                foreach (DelhiMetro.StationRow dr in dt.Rows)
                    dr.Delete();

                ta.Update(dt);
            }

            using (StationConnectionTableAdapter ta = new StationConnectionTableAdapter())
            {
                DelhiMetro.StationConnectionDataTable dt = ta.GetDataByStationFromID(StationID);
                foreach (DelhiMetro.StationConnectionRow dr in dt.Rows)
                    dr.Delete();
                ta.Update(dt);

                dt = ta.GetDataByStationToID(StationID);
                foreach (DelhiMetro.StationConnectionRow dr in dt.Rows)
                    dr.Delete();
                ta.Update(dt);

            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        Cmn.WriteClientScript(this, "parent.LoadNetwork(" + ddMetro.SelectedValue + ");");
    }

    protected void btnUpdateTime_Click(object sender, EventArgs e)
    {

        ShortPathHelper sp = new ShortPathHelper().GetPath(Cmn.ToInt(txtStnFromID.Text), Cmn.ToInt(txtStnToID.Text), IsLocalHost);

        DateTime LastTime = Cmn.ToDate(txtLastTimeToUpdate.Text);
        if (sp.Message == "")
        {
            double LastMin = 0;
            for (int i = 1; i < sp.Path.Count;i++ )
            {
                Station stnFrom = sp.Path[i-1];
                Station stnTo = sp.Path[i];

                using (StationConnectionTableAdapter ta = new StationConnectionTableAdapter())
                {
                    DelhiMetro.StationConnectionDataTable dt = ta.GetDataByStnFromTo(stnFrom.StationID, stnTo.StationID);

                    if (dt.Rows.Count == 1)
                    {
                        double a = (Cmn.ToDate(stnTo.TimeFirst) - Cmn.ToDate(stnFrom.TimeFirst)).TotalMinutes;
                        DelhiMetro.StationConnectionRow dr = dt[0];
                        LastTime = LastTime.AddMinutes(LastMin);
                        dr.TimeLast = LastTime;
                        ta.Update(dt);
                        LastMin = a;
                    }
                }
            }
        }

    }
    protected void txtStationsList_TextChanged(object sender, EventArgs e)
    {

    }
}