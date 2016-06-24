<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FareList.aspx.cs" Inherits="Edit_FareList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        select { background-color: #FFFFFF; }
    </style>
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <link href="../css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#divDialog").dialog({ width: 400, height: 300, autoOpen: false, show: "fade", hide: "fade" });
        });

        function ShowDialog(URL)
        {
            var title = 'Fare Edit';
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
        <table>
            <tr>
                <td>
                    <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True" onchange="parent.ReloadMap()">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ddlRoute" runat="server" OnSelectedIndexChanged="ddlRoute_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                    <asp:DropDownList ID="ddlStationName" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:ListBox ID="lstStation" runat="server" Height="100%" Width="100%"></asp:ListBox>
                </td>
                <td colspan="2">
                    <br />
                    <asp:Literal ID="ltData" runat="server"></asp:Literal>
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <div>
        <iframe id="frameDialog"></iframe>
    </div>
    </form>
</body>
</html>
