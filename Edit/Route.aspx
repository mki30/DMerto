<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Route.aspx.cs" Inherits="Edit_Route" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <link href="../css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
     
        $(document).ready(function ()
        {
            $("#divDialog").dialog({ width: 490, height: 500, autoOpen: false, show: "fade", hide: "fade"});
        });

        function ShowDialog(URL, title)
        {
            $("#frameDialog")[0].src = URL;
            $("#divDialog").dialog('option', 'title', title);
            $("#divDialog").dialog('open');
            return false;
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblData" runat="server" ></asp:Label>
    </div>
    </form>
   <div id='divDialog'>
            <iframe style="width: 100%" height="450px" id="frameDialog" frameborder="0" ></iframe>
        </div>

</body>
</html>
