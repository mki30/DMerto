var Step = 0;
var CacheFlag = true;
IsMobile = 1;

$(document).ready(function ()
{
    if (mCityFrom == 0)
        mCityFrom = $.cookie("mCityFrom") != null ? $.cookie("mCityFrom") : "842";

    if (mCityTo == 0)
        mCityTo = $.cookie("mCityTo") != null ? $.cookie("mCityTo") : "866";

    if (mCityFromName == 0)
        mCityFromName = $.cookie("mCityFromName") != null ? $.cookie("mCityFromName") : "Agra";

    if (mCityToName == 0)
        mCityToName = $.cookie("mCityToName") != null ? $.cookie("mCityToName") : "Meerut";

    if (mCityFromName != "")
    {
        $("#txtSearch").val(mCityFromName);
        LoadCitiesTo();
    }

    $("#txtSearch").watermark('Enter From City');

    $("#txtSearch").autocomplete({ source: BasePath + "Data.aspx?ACTION=SEARCH_CITIES", select: function (event, ui)
    {
        mCityFrom = ui.item.id;
        mCityFromName = ui.item.value;
        LoadCitiesTo();
    }
    });

    ShowUI();

});

function ShowUIPre(ID,Data)
{
    Step = ID;
    switch (Step)
    {
        case 0:
            break;
        case 1:
            mCityTo = $("#selectCityTo").val();
            break;
        case 2:
            break;
        case 3:
            break;
    }
    
    ShowUI(Data);
}

function ShowUI(Data)
{
   
   $("div.divResult").css("display", "none");

    switch (Step)
    {
        case 0:
            $("#divStep0").css("display", "");
            break;
        case 1:
            $("#divStep1").css("display", "");
            SearchServices(mCityFrom, mCityTo);
            //SearchBusFromTo();
            break;
        case 2:

            $("#divStep2").css("display", "");
          
            ShowRoute(Data);

            break;
        case 3:
            $("#divStep3").css("display", "");
            ShowInfo(Data);
            break;
    }
}