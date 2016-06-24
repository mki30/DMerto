<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FeederBus.aspx.cs" Inherits="FeederBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        #divDataTable td, th { padding: 2px; background-color: #FEEEEE; }
       #list li
        {
           list-style-image:url('./Images/icon_blue_dot.png');
   
        }
    </style>
    <div>
     <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/parking.jpg") %>" width="805px" alt="" />
    </div>
    <div style="border: 1px solid  #DFD6D6; width: 100%; ">
        <h2 style ="text-indent:10px;"> 
            FEEDER BUS</h2>
        <div style="padding-left: 10px;">
            <h2 style="margin-top: 10px;">
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                Features Of The Feeder Buses
            </h2>
            <div>
                <div style="float: right; padding-left: 5px; margin: 5px;">
                    <img src="<%=ResolveClientUrl(@"~/Images/DelhiMetro/DelhiMetroBlueLine.jpg") %> "height="150px" alt=""/>
                </div>
             
                <ul >
                    <li>New fare structure for feeder bus will be implemented from tomorrow 0-4 KM: 5 Rs., 4-10 KM: 10 Rs. and more than 10 KM: 15 Rs.</li>
                    <li>They are environment friendly with CNG engine.</li>
                    <li>Control Centers are being set up to monitor the movement of vehicles and will have traffic managers, traffic inspectors and Control Room Operators.</li>
                    <li>Buses are fan cooled.</li>
                    <li>First Aid Box and Fire Extinguisher are provided in the buses.</li>
                </ul>
               
                <br>
                <br>
            </div>
            <div id="divDataTable" style="padding-left: 15px; padding-right: 15px; margin: 15px;"">
            <h2 style="margin-top: 10px;">
                Feeder Buses Currently Operational
            </h2>
            <asp:Label ID="lblBusinfo" runat="server" Text="lblBusinfo"></asp:Label>
            <br>
            <br>
        </div>
        </div>
    </div>
</asp:Content>
