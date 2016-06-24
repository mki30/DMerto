<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BusMain.aspx.cs" Inherits="Edit_BusMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/Map.js" type="text/javascript"></script>
</head>
 <script type="text/javascript">

     // called from frameBusList left top
     function ShowBusEdit(ID)
     {
         $("#frameBusEdit")[0].src = "BusEdit.aspx?ID=" + ID;
         ShowBusRouteEdit(0, ID);
         ShowBusRouteList(0, ID);
         LoadBusRoute(ID);
     }

     // refresh iframeBusRouteEdit   right top
     function ShowBusRouteEdit(ID,RouteID)
     {
         if (RouteID == undefined)
             RouteID = 0;

         $("#iframeBusRouteEdit")[0].src = "BusRouteEdit.aspx?ID=" + ID + "&RouteID=" + RouteID;
         ShowBusStop(ID); //  called from map.js for map.htm
         $("#iframeBusRouteList")[0].contentWindow.ShowBusStop(ID);

     }

     // refresh iframeBusRouteList right bottom
     function ShowBusRouteList(ID,RouteID)
     {
         $("#iframeBusRouteList")[0].src = "BusRouteList.aspx?ID=" + ID + "&RouteID=" + RouteID;
         LoadBusRoute(RouteID); //  called from map.js for map.htm
     }
     
     function UpdateLatLng(Lat, Lng)
     {
         $("#iframeBusRouteEdit")[0].contentWindow.UpdateLatLng(Lat, Lng);
     }
     
 </script>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 250px" valign="top">
                    <iframe id='frameBusEdit' src="BusEdit.aspx" frameborder='0' style='width: 100%; height: 200px'></iframe>
                    <iframe id='frameBusList' src="BusList.aspx" frameborder='0' style='width: 100%; height: 600px'></iframe>
                </td>
                <td valign="top">
                    <iframe id='frameMap' src="../Map.htm" frameborder='0' style='width: 100%; height: 600px'></iframe>
                    <input id="btnZoomToRoute" type="button" value="Zoom To Route" onclick="return ZoomToRoute();" />
                </td>
                <td style="width: 250px" valign="top">
                    <iframe id="iframeBusRouteEdit" src="BusRouteEdit.aspx" frameborder='0' style='width: 100%; height: 250px'></iframe>
                    <iframe id="iframeBusRouteList" src="BusRouteList.aspx" frameborder='0' style='width: 100%; height: 600px'></iframe>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
