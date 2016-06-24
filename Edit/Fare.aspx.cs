using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;
using System.IO;

public partial class Edit_Fare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void btnUpdateFare_Click(object sender, EventArgs e)
    {
        string FileName = Server.MapPath(@"~\App_Data\DelhiMetroFare1.csv");

        string[] Lines = File.ReadAllLines(FileName);

        try
        {
            List<Station> StationList = Station.GetStations(1);


            using (StationTableAdapter taStation = new StationTableAdapter())
            {
                DelhiMetro.StationDataTable dtStations = taStation.GetData();

                string[] ToStations = Lines[0].Split(',');
                

                using (FareTableAdapter ta = new FareTableAdapter())
                {
                    DelhiMetro.FareDataTable dtFare = ta.GetData();

                    for (int i = 2; i < Lines.Length;i++ )
                    {
                        string[] Fields = Lines[i].Split(',');

                        if (Fields[0] == "")
                            continue;

                        int StationFromID = 0, StationToID = 0 ,Date=0;

                        //if (Fields[1].Trim() == "Chandni Chowk")
                        //{
                        //    int x = 10;
                        //}

                        DelhiMetro.StationRow[] drStations = (DelhiMetro.StationRow[])dtStations.Select("Code='" + Fields[0].Trim() + "'");
                        if (drStations.Length > 0)
                            StationFromID = drStations[0].ID;

                        for (int j = 2; j < ToStations.Length;j++ )
                        {

                            StationToID = 0;
                            drStations = (DelhiMetro.StationRow[])dtStations.Select("Code='" + ToStations[j].Trim() + "'");
                            if (drStations.Length > 0)
                                StationToID = drStations[0].ID;

                            if (StationFromID != 0 && StationToID != 0)
                            {

                                DelhiMetro.FareRow dr = dtFare.FindByStationFromIDStationToID(StationFromID, StationToID);//Global.SelectedMetro,
                                Boolean IsNew = false;
                                if (dr == null)
                                {
                                    dr = dtFare.NewFareRow();
                                    IsNew = true;
                                }

                                dr.StationFromID = StationFromID;
                                dr.StationToID = StationToID;
                                dr.Fare = Cmn.ToInt(Fields[j]);
                                dr.Date = Cmn.ToDate(Date);

                                if (IsNew)
                                    dtFare.Rows.Add(dr);
                            }
                        }

                        ta.Update(dtFare);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }      
    }
}