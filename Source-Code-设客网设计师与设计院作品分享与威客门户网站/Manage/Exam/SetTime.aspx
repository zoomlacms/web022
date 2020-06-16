<%@ page language="C#" autoeventwireup="true" inherits="test_SetTime, App_Web_apw4n2f5" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <title>节次时间</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table id="maintable" class="table table-bordered table-striped" style="width:550px;">
        <tr><td>节次</td><td>开始时间</td><td>结束时间</td></tr>
        <tfoot>
            <tr id="foot_tr"><td></td><td colspan="2">
                <asp:Button runat="server" ID="Save_Btn" CssClass="btn btn-primary" Text="保存" OnClientClick="return SaveConfig();" OnClick="Save_Btn_Click" /></td></tr>
        </tfoot>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        var table = $("#maintable");
        var config = { moring: "<%=Request.QueryString["m"]%>", afternoon: "<%=Request.QueryString["a"]%>", evening: "<%=Request.QueryString["e"]%>" };
        var tdTlp = "<tr class='time_tr' data-time='@time' data-num='@num'><td>@timestr</td><td><input type='text' class='date' value='@stime' /></td><td><input type='text' class='date' value='@etime' /></td></tr>";
        var mTimeArr = [{ stime: "8:20", etime: "9:00" }, { stime: "9:20", etime: "10:00" }, { stime: "10:20", etime: "11:00" }, { stime: "11:20", etime: "12:00" }];
        var aTimeArr = [{ stime: "14:20", etime: "15:00" }, { stime: "15:20", etime: "16:00" }, { stime: "16:20", etime: "17:00" }];
        $(function () {
            for (var i = 0; i < config.moring ; i++) {
                if (!mTimeArr[i]) mTimeArr.push({ stime: "", etime: "" });
                var html = tdTlp.replace("@time","moring").replace("@num",(i+1)).
                    replace("@timestr", "上午" + (i + 1)).replace("@stime", mTimeArr[i].stime).replace("@etime", mTimeArr[i].etime);
                table.append(html);
            }
            for (var i = 0; i < config.afternoon ; i++) {
                if (!aTimeArr[i]) aTimeArr.push({ stime: "", etime: "" });
                var html = tdTlp.replace("@time","afternoon").replace("@num",(i+1)).replace("@timestr", "下午" + (i + 1)).replace("@stime", aTimeArr[i].stime).replace("@etime", aTimeArr[i].etime);
                table.append(html);
            }
            for (var i = 0; i < config.evening ; i++) {
                var html = tdTlp.replace("@time","evening").replace("@num",(i+1)).replace("@timestr", "晚上" + (i + 1)).replace("@stime", "").replace("@etime", "");
                table.append(html);
            }
            $(".date").click(function () {
                WdatePicker({ dateFmt: 'HH:mm', minDate: '0:00:00', maxDate: '25:00:00' })
            });
        })
        function SaveConfig() {
            var configArr = [];
            table.find(".time_tr").each(function () {
                var json = { time: "", num: "", stime: "", etime: "" };//时间,节数,上课时间,下课时间
                json.time = $(this).data("time");
                json.num = $(this).data("num");
                json.stime = $(this).find(".date")[0].value;
                json.etime = $(this).find(".date")[1].value;
                configArr.push(json);
            });
            $("#Json_Hid").val(JSON.stringify(configArr));
        }
    </script>
    <asp:HiddenField runat="server" ID="Json_Hid" />
</asp:Content>
