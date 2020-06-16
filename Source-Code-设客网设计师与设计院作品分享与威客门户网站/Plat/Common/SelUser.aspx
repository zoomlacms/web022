<%@ page language="C#" autoeventwireup="true" inherits="Plat_Common_SelUser, App_Web_3ityhbgx" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户组选择</title>
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<style type="text/css">
* {margin: 0;padding: 0;font-family: 'Microsoft YaHei';font-size: 12px;}
.fixed {position: fixed;bottom: 0px;top: auto;right: 5px;}
.mainDiv {padding-top: 10px;}
.divBorder {border: 1px solid #ddd;min-height: 337px;}
#keyText {height: 25px;margin-left: 10px;margin-right: 5px;width: 200px;border-radius: 1px;}
#EGV tr th {color: black;background: url("");text-align: center; }
#EGV tr td input {line-height: normal;}
#EGV .dataRow:hover{background-color:#D5D5FD;}
#AllID_Chk{display:none;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <!--可多选用户组，点确认调用父节点方法完成赋值-->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div style="padding-left: 10px;" runat="server" id="Normal_Div" visible="false" class="mainDiv">
            <asp:Literal runat="server" ID="modelHtml" EnableViewState="false"></asp:Literal>
            <div>
                <button type="button" id="sureBtn" style="width: 80px;" onclick="sureuser()" class="btn-primary fixed" runat="server">确认</button>
            </div>
        </div>
        <div runat="server" id="AllInfo_Div" class="mainDiv">
            <div class="divBorder" style="float: left; width: 150px; margin-bottom: 10px; height: 380px; overflow-y: scroll;">
                <asp:Literal runat="server" ID="AllInfo_Litral" EnableViewState="false"></asp:Literal>
            </div>
            <asp:UpdatePanel runat="server" ID="UserDiv">
                <ContentTemplate>
                    <div style="float: left; margin-left: 10px; width: 600px; top: 2px;">
                        <div style="margin-bottom: 5px;">
                            当前显示:<asp:Label runat="server" ID="curLabel" Style="color: green;">全部用户</asp:Label>
                            <asp:TextBox runat="server" ID="keyText" onkeydown="return GetEnterCode('click','keyBtn');" placeholder="可输入用户名,会员组名,工号" />
                            <asp:Button runat="server" ID="keyBtn" Text="搜索" CssClass="btn btn-primary" OnClick="keyBtn_Click" OnClientClick="return Search();" Height="34" />
                            <button type="button" id="clearBtn" onclick="ClearAll();" class="btn btn-primary" style="height:34px;">清除选择</button>
                            <asp:Button runat="server" ID="showAll_Btn" Text="全部用户" CssClass="btn-primary" Visible="false" OnClick="showAll_Btn_Click" Height="34" />
                            <input type="button" id="AllInfo_sure_btn" value="确定" onclick="AllInfo_sureF();" class="btn btn-primary" />
                        </div>
                        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" CssClass="table border" EmptyDataText="当前没有信息!!"
                            OnPageIndexChanging="EGV_PageIndexChanging" RowStyle-CssClass="dataRow">
                            <Columns>
                                <asp:TemplateField HeaderText="<input id='chkAll' onclick='checkAll(this)' type='checkbox' />" >
                                    <ItemTemplate>
                                        <input type="checkbox" <%#IsChecked(Eval("UserID")+":"+Eval("UserName")) %>  name="idChk" value="<%#Eval("UserID") %>" userinfo="<%#Eval("UserID")+":"+Eval("TrueName") %>" onclick="SaveHide(this);" />
                                        <input type="hidden" name="AllInfo_hid" value="<%#Eval("Gid") %>" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="用户组">
                                    <ItemTemplate><%#Eval("GroupName") %></ItemTemplate>
                                    <HeaderStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="用户名">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TrueName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="120px" />
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle Height="30px" HorizontalAlign="Center" />
                        </ZL:ExGridView>
                    </div>
                    <asp:Button runat="server" ID="ReBind_Btn" OnClick="ReBind_Btn_Click" Style="display: none;" />
                    <asp:HiddenField runat="server" ID="GroupID_H" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:HiddenField runat="server" ID="UserInfo_H" />
            <div class="clear"></div>
        </div>
        <script>
            $("#GroupSel").find("li").find("ul").hide();
            function checkAll(obj) {//必须通过单击事件进行状态更改
                $("input[name='idChk']").each(function () {
                    if (this.checked != obj.checked)
                    { $(this).click(); }
                });
            }
            function hiddenul(obj) {
                $(obj).parent().find("ul").toggle();
                $(obj).parent().find("ul").find("li").find("ul").hide();
            }
            function sureuser() {
                var groupJson = "";
                var s = "";
                $("input[type=checkbox][name=selgroup]:checked").each(function () {
                    s += $(this).attr("myName") + ",";
                    groupJson += '{ "Gname": "' + $(this).attr("myName") + '", "Gid":"' + $(this).val() + '"},';
                })
                if (groupJson) {
                    groupJson = groupJson.substring(0, groupJson.length - 1);
                    groupJson = eval("[" + groupJson + "]");
                }
                $(":checkbox").each(function () { this.checked = ''; });
                parent.selgroup(groupJson);
            }
            //----
            function disFrame(v) {
                parent.selGroup(v);
            }
            //------EGV使用
            $().ready(function () {
                //$("#EGV tr:gt(0)").addClass("tr-hover");
                //$("input[name='idChk']").each(function () {
                //    //为tr绑定事件,单击格也能选中
                //    $(this).parent().parent().click(function () { $(this).find("input[name='idChk']").click(); });
                //});
            });
            //根据会员组筛选
            function FilterTr(gid, gn) {
                $("#EGV tr:gt(0)").hide();
                //$("#EGV [name='AllInfo_hid'][value='" + gid + "']").parent().parent().show();
                $("#GroupID_H").val(gid);
                //$("#curLabel").text(gn);
                $("#ReBind_Btn").click();
            }
            //搜索
            function Search() {
                v = $("#keyText").val();
                if (v == "请输入用户名或会员组名") return false;
            }
            //清空所选CheckBox
            function ClearChk() {
                $("#EGV tr td :checkbox").each(function () { this.checked = false; });
                $("#UserInfo_H").val("");
            }
            function ShowAllTr() {
                //$("#EGV tr").show();
            }
            //拼接Json,传入$chkArr,包含UserInfo=UserID:UserName
            function CreateJson($obj) {
                var userJson = "";
                var uinfo = $("#UserInfo_H").val();
                if (uinfo) uinfo = uinfo.substring(0, uinfo.length - 1);
                var uArr = uinfo.split(',');
                for (var i = 0; i < uArr.length; i++) {
                    v = uArr[i];
                    //userJson += '{"UserID":"' + v.split(':')[0] + '","UserName":"' + v.split(':')[1] + '","TrueName":"' + v.split(':')[2] + '"},';
                    userJson += '{"UserID":"' + v.split(':')[0] + '","UserName":"' + v.split(':')[1] + '"},';
                }
                if (userJson) {//去除尾号,并Json化
                    userJson = userJson.substring(0, userJson.length - 1);
                    userJson = eval("[" + userJson + "]");
                }
                return userJson;
            }
            //确定选择
            function AllInfo_sureF() {
                var $chkArr = $("#EGV tr td :checkbox:checked");
                if ($("#UserInfo_H").val() == "") { alert("你尚未选定用户!!!"); return; }
                else
                {
                    var select = GetParam2();
                    if (select != "")
                        parent.UserFunc(CreateJson($chkArr), select);
                    else
                        parent.UserFunc(CreateJson($chkArr));
                }
            }
            //-----Tool
            function GetParam2() {
                var index = location.href.indexOf("#");
                var r = "";
                if (index > -1) {
                    r = location.href.substring((index + 1), location.href.length);
                }
                return r;
            }
            function SaveHide(obj) {
                if (obj.checked) {
                    if ($("#UserInfo_H").val().indexOf(($(obj).attr("userinfo") + ",")) < 0)
                        $("#UserInfo_H").val($("#UserInfo_H").val() + $(obj).attr("userinfo") + ",");
                }
                else {
                    $("#UserInfo_H").val($("#UserInfo_H").val().replace($(obj).attr("userinfo") + ",", ""));
                }
            }
            function ClearAll() {
                var chkArr = $("input[type=checkbox][name=idChk]");
                for (var i = 0; i < chkArr.length; i++) {
                    chkArr[i].checked = false;
                }
                $("#UserInfo_H").val("");
            }
        </script>
    </form>
</body>
</html>
<script type="text/javascript" src="/Plugins/JqueryUI/spin/spin.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>