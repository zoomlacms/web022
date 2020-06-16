<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_Guest_WdAlter, App_Web_dbnpt1ot" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>问答中心</title>
    <style>
    </style>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <table class="table table-bordered table-hover table-condensed">
        <tr>
            <td class="text-center" style="width:15%; line-height:120px;">
                您的问题:
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtContent"  style="max-width:480px;" AutoPostBack="true" TextMode="MultiLine" Height="120"></asp:TextBox>
                <%=Call.GetUEditor("txtContent",1) %>
            </td>
        </tr>
        <tr>
            <td class="text-center" style="line-height:120px;">补充问题:</td>
            <td>
                <asp:TextBox runat="server" ID="txtSupplyment" AutoPostBack="true"  style="max-width:480px;"  TextMode="MultiLine" Height="120"></asp:TextBox>
                <%=Call.GetUEditor("txtSupplyment",1) %>
            </td>
        </tr>
        <tr>
            <td class="text-center tdtitle">问题分类:</td>
            <td>
                <asp:DropDownList ID="ddlCate" CssClass="form-control" runat="server" Width="100px">
                                <asp:ListItem>电脑网络</asp:ListItem>
                                <asp:ListItem>生活</asp:ListItem>
                                <asp:ListItem>医疗健康</asp:ListItem>
                                <asp:ListItem>体育运动</asp:ListItem>
                                <asp:ListItem>电子数码</asp:ListItem>
                                <asp:ListItem>商业理财</asp:ListItem>
                                <asp:ListItem>教育科学</asp:ListItem>
                                <asp:ListItem>社会民生</asp:ListItem>
                                <asp:ListItem>文化艺术</asp:ListItem>
                                <asp:ListItem>娱乐休闲</asp:ListItem>
                                <asp:ListItem>烦恼</asp:ListItem>
                                <asp:ListItem>地区旅行</asp:ListItem>
                            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="text-center tdtitle">悬赏分数:</td>
            <td>
                <asp:DropDownList ID="ddlScore" CssClass="form-control" runat="server" Width="100px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>40</asp:ListItem>
                                <asp:ListItem>50</asp:ListItem>
                                <asp:ListItem>60</asp:ListItem>
                                <asp:ListItem>70</asp:ListItem>
                                <asp:ListItem>80</asp:ListItem>
                                <asp:ListItem>90</asp:ListItem>
                                <asp:ListItem>100</asp:ListItem>
                            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button runat="server" ID="btnSubmit" Text="提交" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                <a href="WdCheck.aspx" class="btn btn-primary">返回</a>
            </td>
        </tr>
    </table>
    
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>
    <script type="text/javascript">
        function supplyment() {
            var div = document.getElementById("divSupplyment");
            if (div.style.display == "none") {
                div.style.display = "block";
            }
            else {
                div.style.display = "none";
            }
        }
        function CheckDirty() {
            var oEditor = CKEDITOR.instances.TxtTContent;
            var value = oEditor.getData();
            var TxtTTitle = document.getElementById("TxtTTitle").value;
            var TxtValidateCode = document.getElementById("TxtValidateCode").value;

            if (value == "" || TxtTTitle == "" || TxtValidateCode == "") {
                if (value == "") {
                    var obj = document.getElementById("RequiredFieldValidator1");
                    obj.innerHTML = "<font color='red'>内容不能为空！</font>";
                }
                else {
                    var obj = document.getElementById("RequiredFieldValidator1");
                    obj.innerHTML = "";
                }
                if (TxtTTitle == "") {
                    var obj2 = document.getElementById("RequiredFieldValidator2");
                    obj2.innerHTML = "<font color='red'>留言标题不能为空！</font>";
                }
                else {
                    var obj2 = document.getElementById("RequiredFieldValidator2");
                    obj2.innerHTML = "";
                }
                if (TxtValidateCode == "") {
                    var obj3 = document.getElementById("sp1");
                    obj3.innerHTML = "<font color='red'>验证码不能为空！</font>";
                } else {
                    var obj3 = document.getElementById("sp1");
                    obj3.innerHTML = "";
                }
                return false;
            }
            else {
                var obj = document.getElementById("RequiredFieldValidator1");
                obj.innerHTML = "";
                var obj2 = document.getElementById("RequiredFieldValidator2");
                obj2.innerHTML = "";
                var obj3 = document.getElementById("sp1");
                obj3.innerHTML = "";
                document.getElementById("EBtnSubmit2").click();
            }
        }
    </script>
</asp:Content>
