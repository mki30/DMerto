<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusRouteEdit.aspx.cs" Inherits="Edit_BusRoute" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
</head>

<script type="text/javascript">

    function UpdateLatLng(Lat, Lng)
    {
        $("#txtLat").val(Lat);
        $("#txtLng").val(Lng);
    }

    function btnFindAddress_onclick()
    {
        var address = $("#txtStopName").val() + " , Delhi, India";
        parent.FindAddress(address);
    }

</script>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="1">
            <tr>
                <td>&nbsp;ID</td>
                <td>
                    <asp:Label ID="lblID" runat="server">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td>Route ID</td>
                <td>
                    <asp:Label ID="lblRouteID" runat="server">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td>Seq ID</td>
                <td>
                    <asp:Label ID="lblSeqID" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td><asp:TextBox ID="txtStopName" runat="server" /> </td>
            </tr>
            <%--<tr>
                <td>Sequence</td>
                <td><asp:TextBox ID="txtSequence" runat="server" /> </td>
            </tr>--%>
            <tr>
                <td>Lat</td>
                <td><asp:TextBox ID="txtLat" runat="server" /> </td>
            </tr>
            <tr>
                <td>Lng</td>
                <td><asp:TextBox ID="txtLng" runat="server" /> </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                </td>
                <td><asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" /><asp:Button ID="btnDelete" runat="server" Text="Delete" onclick="btnDelete_Click" /> 
                    <asp:Button ID="btnAddAfter" runat="server" onclick="btnAddAfter_Click" Text="Add After " />
                </td>
            </tr>
           
        </table>
       <input id="btnFindAddress" style="width: 90px" type="button" value="FindAddress" onclick="return btnFindAddress_onclick()" />
       
    </div>
    </form>
</body>
</html>
