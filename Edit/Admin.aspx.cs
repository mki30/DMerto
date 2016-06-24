using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DelhiMetroTableAdapters;

public partial class Edit_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFareCleanUp_Click(object sender, EventArgs e)
    {
        Dictionary<string, int> Stns = new Dictionary<string, int>();

        
        using (StationTableAdapter ta = new StationTableAdapter())
        {
            DelhiMetro.StationDataTable dt = ta.GetDataByMetroID(1);
            foreach (DelhiMetro.StationRow dr in dt.Rows)
            {
                if (dr.IsParentStnIDNull() || dr.ParentStnID == 0)
                {
                    foreach (DelhiMetro.StationRow dr2 in dt.Rows)
                    {
                        if (dr2.IsParentStnIDNull() || dr2.ParentStnID == 0)
                        {
                            string Key = dr.ID + "-" + dr2.ID;
                            if (!Stns.ContainsKey(Key))
                                Stns.Add(Key, 0);
                        }
                    }
                }
            }
        }


        using (FareTableAdapter ta = new FareTableAdapter())
        {
            DelhiMetro.FareDataTable dt = ta.GetData();

            //remove any station which should not be preset in the fare table
            foreach(DelhiMetro.FareRow dr in dt.Rows)
            {
                string Key=dr.StationFromID + "-" + dr.StationToID;
                if(!Stns.ContainsKey(Key))
                    dr.Delete();
                else
                    Stns.Remove(Key);// remove stations present in the fare table
            }

            //add any station which is not present in the fare table
            foreach (KeyValuePair<string, int> kvp in Stns)
            {
                DelhiMetro.FareRow dr =dt.NewFareRow();
                dr.StationFromID=Cmn.ToInt( kvp.Key.Split('-')[0]);
                dr.StationToID=Cmn.ToInt( kvp.Key.Split('-')[1]);
                dt.Rows.Add(dr);
            }

            ta.Update(dt);
        }
    }
}