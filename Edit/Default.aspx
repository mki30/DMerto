<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Rail_Data_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delhi Metro Editor</title>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <link href="../css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css" />
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js"></script>
<script language="javascript" type="text/javascript">
    var BasePath = '<%= ResolveClientUrl(".") %>/';
</script>
<script type="text/javascript" src="../js/MakeTabs.js"></script>
<script language="javascript" type="text/javascript">
    TabText = new Array("Station", "Route", "Fare", "Last Train Time", "Stn Group", "Bus", "Touristsplace");
    TabLinks = new Array("StationConnectionMain.aspx", "Route.aspx", "Fare.aspx", "LastTime.aspx", "StationGroup.aspx", "BusMain.aspx", "TouristsplaceMain.aspx");
</script>
<body onload="Resized()">
    <div id='tabsProfile'>
    </div>
</body>
</html>
