<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StationList.aspx.cs" Inherits="Edit_StationList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
</head>
<script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="../js/Map.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">

    function UpdateLatLng(Lat, Lng)
    {
        $("#iframeStationEdit")[0].contentWindow.UpdateLatLng(Lat, Lng);
    }

    function AddresslatLng(Lat, Lng)
    {
        $("#iframeStationEdit")[0].contentWindow.AddresslatLng(Lat, Lng);
    }

    function SelectedStationID(ID, MetroID)
    {
        $("#ddMetro").val(MetroID)

        if ($("#txtStationFrom").val() == "")
            $("#txtStationFrom").val(ID);
        else
        {
            $("#txtStationTo").val(ID);
            if ($("#chkAutoConnect").prop("checked"))
                btnConnect_onclick();
        }
    }

    function btnConnect_onclick()
    {
        ConnectionStations($("#ddMetro").val(), $("#txtStationFrom").val(), $("#txtStationTo").val(), ConnectionDone);
    }

    function ConnectionDone(data)
    {
        alert(data);
        $("#txtStationFrom").val($("#txtStationTo").val());
        $("#txtStationTo").val("");
    }
      
</script>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 400px">
                    <iframe id="iframeStationEdit" src="StationEdit.aspx" frameborder='0' style='width: 100%;
                        height: 600px'></iframe>
                </td>
                <td>
                    <iframe id='frameMap' src="../Map.htm" frameborder='0' style='width: 100%; height: 600px'>
                    </iframe>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td style="text-align: left;">
                    <input id="btnConnect" type="button" value="Connect" onclick="return btnConnect_onclick()" />
                    <input id="txtStationFrom" type="text" />
                    <input id="txtStationTo" type="text" />
                    <asp:DropDownList ID="ddMetro" runat="server">
                    </asp:DropDownList>
                    <input id="chkAutoConnect" type="checkbox" />Auto Connect
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>



