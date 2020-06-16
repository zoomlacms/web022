<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.UserShopManage.Producer, App_Web_e1atrdhs" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加厂商</title>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/EditFile/sample.js"></script>
    <script type="text/javascript" src="/Plugins/kindeditor/kindeditor.js" charset="utf-8"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="text-center">
            <td colspan="2" class="spacingtitle">
                <asp:Label ID="Label1" runat="server" Text="添加厂商"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>厂商名称：</strong>
            </td>
            <td width="66%" valign="middle">
                <asp:TextBox ID="Producername" class="form-control" runat="server" Width="251px"></asp:TextBox>
                <asp:HiddenField ID="ID" runat="server" />
                <asp:HiddenField ID="uptype" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 20%;">
                <strong>厂商缩写：</strong>
            </td>
            <td valign="middle" style="height: 22px">
                <asp:TextBox ID="Smallname" class="form-control" runat="server" Width="251px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>创建日期：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox ID="CreateTime" class="form-control" runat="server" Width="217px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>公司地址：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox ID="Coadd" class="form-control" runat="server" Width="251px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>联系电话：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox ID="Telpho" class="form-control" runat="server" Width="251px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>传真号码：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox ID="FaxCode" class="form-control" runat="server" Width="251px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%; height: 22px">
                <strong>邮政编码：</strong>
            </td>
            <td valign="middle" style="height: 22px">
                <asp:TextBox ID="PostCode" class="form-control" runat="server" Width="251px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>厂商主页：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox ID="CoWebsite" class="form-control" runat="server" Width="251px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>电子邮件：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox ID="Email" class="form-control" runat="server" Width="251px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>厂商分类：</strong>
            </td>
            <td valign="middle">
                <asp:RadioButtonList ID="CoClass" runat="server" RepeatDirection="Horizontal" Width="420px">
                    <asp:ListItem Selected="True">大陆厂商</asp:ListItem>
                    <asp:ListItem>港台厂商</asp:ListItem>
                    <asp:ListItem>日韩厂商</asp:ListItem>
                    <asp:ListItem>欧美厂商</asp:ListItem>
                    <asp:ListItem>其他厂商</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>厂商照片：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox ID="CoPhoto" class="form-control" runat="server" Width="321px"></asp:TextBox>
                <iframe id="proimgs" style="top: 2px" src="../../Shop/fileupload.aspx?menu=CoPhoto" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <strong>厂商简介：</strong>
            </td>
            <td valign="middle">
                <%--<asp:HiddenField ID="Content" runat="server" /><iframe id="infoeditor" src="../../editor/fckeditor_1.html?InstanceName=Content&Toolbar=Default" width="580px" height="350px" frameborder="no" scrolling="no"></iframe>
                --%>
                <textarea cols="80" id="Content" class="form-control" style="max-width:580px;height:350px;" name="Content" rows="10" runat="server"></textarea>
                <%--<script id="headscript" type="text/javascript">
                    //<![CDATA[
                    CKEDITOR.replace('Content', {
                        skin: 'v2', enterMode: 2, shiftEnterMode: 2,
                        toolbar: [['Source', '-', 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', 'Smiley', 'ShowBlocks', 'Maximize', 'About']]
                    });
                    //]]>
                </script>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="保存设置" OnClientClick="return veri()" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/calendar.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function veri() {
            if (document.getElementById("Producername").value == "") {
                alert("请填写厂商名称！");
                return false;
            }
        }
    </script>
</asp:Content>
