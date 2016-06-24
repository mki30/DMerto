<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StationConnectionMain.aspx.cs" Inherits="Edit_StationConnectionMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/Map.js" type="text/javascript"></script>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script src="../js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function UpdateLatLng(Lat, Lng)
        {
            $("#iframeStationEdit")[0].contentWindow.UpdateLatLng(Lat, Lng);
        }

        function AddresslatLng(Lat, Lng)
        {
            $("#iframeStationEdit")[0].contentWindow.AddresslatLng(Lat, Lng);
        }
        
        function ShowStationEdit(StationID)
        {
            $("#iframeStationEdit")[0].src = "StationEdit.aspx?StationID=" + StationID;
        }

        function SelectedStationID(StationID, MetroID)
        {
            $("#iframeStationEdit")[0].src = "StationEdit.aspx?StationID=" + StationID;
            $("#frameEditConnection")[0].contentWindow.SelectedStationID(StationID, MetroID);
        }

        function ShowRoute(obj)
        {
            $.ajax({
                url: "../Data.aspx?Action=GET_ROUTE&Data1=" + $(obj).val(),
                success: function (data)
                {
                    ShowRouteDone(data);
                }
            });
        }

        function ShowRouteDone(data)
        {
            var Lines = data.split('~');

            var str = "<table style='padding:0px;border-spacing:1px;text-indent:0px;'><tr>";
            if (Lines[0] != "")
            {
                str + "<td>" + Lines[0];
            }
            else
            {
                var ctr = 0;
                for (var i = 1; i < Lines.length; i++)
                {
                    if (Lines[i] == "")
                        continue;
                    var Fields = Lines[i].split('^');

                    if (ctr % 10 == 0)
                        str += "<td valign='top'>";

                    str += (ctr + 1) + " <a title='" + Fields[0] + "' href='#' onclick='SetCenter(" + Fields[1] + "," + Fields[2] + ");SelectedStationID(" + Fields[0] + ")'>" + Fields[4] + " (" + Fields[5] + ")</a><br/>";

                    ctr++;
                }                
            }
            str += "</table>";

            $("#divRoute").html(str);
        }      

        
    </script>
</head>
    <body>
        <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 98%">
                <tr>
                    <td style="width: 320px" valign="top">
                        <iframe id='frameEditConnection' src="StationConnection.aspx" frameborder='0' style='width: 100%; height: 600px'></iframe>
                    </td>
                    <td valign="top">
                        <iframe id='frameMap' src="../Map.htm" frameborder='0' style='width: 100%; height: 600px'></iframe>
                    </td>
                    <td style="width: 290px" valign="top">
                        <iframe id="iframeStationEdit" src="StationEdit.aspx" frameborder='0' style='width: 100%; height: 600px'></iframe>   
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="3">
                        <div id="divRoute"></div>
                        </td>
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>
