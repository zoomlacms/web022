<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="manage_Zone_SnsStudentModel, App_Web_ikj1rj5m" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>学校会员模型管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<div class="clearbox"></div>
    <table class="table table-striped table-bordered table-hover">
        <tbody>
            <tr class="gridtitle" align="center" style="height:25px;">
                <td width="5%" height="20">
                    <strong>ID</strong></td>
                <td width="5%">
                    <strong>图标</strong></td>
                <td width="10%">
                    <strong>模型名称</strong></td>
                <td width="20%">
                    <strong>模型描述</strong></td>
                <td width="10%">
                    <strong>项目名称</strong></td>
                <td width="20%">
                    <strong>表名</strong></td>                        
                <td width="30%">
                    <strong>操作</strong></td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <tr class="tdbg" align="center" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="height:25px;">                        
                        <td>
                            <strong><%# Eval("ModelID") %></strong></td>
                        <td>
                            <img src="<%# GetIcon(DataBinder.Eval(Container, "DataItem.ItemIcon", "{0}"))%>" style="border-width:0px;" /></td>
                        <td>
                            <strong><%# Eval("ModelName")%></strong></td>
                        <td align="left">
                            <strong><%# Eval("Description")%></strong></td>
                        <td>
                            <strong><%# Eval("ItemName")%></strong></td>
                        <td align="left">
                            <strong><%# Eval("TableName")%></strong></td>                        
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ModelID") %>'>修改</asp:LinkButton> | 
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("ModelID") %>' OnClientClick="return confirm('确实要删除此模型吗？');">删除</asp:LinkButton> | 
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Field" CommandArgument='<%# Eval("ModelID") %>'>字段列表</asp:LinkButton>                            
                         </td>
                    </tr>
                </ItemTemplate>
             </asp:Repeater>                        
        </tbody>
    </table>
</asp:Content>
