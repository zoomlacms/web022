<%@ page language="C#" autoeventwireup="true" inherits="manage_Flex_AddItempage, App_Web_nw2myhlo" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>Flex管理系统</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table class="table table-striped table-bordered table-hover">
        <tr align="center" >
            <td colspan="2" class="spacingtitle">
                <strong>
                    <asp:Label ID="LblTitle" runat="server" Text="添加礼品页面" Font-Bold="True"></asp:Label>
                </strong>
            </td>
        </tr>
             <tr>
            <td>
                所属礼品：
            </td>
            <td  style="width: 60%;">
                <asp:DropDownList ID="U_Tid" CssClass="form-control" runat="server" Width="150" AutoPostBack="True" OnSelectedIndexChanged="U_Tid_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="U_Tid" ErrorMessage="所属礼品不能为空!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                产品分类：
            </td>
            <td  style="width: 60%;">
                <asp:DropDownList ID="U_PClass" CssClass="form-control" runat="server" OnSelectedIndexChanged="U_PClass_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="U_PClass" ErrorMessage="产品分类不能为空!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                所属分类：
            </td>
            <td  style="width: 60%;">
                <asp:DropDownList ID="U_Class" CssClass="form-control" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="U_Class" ErrorMessage="所属分类不能为空!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td>
                页码：
            </td>
            <td  style="width: 60%;">
                <asp:TextBox ID="U_Pagenum" CssClass="form-control" runat="server" Width="136px">0</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="U_Pagenum" ErrorMessage="页码不能为空!"></asp:RequiredFieldValidator>
            </td>
        </tr>
                <tr>
            <td>
                分页默认小图片：
            </td>
            <td  style="width: 60%;">
               <asp:TextBox ID="U_PageUrl" class="form-control" runat="server" Width="290px"></asp:TextBox>
                <br />
                <iframe id="Upload_pic" src="../../Common/PubimgUpload.aspx?menu=U_PageUrl" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="30" scrolling="no"></iframe>
            </td>
        </tr>
         <tr>
            <td>
                分页默认大图片：
            </td>
             <td style="width: 60%;">
                 <asp:TextBox ID="U_PageUrl2" class="form-control" runat="server" Width="290px"></asp:TextBox>
                 <br />
                 <iframe id="Iframe1" src="../../Common/PubimgUpload.aspx?menu=U_PageUrl2" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="30" scrolling="no"></iframe>
             </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                <asp:Button ID="EBtnSubmit" class="btn btn-primary"  Text="下一步" runat="server" onclick="EBtnSubmit_Click" />
                <input name="BtnCancel" class="btn btn-primary"  type="button" onclick="javascript: window.location.href = 'FlexTemplate.aspx'" value=" 取消 " />
            </td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="pageid_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>