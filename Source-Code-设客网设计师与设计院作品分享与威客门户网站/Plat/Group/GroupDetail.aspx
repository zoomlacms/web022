﻿<%@ page language="C#" autoeventwireup="true" inherits="Plat_Group_GroupDetail, App_Web_wmzrct11" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><asp:Literal runat="server" ID="Title_L" /></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb" style="margin-bottom: 10px;">
        <li><span class="glyphicon glyphicon-home" style="color: black; margin-right: 5px;"></span><a title="首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="管理中心" href="/Plat/Admin/">管理中心</a></li>
        <li><a href="/Plat/Group/MyGroup.aspx">部门管理</a></li>
        <li class="active">
            <asp:Label runat="server" ID="GName_L"></asp:Label>
        </li>
    </ol>
    <div>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
            class="table table-striped table-bordered table-hover" EmptyDataText="该部门尚无成员!!"
            OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="<input type='checkbox' id='chkAll' />">
                    <ItemTemplate>
                        <input type="checkbox" name="idChk" value="<%#Eval("UserID") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="真名" DataField="TrueName" />
                <asp:BoundField HeaderText="手机" DataField="Mobile" />
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>