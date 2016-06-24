using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RRA_Graph;
using DelhiMetroTableAdapters;

/// <summary>
/// Summary description for ShortPath
/// </summary>
public class ShortPathHelper
{
    public string Message = "";
    public List<Station> Path = new List<Station>();

    public ShortPathHelper()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    string Init(Boolean IsLocalHost=false)
    {
        if (ShortPathGlobalData.Nodes.Count == 0 || IsLocalHost)
        {
            List<Node> Nodes = ShortPathGlobalData.Nodes;
            Nodes.Clear();

            try
            {
                using (StationTableAdapter ta = new StationTableAdapter())
                {
                    int MaxID = (int)ta.GetMaxID();
                    for (int i = 0; i <= MaxID; i++)
                        Nodes.Add(new Node());
                }

                using (StationConnectionTableAdapter ta = new StationConnectionTableAdapter())
                {
                    DelhiMetro.StationConnectionDataTable dt = ta.GetData();

                    foreach (DelhiMetro.StationConnectionRow dr in dt.Rows)
                    {
                        Nodes[dr.StationFromID].Adj.Add(new AdjNode(dr.StationToID));
                    }
                }

                
            }
            catch (Exception ex)
            {
                return  ex.Message;
            }
        }

        return "";

    }

    public Station AddStation(int StationID, DelhiMetro.StationConnection1Row drConnectionNext, DelhiMetro.StationConnection1Row drConnectionPrevious,int Counter)
    {
        Station Stn = Station.GetStation(StationID);

        if (Stn != null && drConnectionNext!=null)
        {
            Boolean IsInterChange = false;

            if (!drConnectionNext.IsRouteIDNull()) 
            {
                
                IsInterChange = drConnectionNext.RouteID == 53 || drConnectionNext.RouteID == 54;
            }
            Stn.SerialNo = Counter;
            Stn.RouteID = drConnectionNext.IsRouteIDNull() ? 0 : drConnectionNext.RouteID;
            Stn.IsInterchange = IsInterChange;

            Stn.RouteColor = drConnectionNext.IsRouteColorNull() ? "" : drConnectionNext.RouteColor;
            Stn.RouteCode = drConnectionNext.IsRouteCodeNull() ? "" : drConnectionNext.RouteCode;
            Stn.DistanceFromPreviousStation = drConnectionNext.IsDistanceNull() ? 0 : drConnectionNext.Distance ;
            if(!drConnectionNext.IsTimeFirstNull()) Stn.TimeFirst = drConnectionNext.TimeFirst;
            if(!drConnectionNext.IsTimeLastNull()) Stn.TimeLast = drConnectionNext.TimeLast;
            
            Stn.PlatformNumber = drConnectionNext.IsPlatformNull() ? 0 : drConnectionNext.Platform;
            Stn.Track = drConnectionNext.IsTrackNull() ? "" : drConnectionNext.Track;

            if (drConnectionPrevious != null)
            {
                Stn.PlatformNumber = drConnectionPrevious.IsPlatformNull() ? 0 : drConnectionPrevious.Platform;
                Stn.Track = drConnectionPrevious.IsTrackNull() ? "" : drConnectionPrevious.Track;
              
                if (IsInterChange)
                {
                    Stn.RouteColor = drConnectionPrevious.IsRouteColorNull() ? "" : drConnectionPrevious.RouteColor;
                    Stn.RouteCode = drConnectionPrevious.IsRouteCodeNull() ? "" : drConnectionPrevious.RouteCode;

                    // remove the first & last time of the previous station
                    Stn.TimeFirst = null;
                    Stn.TimeLast = null;
                }
            }

            Path.Add(Stn);
        }

        return Stn;
    }

    public DelhiMetro.StationConnection1Row GetNextStation(int StnFromID, int OtherthanStnToID)
    {
        List<DelhiMetro.StationConnection1Row> StnList = Station.GetConnection(StnFromID);
        foreach (DelhiMetro.StationConnection1Row R in StnList)
        {
            if (R.StationToID != OtherthanStnToID)
                return R;
        }

        return null;
    }
    
    public ShortPathHelper GetPath(int StnFromID, int StnToID,Boolean IsLocalHost=false)
    {
        Init(IsLocalHost);

        ShortPath shortpath = new ShortPath();
        shortpath.FindPath(StnFromID, StnToID);

        if (shortpath.Message == "")
        {
            
            using (StationTableAdapter ta = new StationTableAdapter())
            {
                DelhiMetro.StationDataTable dt = ta.GetData();

                for (int i = 0; i < shortpath.Short_Path.Count-1; i++)
                {
                    int StnFrom = shortpath.Short_Path[i];
                    int StnTo = shortpath.Short_Path[i+1];
                    
                    DelhiMetro.StationConnection1Row drConnection = Station.GetConnection(StnFrom, StnTo);

                    DelhiMetro.StationConnection1Row drConnectionPrev = null;
                    if (i > 0)
                    {
                        int StnPrev = shortpath.Short_Path[i - 1];
                        drConnectionPrev = Station.GetConnection(StnPrev, StnFrom);
                    }

                    Station Stn = AddStation(StnFrom, drConnection, drConnectionPrev, i+1);

                    if (Stn== null)
                    {
                        Path.Add(new Station()
                        {
                            Name = StnFrom +  " -Station Missing"
                        });
                    }

                    if (i == shortpath.Short_Path.Count - 2)// add the last station
                    {
                        Stn = AddStation(StnTo, drConnection, drConnection, i + 1);

                        if(Path.Count>1)
                        {
                            Stn.TimeFirst = null;
                            Stn.TimeLast = null;
                            drConnection= GetNextStation(Stn.StationID, Path[Path.Count - 1].StationID);
                            if (drConnection != null)
                            {
                                if(!drConnection.IsTimeFirstNull()) Stn.TimeFirst = drConnection.TimeFirst;
                                if(!drConnection.IsTimeLastNull()) Stn.TimeLast = drConnection.TimeLast;
                            }
                        }
                    }
                }              
            }
        }

        return this;
    }
}