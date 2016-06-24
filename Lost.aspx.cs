using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DelhiMetro_RedLine : BasePage
{
    protected new void Page_Load(object sender, EventArgs e)
    {
        base.Page_Load(sender, e);
        panelEnglish.Visible = CurrentLanguage == Language.English;
        panelHindi.Visible = CurrentLanguage == Language.Hindi;
    }
}