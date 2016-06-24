using System;
using DelhiMetroTableAdapters;

public partial class Rail_Data_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // UpdateDistance();
       // UpdateStaionNames();
    }


    void UpdateStaionNames()
    {
        using (StationTableAdapter ta = new StationTableAdapter())
        {

            DelhiMetro.StationDataTable dt = ta.GetData();

            foreach (DelhiMetro.StationRow dr in dt.Rows)
            {
                dr.DisplayName = Cmn.ProperCase(dr.DisplayName);
            }

            ta.Update(dt);
        }
    }

    void UpdateDistance()
    {

        using (StationConnectionTableAdapter ta = new StationConnectionTableAdapter())
        {

            DelhiMetro.StationConnectionDataTable dt=ta.GetDataByMetroID(1);

            foreach(DelhiMetro.StationConnectionRow dr in dt.Rows)
            {
                Station StnFrom = Station.GetStation(dr.StationFromID);
                Station StnTo = Station.GetStation(dr.StationToID);

                dr.Distance = GeoCodeCalc.CalcDistance(StnFrom.Lat, StnFrom.Lng, StnTo.Lat, StnTo.Lng, GeoCodeCalcMeasurement.Kilometers);
            }

            ta.Update(dt);
        }
    }
}
