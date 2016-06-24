<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StationGroup.aspx.cs" Inherits="Edit_StationGroup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
        <table>
            <tr>
                <td>
                    <asp:ListBox ID="lstStnParent" runat="server" AutoPostBack="True" Height="600px" onselectedindexchanged="lstStnParent_SelectedIndexChanged" Width="200px"></asp:ListBox>
                </td>
                <td>
                    <asp:ListBox ID="lstStnChild" runat="server" Height="600px" Width="200px"></asp:ListBox>
                </td>
                <td>
                    <asp:ListBox ID="lstStnList" runat="server" Height="600px" Width="200px"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnRemove" runat="server" onclick="btnRemove_Click" Text="Remove" />
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="Add" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
