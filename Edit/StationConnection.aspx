<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StationConnection.aspx.cs" Inherits="Edit_StationConnection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../js/StationInfo.js" type="text/javascript"></script>
    <link href="../css/Simple.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#txtFrom").keyup(function () { ListBoxFilter(this, "#lstFrom"); });
            $("#txtTo").keyup(function () { ListBoxFilter(this, "#lstTo"); });

            $("#txtStnFrom").keyup(function () { ListBoxFilter(this, "#lstFrom",true); });
            $("#txtStnTo").keyup(function () { ListBoxFilter(this, "#lstTo", true); });
            
            $("#ddRouteList").change(
                function ()
                {
                    var color = $('option:selected', this).css('background-color');
                    $(this).css('background-color', color);
                }
            );

            $("#ddRouteList").change();

        });

        function ListBoxFilter(txt, lst,ByValue)
        {
            var Search = $(txt).val().toLowerCase();
            if (ByValue == undefined)
                ByValue = false;

            $(lst + " option").each(function (index)
            {
                if (ByValue)
                {
                    if ($(this).val().toLowerCase().indexOf(Search) > -1)
                    {
                        $(lst).get(0).selectedIndex = index;
                    }
                }
                else
                {
                    if ($(this).text().toLowerCase().indexOf(Search) > -1)
                    {
                        $(lst).get(0).selectedIndex = index;
                    }
                }
            });
        }

        function btnSwitchStation_onclick()
        {
            var valFrom = $("#lstFrom").val();
            var valTo = $("#lstTo").val();
            $("#lstFrom").val(valTo);
            $("#lstTo").val(valFrom);
            $("#txtTo").val("");
            $("#txtTo").focus();
        }

        function DeleteConnection(FromID, ToID)
        {
            parent.DisConnectionStations(FromID, ToID, LoadConnections);
        }

        function btnConnect_onclick()
        {
            $("#txtTo").val("");
            $("#txtTo").focus();
            ConnectStations($("#lstFrom").val(), $("#lstTo").val());
        }

        function ConnectStations(From, To)
        {
            var Color = $("#ddRouteList").css('background-color');
            parent.ConnectionStations($("#ddMetro").val(), From, To, $("#ddRouteList").val(), LoadConnections);
        }

        function btnConnectAndMoveNext_onclick()
        {
            btnConnect_onclick();
            btnSwitchStation_onclick();
        }

        var hexDigits = new Array
        ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f");

        //Function to convert hex format to a rgb color
        function rgb2hex(rgb)
        {
            rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
            return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
        }

        function hex(x)
        {
            return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
        }

        function StationListClick(obj)
        {
            if ($(obj).attr("id") == "lstFrom")
            {
                $("#txtStnFrom").val($(obj).val());
                LoadConnections();
            }
            else
                $("#txtStnTo").val($(obj).val());
        }

        function LoadConnections()
        {
            GetStationInfo($("#lstFrom").val(), function (data)
            {
                if($("#chkAutoCenter").prop("checked"))
                    parent.SetCenter(parseFloat(data[S_Lat]), parseFloat(data[S_Lng]));
            });

            $.ajax({
                url: "../Data.aspx?Action=CONNECTION_LIST&Data1=" + $("#lstFrom").val(),
                success: function (data)
                {
                    var Lines = data.split('~');
                    if (Lines[0] == "")
                        $("#divData").html(Lines[1]);
                    else
                        alert(Lines[0]);
                }
            });
        }

        function btnEdit_onclick()
        {
            parent.ShowStationEdit($("#lstFrom").val());
        }

        function SelectedStationID(ID, MetroID)
        {
            if(MetroID!=undefined)
                $("#ddMetro").val(MetroID)

            if ($("#lstFrom").val() == null || $("#chkUpdateFirstList").prop("checked"))
            {
                $("#lstFrom").val(ID);
                $("#txtStnFrom").val(ID);

                LoadConnections();
            }
            else
            {
                $("#lstTo").val(ID);
                $("#txtStnTo").val(ID);

                if ($("#chkShowShortRoute").prop("checked"))
                {
                    parent.GetPath($("#lstFrom").val(), $("#lstTo").val());
                }
            }

            //btnConnect_onclick();
        }


        function SelectFromStation(StationID)
        {
            $("#lstFrom").val(StationID);
            LoadConnections();
        }

        function btnReloadMap_onclick()
        {
            parent.LoadNetwork($("#ddMetro").val());
        }

        function chkShowShortRoute_onclick()
        {
            GetPath();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
    <div>
        <table style="padding:0px;border-spacing:0px;">
            <tr>
                <td colspan="2">
                    <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True" onchange="parent.ReloadMap()">
                    </asp:DropDownList>
                    <input id="btnEdit" type="button" value="Edit" onclick="return btnEdit_onclick()" />
                    <input id="btnReloadMap" type="button" value="Refresh Map" onclick="return btnReloadMap_onclick()" />
                    <input id="chkShowShortRoute" type="checkbox" onclick="return chkShowShortRoute_onclick()" />Show Route
                    <asp:CheckBox ID="chkUpdateFirstList" runat="server" Text="FirstList" Checked="True" />
                    <br />
                    <input id="chkAutoCenter" type="checkbox" checked="checked" />AutoCenter
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtFrom" class="search" runat="server" Width="60%"></asp:TextBox>
                    <asp:TextBox ID="txtStnFrom" runat="server" Width="25%"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtTo" class="search" runat="server" Width="60%"></asp:TextBox>
                    <asp:TextBox ID="txtStnTo" runat="server" Width="25%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="lstFrom" runat="server" Height="300px" Width="150px"></asp:ListBox>
                </td>
                <td>
                    <asp:ListBox ID="lstTo" runat="server" Height="300px" Width="150px"></asp:ListBox>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="btnConnect" type="button" value="Connect" onclick="return btnConnect_onclick()" />
                </td>
                <td>
                    <asp:DropDownList ID="ddRouteList" runat="server" Width="150px" onselectedindexchanged="ddRouteList_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="0">
                    <input id="btnConnectAndMoveNext" type="button" value="Connect &amp; Switch" onclick="return btnConnectAndMoveNext_onclick()" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input id="btnSwitchStation" type="button" value="Switch Station" onclick="return btnSwitchStation_onclick()" />
                    <asp:Button ID="btnUpdateColor" runat="server" onclick="btnUpdateColor_Click" Text="Update Route" ToolTip="Enter Station ID in the search textbox to update route of all stations in the route"  />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="divData">
                        <%--OnClientClick="return Distance();" />--%>
                    </div>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
