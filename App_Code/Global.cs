using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;

/// <summary>
/// Summary description for Global
/// </summary>
public class Global
{
    public Global()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string Culture
    {
        get
        {
            if (HttpContext.Current.Session["Culture"] == null)
                return "en-US";
            else
                return HttpContext.Current.Session["Culture"].ToString();
        }

        set
        {
            HttpContext.Current.Session["Culture"] = value;
        }
    }
        

    public static string FromPage
    {
        get
        {
            if (HttpContext.Current.Session["FROMPAGE"] == null)
                return "";
            else
                return HttpContext.Current.Session["FROMPAGE"].ToString();
        }

        set
        {
            HttpContext.Current.Session["FROMPAGE"] = value;
        }
    }
        
    public static string UserName
    {
        get
        {
            if (HttpContext.Current.Session["USERNAME"] == null)
                return "";
            else
                return HttpContext.Current.Session["USERNAME"].ToString();
        }

        set
        {
            HttpContext.Current.Session["USERNAME"] = value;
        }
    }
    public static string UserEmailID
    {
        get
        {
            if (HttpContext.Current.Session["UserEmailID"] == null)
                return "";
            else
                return HttpContext.Current.Session["UserEmailID"].ToString();
        }

        set
        {
            HttpContext.Current.Session["UserEmailID"] = value;
        }
    }
    
    public static Boolean LogInDone
    {
        get
        {
            if (HttpContext.Current.Session["LOGINDONE"] == null)
                return false;
            else
                return HttpContext.Current.Session["LOGINDONE"].ToString() == "1" ? true : false;
        }

        set
        {
            HttpContext.Current.Session["LOGINDONE"] = value ? "1" : "0";
        }
    }
        
    public static Boolean IsAdmin
    {
        get
        {
            if (HttpContext.Current.Session["ISADMIN"] == null)
                return false;
            else
                return HttpContext.Current.Session["ISADMIN"].ToString()=="1"?true:false;
        }

        set
        {
            HttpContext.Current.Session["ISADMIN"] = value?"1":"0";
        }
    }

    public static int SelectedMetro
    {
        get
        {
            if (HttpContext.Current.Session["SelectedMetro"] == null)
                return 1;
            else
                return (int)HttpContext.Current.Session["SelectedMetro"];
        }

        set
        {
            HttpContext.Current.Session["SelectedMetro"] = value;
        }
    }
}
