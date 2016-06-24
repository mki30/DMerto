<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RouteInfo.aspx.cs" Inherits="RouteInfo" ViewStateMode="Disabled" %>
<%@ Register Src="~/controls/stationselection.ascx" TagPrefix="uc" TagName="StationSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <uc:StationSelection runat="server" ID="ucStationSelection" />
   <asp:Label ID="lblData" runat="server" Text="Label" ViewStateMode="Disabled"></asp:Label>  
</asp:Content>
