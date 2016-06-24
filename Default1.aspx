<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SubRail.com Subways & Suburban trains of the world</title>

<meta name="Description" content="Find all information about Delhi Metro"/>
<meta name="Keywords" content="Delhi Metro, First Train, Last Train, Delhi Metro Fare, DMRC, Delhi Metro Rail Corporation, DMRC Route Map, Metro Map, Metro Station Information, Metro Timings, Delhi Map"/>
<meta name="Language" content="English"/>
<meta http-equiv="Expires" content="never"/>
<meta http-equiv="CACHE-CONTROL" content="PUBLIC"/>
<meta name="Designer" content="RRA Soft"/>
<meta name="Revisit-After" content="2 days"/>
<meta name="distribution" content="Global"/>
<meta name="Robots" content="Index,Follow"/>
<meta name="city" content="Delhi"/>
<meta name="country" content="India"/>	
<link rel="shortcut icon" href="images/favicondelhimetro.ico" />
    <link href="css/Simple.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .TopTable { background-image: url('Images/TopBack.jpg'); background-repeat: repeat-x; }
        
        .TopTable table { background-color: transparent; color: White; }
        
        .TopTable tr { background-color: transparent; }
        
        tr th
        {
            background-color:#CEF6CE;
        }
    </style>

    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-32151088-1']);
        _gaq.push(['_trackPageview']);

        (function ()
        {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

</script>
</head>
<body>
    <form id="form1" runat="server">
    <center>
      <asp:Panel ID="panelTest" runat="server">
                        
                        <table cellpadding="0" cellspacing="0">
                        <tr><td>
                        Test
                        </td>
                        
                        <td>
                        <asp:DropDownList ID="ddTest" runat="server" AutoPostBack="True" onselectedindexchanged="ddTest_SelectedIndexChanged" Width="150px">
                            <asp:ListItem></asp:ListItem>

                            <asp:ListItem Value="1738-1776">101 Van Cortlandt Park to 142	South Ferry</asp:ListItem>
                             <asp:ListItem Value="1738-1777">101 Van Cortlandt Park to Wakefield - 241 St -201</asp:ListItem>
                             <asp:ListItem Value="1738-1830">101 Van Cortlandt Park to Harlem - 148 St -301</asp:ListItem>
                             <asp:ListItem Value="1738-1832">101 Van Cortlandt Park to Woodlawn -401</asp:ListItem>
                             <asp:ListItem Value="1738-1850">101 Van Cortlandt Park to Eastchester - Dyre Av -501</asp:ListItem>
                             <asp:ListItem Value="1738-1855">101 Van Cortlandt Park to Pelham Bay Park -601</asp:ListItem>
                             <asp:ListItem Value="1738-1893">101 Van Cortlandt Park to Flushing - Main St -701</asp:ListItem>
                             <asp:ListItem Value="1738-1883">101 Van Cortlandt Park to Grand Central - 42 St-901</asp:ListItem>
                             <asp:ListItem Value="1738-1916">101 Van Cortlandt Park to Inwood - 207 St - A02</asp:ListItem>
                             <asp:ListItem Value="1738-1968">101 Van Cortlandt Park to 21 St - Queensbridge - B04</asp:ListItem>
                             <asp:ListItem Value="1738-1984">101 Van Cortlandt Park to Norwood - 205 St - D01</asp:ListItem>
                             <asp:ListItem Value="1738-2024">101 Van Cortlandt Park to World Trade Center - E01</asp:ListItem>
                             <asp:ListItem Value="1738-2025">101 Van Cortlandt Park to Jamaica - 179 St - F01</asp:ListItem>
                              <asp:ListItem Value="1738-2057">101 Van Cortlandt Park to Jamaica Center - Parsons/Archer - G05</asp:ListItem>
                             <asp:ListItem Value="1738-2085">101 Van Cortlandt Park to  Aqueduct - N Conduit Av -H02</asp:ListItem>
                             <asp:ListItem Value="1738-2098">101 Van Cortlandt Park to 121 St - J12</asp:ListItem>
                             <asp:ListItem Value="1738-2115">101 Van Cortlandt Park to 8 Av - L01</asp:ListItem>
                             <asp:ListItem Value="1738-2139">101 Van Cortlandt Park to Middle Village - Metropolitan Av -M01</asp:ListItem>
                             <asp:ListItem Value="1738-2157">101 Van Cortlandt Park to  8 Av -N01</asp:ListItem>
                             <asp:ListItem Value="1738-1770">101 Van Cortlandt Park to Canal St -Q01</asp:ListItem>
                             <asp:ListItem Value="1738-2167">101 Van Cortlandt Park to  Astoria - Ditmars Blvd -R01</asp:ListItem>
                              <asp:ListItem Value="1738-1812">101 Van Cortlandt Park to   Franklin Av -S01</asp:ListItem>

                        </asp:DropDownList>
                        </td>
                        </tr>
                        </table>
                        </asp:Panel>

        <div class="TopTable">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                    </tr>
                    <tr>
                    <td>From</td>
                    <td>
                        <asp:DropDownList ID="ddStationFromList" runat="server" Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="btnShow" runat="server" onclick="btnShow_Click" Text="Show" />
                    </td>
                    </tr>
                    <tr>
                    <td>To</td>
                    <td>
                        <asp:DropDownList ID="ddStationToList" runat="server" AutoPostBack="True" Width="200px" OnSelectedIndexChanged="ddStationToList_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="btnReverse" runat="server" onclick="btnReverse_Click" Text="Reverse" />
                        </td>
                    </tr>
            </table>
        </div>
        <asp:Label ID="lblData" runat="server" Text=""></asp:Label>
    </center>
    </form>

</body>
</html>
