<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RouteEdit.aspx.cs" Inherits="Edit_RouteEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
                   ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                
                
                <br />
                MetroID:
                <asp:TextBox ID="MetroIDTextBox" runat="server" Text='<%# Bind("MetroID") %>' />
                <br />
                RouteID:
                <asp:TextBox ID="RouteIDTextBox" runat="server" Text='<%# Bind("RouteID") %>' />
                <br />
                RouteCode:
                <asp:TextBox ID="RouteCodeTextBox" runat="server" Text='<%# Bind("RouteCode") %>' />
                <br />
                AgencyID:
                <asp:TextBox ID="AgencyIDTextBox" runat="server" Text='<%# Bind("AgencyID") %>' />
                <br />
                RouteShortName:
                <asp:TextBox ID="RouteShortNameTextBox" runat="server" Text='<%# Bind("RouteShortName") %>' />
                <br />
                RouteLongName:
                <asp:TextBox ID="RouteLongNameTextBox" runat="server" Text='<%# Bind("RouteLongName") %>' />
                <br />
                RouteDesc:
                <asp:TextBox ID="RouteDescTextBox" runat="server" Text='<%# Bind("RouteDesc") %>' />
                <br />
                RouteType:
                <asp:TextBox ID="RouteTypeTextBox" runat="server" Text='<%# Bind("RouteType") %>' />
                <br />
                RouteURL:
                <asp:TextBox ID="RouteURLTextBox" runat="server" Text='<%# Bind("RouteURL") %>' />
                <br />
                RouteColor:
                <asp:TextBox ID="RouteColorTextBox" runat="server" Text='<%# Bind("RouteColor") %>' />
                <br />
                RouteTextColor:
                <asp:TextBox ID="RouteTextColorTextBox" runat="server" Text='<%# Bind("RouteTextColor") %>' />
                <br />
                StationFirstID:
                <asp:TextBox ID="StationFirstIDTextBox" runat="server" Text='<%# Bind("StationFirstID") %>' />
                <br />
                StationLastID:
                <asp:TextBox ID="StationLastIDTextBox" runat="server" Text='<%# Bind("StationLastID") %>' />
                <br />

    </div>
    </form>
</body>
</html>
