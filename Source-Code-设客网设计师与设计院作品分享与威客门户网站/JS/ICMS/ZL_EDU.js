//排课系统JS
var tdTlp = "<td class='item' data-time='@time' data-day='@day'  data-num='@num'><div class='itemhead'><span class='glyphicon glyphicon-cog bantd' title='禁用|启用'></span></div><textarea class='content'></textarea></td>";
//--------------数组
function GetItem(arr,$td) {
    if (!arr || arr.length < 1) return;
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].time == $td.data("time") && arr[i].day == $td.data("day") && arr[i].num == $td.data("num"))
        { return arr[i]; }
    }
}
function InitTable() {
    table.html("");
    for (var i = 0; i < config.moring; i++) {
        var html = "<tr><td>上午" + (i + 1) + "</td>";
        for (var j = 0; j < config.weekday; j++) {
            html += tdTlp.replace("@time", "moring").replace("@num", (i + 1)).replace("@day", (j + 1));
        }
        html += "</tr>";
        table.append(html);
    }
    for (var i = 0; i < config.afternoon; i++) {
        var html = "<tr><td>下午" + (i + 1) + "</td>";
        for (var j = 0; j < config.weekday; j++) {
            html += tdTlp.replace("@time", "afternoon").replace("@num", (i + 1)).replace("@day", (j + 1));
        }
        html += "</tr>";
        table.append(html);
    }
    for (var i = 0; i < config.evening; i++) {
        var html = "<tr><td>晚上" + (i + 1) + "</td>";
        for (var j = 0; j < config.weekday; j++) {
            html += tdTlp.replace("@time", "evening").replace("@num", (i + 1)).replace("@day", (j + 1));
        }
        html += "</tr>";
        table.append(html);
    }
    HideTBColumn(config.weekday);
    //绑定事件
    $(".bantd").click(function () {
        $text = $(this).closest("td").find(".content");
        if ($text.hasClass("disabled")) {
            $text.removeClass("disabled");
            $text[0].disabled = false;
            $text.val("");
        }
        else {
            $text.addClass("disabled");
            $text[0].disabled = true;
            $text.val("不安排");
        }
    });
    //绑定值
    table.find(".item").each(function () {
        var $td = $(this); 
        var model = GetItem(items,$td);
        if (model)
        {
            $text = $td.find(".content");
            $text.val(model.text);
            if (model.disabled)
            {
                $text.addClass("disabled");
                $text[0].disabled = true;
                $text.val("不安排");
            }
        }

    });
}
function UpdateConfig()
{
    config.weekday = $("#WeekDay_DP").val();
    config.moring = $("#Moring_DP").val();
    config.afternoon = $("#Afternoon_DP").val();
    config.evening = $("#Evening_DP").val();
}
function Render() {
    UpdateConfig();
    InitTable();
}
//读取其td配置,拼接为json
function SaveConfig() {
    UpdateConfig();
    var jsonArr = [];
    table.find(".item").each(function () {
        //item
        var jsontd = { time: "",day:"",num:"", disabled: "", text: "" };//时间,第几天,节数,是否禁用,自定义文本
        $text = $(this).find(".content");
        jsontd.time = $(this).data("time");
        jsontd.day = $(this).data("day");
        jsontd.num = $(this).data("num");
        jsontd.disabled = $text.hasClass("disabled");
        jsontd.text = $text.val();
        jsonArr.push(jsontd);
    });
    config.items = JSON.stringify(jsonArr);
    $("#Json_Hid").val(JSON.stringify(config));
}
//--------------
//节次时间配置,单独页面,默认40分钟一节课
function ShowSetTime()
{
    var diag = new ZL_Dialog();
    diag.title = "节次时间";
    diag.maxbtn = false;
    diag.width = 600;
    diag.url = "SetTime.aspx?m=" + config.moring + "&a=" + config.afternoon + "&e=" + config.evening;
    diag.ShowModal();
}
//--------------表格相关操作
function HideTBColumn(col) {
    $("#maintable thead td").show();
    $("#maintable thead td:gt(" + col + ")").hide();
    $("#maintable tr").each(function () {
        $(this).find("td:gt(" + col + ")").addClass("hid");
    });
}
//--------------
//返回一天的td
Array.prototype.GetDayItem = function (day) {
    var itemday = [];
    for (var i = 0; i < this.length; i++) {
        if (this[i].day == day) itemday.push(this[i]);
    }
    return itemday;
}