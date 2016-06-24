<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 500px">
        <div style="float: left;">
            <h2>
                Email:</h2>
            rrasoftmail@gmail.com
            <h2>
                Phone:</h2>
            011-223433334
        </div>
        <div style="float: right;">
            <div style="float: right; padding-left: 5px; margin: 5px;">
                <img src="<%=ResolveClientUrl(@"~/Images/DelhiMetro/ContecUs1.jpg") %> " height="150px" alt="" />
            </div>
    </div>
    </div>
</asp:Content>
