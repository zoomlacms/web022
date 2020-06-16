<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_StoreStyleAdd, App_Web_ikj1rj5m" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加个人空间模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center"><asp:Literal ID="LTitle" runat="server" Text="添加个人空间模板"></asp:Literal></td>
        </tr>
        <tr>
            <td class="td_l text-right">
                <strong>模板名称：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtModelName" class="form-control" runat="server" Width="300" MaxLength="20" /><font color="red">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtModelName">模板名称不能为空</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>模板缩略图：</strong>
            </td>
            <td>
                <asp:TextBox ID="txt_Thumbnails" class="form-control" runat="server" Width="300px" /> <span>填写模板图片路径</span>
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>用户空间首页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="ModeTemplate" class="form-control" runat="server" />
                <input type="button" value="选择模板" class="btn btn-primary" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('ModeTemplate') + '&FilesDir=')" />
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>日志列表模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="LogStyle_T" class="form-control" runat="server" />
                <input type="button" value="选择模板" class="btn btn-primary" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('LogStyle_T') + '&FilesDir=')" />
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>日志内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="LogShowStyle_T" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('LogShowStyle_T') + '&FilesDir=')" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>相册列表模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="PhotoStyle_T" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('PhotoStyle_T') + '&FilesDir=')" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>相册内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="PhotoShowStyle_T" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('PhotoShowStyle_T') + '&FilesDir=')" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>相片内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="PicShowStyle_T" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('PicShowStyle_T') + '&FilesDir=')" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>群族列表模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="GroupStyle_T" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('GroupStyle_T') + '&FilesDir=')" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>群族内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="GroupShowStyle_T" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('GroupShowStyle_T') + '&FilesDir=')" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td class="text-right">
                <strong>话题内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="GroupTopicShow_T" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('GroupTopicShow_T') + '&FilesDir=')" class="btn btn-primary" />
            </td>
        </tr>
        
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="EBtnSubmit" Text="保存模板" class="btn btn-primary" runat="server" OnClick="EBtnSubmit_Click" />
                <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="取消保存" onclick="javescript: history.go(-1)" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        function GV(id, value) {

            $("#" + id).val(value);
        }
        var TemDiag = new ZL_Dialog();
        function opentitle(url) {
            TemDiag.title = "选择模板";
            TemDiag.maxbtn = false;
            TemDiag.url = url;
            TemDiag.ShowModal();
        }
        function CloseDialog() {
            TemDiag.CloseModal();
        }
    </script>
</asp:Content>
