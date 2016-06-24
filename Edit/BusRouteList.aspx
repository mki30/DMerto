<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusRouteList.aspx.cs" Inherits="Edit_BusRouteList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>

    <script type ="text/javascript">
        function ShowBusRouteEdit()
        {
            parent.ShowBusRouteEdit($("#lstBusRoute").val());
        }

        function ShowBusStop(ID)
        {
            $("#lstBusRoute").val(ID);
        }

    </script>
   
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="lblRouteID" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="btnMoveUp" runat="server" Text="MoveUp" onclick="btnMoveUp_Click" />
  
    <asp:Button ID="btnMoveDown" runat="server" Text="MoveDown" onclick="btnMoveDown_Click" />
    <div>
        <asp:ListBox ID="lstBusRoute" runat="server" Width="200" Height="400"></asp:ListBox>
        <br />
        <asp:TextBox ID="txtAddStops" runat="server" Height="94px" TextMode="MultiLine" Width="194px"></asp:TextBox>
        <asp:Button ID="btnAddStops" runat="server" onclick="btnAddStops_Click" Text="AddStops" />
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
