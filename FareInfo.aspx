<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FareInfo.aspx.cs" Inherits="MetroFares" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        #divDataTable { padding: 2px; background-color: #FEEEEE; height: 60px; text-align: center; padding-top: 45px; }
        p
        {
            text-align:justify;
            color:#464848;
        }
        #inner-cnt-in { text-align: justify; color: #464848; font-family: helvetica, trebuchet ms, verdana, arial; font-size: 12px; font-weight: normal; }
    </style>
    <div>
        
        <div style=" width: 100%; float: left; ">
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/fare.jpg") %>" width="800px" alt="" />
        </div>

        <asp:Panel ID="panelEnglish" runat="server">
        

        <div style="border: 0px solid; clear: both;">
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                Metro Fare
            </h2>
            <p>
                To know fare between two stations, please select them from below:
            </p>
            <div id="divDataTable"  >
                <asp:DropDownList ID="ddStationFromListEnglish" runat="server">
                </asp:DropDownList>
                <asp:DropDownList ID="ddStationToListEnglish" runat="server">
                </asp:DropDownList>
                <asp:Button ID="btnShowFare" runat="server" Text="Show" OnClick="btnShowFare_Click" /></div>
            <p style="height: 25px">
                <center><asp:Label ID="lblData" runat="server" Text="Label"></asp:Label></center>
            </p>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                Automatic Ticketing
            </h2>
            <p>
                Delhi Metro has introduced, for the first time in the country, ticketing and passenger control through a completely Automatic Fare Collection system.
            </p>
            <p>
                The ticket, which could be a card or a token, is purchased from the Ticket Counter. The passenger then proceeds to one of several gates that separate the Paid Area from the Unpaid Area. Here, the passenger will hold the ticket close to the machine to the right of the gate. If valid, the gates will open
                automatically, and the passenger can pass to the Paid Area. If not valid, then the passenger will need to contact the Customer Service Staff.
            </p>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                Ticket Options:
            </h2>
    
            <p> <img src="<% =ResolveClientUrl(@"~/Images/icon_blue_dot3.png") %>" height="15px" alt="" />
                <b>Travel Card :</b>
                <br />
                - Most convenient for the frequent commuter. A stored value card, The minimum recharge value of a travel card is Rs. 100/- and the maximum is Rs. 1000/-. A security deposit of Rs. 50/- (Refundable on return of card) is payable at purchase and the file commuter can add on a minimum value of Rs/-50 during
                purchase.Subsequent recharge of the card will be of a minimum value of Rs. 100/</p>
            <p>
                - Refund of Electronically Readable store value smart cards : - During refund, processing charges of Rs.5/- will be chargeable. Hence, the Electronic balance plus (+) security deposit minus (-) Rs 5/- will be refundable i.e. while refunding, Rs. 5/- will be deducted from sum of electronic balance and
                security deposit. Bonus amount ( if any) is not refundable. This is applicable both for physically damaged and physically ok electronically readable cards.)</p>
            - Refundable Deposit: Rs.50 only<br />
            - Validity: One Year from the date of purchase or one year from the date of recharge whichever is later.<br />
            - Renewal: Rs. 5/- will be charged<br />
            - Facility to check balance on Card: Ticket Reading Machines at all Metro Stations. </p>
            <p> <img src="<% =ResolveClientUrl(@"~/Images/icon_blue_dot.png") %>" height="15px" alt="" />
                <b>Tourist Card:</b>
                <br />
                For unlimited travel over short periods. There are two kinds of cards - 1 day and 3 day.<br />
                - Value of 1-Day Card: Rs 100<br />
                - Value of 3-Day Card: Rs 250<br />
                - Refundable Deposit: Rs 50/- payable at purchase (refundable on return of card)
            </p>
            <p> <img src="<% =ResolveClientUrl(@"~/Images/icon_blue_dot.png") %>" height="15px" alt="" />
                <b>Token:</b>
                <br />
                - Single-Journey Token: For one way journey<br />
                - Value will depend on the destination. Valid only on the day of purchase<br />
                - Minimum Fare Rs. 8/- and Maximum Fare Rs. 30/-</p>
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/touch-machine.jpg") %>" height="90%" width="30%" alt="" />
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/balance-checker.jpg") %>" height="90%" width="30%" alt="" />
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/yatri.jpg") %>" height="90%" width="30%" alt="" />
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                    How to use your Token:</h2>
                - Hold your token close to the machine for the gates to open.<br />
                - At exit, drop a Single-Journey token into the machine.<br />
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                    How to use your Smart Card/ Tourist Card:</h2>
            <p>
                - For entry to the station, please exhibit your travel card at the entry gate for the flap to open.<br />
                - For exit please exhibit your travel card at the exit gates for the flap to open and to do an exit from the station.</p>
            
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                    Instructions to Smart Card Holders/ Travel Card Holders:</h2>
            <p>
                1. In case of any difficulty, please get in touch with Customer Care Centre.</p>
            <p>
                2. If a passenger performs entry and exit from same station, under normal fare mode, a fare of Rs. 16/- will be deducted from his stored value of the Smart Card (SV-2, SV-5, SV-6) at the time of exit without recourse to CCC. Maximum period of stay within paid area for entry/exit from same station is
                defined as 20 minutes. For stay beyond 20 minutes a penalty at the rate of Rs 10/- hour subject to the maximum of Rs 50/- shall be charged per passenger.
            </p>
            <p>
                3. If a passenger performs simultaneous entry and exit at a station, i.e. making pseudo entry or exit at AFC gates, a penalty of Rs 80/- will be imposed on passenger. Manual penalty receipt willbe issued to passenger. If a passenger has been penalized insde paid area and exit has been recorded, a free
                exit token will be issued to the passenger for exit purposes.</p>
            <p>
                4. The refund of an unused Single journey token is permissible within 60 minutes of issuing of token from token issuing station only.
            </p>
            <p>
                5. Please ensure that any entry on a travel card is followed by a valid exit from the system.</p>
            <p>
                6. Please note that in case the time gap between entry and exit is more than maximum permissible time limit, a penalty at the rate of Rs. 10/- per hour is chargeable. The maximum permissible limit for entry/exit from the same station is 20 minutes and for entry/ exit from different station is 170 minutes</p>
            <p>
                7. In case of any entry/exit mismatch passenger will be charged as per Metro rules.</p>
        </div>

        </asp:Panel>
        <asp:Panel ID="panelHindi" runat="server">
         <div style="border: 0px solid; clear: both;">
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                किराए की सूचना


            </h2>
            <p>
               दो स्टेशनों के बीच का किराया जानने के लिए कृपया उन्हें निम्न में से चुने
            </p>
            <div  id="divDataTable">
                <asp:DropDownList ID="ddStationFromListHindi" runat="server">
                </asp:DropDownList>
                <asp:DropDownList ID="ddStationToListHindi" runat="server">
                </asp:DropDownList>
                <asp:Button ID="btnShowFareHindi" runat="server" Text="दिखाना" OnClick="btnShowFareHindi_Click" /></div>
                <p style="height: 25px">
                <center><asp:Label ID="lblDataHindi" runat="server"></asp:Label></center>
            </p>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
               स्वचालित टिकटिंग
            </h2>
            <p>
                दिल्ली मैट्रो ने देश में पहली बार, पूरी तरह स्वचालित किराया संग्रहण प्रणाली द्वारा टिकट वितरण और यात्री नियंत्रण प्रेषित किया है।
            </p>
            <p>
               टिकट, जो कार्ड या टोकन हो सकता है, टिकट काउंटर से खरीदा जाता है। फिर यात्री कई द्वारों में से किसी एक की ओर बढ़ता है जो भुगतान क्षेत्र से गैर-भुगतान क्षेत्र को अलग करता है। यहां, यात्री द्वार के दांई ओर मशीन पर टिकट लगाएगा। यदि वैध हो, द्वार स्वतः खुल जाएगा और यात्री भुगतान क्षेत्र में जा सकता है। यदि वैध न हो तो यात्री को ग्राहक सेवा स्टाफ से संपर्क करने की जरूरत होगी।
               </p>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                टिकट के विकल्प:
            </h2>
            <p> <img src="<% =ResolveClientUrl(@"~/Images/icon_blue_dot.png") %>" height="15px" alt="" />
                <b>ट्रैवल कार्ड:</b>
                <br />
               नियमित आने-जाने वालों के लिए अत्यधिक सुविधाजनक। एक संचित मूल्य कार्ड, ट्रैवल कार्ड रू. 50/- के वर्ग में उपलब्ध हैं और इन्हें अधिकतम रू. 800/- की सीमा तक रू. 50/- के गुणकों में रिचार्ज किया जा सकता है। खरीदते समय जमा राशि रू. 50/- (कार्ड लौटाने पर वापसी योग्य)</p>
            <p>
              
             - वापसी योग्य जमा राशि:रू. 50/- मात्र<br />
            - वैधता: खरीद की तिथि से एक वर्ष या रिचार्ज की तिथि से एक वर्ष, जो भी बाद में हो।<br />
          - नवीकरण: कोई अतिरिक्त शुल्क नहीं<br />
        - कार्ड में शेष राशि जानने की सुविधा: सभी मैट्रो स्टेशनों पर टिकट रीडिंग मशीनें। </p>
            <p> <img src="<% =ResolveClientUrl(@"~/Images/icon_blue_dot.png") %>" height="15px" alt="" />
                <b>पर्यटक कार्ड:</b>
                <br />
               कम अवधियों में असीमित सफर के लिए। इसमें कार्ड के दो प्रकार है - 1 दिन और 3 दिन।<br />
               - 1 दिन के कार्ड का मूल्य: रू. 100<br />
               - 3 दिन के कार्ड का मूल्य: रू. 250<br />
              - वापसी योग्य जमा राशि: खरीदते समय रू. 50/- (कार्ड लौटाने पर वापसी योग्य)
            </p>
            <p> <img src="<% =ResolveClientUrl(@"~/Images/icon_blue_dot.png") %>" height="15px" alt="" />
                <b>टोकन:</b>
                <br />
               - सिंगल ट्रैवल टोकन: एक तरफा यात्रा के लिए<br />
                - मूल्य गंतव्य स्थान पर आधारित होगा। केवल खरीद के दिन वैध।<br />
                - न्यूनतम किराया रु. 8/- और अधिकतम किराया रु. 30/-</p>
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/touch-machine.jpg") %>" height="90%" width="30%" alt="" />
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/balance-checker.jpg") %>" height="90%" width="30%" alt="" />
            <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/yatri.jpg") %>" height="90%" width="30%" alt="" />
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                   अपना टोकन कैसे प्रयोग करें:</h2>
                - द्वार खोलने के लिए अपना टोकन मशीन के साथ लगाएं<br />
                - बाहर आने के लिए, सिंगल ट्रैवल टोकन को मशीन में डालें।<br />
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                   अपना समार्ट कार्ड/यात्रा कार्ड कैसे प्रयोग करें:</h2>
            <p>
                - स्टेशन में प्रवेश के लिए, फ्लैप खोलने के लिए प्रवेश द्वार पर कृपया अपना ट्रैवल कार्ड प्रदर्शित करें।<br />
                - बाहर आने, फ्लैप खोलने के लिए कृपया बाहरी द्वार पर अपना ट्रैवल कार्ड प्रदर्शित करें और स्टेशन से बाहर निकलें।</p>
            
                <h2>
                    <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                    स्मार्ट कार्डधारकों/ट्रैवल कार्डधारकों के लिए निर्देश:

