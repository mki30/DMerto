<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PassengerInformation.aspx.cs" Inherits="PassengerInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:Panel ID="panelEnglish" runat="server">
            <div>
                <div>
                    <h1>
                        PASSENGER INFORMATION</h1>
                </div>
                <div>
                    <p>
                        Delhi Metro is committed to provide the highest standards in safety to each passenger. With this in view, all design and operations are done with a safety margin.
                    </p>
                    <br />
                    <h2>
                        <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                        Safe Escalators</h2>
                    <div style="float: right; padding-left: 5px; margin: 5px;">
                        <img src="<%=ResolveClientUrl(@"~/Images/DelhiMetro/DelhiMetroBlueLine.jpg") %> " height="125px" alt="" />
                    </div>
                    <ul>
                        <li>
                            <p>
                                Escalators have been equipped with several safety devices to ensure safety of passengers that include protection against over speeding, detection of missing step etc. To reduce fire risk and improve safety a tray to collect human hair, dust, water, oil etc. has been provided.</p>
                        </li>
                        <li>
                            <p>
                                In addition, there is a unique sari guard feature that deflects loose clothing (e.g. sari of ladies) from getting trapped in the escalator.</p>
                        </li>
                        <li>
                            <p>
                                There are Emergency Stop Switches Prominently Displayed at 3 locations - Bottom, Top and Centre.</p>
                        </li>
                    </ul>
                    <h2>
                        <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                        Safe Coaches</h2>
                    <div style="float: right; padding-left: 5px; margin: 5px;">
                        <img src="<%=ResolveClientUrl(@"~/Images/DelhiMetro/DelhiMetroBlueLine.jpg") %> " height="125px" alt="" />
                    </div>
                    <ul>
                        <li>Coaches have been designed for maximum comfort and safety. </li>
                        <li>Automatic door opening and closing mechanism and the train cannot move unless all doors are closed and locked. If a door opens accidentally in the moving train, brakes will apply automatically, bringing the train to a halt. </li>
                        <li>Reduced fire risk due to special design features and materials. </li>
                        <li>Emergency evacuation facility through emergency front door. </li>
                        <li>Facility for passengers to talk to driver in Emergency. </li>
                        <li>Provision for Emergency announcements in the train by driver and Operation Control Centre. </li>
                        <li>
                        Communication between Operation Control Centre and driver.
                        <li>Emergency illumination and ventilation in case of power supply failure. </li>
                    </ul>
                    <h2>
                        <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                        Do's</h2>
                    <ul>
                        <li>Do stand in queue.</li>
                        <li>Do limit your baggage to 15 Kgs, not exceeding 60 cm (Length) X 45 cm (Breadth) X 25 cm ( Height) in size.</li>
                        <li>Do use the dustbins.</li>
                        <li>Do stand on the left side of the escalators and while moving keep to the right.</li>
                        <li>Do move away from escalators immediately after use.</li>
                        <li>Do make way for the physically challenged.</li>
                        <li>Do remember that the train stops for 30 seconds only.</li>
                        <li>Do show your tickets to Metro personnel, when asked to.</li>
                        <li>Do consider the comfort of your fellow passengers.</li>
                        <li>Do abstain from drunken and unruly behaviour.</li>
                        <li>Do take care of your valuables.</li>
                        <li>Do contact Metro Police for assistance.</li>
                        <li>Do contact female security personnel in case of any problem ( for lady passengers)</li>
                    </ul>
                    <h2>
                        <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                        Don'ts</h2>
                    <ul>
                        <li>Don’t bring eatables inside the station premises. </li>
                        <li>Don’t bring pets inside.< </li>
                        <li>Don’t smoke. </li>
                        <li>Don’t carry firearms. </li>
                        <li>Don’t travel without your smart card or token. </li>
                        <li>
                        Don’t jump over the ticket barrier.
                        <li>Don’t share your card or token with another person on the same journey. </li>
                        <li>Don’t cross the yellow line on the platform. </li>
                        <li>Don’t step onto the Metro tracks. </li>
                        <li>Don’t travel on the roof of the train. </li>
                        <li>
                        Don’t try to force the doors open.
                        <li>Don’t deface or put up posters inside the Metro station or train. </li>
                        <li>Don’t step on the Tactiles meant for the visually impaired. </li>
                        <li>Don’t use the lift, it is meant for the physically challenged. </li>
                    </ul>
                    <h2>
                        <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                        Offences and Penalties</h2>
                    <ul>
                        <li>The Metro Railways (Construction of Works) Act. </li>
                        <li>The Delhi Metro Railways (Operation and Maintenance) Act, 2002. </li>
                        <li>Drunken behaviour, vandalism, indecency, use of offensive & abusive language is punishable by a fine of Rs. 500/- . </li>
                        <li>Carrying dangerous & offensive material on Metro Rail is punishable with imprisonment extending up to 4 years and a fine of up to Rs. 5000/-. </li>
                        <li>Putting up posters without lawful authority or defacing the Metro premises or trains will invite penalties, which may extend up to 6 months imprisonment and /or a fine up to Rs.1000/-. </li>
                        <li>Travelling on the roof or any other part of the train, not intended for the use of the passengers, will result in a fine of Rs. 50/-or imprisonment of 1 month or both. </li>
                        <li>Walking on Metro tracks without lawful authority will be punishable by imprisonment up to 6 months or a fine of up to Rs. 500/- or both. </li>
                        <li>
                            <p>
                                Willfully obstructing any Metro official in discharging his or her duties will result in punishment with imprisonment up to 1 year or fine up to Rs.1000/- or both.</p>
                        </li>
                        <li>
                            <p>
                                Improper use of official communication equipment will be punishable by imprisonment up to 1 year or fine up to Rs.1000/- or both. </li>
                        <li>Damaging Metro boards or documents shall be punishable with imprisonment up to 2 months and/or penalty of Rs.250/-. </li>
                        <li>Unauthorised sale of tickets shall be punishable with a sentence of upto 3 months and/or fine up to Rs. 500/-. </li>
                        <li>If any person throws an object with intent to damage any part of the train or its passengers, he/she will be punished with a life sentence or rigorous imprisonment extending up to 10 years. </li>
                        <li>Damage to any property or causing fire hazards or explosions will result in imprisonment extending up to 10 years. </li>
                        <li>Tampering with any safety device and endangering the safety of passengers or obstructing trains will result in imprisonment, extending up to 7 years. </li>
                        <li>Any Unauthorised sale of articles at Metro Railway premises shall be punishable with a fine of up to Rs. 500/- or imprisonment up to 6 months. </li>
                        <li>Ticket-less travel will result in a fine of Rs. 50/-. </li>
                    </ul>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelHindi" runat="server">
            <p>
                दिल्ली मैट्रो प्रत्येक यात्री को ऊंचे दर्जे की सुरक्षा देने के लिए प्रतिबद्ध है। इसके दृष्टिगत सभी डिजाइन और प्रचालन सुरक्षा मार्जिक के साथ किए जाते हैं।</p>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                सुरक्षित एस्कलरेटर</h2>
            <div style="float: right; padding-left: 5px; margin: 5px;">
                <img src="<%=ResolveClientUrl(@"~/Images/DelhiMetro/DelhiMetroBlueLine.jpg") %> " height="125px" alt="" />
            </div>
            <ul>
                <li>एस्कलरेटर को अनेक सुरक्षा उपकरणों से सुस्सजित किया गया है ताकि यात्रियों की सुरक्षा सुनिश्चित हो सके। सुरक्षा में अधिक गति से सुरक्षा, गलत कदम इत्यादि का पता चलने इत्यादि शामिल हैं। आग के खतरे को कम करने और सुरक्षा में सुधार के लिए मनुष्य के बालों, धुल, पानी, तेल इत्यादि के लिए एक ट्रे का प्रावधान किया
                    गया है।</li>
                <li>इसके अतिरिक्त एक विशेष साड़ी गार्ड व्यवस्था की गई है, जो ढीले-ढाले वस्त्रों (जैसे महिलाओं की साड़ी) को एस्कलरेटर में फंसने से बचाता है।</li>
                <li>आपातकालीन स्टाप बटन तीन जगह पर दिखाए गए हैं, नीचे ऊपर व बीच में।<br>
                    <br>
                </li>
            </ul>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                सुरक्षित डिब्बेर</h2>
            <div style="float: right; padding-left: 5px; margin: 5px;">
                <img src="<%=ResolveClientUrl(@"~/Images/DelhiMetro/DelhiMetroBlueLine.jpg") %> " height="125px" alt="" />
            </div>
            <ul>
                <li>सवारी डिब्बे ज्यादा आराम व सुरक्षा को ध्यान में रखकर बनाए गए हैं।</li>
                <li>स्वचालित खुलने व बंद होने वाले दरवाजे एवं सभी द्वारों एवं खिड़कियों के बंद होने के उपरांत ही ट्रेन के चलने की व्यवस्था है। यदि चलती ट्रेन के बीच ही कोई द्वार स्वयं ही खुल जाए, इस स्थिति में ट्रेन में स्वचालित ब्रेक लग जाएंगे व इस स्थिति में ट्रेन रूक जाएगी।</li>
                <li>विशेष निर्माण व्यवस्थाओं व सामग्री के कारण आग लगने की कम संभावना।</li>
                <li>आपातकालीन अगले द्वार से आपातकालीन स्थिति में निकनले की सुविधा।</li>
                <li>आपातकालीन स्थिति में यात्रियों के चालक से संपर्क की व्यवस्था।</li>
                <li>आपातकालीन स्थिति में चालक द्वारा व प्रचालन नियंत्रण केंद्र द्वारा घोषणा की सुविधा।</li>
                <li>चालक व प्रचालन केंद्र के बीच संपर्क की व्यवस्था।</li>
                <li>बिजली के चले जाने की स्थिति में आपातकालीन रोशनी व वायुसंचार की सुविधा।
                    <br>
                    <br>
                </li>
            </ul>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                करने योग्य</h2>
            <ul>
                <li>पंक्ति में खड़े रहें। </li>
                <li>कृपया अपने सामान को ज्यादा से ज्यादक 15 किलो, 60 सेमी. (लंबाई) x 45 सेमी. (चौड़ाई)x 25 सेमी. के आकार का रखें।</li>
                <li>कृपया कुड़ेदान का प्रयोग करें। </li>
                <li>कृपया एस्केलेटर में खड़े हुए बांई ओर व चलते हुए दांई ओर रहें। </li>
                <li>कृपया इस्तमाल के उपरांत तुरंत ही एस्केलेटर से हट जाएं। </li>
                <li>कृपया शाररिक रूप से विकलांग लोगों के लिए रास्ता दें। </li>
                <li>ध्यान रखें कि ट्रेन मात्र 30 सेकंड के लिए रूकती है।</li>
                <li>कृपया पुछे जाने पर मैट्रो कर्मचारी को अपना टिकट दिखाएं।</li>
                <li>कृपया अपने साथी यात्रियों के आराम का ध्यान रखें। </li>
                <li>कृपया नशा और असभ्य व्यवहार न करें। </li>
                <li>अपनी कीमती चीजों का ध्यान स्वयं रखें। </li>
                <li>किसी मदद के लिए मैट्रो पुलिस से संपर्क करें।</li>
                <li>कृपया किसी परेशानी की स्थिति में महिला सुरक्षा कर्मचारी से संपर्क करें (महिलाओं के लिए)<br>
                    <br>
                </li>
            </ul>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                न करें</h2>
            <ul>
                <li>कृपया मैट्रो स्टेशन के अंदर कोई खाने की वस्तु न लाएं। </li>
                <li>किसी पालतु पशु को स्टेशन में न लाएं। </li>
                <li>कृपया धूम्रपान न करें। </li>
                <li>कृपया किसी प्रकार के हथियार न रखें। </li>
                <li>अपने स्मार्ट कार्ड व टोकन के बिना यात्रा न करें।</li>
                <li>कृपया टिकट बैरियर को ऊपर से पार न करें। </li>
                <li>कृपया अपना कार्ड या टोकन एक ही यात्रा में किसी दूसरे यात्री से न बदलें।</li>
                <li>कृपया प्लेटफार्म की पीली पट्टीयों को पार न करें।</li>
                <li>कृपया मैट्रो की पटरियों पर न चढ़ें। </li>
                <li>कृपया बलपूर्वक द्वारों को खोलने की चेष्ठा न करें। </li>
                <li>कृपया ट्रेन की छत पर यात्रा न करें.</li>
                <li>कृपया किसी प्रकार के पर्चे/पोस्टर ट्रेन व स्टेशन के भीतर न लगाएं।</li>
                <li>कृपया नेत्रहीनों के लिए लगाए स्पर्श यंत्रों का प्रयोग न करें। </li>
                <li>लिफ्ट का प्रयोग न करें, यह शाररिक रूप से विकलांग लोगों के लिए है।<br>
                    <br>
                </li>
            </ul>
            <h2>
                <img src="<% =ResolveClientUrl(@"~/Images/Delhimetro/hd-bg-red.jpg") %>" height="15px" alt="" />
                अपराध और दण्ड</h2>
            <ul>
                <li>मैट्रो रेल (कार्यों का सन्निर्माण) अधिनियम</li>
                <li>दिल्ली मैट्रो रेल (प्रचालन और अनुरक्षण) अधिनियम, 2002</li>
                <li>पीकर दुव्यवहकर करना, विध्वंस, अशिष्टता, आपत्तिजनक और भद्दी भाषा का प्रयोग करने के लिए 500/- रूपये का दंड लगेगा।</li>
                <li>मैट्रो रेल में खतरनाक और आपत्तिजनक सामग्री ले जाने के लिए 4 वर्ष तक जेल और 5000/- रू. तक जुमाना हो सकता है। </li>
                <li>बिना कानूना प्राधिकार के पोस्टर लगाने या मैट्रो के परिसर या ट्रेनों को गंदा करने पर दंड दिया जाएगा जिसके लिए 6 माह तक जेल हो सकती है और/या 1000/- रू. तक जुर्माना लिया जा सकता है। </li>
                <li>ट्रेन की छत या किसी अन्य हिस्से में, जो यात्रियों के प्रयोग के लिए नहीं है, यात्रा करने पर 50/- रू. का जुर्माना या 1 माह तक जेल या दोने से दंडित किया जा सकता है।</li>
                <li>मैट्रो ट्रेक पर बिना किसी कानूना प्रधिकार के चलने पर 6 माह तक जेल या 500/- रू. तक जुर्माना या दोनों से दंडित किया जा सकता है। </li>
                <li>जानबुझकर किसी मैट्रो कर्मचारी को उसकी ड्यूटी करने से रोकने पर 1 वर्ष तक की जेल हो सकती है या 1000/- रू. तक जुर्माना लिया जा सकता है या दोनों से दंडित किया जा सकता है।</li>
                <li>सरकारी संचार उपकरण का अनुचित प्रयोग करने पर 1 वर्ष तक का कारावास या 1000/- रू. का जुर्माना या दोनो हो सकता है।</li>
                <li>मैट्रो बोर्डों या दस्तावेजों को क्षति पहुंचाने पर 2 माह तक का कारावास और/या 250/- रू. का जुर्माना हो सकता है। </li>
                <li>टिकटों की अनधिकृत बिक्री से 3 माह तक की जेल और/या 500/- रू. तक का जुर्माना हो सकता है। </li>
                <li>यदि कोई व्यक्ति ट्रेन के किसी हिस्से को या इसके यात्रियों को क्षति पहुंचाने के लिए कोई चीज फेंकता है तो उसे आजीवन कारावास या 10 वर्ष तक के कठोर कारावास से दंडित किया जा सकता है। </li>
                <li>किसी संपत्ति को नुकसान या आग लगाने या विस्फोट करने से 10 वर्ष तक का कारावास होगा। </li>
                <li>किसी सुरक्षा उपकरण से छेड़छाड़ करने और यात्रियों की सुरक्षा खतरे में डालने या ट्रेनों के अवरूद्ध करने पर 7 वर्ष तक का कारावास होगा।</li>
                <li>मैट्रो रेल परिसर में किसी वस्तु की अनधिकृत बिक्री करने से 5000/- रू. तक का जुर्माना या 6 माह तक का कारावास हो सकता है।</li>
                <li>बिना टिकट यात्रा करने से 50/- रू. का जुर्माना लगेगा।
                    <br>
                    <br>
                </li>
            </ul>
        </asp:Panel>
    </div>
</asp:Content>
