<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AboutDelhiMetro.aspx.cs" Inherits="HomeDelhiMetro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<style>
     p   
       
        {
            text-align:justify;
            text-indent:25px;
            color:#464848;
        }
        
    </style>
    <asp:Panel ID="panelEnglish" runat="server">
        <div style="border: 0px solid; clear: both;">
            <h2>
                Delhi Metro
            </h2>
            <div>
                <div style="float:left; margin-right:5px;">
                   <img src="<% =ResolveClientUrl(@"~/Images/DelhiMetro/dl.jpg") %>" width="150px" alt="" />
                  
                </div>
                <p>
                    The Delhi Metro is a rapid transit system serving Delhi, Gurgaon, Noida and Ghaziabad in the National Capital Region of India. The network consists of six lines with a total length of 189.63 kilometres (117.83 mi) with 142 stations of which 35 are underground. It has a combination of elevated, at-grade
                    and underground lines and uses both broad gauge and standard gauge rolling stock. Four types of rolling stock are used: Mitsubishi-ROTEM Broad gauge, Bombardier MOVIA, Mitsubishi-ROTEM Standard gauge and CAF Beasain Standard gauge.
                </p>
                <p>
                    Delhi Metro is being built and operated by the Delhi Metro Rail Corporation Limited (DMRC). As of November 2010, DMRC operates around 2,700 trips daily between 6:00 and 23:00 running with an interval of 2 minutes 30 seconds between trains at peak frequency. The trains are mainly of four coaches, but
                    due to increase in passengers numbers, six-coach trains are also added on the Red Line (Dilshad Garden to Rithala), Yellow Line (Jahangirpuri to HUDA city centre), Blue Line (Dwarka sec −21 to Vaishali/NOIDA city centre) and Violet Line (Central Secretariat to Badarpur).4578 The power output is supplied
                    by 25-kilovolt, 50 Hertz alternating current through overhead catenary. The metro has an average daily ridership of 1.8 million commuters, and, as of July 2011, had carried over 1.25 billion commuters since its inception. The Delhi Metro Rail Corporation has been certified by the United Nations as the
                    first metro rail and rail-based system in the world to get “carbon credits for reducing greenhouse gas emissions” and helping in reducing pollution levels in the city by 630,000 tons (630 Gg) every year.
                </p>
                <div>
                 <iframe id='frameMap' src="Map.htm? Action=DelhiMetro" frameborder="0" style='width: 100%; height: 700px'></iframe>
         
                </div>
                <h3>
                    Background
                </h3>
                <p>
                    The concept of a mass rapid transit for New Delhi first emerged from a traffic and travel characteristics study which was carried out in the city in 1969.11 Over the next several years, many official committees by a variety of government departments were commissioned to examine issues related to technology,
                    route alignment and governmental jurisdiction.12 In 1984, the Delhi Development Authority and the Urban Arts Commission came up with a proposal for developing a multi-modal transport system, which would consist of constructing three underground mass rapid transit corridors as well augmenting the city's
                    existing suburban railway and road transport networks.
                </p>
                <p>
                    While extensive technical studies and the raising of finance for the project were in progress, the city expanded significantly resulting in a twofold rise in population and a fivefold rise in the number of vehicles between 1981 and 1998.13 Consequently, traffic congestion and pollution soared, as an
                    increasing number of commuters took to private vehicles with the existing bus system unable to bear the load.11 An attempt at privatising the bus transport system in 1992 merely compounded the problem, with inexperienced operators plying poorly maintained, noisy and polluting buses on lengthy routes,
                    resulting in long waiting times, unreliable service, extreme overcrowding, unqualified drivers, speeding and reckless driving.14 To rectify the situation, the Government of India and the Government of Delhi jointly set up a company called the Delhi Metro Rail Corporation (DMRC) on March 5, 1995 with
                    E. Sreedharan as the managing director.
                </p>
                <p>
                    Dr. E. Sreedharan handed over charge as MD, DMRC to Shri Mangu Singh on 31st December 2011.</p>
                <h3>
                    Construction
                </h3>
                <p>
                    Physical construction work on the Delhi Metro started on October 1, 1998.16 After the previous problems experienced by the Kolkata Metro, which was badly delayed and 12 times over budget due to "political meddling, technical problems and bureaucratic delays", the DMRC was given full powers to hire people,
                    decide on tenders and control funds.17 The DMRC then consulted the Hong Kong MTR on rapid transit operation and construction techniques.18 As a result, construction proceeded smoothly, except for one major disagreement in 2000, where the Ministry of Railways forced the system to use broad gauge despite
                    the DMRC's preference for standard gauge.</p>
                <p>
                    The first line of the Delhi Metro was inaugurated by Atal Behari Vajpayee, the then Prime Minister of India on December 24, 200220 and thus it became the second underground rapid transit system in India, after the Kolkata Metro. The first phase of the project was completed in 200621 on budget and almost
                    three years ahead of schedule, an achievement described by Business Week as "nothing short of a miracle".</p>
                <h3>
                    Network
                </h3>
                <hr>
                <p>
                    The Delhi Metro is being built in phases. Phase I completed 65.11 km (40.46 mi) of route length, of which 13.01 km (8.08 mi) is underground and 52.10 km (32.37 mi) surface or elevated. The inauguration of the Vaishali*–Barakhamba Road corridor of the Blue Line marked the completion of Phase I on October
                    27, 2006.21 Phase II of the network comprises 128 km (80 mi) of route length and 79 stations, and is fully completed, with the first section opened in June 2008 and the last line opened in August 2011.23 Phases III (112 km) and IV (108.5 km) are planned to be completed by 2015 and 2021 respectively,
                    with the network spanning 413 km (257 mi) by then.24
                </p>
                <h4>
                    <a href="<% =ResolveClientUrl(@"~/line") %>">Red Line</a>

                </h4>
                <p>
                    The Red Line was the first line of the Metro to be opened and connects Rithala in the west to Dilshad Garden in the east, covering a distance of 25.09 kilometres (15.59 mi).26 It is partly elevated and partly at grade, and crosses the Yamuna River between Kashmere Gate and Shastri Park stations. The
                    inauguration of the first stretch between Shahdara and Tis Hazari on December 24, 2002, caused the ticketing system to collapse due to the line being crowded to four times its capacity by citizens eager to have a ride.3031 Subsequent sections were inaugurated from Tis Hazari – Trinagar (later renamed
                    Inderlok) on October 4, 2003,32 Inderlok – Rithala on March 31, 2004, and Shahdara – Dilshad Garden on June 4, 2008.
                </p>
                <h4>
                    <a href="LineInfo.aspx ">Yellow Line</a>
                </h4>
                <p>
                    The Yellow Line was the second line of the Metro and was the first underground line to be opened. It runs for 44.36 kilometres (27.56 mi) from north to south and connects Jahangirpuri with HUDA City Centre in Gurgaon. The northern and southern parts of the line are elevated, while the central section
                    through some of the most congested parts of Delhi is underground. The first section between Vishwa Vidyalaya and Kashmere Gate opened on December 20, 2004, and the subsequent sections of Kashmere Gate – Central Secretariat opened on July 3, 2005, and Vishwa Vidyalaya – Jahangirpuri on February 4, 2009.
                    This line also possesses the country's deepest Metro station at Chawri Bazaar, situated 30 metres (98 ft) below ground level.[35][36] On 21 June 2010, an additional stretch from Qutub Minar to HUDA City Centre was opened, initially operating separately from the main line. However, Chhatarpur station
                    on this line opened on August 26, 2010. Due to delay in acquiring the land for constructing the station, it was constructed using pre-fabricated structures in a record time of nine months and is the only station in the Delhi metro network to be made completely of steel.[37][38] The connecting link between
                    Central Secretariat and Qutub Minar opened on September 3, 2010.[39] Interchanges are available with the Red Line at Kashmere Gate station, Blue Line at Rajiv Chowk Station, Violet Line at Central Secretariat, and with the Indian Railways network at Delhi and New Delhi railway stations. New Six Coach
                    trains are also introduced for convenience for passengers
                </p>
                <h4>
                  <a href="<% =ResolveClientUrl(@"~/line") %>">Blue Line</a>
                </h4>
                <p>
                    The Blue Line was the third line of the Metro to be opened, and the first to connect areas outside Delhi.42 Partly overhead and partly underground,43 it connects Dwarka Sub City in the west with the satellite city of Noida in the east, covering a distance of 47.4 kilometres (29.5 mi).42 The first section
                    of this line between Dwarka and Barakhamba Road was inaugurated on December 31, 2005, and subsequent sections opened between Dwarka – Dwarka Sector 9 on April 1, 2006, Barakhamba Road – Indraprastha on November 11, 2006, Indraprastha – Yamuna Bank on May 10, 2009, Yamuna Bank – Noida City Centre on
                    November 12, 2009, and Dwarka Sector 9 – Dwarka Sector 21 on October 30, 2010.33 This line crosses the Yamuna River between Indraprastha and Yamuna Bank stations,29 and has India's first extradosed bridge across the Northern Railways mainlines near Pragati Maidan.44 A branch of the Blue line, inaugurated
                    on January 8, 2010, takes off from Yamuna Bank station and runs for 6.25 kilometres (3.88 mi) up to Anand Vihar in east Delhi.45 It was further extended up to Vaishali which was opened to public on July 14, 2011.4647 A small stretch of 2.76 kilometres (1.71 mi) from Dwarka Sector 9 to Dwarka Sector
                    21 was inaugurated on October 30, 2010.4849 Interchanges are available with the Yellow Line at Rajiv Chowk station,43 and with the Indian Railways network at the Anand Vihar Railway Terminal.
                </p>
                <h4>
              <a href="<% =ResolveClientUrl(@"~/line") %>">Green Line</a>
                </h4>
                <p>
                    Opened in 2010, the Green Line was the first standard-gauge corridor of the Delhi Metro.27 The fully elevated line connects Mundka with Inderlok, running for 15.1 kilometres (9.4 mi) mostly along Rohtak Road.51 An interchange with the Red line is available at Inderlok station via an integrated concourse.
                    This line also has the country's first standard-gauge maintenance depot at Mundka.
                </p>
                <h4>
                    <a href="<% =ResolveClientUrl(@"~/line") %>">Violet Line</a>
                </h4>
                <p>
                    The Violet Line is the most recent line of the Metro to be opened, and the second standard-gauge corridor after the Green Line. The 20.2 km (12.6 mi) long line connects Badarpur to Central Secretariat, with 9 km (5.6 mi) being overhead and the rest underground.28 The first section between Central Secretariat
                    and Sarita Vihar was inaugurated on October 3, 2010, just hours before the inaugural ceremony of the 2010 Commonwealth Games, and connects the Jawaharlal Nehru Stadium which is the venue for the opening and closing ceremonies of the event.54 Completed in just 41 months, it includes a 100 m (330 ft)
                    long bridge over the Indian Railways mainlines and a 167.5 m (550 ft) long cable-stayed bridge across an operational road flyover, and connects several hospitals, tourist attractions and a major industrial estate along its route.28 Services are provided at intervals of 5 min.54 An interchange with the
                    Yellow Line is available at Central Secretariat through an integrated concourse.28 On January 14, 2011, the remaining portion from Sarita Vihar to Badarpur was opened for commercial service, adding three new stations to the network and marking the completion of the line.
                </p>
                <h4>
                <a href="<% =ResolveClientUrl(@"~/line") %>">Airport Express</a>
                </h4>
                <p>
                    The Airport Express line runs for 22.7 km (14.1 mi) from New Delhi Railway Station to Dwarka Sector 21, linking the Indira Gandhi International Airport. The line is operated, by the Delhi Airport Metro Express Pvt. Limited (DAMEL), a subsidiary of Reliance Infrastructure, the concessionaire of the line.
                    Constructed at a cost of 2,885 crore (US$575.56 million),56 the line has six stations (Dhaula Kuan and Delhi Aerocity became operational on August 15, 2011), with some featuring check-in facilities, parking and eateries.57 Rolling stock consists of six-coach trains operating at intervals of ten minutes
                    and having a maximum speed of 135 km/h (84 mph).57 Originally scheduled to open before the 2010 Commonwealth Games, the line failed to obtain the mandatory safety clearance, and was opened on 24 February 2011, after a delay of around 5 months.
                </p>
                <h4>
                </h4>
                <p>
                </p>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="panelHindi" runat="server">
        <div style="border: 0px solid; clear: both;">
            <h2>
                दिल्ली मेट्रो रेल
            </h2>
            <div>
                <div style="float: right; padding-left: 5px; margin: 5px;">
                   <img src="<% =ResolveClientUrl(@"~/Images/DelhiMetro/DelhiMetroBlueLine.jpg") %>" width="150px" alt="" />
                </div>
                <p>
                    दिल्ली मेट्रो रेल भारत की राजधानी दिल्ली की मेट्रो रेल परिवहन व्यवस्था है जो दिल्ली मेट्रो रेल निगम लिमिटेड द्वारा संचालित है। इसका शुभारंभ २४ दिसंबर, २००२ को शहादरा तीस हजारी लाईन से हुई। इस परिवहन व्यवस्था की अधिकतम गति ८०किमी/घंटा (५०मील/घंटा) रखी गयी है और यह हर स्टेशन पर लगभग २० सेकेंड रुकती है।
                    सभी ट्रेनों का निर्माण दक्षिण कोरिया की कंपनी रोटेम(ROTEM) द्वारा किया गया है। दिल्ली की परिवहन व्यवस्था में मेट्रो रेल एक महत्वपूर्ण कड़ी है। इससे पहले परिवहन का ज्यादतर बोझ सड़क पर था। प्रारंभिक अवस्था में इसकी योजना छह मार्गों पर चलने की थी जो दिल्ली के ज्यादातर हिस्से को जोड़ते थे। इस प्रारंभिक
                    चरण को २००६ में पूरा किय़ा गया। बाद में इसका विस्तार राष्ट्रीय राजधानी क्षेत्र से सटे शहरों गाजियाबाद, फरीदाबाद, गुड़गाँव और नोएडा तक किया गया। इस परिवहन व्यवस्था की सफलता से प्रभावित होकर भारत के दूसरे राज्यों जैसे उत्तर प्रदेश, राजस्थान, कर्नाटक, आंध्र प्रदेश एवं महाराष्ट्र में भी इसे चलाने की योजनाएं
                    बन रही हैं। दिल्ली मेट्रो रेल व्यव्स्था अपने शुरुआती दौर से ही ISO १४००१ प्रमाण-पत्र अर्जित करने में सफल रही है जो सुरक्षा और पर्यावरण की दृष्टि से काफी महत्वपूर्ण है।
                </p>
                <p>
                    सितंबर २०११ में संयुक्त राष्ट्र ने "स्वच्छ विकास तंत्र" योजना के तहत हरित गृह गैसों में कमी लाने के लिए दिल्ली मेट्रो को दुनिया का पहला "कार्बन क्रेडिट" दिया जिसके अंतर्गत उसे सात सालों के लिए 95 लाख डॉलर मिलेंगे।
                </p>
                <div>
                    <iframe id='Iframe1' src="Map.htm?Action=DelhiMetro" frameborder="0" style='width: 100%; height: 700px'></iframe>
                </div>
                <h3>
                    मेट्रो रेल मार्ग
                </h3>
                <hr>
                <p>
                    इस रेल व्यवस्था के प्रथम चरण (फेज I) में मार्ग की कुल लंबाई लगभग ६५.११ किमी है जिसमे १३ किमी भूमिगत एवं ५२ किलोमीटर एलीवेटेड मार्ग है। द्वितीय चरण (फेज II) के अंतर्गत पूरे मार्ग की लंबाई १२८ किमी है, एवं इसमें ७९ स्टेशन है। तृतीय चरण (फेज III) (११२ किमी) एवं IV (१०८.५ किमी) लंबाई की बनाये जाने का प्रस्ताव
                    है जिसे क्रमश: २०१५ एवं २०२० तक पूरा किये जाने की योजना है। इन चारों चरणो का निर्माण कार्य पूरा हो जाने के पश्चात दिल्ली मेट्रो के मार्ग की कुल लंबाई ४१३.८ किलोमीटर की हो जाएगी जो लंदन के मेट्रो रेल (४०८ किमी) से भी बडा बना देगी। दिल्ली के २०२१ मास्टर प्लान के अनुसार बाद में मेट्रो रेल को दिल्ली के
                    उपनगरों तक ले जाए जाने की भी योजना है।
                </p>
                <h4>
                  <a href="<% =ResolveClientUrl(@"~/line") %>">रेड लाइन </a>
                </h4>
                <p>
                    इस लाइन में 21 मैट्रो स्टेशन हैं, जो कि दिलशाद गार्डन से रिठाला तक जाती है। इसके द्वारा तय की गई कुल दूरी है 25.15 कि.मी। यह लाइन पूर्णतया प्रचालन में है। यह अधिकांश लाइन उपरिगामी है। यह लाइन उत्तर, उत्तर-पूर्व और उत्तर-पश्चिम और पश्चिम दिल्ली को जोड़ती है। यह लाइन दिल्ली में पहली लाइन थी, जो जनता के
                    लिए आरंभ हुई।
                </p>
                <h4>
                    <a href="<% =ResolveClientUrl(@"~/line") %>">येलो लाइन </a>
                </h4>
                <p>
                    इस लाइन में 34 मैट्रो स्टेशन हैं, जो कि जहांगीरपुरी से हुडा सिटी सेंटर तक जाती है। इसके द्वारा तय की गई कुल दूरी है 44.65 कि.मी। यह लाइन पूर्णतया प्रचालन में है।. यह लाइन भूमिगत/उपरिगामी है, और दिल्ली के सबसे संकीर्ण इलाकों से निकलती है।
                </p>
                <h4>
              <a href="<% =ResolveClientUrl(@"~/line") %>">ब्लू लाइन </a>
                </h4>
                <p>
                    इस लाइन में 52 मैट्रो स्टेशन हैं, जो कि द्वारका सैक्टर २१ से नोएडा सिटी सेंटर/वैशाली तक जाती है। इसके द्वारा तय की गई कुल दूरी है 58.68 कि.मी। यह लाइन पूर्णतया प्रचालन में है।
                </p>
                <h4>
                   <a href="<% =ResolveClientUrl(@"~/line") %>">ग्रीन लाइन </a>
                </h4>
                <p>
                    यह लाइन २०१० में शुरू हुई। ग्रीन लाइन दिल्ली मेट्रो की पहली मानक गेज लाइन थी । इस पूर्णतया उपरिगामी लाइन में 15 मैट्रो स्टेशन हैं, जो कि इंदरलोक से मुन्द्का/कीर्ति नगर. तक जाती है। इसके द्वारा तय की गई कुल दूरी है 21.78 कि.मी। रेड लाइन के साथ एक इंटरचेंज इंदरलोक में उपलब्ध है। यह लाइन पूर्णतया प्रचालन
                    में है।
                </p>
                <h4>
                  <a href="<% =ResolveClientUrl(@"~/line") %>">बैंगनी लाइन </a>
                </h4>
                <p>
                    यह लाइन २०११ में शुरू हुई। बैंगनी लाइन दिल्ली मेट्रो की ग्रीन लाइन के बाद दूसरी मानक गेज लाइन थी । यह २०.२ किमी (१२.६ मील ) लम्बी लाइन बदरपुर को केंद्रीय सचिवालय से जोड़ती है. इसमें ९ किमी लाइन उपरिगामी बाकी भूमिगत है। यह लाइन पूर्णतया प्रचालन में है।
                </p>
                <h4>
                     <a href="<% =ResolveClientUrl(@"~/line") %>">एयरपोर्ट एक्सप्रेस/नारंगी लाइन </a>
                </h4>
                <p>
                    एयरपोर्ट एक्सप्रेस लाइन २०११ में शुरू हुई। । यह २०.२ किमी (१२.६ मील ) लम्बी लाइन नई दिल्ली को इंदिरा गाँधी अंतरराष्ट्रीय एयरपोर्ट से जोड़ती है.। यह लाइन,दिल्ली मेट्रो एक्सप्रेस प्राइवेट लिमिटेड (DAMEL) द्वारा संचालित है। यह लाइन पूर्णतया प्रचालन में है।
                </p>
                <h4>
                </h4>
                <p>
                </p>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
