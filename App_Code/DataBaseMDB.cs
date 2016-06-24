using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;
/// <summary>
/// handles the opening and closing of the database connection
/// </summary>
public class DataBase //: System.Web.UI.Page
{
	
	public OleDbConnection myconnection=null;
	private OleDbCommand cmd;

	public DataBase()
		: this(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\DelhiMetro.mdb")
	{
	}

	public DataBase(string strAccessConn)
	{
		string vError = "";
		try
		{
			myconnection = new OleDbConnection(strAccessConn);
			cmd = new OleDbCommand(); 
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}

		
		myconnection.Open();

		cmd.Connection =myconnection;
	}

	public void Close()
	{

		if (myconnection.State == System.Data.ConnectionState.Open)
			myconnection.Close();
	}

	// run query and set value in data set
	public DataSet GetDataSet(string sqlQuery,ref string vError)
	{
		OleDbDataAdapter dbAdapter = new OleDbDataAdapter(sqlQuery, myconnection);
		DataSet resultsDataSet = new DataSet();

		try
		{   
			dbAdapter.Fill(resultsDataSet);
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}
		return resultsDataSet;
	}


	//IMPORTANT : It is the responsibility of the user to close the datareader
	public OleDbDataReader GetDataReader(string SQL, ref string vError)
	{
		vError = "";
		OleDbCommand cmd = new OleDbCommand(SQL,myconnection); 
		OleDbDataReader dataReader = null;
		
		try
		{
			dataReader = cmd.ExecuteReader();
		}
		catch (Exception Ex)
		{
			if (dataReader != null)
				dataReader.Close();

			vError = Ex.Message;
		}
		return dataReader;
	}

	// run only query 
	public void RunQuery(string sqlQuery, ref string vError)
	{
		vError = "";

		try
		{
			cmd.CommandText = sqlQuery;
			cmd.ExecuteNonQuery();
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}
	} 
	
	// ExecuteScalar
	public object ExecuteScalar(string sqlQuery,ref string vError)
	{
		try
		{
			cmd.CommandText = sqlQuery;
			return cmd.ExecuteScalar();
			//vError = "Transaction Complete";
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}
		return null;
	}

	public string GetFieldValue(string SQL,ref string vError)
	{
		string ret ="";
		vError = "";

		cmd.CommandText = SQL;
		OleDbDataReader dataReader=null;

		try
		{
			dataReader = cmd.ExecuteReader();
			dataReader.Read();
			ret = dataReader[0].ToString();
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}
		finally
		{
			if (dataReader!=null)
				dataReader.Close();
		}
		
		return ret;
	}

	// GetMax
	public int GetMax(string TableName, string FieldName, string where ,ref string vError)
	{
		string sqlQuery;
		int max = 0;
		object ob;
		try
		{
			sqlQuery = "select max(" + FieldName + ") from " + TableName + (where.Length>0?" where " + where:"");
			cmd.CommandText = sqlQuery;
			ob=cmd.ExecuteScalar();
			if (ob.GetType().ToString() != "System.DBNull")
				max = int.Parse(ob.ToString());
			vError = "";

			return max;
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}
		return 0;
	}

	//dublicate record
	//public bool CheckDublicateRecord(string TableName, string FieldName, string Name , string vError)
	//{
	//    string sqlQuery;
	//    int DublicateRecord = 0;
	//    object ob;

	//    try
	//    {
	//        sqlQuery = "select count(" + FieldName + ") from " + TableName + " where " + FieldName + "='" + Name + "' group by " + FieldName;

	//        cmd.CommandText = sqlQuery;
	//        ob = cmd.ExecuteScalar();
	//        //if (ob.GetType().ToString() != "System.DBNull")
	//        if(ob !=null)  
	//            DublicateRecord = Convert.ToInt16(ob);
	//        vError = "Transaction Complete";

	//        if (DublicateRecord >0)
	//            return true;
	//        else
	//            return false;

	//    }
	//    catch (Exception ex)
	//    {
	//        vError = ex.Message;
	//    }

	//    return false;
	//}

	//dublicate record
	public int GetCount(string sqlQuery,ref string vError)
	{
		int CountRecord= 0;
		object ob;

		try
		{
			cmd.CommandText = sqlQuery;
			ob = cmd.ExecuteScalar();
			//if (ob.GetType().ToString() != "System.DBNull")
			if(ob !=null)
				CountRecord = Convert.ToInt16(ob);
			vError = "Transaction Complete";

			return CountRecord; 
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}

		return 0;
	}

	public void FillCombo(string sqlQuery, DropDownList combo, string FirstField, string FirstValue, string DisplayField, string DisplayValue, ref string vError)
	{
		vError = "";

		cmd.CommandText = sqlQuery;
		OleDbDataReader dataReader;

		combo.Items.Clear();

		try
		{
			dataReader = cmd.ExecuteReader();
			if (FirstField != "")
				combo.Items.Add(new ListItem(FirstField, FirstValue));


			while (dataReader.Read())
			{
				combo.Items.Add(new ListItem(dataReader[DisplayField.Trim()].ToString(), dataReader[DisplayValue.Trim()].ToString()));
			}

			dataReader.Close();
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}

	}

	//Login
	public bool Login(string sqlQuery,ref string vError)
	{
		OleDbDataReader dataReader=null;
		try
		{
			cmd.CommandText = sqlQuery;
			dataReader = cmd.ExecuteReader();
			return dataReader.HasRows;
		}
		catch (Exception ex)
		{
			vError = ex.Message;
		}
		finally
		{
			if(dataReader!=null)
				dataReader.Close();
		}

		return false;
	}

}
