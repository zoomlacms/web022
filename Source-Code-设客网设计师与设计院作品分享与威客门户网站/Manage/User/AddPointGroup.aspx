<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddPointGroup, App_Web_1jbandww" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/Common.js"></script>
    <title>添加积分等级</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField runat="server" ID="LNav_Hid" Value="添加积分等级" />
    <table width="100%" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
        <tr style="display: none;">
            <td class="spacingtitle" colspan="2" align="center">
                <asp:Literal ID="LTitle" runat="server" Text="添加积分等级"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: auto"><strong>积分等级：</strong></td>
            <td>
                <asp:TextBox class="form-control pull-left text_md" ID="txtPointGroup" runat="server" />
                <font color="red" style="float: left; padding: 5px;">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPointGroup">积分等级不能为空</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: auto"><strong>积分值：</strong></td>
            <td>
                <asp:TextBox class="form-control pull-left" ID="txtPoint" runat="server" Style="width: auto">0</asp:TextBox>
                <span style="float: left; padding: 5px">(用户多少积分可升级为此等级)</span>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0" ControlToValidate="txtPoint"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: auto"><strong>备注：</strong></td>
            <td>
                <asp:TextBox class="form-control" ID="TxtDescription" runat="server" TextMode="MultiLine" Style="max-width: 372px" Height="61px" />
            </td>
        </tr>
        <tr>
            <td class="text-right"><strong>等级图片：</strong></td>
            <td>
                <asp:TextBox ID="txt_imgUrl" runat="server" class="form-control text_md" ></asp:TextBox> <span id="imgIcon"></span>
                <button type="button" id="levelimg_btn" class="btn btn-primary" onclick="SelIcon()">填写或选择奥森图标</button>
            </td>             
        </tr>
        <tr>
            <td colspan="2" style="padding-left: 19%">
                <asp:HiddenField ID="HdnGroupID" runat="server" />
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存设置" OnClick="EBtnSubmit_Click" runat="server" />
                <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="返回列表" onclick="location.href = 'PointGroup.aspx'" />
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var diag = new ZL_Dialog();
        diag.title = "填写或选择奥森图标";
        diag.ajaxurl = "/Common/icon.html";
        function SelIcon() {
            diag.ShowModal();
        }
        function LoadIcon() {
            $("[name=glyphicon]").click(function () {
                $("#txt_imgUrl").val($(this).prev().prev().attr("class"));
                $("#imgIcon").attr("class", $(this).prev().prev().attr("class"));
                diag.CloseModal();
            });
        }
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
     
</asp:Content>