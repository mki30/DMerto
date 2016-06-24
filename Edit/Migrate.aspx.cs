using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Edit_Migrate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataBase db = new DataBase();
        string Error="";
        Dictionary<int, int> StationIDMapping = new Dictionary<int, int>();
        using( IDataReader dr=db.GetDataReader("select * from singaporestation",ref Error ))
        {

            while (dr.Read())
            {

                int OldID = Cmn.ToInt( dr["ID"]);
                string Name = dr["stationname"].ToString();
                int NewID =Cmn.ToInt( db.GetFieldValue("select Id from station where  stationname='" + Name + "'", ref Error));
                if (NewID != 0)
                {
                    StationIDMapping.Add(OldID, NewID);
                }
            }

        }


        using (IDataReader dr = db.GetDataReader("select * from SingaporeStationConnection", ref Error))
        {

            while (dr.Read())
            {

                int From = Cmn.ToInt(dr["StationFromID"]);
                int To = Cmn.ToInt(dr["StationToID"]);

                int NewFrom = 0;
                int NewTo = 0;

                if (StationIDMapping.ContainsKey(From))
                    NewFrom = StationIDMapping[From];

                if (StationIDMapping.ContainsKey(To))
                    NewTo = StationIDMapping[To];

                if (NewFrom != 0 && NewTo != 0)
                {
                    db.RunQuery("insert into StationConnection (MetroID,StationFromID,StationToID) values(2," + NewFrom + "," + NewTo + ")", ref Error);
                }
              
            }

        }

    }
}