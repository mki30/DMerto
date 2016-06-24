<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TouristsplaceMain.aspx.cs" Inherits="Edit_TouristsplaceMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />    
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/Map.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
    function UpdateLatLng(Lat, Lng)
    {
        $("#frameTouristsPlace")[0].contentWindow.UpdateLatLng(Lat, Lng);
    }

    function AddresslatLng(Lat, Lng)
    {
        $("#iframeShowTouristsplace")[0].contentWindow.AddresslatLng(Lat, Lng);
    }

    function Touristsplace(StationID)
    {
        $("#iframeStationEdit")[0].src = "StationEdit.aspx?StationID=" + StationID;
    }

    function SelectedStationID(StationID, MetroID)
    {
        $("#iframeTouristsplaceEdit")[0].src = "TouristsplaceEdit.aspx?StationID=" + StationID;

    }

    function FindAddress(address)
    {
        $("#frameMap")[0].contentWindow.codeAddress(address);
        
    }

</script>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 300px" valign="top">
                    <iframe id='frameTouristsPlace' src="TouristsPlaceEdit.aspx" frameborder='0' style='width: 100%; height: 600px'></iframe>
                </td>
                <td valign="top">
                    <iframe id='frameMap' src="../Map.htm" frameborder='0' style='width: 100%; height: 600px'></iframe>
                    <input id="btnZoomToRoute" type="button" value="Zoom To Route" onclick="return ZoomToRoute();" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>