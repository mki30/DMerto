<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LineInfo.aspx.cs" Inherits="LineInfo" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="border: 1px solid  #DFD6D6; width: 100%;">
            <div style="float: right">
                <div style="float: right; padding: 5px; 5px; 5px; 0px; max-width: 155px;">
                    <img src="<% =ResolveClientUrl(@"~/Images/DelhiMetro/DelhiMetroBlueLine.jpg") %>" width="150px" alt="" /><br />
                    <asp:Label ID="lblLines" runat="server" EnableViewState="False" meta:resourcekey="lblLinesResource1"></asp:Label>
                </div>
            </div>
            <asp:Label ID="lblLinesMap" runat="server" EnableViewState="False" meta:resourcekey="lblLinesMapResource1"></asp:Label>
            <br />
            <asp:Label ID="lblRoute" runat="server" EnableViewState="False" meta:resourcekey="lblRouteResource1"></asp:Label>
            <asp:Label ID="lblSeq" runat="server" Text="Label" EnableViewState="False" meta:resourcekey="lblSeqResource1" Visible="False"></asp:Label>
        </div>
        <div>
        <asp:Panel ID="panelEnglish" runat="server">
            <div>
                <div id="RedLine" runat="server" style="display:block;">
                    <h1>
                        STATION INFORMATION</h1>
                </div>

                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                    Line 1 (Dilshad Garden - Rithala)</h2>
                <div style="float: right; padding: 5px; 5px; 5px; 0px; max-width: 155px;">
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/stRedinfo.jpg") %>" width="150px" alt="" /><br />
                </div>
                <b>Date of Completion:</b><br />
                Shahdara - Tis Hazari - December 2002
                <br />
                Inderlok - Rithala - March 2004
                <br />
                Dilshad Garden - Shahdara - June 2008
                <br />
                <b>Distance :</b>25.1 kms<br />
                <b>No. of Stations :</b>21<br />
                <p>
                    <b>Name of Stations :</b> Dilshad Garden, Jhilmil, Mansarovar Park, Shahdara, Welcome, Seelampur, Shastri Park, Kashmere Gate, Tis Hazari, Pul Bangash, Pratap Nagar, Shastri Nagar, Inder Lok, Kanhiya Nagar, Keshav Puram, Netaji Subhash Place, Kohat Enclave, Pitam Pura, Rohini East, Rohini West and Rithala.</p>
                <p>
                    The 8.5 kms section between Shahdara and Tis Hazari was the first Delhi Metro section to become operational and was inaugurated on 24th December 2002. The Inderlok - Rithala section became operational on 31st March 2004. The Shahdara Dilshad Garden section became operational from 4th June 2008.</p>
                This line is fully operational.<br />
            </div>
            <div>
                <div>
                    <h1>
                        STATION INFORMATION</h1>
                </div>
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                    Line 2 (Jahangirpuri -Huda City Centre)</h2>
                <div style="float: right; padding: 5px; 5px; 5px; 0px; max-width: 155px;">
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/stRedinfo.jpg") %>" width="150px" alt="" /><br />
                </div>
                <b>Date of Completion:</b><br />
                Vishwa Vidyalaya - Kashmere Gate - December 2004<br />
                Kashmere Gate - Central Sectt. - July 2005<br />
                Jahangirpuri - Vishwa Vidyalaya - February 2009
                <br />
                <br />
                <b>Distance :</b>42.4 kms<br />
                <b>No. of Stations :</b>34<br />
                <p>
                    <b>Name of Stations :</b> Jahangirpuri, Adarsh Nagar, Azad Pur, Model Town, GTB Nagar, Vishwa Vidyalaya, Vidhan Sabha, Civil Lines, Kashmere Gate, Delhi Main, Chawri Bazar, New Delhi, Rajiv Chowk, Patel Chowk and Central Sectt.</p>
                <p>
                    A 4 Km section of this line between Vishwa Vidyalaya and Kashmere Gate commenced commercial operations from 20th Dec, 2004. The next section between Kashmere Gate and Central Secretariat (7 Kms) opened for the public from 3rd July, 2005. The Vishwa Vidyalaya Jahangirpuri section was opened for the public
                    from 4th February 2009.</p>
                This line is fully operational.<br />
            </div>
            <div>
                <div>
                    <h1>
                        STATION INFORMATION</h1>
                </div>
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                    Line 3 (Noida City Centre – Dwarka Sector 9)</h2>
                <div style="float: right; padding: 5px; 5px; 5px; 0px; max-width: 155px;">
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/stRedinfo.jpg") %>" width="150px" alt="" /><br />
                </div>
                <b>Date of Completion:</b><br />
                Barakhamba – Dwarka - December, 2005
                <br />
                Dwarka - Dwarka Subcity - March, 2006
                <br />
                Barakhamba - Indraprastha - November, 2006
                <br />
                Indraprastha – Yamuna Bank – May, 2009
                <br />
                Yamuna Bank – Noida City Centre – November 2009
                <br />
                <br />
                <b>Distance :</b>47.3 kms<br />
                <b>No. of Stations :</b>34<br />
                <p>
                    <b>Name of Stations :</b> Noida City Centre, Golf course, Botanical Garden, Noida Sector 18, Noida Sector 16, Noida Sector 15, New Ashok Nagar, Mayur Vihar Ext. Mayur Vihar –I, Akshardham, Yamuna Bank, Indraprastha, Pragati Maidan, Mandi House, Barakhamba Road, Rajiv Chowk, R.K. Ashram Marg, Jhandewalan, Karol Bagh, Rajendra Place, Patel Nagar, Shadipur, Kirti Nagar, Moti Nagar, Ramesh Nagar, Rajouri Garden, Tagore Garden, Subhash Nagar, Tilak Nagar, Janakpuri East, Janakpuri West, Uttam Nagar East, Uttam Nagar West, Nawada, Dwarka Morh, Dwarka, Dwarka Sec-14, Dwarka Sec-13, Dwarka Sec-12, Dwarka Sec-11, Dwarka Sec-10 and Dwarka Sec-9.</p>
                <p>
                   A 22.79 Kms section of this line between Barakhamba and Dwarka commenced commercial operations from 31st December, 2005 and extensions of Line III i.e. 6.5 Kms into Dwarka subcity commenced commercial operations from 1st April, 2006 and 2.81 Kms from Barakhamba to Indraprastha commenced commercial operations on November 11, 2006.</p>
                   <p>The 2.1 kms section from Indraprastha to Yamuna Bank began commercial operations on 10th May 2009 while the 13.1 section of Yamuna Bank to Noida City Centre began operations on 12th November 2009</p>
                This line is fully operational.<br />
            </div>
            
             <div>
                <div>
                    <h1>
                        STATION INFORMATION</h1>
                </div>
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                    Line 4 (Yamuna Bank – Anand Vihar)</h2>
                <div style="float: right; padding: 5px; 5px; 5px; 0px; max-width: 155px;">
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/stRedinfo.jpg") %>" width="150px" alt="" /><br />
                </div>
                <b>Date of Completion:</b><br />
             Yamuna Bank – Anand Vihar – January 2010 
                
                <br />
                <b>Distance :</b>6.25 kms<br />
                <b>No. of Stations :</b>34<br />
                <p>
                    <b>Name of Stations :</b>  Laxmi Nagar, Nirman Vihar, Preet Vihar, Karkarduma and Anand Vihar.</p><br />
                    <p>The 6.25 kms section from Yamuna Bank to Anand Vihar began commercial operations on 6th January 2010.</p>
                  
                This line is fully operational.<br />
            </div>
    
    </asp:Panel>
    <asp:Panel ID="panelHindi" runat="server">
    </asp:Panel>
    </div>
</asp:Content>
