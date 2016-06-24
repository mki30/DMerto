<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TouristsPlaceEdit.aspx.cs" Inherits="Edit_TouristsPlaceEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
    function UpdateLatLng(Lat, Lng)
    {
  
        $("#txtLat").val(Lat);
        $("#txtLng").val(Lng);
    }

    function AddresslatLng(Lat, Lng)
    {
        $("#txtLat").val(Lat);
        $("#txtLng").val(Lng);
    }
    function Touristsplace(ID)
    {
        $("#lstTouristsPlaceName").val(ID);
    }
    function btnFindAddress_onclick()
    {
        var address = $("#txtTouristPlaceName ").val() + " , Delhi, India";
        parent.FindAddress(address);
    }
</script>
 <%-- var address = $("#lstTouristsPlaceName").val() + " TouristsPlace , " + $("#lstTouristsPlaceName option:selected'").text();--%>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="1">
            <tr>
                <td>
                    ID
                </td>
                <td>
                    <asp:Label ID="lblID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    StationID
                </td>
                <td>
                    <asp:TextBox ID="txtStationID" runat="server"  />
                </td>
            </tr>
            <tr>
                <td>
                    TouristPlaceName
                </td>
                <td>
                    <asp:TextBox ID="txtTouristPlaceName" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Lat
                </td>
                <td>
                    <asp:TextBox ID="txtLat" runat="server"  />
                </td>
            </tr>
            <tr>
                <td>
                    Lng
                </td>
                <td>
                    <asp:TextBox ID="txtLng" runat="server"  />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ListBox ID="lstTouristsPlaceName" runat="server" Height="220px"  OnSelectedIndexChanged="lstTouristsPlaceName_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
                </td>
            </tr>
        </table>
          <input id="btnFindAddress" style="width: 90px" type="button" value="FindAddress" onclick="return btnFindAddress_onclick()" />
    </div>
    </form>
</body>
</html>
