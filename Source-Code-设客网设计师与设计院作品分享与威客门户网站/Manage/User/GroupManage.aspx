<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.GroupManage, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>会员组管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="foo" style="position:fixed;top:50%;left:30%;display:block;"></div>
<table class="table table-striped table-bordered table-hover">
    <tr>
		<td style="width:3%;text-align:center;"><strong>ID</strong></td>
		<td style="width:30%;text-align:center;"><strong>会员组名</strong></td>
        <td style="width:10%;text-align:center;"><strong>会员组说明</strong></td>
		<td style="width:6%;text-align:center;"><strong>注册可选</strong></td>
        <td style="width:3%;text-align:center;"><strong>默认</strong></td>
        <td style="width:6%;text-align:center;"><strong>会员数</strong></td>
		<td style="width:45%;text-align:center;"><strong>操作</strong></td>
	</tr>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <tr class="list<%#Eval("ParentGroupID") %>" id="list<%#Eval("GroupID") %>" name="list<%#Eval("ParentGroupID") %>" onclick="getGroupList(this,'grouplist','<%#Eval("GroupID") %>');" <%# ShoworHidden(Eval("GroupID","{0}"),Eval("ParentGroupID","{0}")) %> style="cursor:pointer;">
                <td style="text-align:center;"><%#Eval("GroupID","{0}") %></td>
                <td style="text-align:left;"><%#GetIcon(Eval("GroupName","{0}"),Eval("GroupID","{0}"),Eval("ParentGroupID","{0}")) %></td>
                <td style="text-align:center;"><%#Eval("Description") %></td>
                <td style="text-align:center;"><%#GetReg(Eval("RegSelect","{0}")) %></td>
                <td style="text-align:center;"><%#GetDefault(Eval("IsDefault","{0}"))%></td>
                <td style="text-align:center;"><a href="UserManage.aspx?GroupId=<%#Eval("GroupID") %>" title="会员列表"><%# GetUserNum(Eval("GroupID","{0}")) %></a></td>
                <td style="text-align:center;"><%#GetOper(Eval("GroupID","{0}"),Eval("UserModel","{0}")) %></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/Plugins/JqueryUI/spin/spin.js"></script>
    <script type="text/javascript">
        function showlist(sid)
        {
            var i = 0;
            var j = 0;
            var state = $("#list" + sid).attr("state");
            if (sid == "0") {
                for (i = 3; i <= $("tr").length; i++) {
                    if (state == "1") {
                        $("tr:nth-child(" + i + ")").css("display", "none");
                        $("tr:nth-child(" + i + ")").attr("state", "1");
                    }
                    else {
                        $(".list" + sid).css("display", "");
                        $("tr:nth-child(" + i + ")").attr("state", "0");
                    }
                }
            }
            else {
                for (i = 1; i <= $("tr").length; i++) {
                    if ($("tr:nth-child(" + i + ")").attr("name") == $("#list" + sid).attr("name") && $("tr:nth-child(" + i + ")").attr("id") == ("list" + sid)) {
                        j++;
                        continue;
                    }
                    if (j == 1 && $("tr:nth-child(" + i + ")").attr("name") == $("#list" + sid).attr("name")) {
                        j++;
                        break;
                    }
                    switch (j) {
                        case 1:
                            if (state == "1") {
                                if ($("tr:nth-child(" + i + ")").attr("name") != "list0") {
                                    $("tr:nth-child(" + i + ")").css("display", "none");
                                    $("tr:nth-child(" + i + ")").attr("state", "1");
                                }
                            }
                            else {
                                $(".list" + sid).css("display", "");
                                $("tr:nth-child(" + i + ")").attr("state", "0");
                            }
                            break;
                    }
                }
            }
            if (state == "1") {
                $("#list" + sid).attr("state", "0");
            } else {
                $("#list" + sid).attr("state", "1");
            }
        }
        var opts = {
            lines: 8, // The number of lines to draw
            length: 6, // The length of each line
            width: 2, // The line thickness
            radius: 5, // The radius of the inner circle
            color: '#000', // #rbg or #rrggbb
            speed: 1, // Rounds per second
            trail: 100, // Afterglow percentage
            shadow: true // Whether to render a shadow
        };
        var trCode = "<tr onclick=\"getGroupList(this,'grouplist','{gid}');\" class=\"list{pid}\" id=\"list{gid}\" name=\"list{pid}\" align=\"center\" state=\"1\" ondblclick=\"showlist('{gid}');\" style=\"cursor:pointer;\">"
                    + "<td>{gid}</td>"
                    + "<td style=\"text-align:left;\">"
                    + "{icon}"
                    + "</td>"
                    + "<td>{describe}</td>"
                    + "<td>{reg}</td>"
                    + "<td>{defalut}</td>"
                    + "<td><a href='UserManage.aspx?GroupID={gid}'>{usernum}</a></td>"
                    + "<td>{oper}"
                    + "</td></tr>";
        function getGroupList(obj, a, groupid) {
            var target = document.getElementById('foo');
            var spinner = new Spinner(opts).spin(target);
            $.ajax({
                type: "Post",
                url: "GroupManage.aspx",
                data: { want: a, gid: groupid },
                dataType: "json",//json
                success: function (data) {
                    spinner.stop();
                    if (!data) return;
                    for (var i = 0; i < data.length; i++) {
                        newTr = trCode.replace(/{gid}/g, data[i].GroupID);
                        newTr = newTr.replace(/{pid}/g, data[i].ParentGroupID);
                        newTr = newTr.replace(/{icon}/, data[i].icon);
                        newTr = newTr.replace(/{describe}/g, data[i].Description);
                        newTr = newTr.replace(/{reg}/, data[i].reg);
                        newTr = newTr.replace(/{defalut}/, data[i].isdef);
                        newTr = newTr.replace(/{usernum}/, data[i].usernum);
                        newTr = newTr.replace(/{oper}/, data[i].oper);
                        $(obj).after(newTr);
                    }
                },
                error: function (data) {
                    spinner.stop();
                    //alert("自定错误" + data);
                }
            })
            obj.onclick = "";
        }
    </script>
</asp:Content>

