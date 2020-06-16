<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_AddShopBrand, App_Web_e1atrdhs" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>品牌管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="2">品牌参数设置</td>
        </tr>
        <tr>
            <td style="width: 20%"><strong>品牌名称：</strong></td>
            <td valign="middle">
                <asp:TextBox ID="Trname" class="form-control" runat="server" Width="251px"></asp:TextBox>
                <asp:HiddenField ID="ID_H" runat="server" />
                <asp:HiddenField ID="uptype" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="tdbgleft" style="height: 22px; width: 20%;"><strong>所属厂商：</strong></td>
            <td valign="middle" style="height: 22px">
                <asp:DropDownList ID="Producer" CssClass="form-control" Width="150" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 20%; height: 22px;"><strong>是否推荐：</strong> </td>
            <td valign="middle" style="height: 22px">
                <asp:CheckBox ID="Isbest" runat="server" Text="推荐" /></td>
        </tr>
        <tr>
            <td style="width: 20%"><strong>品牌分类：</strong></td>
            <td height="22" valign="middle">
                <asp:RadioButtonList ID="TrClass" runat="server" RepeatDirection="Horizontal"
                    Width="420px">
                    <asp:ListItem Selected="True" Value="大陆品牌">大陆品牌</asp:ListItem>
                    <asp:ListItem Value="港台品牌">港台品牌</asp:ListItem>
                    <asp:ListItem Value="日韩品牌">日韩品牌</asp:ListItem>
                    <asp:ListItem Value="欧美品牌">欧美品牌</asp:ListItem>
                    <asp:ListItem Value="其他品牌">其他品牌</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td style="width: 20%"><strong>品牌照片：</strong></td>
            <td height="22" valign="middle">
                <asp:TextBox ID="txt_TrPhoto" class="form-control" runat="server" Width="321px"></asp:TextBox>
                <iframe id="proimgs" style="top: 2px" src="/Common/fileupload.aspx?FieldName=TrPhoto" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
            </td>
        </tr>
        <tr>
            <td style="width: 20%"><strong>品牌简介：</strong></td>
            <td valign="middle">

                <textarea cols="80" id="TrContent" class="form-control" style="max-width:580px;" height="350px" name="TrContent" rows="10" runat="server"></textarea>
                <script id="headscript" type="text/javascript">
                    //<![CDATA[
                    CKEDITOR.replace('TrContent',
                    {
                        skin: 'v2',
                        enterMode: 2,
                        shiftEnterMode: 2,
                        toolbar: [['Source', '-', 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', 'Smiley', 'ShowBlocks', 'Maximize', 'About']]
                    });
                    //]]>
                </script>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="保存设置" OnClick="Button1_Click" /></td>
        </tr>
    </table>
    <script type="text/javascript">
        function DealwithUploadPic(url, id) {
            $("#" + id).val(url);
        }
    </script>
</asp:Content>
