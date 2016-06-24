$(document).ready(function ()
{
    if ($("#ctl00_InnerContent_lblFare"))
    {
        var strFare = $("#ctl00_InnerContent_lblFare").html()
        strFare = strFare.substring(strFare.indexOf('>') + 1);

        if (strFare != "")
        {
            var URLBase = "http://delhimetrorail.info/";
            //URLBase = "http://localhost:4529/DelhiMetro/";

            $.ajax({ url: URLBase + "Data.aspx?Action=UpdateFare&Data1=1&Data2=" + $("#ctl00_InnerContent_ddlFrom").val() +
            "&Data3=" + $("#ctl00_InnerContent_ddlTo").val() + "&Data4=" + strFare,
                success: function (data)
                {
                    //alert(data);
                    var Lines = data.split('~')[1].split(',');

                    if (Lines.length > 1)
                    {
                        $("#ctl00_InnerContent_ddlFrom").val(Lines[0]);
                        $("#ctl00_InnerContent_ddlTo").val(Lines[1]);
                        $("#ctl00_InnerContent_btnShowFare").click();
                    }



                    //                    if (true)
                    //                    {
                    //                        var i = $("#ctl00_InnerContent_ddlTo")[0].selectedIndex;
                    //                        var j = $("#ctl00_InnerContent_ddlFrom")[0].selectedIndex;

                    //                        if (i < $('#ctl00_InnerContent_ddlTo option').length - 1)
                    //                        {
                    //                            i++;
                    //                        }
                    //                        else
                    //                        {
                    //                            $("#ctl00_InnerContent_ddlFrom")[0].selectedIndex = ++j;
                    //                            i = 0;
                    //                        }

                    //                        $("#ctl00_InnerContent_ddlTo")[0].selectedIndex = i;
                    //                        $("#ctl00_InnerContent_btnShowFare").click();
                    //                    }
                }
            });

        }
    }

});

function FillForm(StnFrom, StnTo)
{
    mStnFrom = StnFrom;
    mStnTo = StnTo;

    if ($("#ctl00_InnerContent_btnShowFare") != null)
    {
        $("#ctl00_InnerContent_ddlFrom").val(mStnFrom);
        $("#ctl00_InnerContent_ddlTo").val(mStnTo);
        $("#ctl00_InnerContent_btnShowFare").click();
    }
}

function Process(data)
{
    var str = "";
    $("table", $(data)).each(function (index)
    {
        $("input:radio", this).each(function ()
        {
            str += $(this).val() + "~";
        });
    });

    return str;
}

function htmlEncode(value)
{
    return $('<div/>').text(value).html();
}

function htmlDecode(value)
{
    return $('<div/>').html(value).text();
}

function GetCleanTable(obj, replacetxt, replacewith)
{
    var str = "";
    $("tr", $(obj)).each(function (index)
    {
        $("th", $(this)).each(function (index)
        {
            str += $(this).text() + "^";
        });

        $("td", $(this)).each(function (index)
        {
            str += $(this).text() + "^";
        });

        str += "~";
    });

    return str;
}