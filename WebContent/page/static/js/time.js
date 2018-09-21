function getTime() {
    var time = new Date();
    var Year = time.getFullYear();
    var Month = time.getMonth() + 1;
    if (Month < 10)
        Month = "0" + Month;
    var Day = time.getDate();
    if (Day < 10)
        Day = "0" + Day;
    var Hour = time.getHours();
    if (Hour < 10)
        Hour = "0" + Hour;
    var Minute = time.getMinutes();
    if (Minute < 10)
        Minute = "0" + Minute;
    var Second = time.getSeconds();
    if (Second < 10)
        Second = "0" + Second;

    var w = time.getDay();
    switch (w) {
        case 0:
            Week = "星期日";
            break;
        case 1:
            Week = "星期一";
            break;
        case 2:
            Week = "星期二";
            break;
        case 3:
            Week = "星期三";
            break;
        case 4:
            Week = "星期四";
            break;
        case 5:
            Week = "星期五";
            break;
        case 6:
            Week = "星期六";
            break;
    }
    document.getElementById("time").innerHTML = Year + "年" + Month + "月" + Day
        + "日" + " " + Hour + ":" + Minute + ":" + Second + " " + Week;
}

setInterval("getTime()", 1);