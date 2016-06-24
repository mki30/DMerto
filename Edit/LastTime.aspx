<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LastTime.aspx.cs" Inherits="Edit_LastTime" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="lstStations" runat="server" Height="502px" Width="482px" AutoPostBack="True" onselectedindexchanged="lstStations_SelectedIndexChanged"></asp:ListBox>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td>
                                From
                            </td>
                            <td>
                                <asp:DropDownList ID="ddStnFrom" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                To
                            </td>
                            <td>
                                <asp:DropDownList ID="ddStnTo" runat="server">
                                </asp:DropDownList>
                            </td>
                            <tr>
                                <td>
                                    Time
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTime" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btn" runat="server" Text="Save" onclick="btn_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
