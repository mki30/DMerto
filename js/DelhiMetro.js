function FareLocation()
{
    window.location.PathName = "fare/" + $("#ddStationFromList").val() + "/" + $("#ddStationToList").val();
}