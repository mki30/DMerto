<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        #divData { height: 40px; padding: 2px; background-color: #FEEEEE; }
    </style>
    <div>
        
            <div id="divData" style="text-align: center">
            <asp:DropDownList ID="ddMetro" runat="server" OnSelectedIndexChanged="ddMetro_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                <asp:Label ID="lblFrom" runat="server" Text="From"></asp:Label>
                <asp:DropDownList ID="ddStationFromList" runat="server" Width="200px">
                </asp:DropDownList>
                <asp:DropDownList ID="ddStationFromListHindi" runat="server" Width="200px">
                </asp:DropDownList>
                <asp:Label ID="lblTo" runat="server" Text="To"></asp:Label>
                <asp:DropDownList ID="ddStationToList" runat="server" Width="200px" >
                </asp:DropDownList>
                <asp:DropDownList ID="ddStationToListHindi" runat="server" Width="200px" >
                </asp:DropDownList>
                <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="Show" />
            </div>
            <div style="min-height: 500px;">
                 <p style="height: 25px;"><center><asp:Label ID="lblData" runat="server" Text=""></asp:Label></center></p>
                </div>
        </div> 
</asp:Content>
