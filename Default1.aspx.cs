using System;
using System.Text;
using System.Web.UI.WebControls;

public partial class _Default : BasePage
{

    StringBuilder str = new StringBuilder();
    protected new void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsLocalHost)
            {
                panelTest.Visible = false;
                btnShow.Visible = false;
            }

            Metro.FillList(ddMetro);
            ddMetro_SelectedIndexChanged(null, EventArgs.Empty);
        }

        string URL = this.Request.Url.ToString().ToUpper();
        if (URL.Contains("DELHIMETRORAIL"))
        {
            Title = "Delhi Metro Rail - route, time table, fare, first & last train";
            ddMetro.SelectedValue = "1";
            ddMetro.Visible = false;
        }
    }
    
    void ShowRoute(int StationFromID, int StationToID)
    {
        int MetroID = Cmn.ToInt(ddMetro.SelectedValue);
        Route R = new Route();
        str.Append("<table cellpadding='0' cellspacing='0'><tr>");
        switch (MetroID)
        {
            case 1://delhi metro

                if (StationToID == 0)
                {
                    str.Append(R.GetRoute(StationFromID,99,this,IsLocalHost));// lblNoida);
                    str.Append(R.GetRoute(StationFromID,57,this,IsLocalHost));// lblDwarka);
                    str.Append(R.GetRoute(StationFromID,21,this,IsLocalHost));// lblRithala);
                    str.Append(R.GetRoute(StationFromID,56,this,IsLocalHost));// lblHuaCityCenter);
                    str.Append(R.GetRoute(StationFromID,22,this,IsLocalHost));// lblJahangir);
                    str.Append(R.GetRoute(StationFromID,1,this,IsLocalHost));// lblDilshadGarden);
                    str.Append(R.GetRoute(StationFromID,106,this,IsLocalHost));// lblVaishali);
                    str.Append(R.GetRoute(StationFromID,135,this,IsLocalHost));// lblBadarpur);
                    str.Append(R.GetRoute(StationFromID,120,this,IsLocalHost));// lblMundka);
                    str.Append(R.GetRoute(StationFromID,139,this,IsLocalHost));// lblIGI);
                }
                else
                    str.Append(R.GetRoute(StationFromID,StationToID ,this,IsLocalHost));

                break;

            case 2://Singapore
                
                if (StationToID == 0)
                {
                    str.Append(R.GetRoute(StationFromID,186,this,IsLocalHost));//Joo Koon
                    str.Append(R.GetRoute(StationFromID,166,this,IsLocalHost));//Paris Ris
                    str.Append(R.GetRoute(StationFromID,216,this,IsLocalHost));//HarbourFront
                    str.Append(R.GetRoute(StationFromID,164,this,IsLocalHost));//Marina Bay
                    str.Append(R.GetRoute(StationFromID,168,this,IsLocalHost));//Changi Airport
                    str.Append(R.GetRoute(StationFromID,230,this,IsLocalHost));//Punggol
                }
                else
                    str.Append(R.GetRoute(StationFromID,StationToID,this,IsLocalHost));

                break;
            case 3://Subway NewYork

                if (StationToID == 0)
                {
                    str.Append(R.GetRoute(StationFromID,1738,this,IsLocalHost));//Van Cortlandt Park - 242 St-101
                    str.Append(R.GetRoute(StationFromID,1776,this,IsLocalHost));//South Ferry - 142

                    str.Append(R.GetRoute(StationFromID,1777,this,IsLocalHost));//Wakefield - 241 St -201
                    str.Append(R.GetRoute(StationFromID,1829,this,IsLocalHost));//New Lots Av -257  

                    str.Append(R.GetRoute(StationFromID,1830,this,IsLocalHost));//Harlem - 148 St -301
                    str.Append(R.GetRoute(StationFromID,1831,this,IsLocalHost));// 145 St -302

                    str.Append(R.GetRoute(StationFromID,1832,this,IsLocalHost));//Woodlawn -401
                    str.Append(R.GetRoute(StationFromID,1849,this,IsLocalHost));// Borough Hall -423

                    str.Append(R.GetRoute(StationFromID,1850,this,IsLocalHost));//Eastchester - Dyre Av -501
                    str.Append(R.GetRoute(StationFromID,1854,this,IsLocalHost));// Morris Park -505

                    str.Append(R.GetRoute(StationFromID,1855,this,IsLocalHost));//Pelham Bay Park -601
                    str.Append(R.GetRoute(StationFromID,1892,this,IsLocalHost));// Brooklyn Bridge - City Hall -640

                    str.Append(R.GetRoute(StationFromID,1893,this,IsLocalHost));//Flushing - Main St -701
                    str.Append(R.GetRoute(StationFromID,1913,this,IsLocalHost));// Times Sq - 42 Stt -721

                    str.Append(R.GetRoute(StationFromID,3221,this,IsLocalHost));//Grand1914 Central - 42 St-901
                    str.Append(R.GetRoute(StationFromID,1915,this,IsLocalHost));// Times Sq - 42 Stt -902

                    str.Append(R.GetRoute(StationFromID,1916,this,IsLocalHost)); //Inwood - 207 St - A02
                    str.Append(R.GetRoute(StationFromID,1967,this,IsLocalHost)); //Ozone Park - Lefferts Blve A52

                    str.Append(R.GetRoute(StationFromID,1968,this,IsLocalHost)); //21 St - Queensbridge - B04
                    str.Append(R.GetRoute(StationFromID,1983,this,IsLocalHost)); //Bay 50 St     -B16

                    str.Append(R.GetRoute(StationFromID,1984,this,IsLocalHost)); //Norwood - 205 St - D01
                    str.Append(R.GetRoute(StationFromID,2023,this,IsLocalHost)); //Coney Island - Stillwell Av  -D43


                    str.Append(R.GetRoute(StationFromID,2024,this,IsLocalHost)); //World Trade Center - E01
                    //str.Append(R.GetRoute(StationFromID,2023,this,IsLocalHost)); //Coney Island - Stillwell Av  -D40

                    str.Append(R.GetRoute(StationFromID,2025,this,IsLocalHost)); //Jamaica - 179 St - F01
                    str.Append(R.GetRoute(StationFromID,2056,this,IsLocalHost)); //Neptune Av  -F39

                    str.Append(R.GetRoute(StationFromID,2057,this,IsLocalHost)); //Jamaica Center - Parsons/Archer - G05
                    str.Append(R.GetRoute(StationFromID,2086,this,IsLocalHost)); //Fulton St -G36

                    str.Append(R.GetRoute(StationFromID,2085,this,IsLocalHost)); // Aqueduct - N Conduit Av -H02
                    str.Append(R.GetRoute(StationFromID,2097,this,IsLocalHost)); // Rockaway Park - Beach 116 St-H15 

                    str.Append(R.GetRoute(StationFromID,2098,this,IsLocalHost)); //121 St - J12
                    str.Append(R.GetRoute(StationFromID,2114,this,IsLocalHost)); //Kosciusko St -J17

                    str.Append(R.GetRoute(StationFromID,2115,this,IsLocalHost)); //8 Av - L01
                    str.Append(R.GetRoute(StationFromID,2138,this,IsLocalHost)); //Canarsie - Rockaway Pkwy -L29


                    str.Append(R.GetRoute(StationFromID,2139,this,IsLocalHost)); //Middle Village - Metropolitan Av -M01
                    str.Append(R.GetRoute(StationFromID,2156,this,IsLocalHost)); //Broad St -M23

                    str.Append(R.GetRoute(StationFromID,2157,this,IsLocalHost)); //8 Av -N01
                    str.Append(R.GetRoute(StationFromID,2165,this,IsLocalHost)); //86 St -N09

                    str.Append(R.GetRoute(StationFromID,2166,this,IsLocalHost)); //Canal St -Q01
                    //str.Append(R.GetRoute(StationFromID,2165,this,IsLocalHost)); //86 St -N09  

                    str.Append(R.GetRoute(StationFromID,2167,this,IsLocalHost)); // Astoria - Ditmars Blvd -R01
                    str.Append(R.GetRoute(StationFromID,2205,this,IsLocalHost)); // Bay Ridge - 95 St -R45



                    str.Append(R.GetRoute(StationFromID,1950,this,IsLocalHost)); // Franklin Av -S01
                    str.Append(R.GetRoute(StationFromID,2230,this,IsLocalHost)); // St George -S31
                
                }
                else
                    str.Append(R.GetRoute(StationFromID,StationToID,this,IsLocalHost));
                break;
            case 4://London Metro

                if (StationToID == 0)
                {
                    str.Append(R.GetRoute(StationFromID,3524,this,IsLocalHost));// Baker Street);1
                    str.Append(R.GetRoute(StationFromID,3547,this,IsLocalHost));// Bank);2
                    str.Append(R.GetRoute(StationFromID,3599,this,IsLocalHost));// Baker Street);3
                    str.Append(R.GetRoute(StationFromID,3620,this,IsLocalHost));// Acton Town);4
                    str.Append(R.GetRoute(StationFromID,3660,this,IsLocalHost));// Canada Water);5
                    str.Append(R.GetRoute(StationFromID,3675,this,IsLocalHost));// Bermondsey);6
                    str.Append(R.GetRoute(StationFromID,3676,this,IsLocalHost));// Canary Wharf);7
                    str.Append(R.GetRoute(StationFromID,3695,this,IsLocalHost));// Acton Central);8
                    str.Append(R.GetRoute(StationFromID,3715,this,IsLocalHost));// Aldgate);9
                    str.Append(R.GetRoute(StationFromID,3738,this,IsLocalHost));// Angel);10
                    str.Append(R.GetRoute(StationFromID,3780,this,IsLocalHost));// Alperton);11
                    str.Append(R.GetRoute(StationFromID,3816,this,IsLocalHost));// City Thameslink);12
                    str.Append(R.GetRoute(StationFromID,3818,this,IsLocalHost));// Blackhorse Road);13
                    str.Append(R.GetRoute(StationFromID,3872,this,IsLocalHost));// Abbey Road);00
                }
                else
                    str.Append(R.GetRoute(StationFromID,StationToID,this,IsLocalHost));

                break;

        }

        str.Append("</table>");
        lblData.Text = str.ToString();
    }

    protected void ddStationToList_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowRoute(Cmn.ToInt(ddStationFromList.SelectedValue), Cmn.ToInt(ddStationToList.SelectedValue));
    }
   
    protected void ddMetro_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MetroID = Cmn.ToInt(ddMetro.SelectedValue);
        Global.SelectedMetro = MetroID ;
        Station.FillStationList(ddStationFromList,MetroID,true,IsLocalHost,true);

        ddStationToList.Items.Clear();
        if (IsLocalHost)
        {
            ddStationToList.Items.Add(new ListItem("", ""));
            ddStationToList.Items.Add(new ListItem("<All>", "0"));
        }

        Station.FillStationList(ddStationToList, MetroID, false, IsLocalHost, true);

        //ShowRoute(Cmn.ToInt(ddStationFromList.SelectedValue), 0);
    }

    protected void btnSelectedindex_Click(object sender, EventArgs e)
    {
      
    }
    protected void ddTest_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddTest.SelectedValue == "")
            return;
        ddMetro.SelectedValue = "3";
        ddMetro_SelectedIndexChanged(null, EventArgs.Empty);
        ddStationFromList.SelectedValue = ddTest.SelectedValue.Split('-')[0];
        ddStationToList.SelectedValue = ddTest.SelectedValue.Split('-')[1];
        ddStationToList_SelectedIndexChanged(null, EventArgs.Empty);
    }
    protected void btnReverse_Click(object sender, EventArgs e)
    {
        string From = ddStationFromList.SelectedValue;
        ddStationFromList.SelectedValue = ddStationToList.SelectedValue;
        ddStationToList.SelectedValue = From;
        ddStationToList_SelectedIndexChanged(null, EventArgs.Empty);
    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        ShowRoute(Cmn.ToInt(ddStationFromList.SelectedValue), Cmn.ToInt(ddStationToList.SelectedValue));
    }
    protected void ddStationFromList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}