</h2>
            <p>
                1. किसी कठिनाई की दशा में, कृपया ग्राहक सेवा केंद्र से संपर्क करें।</p>
            <p>
                2. कृपया सुनिश्चित करें कि ट्रैवल कार्ड से कोई भी प्रवेश, सिस्टम से वैध निकास द्वारा किया गया है।
            </p>
            <p>
                3.  कृपया ध्यान दें कि प्रवेश और निकास के बीच अधिकतम स्वीकृत समय सीमा से अधिक होने की दशा में, रू. 10 प्रतिघंटा की दर से जुर्माना वसूल किया जाएगा। किसी एक स्टेशन पर प्रवेश/निकास का अधिकतम स्वीकृत समय 20 मिनट है और दूसरे स्टेशन में प्रवेश/निकास का समय 120 मिनट है। कृपया ध्यान दें कि प्रवेश और निकास के बीच अधिकतम स्वीकृत समय सीमा से अधिक होने की दशा में, रू. 10 प्रतिघंटा की दर से जुर्माना वसूल किया जाएगा। किसी एक स्टेशन पर प्रवेश/निकास का अधिकतम स्वीकृत समय 20 मिनट है और दूसरे स्टेशन में प्रवेश/निकास का समय 120 मिनट है।</p>
            <p>
                4. यात्री के किसी प्रवेश/निकास के बेमेल होने की दशा में मैट्रों नियमों के अनुसार शुल्क वसूला जाएगा।
            </p>
           
        </div>
          
        </asp:Panel>
        
    </div>
</asp:Content>
