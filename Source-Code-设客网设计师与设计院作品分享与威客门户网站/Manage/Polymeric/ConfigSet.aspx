<%@ page language="C#" autoeventwireup="true" inherits="manage_Polymeric_ConfigSet, App_Web_dbhvdi1j" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %> 
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>参数设置</title> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td width="100%" class="title" colspan="2">模板设置
            </td>
        </tr>
        <tr align="center">
            <td width="30%" class="tdbgleft" align="right">聚合名称：
            </td>
            <td width="70%" class="tdbg" align="left">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control text_md" ></asp:TextBox>
                &nbsp;举例：如：店铺 或 主页 等等
            </td>
        </tr>
        <tr align="center">
            <td width="30%" class="tdbgleft" align="right">首页模板：
            </td>
            <td width="70%" class="tdbg" align="left">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control text_md" ></asp:TextBox>
                <input type="button" value="选择模板" onclick="OpenTitle('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox1') + '&FilesDir=')"
                    class="btn btn-primary" />
            </td>
        </tr>
        <tr align="center">
            <td width="30%" class="tdbgleft" align="right">列表页模板：
            </td>
            <td width="70%" class="tdbg" align="left">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control text_md" ></asp:TextBox>
                <input type="button" value="选择模板" onclick="OpenTitle('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox2') + '&FilesDir=')"
                    class="btn btn-primary" />
            </td>
        </tr>
        <tr align="center">
            <td width="30%" class="tdbgleft" align="right">内容页模板：
            </td>
            <td width="70%" class="tdbg" align="left">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control text_md"  ></asp:TextBox>
                <input type="button" value="选择模板" onclick="OpenTitle('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox3') + '&FilesDir=')"
                    class="btn btn-primary" />
            </td>
        </tr>
        <tr align="center">
            <td width="30%" class="tdbg" align="center" colspan="2">
                <asp:Button ID="Button1" runat="server" Text=" 更 新 " CssClass="btn btn-primary"
                    OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var temdiag = new ZL_Dialog();
        function OpenTitle(url) {
            temdiag.title = "选择模板";
            temdiag.url = url;
            temdiag.ShowModal();
        }
        function CloseDialog() {
            temdiag.CloseModal();
        }
    </script>
</asp:Content>