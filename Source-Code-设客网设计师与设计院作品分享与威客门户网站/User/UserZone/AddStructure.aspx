<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserZone_AddStructure, App_Web_222g3wpa" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>创建企业结构</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Structure.aspx">企业结构</a></li>
        <li class="active">创建企业结构</li>
    </ol>
    <div class="us_seta" style="margin-top: 5px;">
        <table class="table table-striped table-bordered table-hover">
            <tbody id="Tabs0">
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblText" runat="server">创建组织结构</asp:Label></td>
                </tr>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td style="width:50%;text-align:right;" class="text-right"><strong>结构名：</strong></td>
                    <td style="text-align:left;">
                        <asp:TextBox ID="TxtProjectName" class=" form-control" runat="server" />
                        <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="BtnCommit" runat="server" Text="提交" class="btn btn-primary" OnClick="Button1_Click" />
                        <asp:Button ID="Btn" runat="server" Text="返回" class="btn btn-primary" OnClick="Button2_Click" />
                    </td>
                </tr>
        </table>
    </div>
</asp:Content>
