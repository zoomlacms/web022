<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="manage_UserShopManage_StoreStyleEdit, App_Web_ikj1rj5m" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>会员组模型编辑</title>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="clearbox"></div>    
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="spacingtitle text-center" colspan="2">
                <asp:Literal ID="LTitle" runat="server" Text="修改个人空间模板"></asp:Literal></td>
        </tr>
        <tr class="tdbg">
            <td class="tdbgleft" style="width: 35%">
                <strong>模板名称：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtModelName" class="form-control text_300" runat="server" Width="156" MaxLength="200" /><font color="red">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtModelName">模板名称不能为空</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>模板缩略图：</strong>
            </td>
            <td><asp:TextBox ID="Thumbnails" class="form-control" runat="server" Width="300px" /><span style="color: #ff0000">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Thumbnails"
                    ErrorMessage="RequiredFieldValidator">模板缩略图不能为空</asp:RequiredFieldValidator><iframe id="smallimgs" style="top:2px" src="../shop/fileupload.aspx?menu=Thumbnails" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>用户空间首页模板：</strong>
            </td>
            <td><asp:TextBox ID="ModeTemplate" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('ModeTemplate')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>日志列表模板：</strong>
            </td>
            <td><asp:TextBox ID="TextBox6" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TextBox6')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
         <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>日志内容页模板：</strong>
            </td>
            <td><asp:TextBox ID="TextBox5" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TextBox5')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
        <tr> 
            <td class="tdbgleft" style="width: 35%">
                <strong>相册列表模板：</strong>
            </td>
            <td><asp:TextBox ID="TextBox1" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TextBox1')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>相册内容页模板：</strong>
            </td>
            <td><asp:TextBox ID="TextBox2" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TextBox2')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>相片内容页模板：</strong>
            </td>
            <td><asp:TextBox ID="TextBox7" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TextBox7')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>群族列表模板：</strong>
            </td>
            <td><asp:TextBox ID="TextBox3" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TextBox3')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>群族内容页模板：</strong>
            </td>
            <td><asp:TextBox ID="TextBox4" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TextBox4')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>话题内容页模板：</strong>
            </td>
            <td><asp:TextBox ID="TextBox9" class="form-control text_300" runat="server" />
                                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TextBox9')+'&FilesDir=',650,480)" class="C_input" /></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 35%">
                <strong>模板状态：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">停用</asp:ListItem>
                    <asp:ListItem Value="1">启用</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:HiddenField ID="HdnModelId" runat="server" />
                <asp:Button ID="EBtnSubmit" Text="保存" class="btn btn-primary"  runat="server" OnClick="EBtnSubmit_Click" />
                &nbsp;&nbsp;
                <input name="Cancel" type="button" class="btn btn-primary"  id="Cancel" value="取消" onclick="javescript:history.go(-1)" />                
            </td>
        </tr>
    </table> 
</asp:Content>

