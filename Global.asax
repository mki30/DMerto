<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        InitializeRoutes(RouteTable.Routes);

    }

    private void InitializeRoutes(RouteCollection routes)
    {
        routes.MapPageRoute(routeName: "station", routeUrl: "station", physicalFile: "~/StationInfo.aspx", checkPhysicalUrlAccess: true);
        routes.MapPageRoute(routeName: "station2", routeUrl: "station/{Data1}", physicalFile: "~/StationInfo.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "station3", routeUrl: "station/{Data1}/{Data2}", physicalFile: "~/StationInfo.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });

        routes.MapPageRoute(routeName: "route", routeUrl: "route", physicalFile: "~/RouteInfo.aspx", checkPhysicalUrlAccess: true);
        routes.MapPageRoute(routeName: "route2", routeUrl: "route/{Data1}", physicalFile: "~/RouteInfo.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "route3", routeUrl: "route/{Data1}/{Data2}", physicalFile: "~/RouteInfo.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });


        routes.MapPageRoute(routeName: "fare", routeUrl: "fare", physicalFile: "~/FareInfo.aspx", checkPhysicalUrlAccess: true);
        routes.MapPageRoute(routeName: "fare2", routeUrl: "fare/{Data1}", physicalFile: "~/FareInfo.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
        routes.MapPageRoute(routeName: "fare3", routeUrl: "fare/{Data1}/{Data2}", physicalFile: "~/FareInfo.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" }, { "Data2", "" } });

        routes.MapPageRoute(routeName: "MetroStationNumber", routeUrl: "MetroStationNumber", physicalFile: "~/MetroStationNumber.aspx", checkPhysicalUrlAccess: true);
        
        routes.MapPageRoute(routeName: "Line1", routeUrl: "line", physicalFile: "~/LineInfo.aspx", checkPhysicalUrlAccess: true);
        routes.MapPageRoute(routeName: "Line2", routeUrl: "line/{Data1}", physicalFile: "~/LineInfo.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Data1", "" } });
       
        routes.MapPageRoute(routeName: "AboutDelhiMetro", routeUrl: "AboutDelhiMetro", physicalFile: "~/AboutDelhiMetro.aspx", checkPhysicalUrlAccess: true);
 
        routes.MapPageRoute(routeName: "ContactUs", routeUrl: "ContactUs", physicalFile: "~/ContactUs.aspx", checkPhysicalUrlAccess: true);

        routes.MapPageRoute(routeName: "FeederBus", routeUrl: "FeederBus", physicalFile: "~/FeederBus.aspx", checkPhysicalUrlAccess: true);

        routes.MapPageRoute(routeName: "Lost", routeUrl: "Lost", physicalFile: "~/Lost.aspx", checkPhysicalUrlAccess: true);

        routes.MapPageRoute(routeName: "FAQs", routeUrl: "FAQs", physicalFile: "~/FAQs.aspx", checkPhysicalUrlAccess: true);
        
        routes.MapPageRoute(routeName: "PrivacyPolicy", routeUrl: "PrivacyPolicy", physicalFile: "~/PrivacyPolicy.aspx", checkPhysicalUrlAccess: true);

        routes.MapPageRoute(routeName: "CommunicationGuide", routeUrl: "CommunicationGuide", physicalFile: "~/CommunicationGuide.aspx", checkPhysicalUrlAccess: true);

    
    

        routes.MapPageRoute(routeName: "Main", routeUrl: "{Action}/{ID}/{ID2}", physicalFile: "~/Default.aspx", checkPhysicalUrlAccess: true, defaults: new RouteValueDictionary() { { "Action", "product" }, { "ID", "0" }, { "ID2", "0" } });

      
    }
    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
