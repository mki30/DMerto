<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusList.aspx.cs" Inherits="Edit_BusList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>

    <script type ="text/javascript">
        function ShowBusEdit()
        {
            parent.ShowBusEdit($("#lstStops").val());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="1">
            <tr>
                <td>
                    <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="lstStops" runat="server" Height="500px" Width="200px" ></asp:ListBox>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
