<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MetroStationNumber.aspx.cs" Inherits="MetroStationNumber" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        #divDataTable table { width: 500px; }
        #divDataTable td, th { padding: 2px; background-color: #FEEEEE; }
        #divMSN { width: 590px; border: 1px solid #EFE1E0; float: left; background-color: #FDFCFA; padding: 5px 0px 5px 0px; margin-bottom: 10px; }
    </style>
    <div>
        <div>
            <div>
          <div style="border: 1px solid  #DFD6D6; width: 100%; text-indent: 15px; border-radius: 4px;">
                    <div style="float: right; padding-left: 5px; margin: 5px;">
                     
                    </div>
                    <div class="inr-cnt-cntr-hdn">
                        <h1>
                            Metro Station Number
                        </h1>
                    </div>
                    <div style="padding-left: 15px; margin: 15px;">
                        <h4 style="height: 25px">
                            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" width="15px" alt="" />
                            <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label></h4>
                    </div>
                    <div>
                        <asp:Label ID="lblLine" runat="server" BackColor="#FEEEEE" meta:resourcekey="lblLineResource1"></asp:Label>
                    </div>
                    <div id="divDataTable" style="padding-left: 15px; margin: 15px;">
                        <asp:Label ID="lblStationNumber" runat="server" meta:resourcekey="lblStationNumberResource1"></asp:Label>
                    </div>
                </div>
            </div>
            </div>    
            </div>
</asp:Content>
