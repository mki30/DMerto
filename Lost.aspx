<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lost.aspx.cs" Inherits="DelhiMetro_RedLine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div id="divLost">
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/fare.jpg") %>" height="150px" alt="" width="800px" />
        </div>
        <asp:Panel ID="panelEnglish" runat="server">
            <div>
                <h3>
                    LOST & FOUND
                </h3>
                <h3 class="SmallIcon">
                    For Lost and Found Section please contact :</h3>
                <p>
                    Station Control Room
                    <br />
                    Kashmere Gate Metro Station<br />
                    Ph: 011-23860837
                    <br />
                    011-23417910 Extn: 16600</p>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelHindi" runat="server">
            <div>
                <h2>
                    खोया और पाया
                </h2>
                <h3 class="SmallIcon">
                    खोया और पाया के लिए कृपया संपर्क करें :</h3>
                <p>
                    स्टेशन कंट्रोल रूम<br />
                    कश्मीरी गेट मेट्रो स्टेशन<br />
                    फोन:-011-23860837<br />
                    011-23417910
                </p>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
