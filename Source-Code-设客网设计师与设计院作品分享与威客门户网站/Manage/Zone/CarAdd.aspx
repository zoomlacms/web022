<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_CarAdd, App_Web_ikj1rj5m" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加车辆</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center" class="spacingtitle">添加车辆信息</td>
            </tr>
            <tr>
                <td  style="width:24%;" class="text-center">车辆名称：</td>
                <td>
                    <asp:TextBox ID="txtCarName" class="form-control text_md" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCarName" ErrorMessage="请输入车辆名称"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td  class="text-center">车辆售价：</td>
                <td>
                    <asp:TextBox ID="txtCarMoney" class="form-control text_md" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCarMoney" ErrorMessage="请输入车辆价格"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCarMoney" ErrorMessage="请输入正确的价格" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td  class="text-center">车辆LOG图片：</td>
                <td>
                    <asp:TextBox ID="txtCarLog" class="form-control" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCarLog" ErrorMessage="请上传车辆的LOG图片"></asp:RequiredFieldValidator>
                    <iframe id="smallimgs" style="top: 2px" src="../../shop/fileupload.aspx?menu=txtCarLog" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                </td>
            </tr>
            <tr>
                <td  class="text-center">车辆图片：</td>
                <td>
                    <asp:TextBox ID="txtCarImg" class="form-control" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCarImg" ErrorMessage="请上传车辆的图片"></asp:RequiredFieldValidator>
                    <iframe id="Iframe1" style="top: 2px" src="../../shop/fileupload.aspx?menu=txtCarImg" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                </td>
            </tr>
            <tr>
                <td  class="text-center">车辆简介：</td>
                <td>
                    <asp:TextBox ID="txtCarContext" class="form-control" runat="server" Height="100px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-center"></td>
                <td>
                    <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="保存" OnClick="btnSubmit_Click" />
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="返回" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
