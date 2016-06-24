<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StationEdit.aspx.cs" Inherits="Edit_Station" %>

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

    $(document).ready(function ()
    {
    
        $("#ddRouteList").change(
                function ()
                {
                    var color = $('option:selected', this).css('background-color');
                    $(this).css('background-color', color);
                }
            );

        $("#ddRouteList").change();

    });

    function UpdateLatLng(Lat, Lng)
    {
        $("#txtLat").val(Lat);
        $("#txtLng").val(Lng);
    }

    function btnFindAddress_onclick()
    {
   
        var address = $("#txtStationName").val() + " station , " + $("#ddMetro option:selected'").text();
        parent.FindAddress(address);
    }

    function AddresslatLng(Lat, Lng)
    {
        $("#txtLat").val(Lat);
        $("#txtLng").val(Lng);
    }

    function LoadConnections()
    {
        GetStationInfo($("#ddMetro").val(), function (data)
        {
            parent.SetCenter(parseFloat(data[S_Lat]), parseFloat(data[S_Lng]));
        });

        $.ajax({
            url: "../Data.aspx?Action=CONNECTION_DROPDOWNLIST&Data1=" + $("#ddMetro").val(),
            //CONNECTION_LIST&Data1=" + $("#ddMetro").val(),
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

    function SelectedStationID1(ID, MetroID)
    {

        $("#ddMetro").val(MetroID)

        if ($("#txtStationName").val() == "")
        {

            $("#txtSerialNo").val(ID);
            $("#tcxtCode").val(ID);
            $("#txtStationName").val(ID);
        }

    }


</script>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblID" Visible="false" runat="server"></asp:Label>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    Metro
                </td>
                <td>
                    <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True" onchange="parent.ReloadMap()" Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Station
                </td>
                <td>
                    <asp:DropDownList ID="ddStationList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddStationList_SelectedIndexChanged" Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Code
                </td>
                <td>
                    <asp:TextBox ID="txtCode" runat="server" Width="48px"></asp:TextBox>
                    <asp:DropDownList ID="ddRouteList" runat="server" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <asp:TextBox ID="txtStationName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Display Name
                </td>
                <td>
                    <asp:TextBox ID="txtStationNameDisplay" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Local Name</td>
                <td>
                    <asp:TextBox ID="txtLocalName" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Lat
                </td>
                <td>
                    <asp:TextBox ID="txtLat" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Lng
                </td>
                <td>
                    <asp:TextBox ID="txtLng" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Height="22px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile
                </td>
                <td>
                    <asp:TextBox ID="txtMobile" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Layout</td>
                <td>
                    <asp:DropDownList ID="ddLayout" runat="server" Width="150px">
                        <asp:ListItem>At Grade</asp:ListItem>
                        <asp:ListItem>Elevated</asp:ListItem>
                        <asp:ListItem>Underground</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblConnection" runat="server" Text="Connection"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddConnection" runat="server" Width="150px">
                        <asp:ListItem>None</asp:ListItem>
                        <asp:ListItem>Yellow Line</asp:ListItem>
                        <asp:ListItem>Green Line</asp:ListItem>
                        <asp:ListItem>Red Line</asp:ListItem>
                        <asp:ListItem>Blue Line</asp:ListItem>
                        <asp:ListItem>Violet Line</asp:ListItem>
                        <asp:ListItem>Airport Express</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <td colspan="2">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            First Stn ID
                        </td>
                        <td>
                            <asp:TextBox ID="txtFromID" runat="server" Width="40px"></asp:TextBox>
                        </td>
                        <td>
                            Last Stn ID
                        </td>
                        <td>
                            <asp:TextBox ID="txtToID" runat="server" Width="40px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <tr>
                <td colspan="2">
                    <table style="width: 100%; padding: 0px; border-spacing: 1px;" cellpadding="0" cellspacing="1">
                        <tr style="background-color: Aqua">
                            <th>
                                Station
                            </th>
                            <th>
                                First
                            </th>
                            <th>
                                Last
                            </th>
                            <th>
                                PF
                            </th>
                            <th>
                            Track
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblStationID1" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblStation1" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTimeFirst1" runat="server" Width="60px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTimeLast1" runat="server" Width="60px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddPlatform1" runat="server">
                                    <%-- <asp:ListItem>0</asp:ListItem>--%>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem Value="8"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTrack1" runat="server">
                                    <asp:ListItem>L</asp:ListItem>
                                    <asp:ListItem>R</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblStationID2" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblStation2" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTimeFirst2" runat="server" Width="60px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTimeLast2" runat="server" Width="60px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddPlatform2" runat="server">
                                    <%--   <asp:ListItem>0</asp:ListItem>--%>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem Value="8"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTrack2" runat="server">
                                    <asp:ListItem>L</asp:ListItem>
                                    <asp:ListItem>R</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblStationID3" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblStation3" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTimeFirst3" runat="server" Width="60px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTimeLast3" runat="server" Width="60px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddPlatform3" runat="server">
                                    <%--   <asp:ListItem>0</asp:ListItem>--%>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem Value="8"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTrack3" runat="server">
                                    <asp:ListItem>L</asp:ListItem>
                                    <asp:ListItem>R</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
     &nbsp;
                </td>
                <td colspan ="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" Enabled="False" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <asp:TextBox ID="txtStationsList" runat="server" Height="29px" TextMode="MultiLine" Width="250px" ontextchanged="txtStationsList_TextChanged"></asp:TextBox>
    <asp:Button ID="btnStationAdd" runat="server" OnClick="btnStationAdd_Click" Text="Add Stations" ToolTip="Enter stations separated by new line" Width="90px" />
    <input id="btnFindAddress" style="width: 90px" type="button" value="FindAddress" onclick="return btnFindAddress_onclick()" />
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                From
          
            </td>
            <td>
                <asp:TextBox ID="txtStnFromID" runat="server" Width="30px"></asp:TextBox>
            </td>
            <td>
                To
            </td>
            <td>
                <asp:TextBox ID="txtStnToID" runat="server" Width="30px"></asp:TextBox>
            </td>
            <td>
               Time
            </td>
            <td>
                <asp:TextBox ID="txtLastTimeToUpdate" runat="server" Width="50px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnUpdateTime" runat="server" Text="Update" OnClick="btnUpdateTime_Click" />
            </td>
        </tr>
        
    </table>
    </form>
</body>
</html>
