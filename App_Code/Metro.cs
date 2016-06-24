using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;

/// <summary>
/// Summary description for Metro
/// </summary>
public class Metro
{
	public Metro()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void FillList(DropDownList dropdownlist)
    {
        DataBase db = new DataBase();

        try
        {
            string Error = "";
            string SQL = "select * from Metro order by MetroName";
          

            using (IDataReader dr = db.GetDataReader(SQL, ref Error))
            {
                while (dr.Read())
                {
                    dropdownlist.Items.Add(new ListItem(Cmn.ProperCase(dr["MetroName"]), dr["ID"].ToString()));

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
    }

}