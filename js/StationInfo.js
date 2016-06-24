var S_ID = 0
        , S_RouteID = 1
        , S_SerialNo = 2
        , S_Code = 3
        , S_StationName = 4
        , S_DisplayName = 5
        , S_Lat = 6
        , S_Lng = 7
        , S_Phone = 8
        , S_Mobile = 9
        , S_StationType = 10
        , S_MetroID = 11;



function GetStationInfo(StationID,CallBack)
{
    $.ajax({
        url: "../Data.aspx?Action=STATION_INFO&Data1=" + StationID,
        success: function (data)
        {
            var Lines = data.split('~');
            if (Lines[0] == "")
            {
                CallBack(Lines[1].split('^'));
            }
            else
                alert(Lines[0]);
        }
    });

}