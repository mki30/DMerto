using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Text;
using DelhiMetroTableAdapters;

public partial class MetroStationNumber : BasePage
{

    protected new void Page_Load(object sender, EventArgs e)
    {
        if (CurrentLanguage == Language.English)

            lblmsg.Text = "For any Queries/Grievances releted to any particular station, kindly contact that station at the number given below :";
        else
            lblmsg.Text = "किसी भी  विशेष स्टेशन से सम्बंधित  प्रश्न / शिकायत  के लिए, कृपया नीचे दिए गए नंबर पर स्टेशन से संपर्क करें:";

        lblStationNumber.Text = new Line().GetLines(0,this);
       
    }
}