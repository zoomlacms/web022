<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_MisModelManage, App_Web_rxxn1rgs" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模板管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style=" margin-bottom:10px;">
        <div class="input-group" style="width:300px;">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass=" form-control" />
            <span class="input-group-btn">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" />
            </span>
        </div>
    </div>
    <div>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="ID" OnRowDataBound="EGV_RowDataBound" OnRowCommand="EGV_RowCommand"  AllowUserToOrder="true" EmptyDataText="当前没有类型!!">
            <Columns>
                <asp:BoundField HeaderText="模板ID" DataField="ID" HeaderStyle-Height="22" />
                <asp:BoundField HeaderText="模板名称" DataField="ModelName" />
                <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="AddMisModel.aspx?&ID=<%#Eval("ID") %>">修改</a>
                        <asp:LinkButton ID="LinkButton1" CommandName="del" CommandArgument='<%# Eval("ID") %>' runat="server">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
</asp:Content>
