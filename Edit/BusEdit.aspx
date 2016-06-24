<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusEdit.aspx.cs" Inherits="Edit_BusEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 { width: 168px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="1">
            <tr>
                <td>
                    <asp:DropDownList ID="ddMetro" runat="server" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="1">
                        <tr>
                            <td>ID</td>
                            <td class="style1">
                                <asp:Label ID="lblID" runat="server"></asp:Label></td>
                        </tr>
                        
                        <tr>
                            <td>Name</td>
                            <td class="style1">
                                <asp:TextBox ID="txtRouteName" runat="server" /></td>
                        </tr>
                          <tr>
                            <td>From</td>
                            <td class="style1">
                                <asp:TextBox ID="txtFrom" runat="server" /></td>
                        </tr>
                       
                          <tr>
                            <td>To</td>
                            <td class="style1">
                                <asp:TextBox ID="txtTo" runat="server" /></td>
                        </tr>
                           
                        <tr>
                            <td><asp:Label ID="lblStatus" runat="server"  ></asp:Label></td>
                            <td class="style1">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" />
                                <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
                                <asp:Button ID="btnDelete" runat="server" onclick="btnDelete_Click" Text="Delete" />
                            </td>
                        
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
