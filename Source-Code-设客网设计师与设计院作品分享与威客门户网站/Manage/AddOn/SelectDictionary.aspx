﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.AddOn.SelectDictionary, App_Web_jzh2rzwp" enableviewstatemac="false" masterpagefile="~/Plat/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head"><title>选择数据字典</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table  class="TableWrap"  id="sleall">
    <tr>
        <td style="height: 21px">                   
            分类名：<asp:TextBox ID="txtCategoryName" runat="server" Width="200px" class="form-control"></asp:TextBox>
            &nbsp;                        
            <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" class="btn btn-primary"/>
            <asp:HiddenField ID="HdnNameKey" runat="server" />
            </td>
    </tr>                
</table>
<div class="clearbox"></div>
<ZL:ExGridView ID="EGV" DataKeyNames="DicCateID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" 
    EmptyDataText="无相关数据" CssClass="table table-bordered table-hover table-striped">
    <Columns>                
        <asp:BoundField DataField="DicCateID" HeaderText="序号">
        <ItemStyle HorizontalAlign="Center" />
        <HeaderStyle Width="5%" />
        </asp:BoundField>                                               
        <asp:TemplateField HeaderText="分类名">
            <ItemTemplate>                                
               <%# Eval("CategoryName")%>
            </ItemTemplate>
             <ItemStyle HorizontalAlign="Left" />
             <HeaderStyle Width="50%" />
        </asp:TemplateField>                                                      
        <asp:TemplateField HeaderText="操作">
        <HeaderStyle Width="19%" />
        <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" CommandArgument='<%# Eval("DicCateID") %>'>选择</asp:LinkButton>                    
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
    <PagerStyle HorizontalAlign="Center" />
    <RowStyle Height="24px" HorizontalAlign="Center" />
</ZL:ExGridView>
<asp:TextBox ID="TxtSelectDic" runat="server" TextMode="MultiLine" Width="300px" Height="100px"></asp:TextBox><br />
<asp:Button ID="Button1" runat="server" Text="确定" OnClientClick="add();" class="btn btn-primary"/>
<asp:HiddenField ID="HdnContrID" runat="server" />
<script type="text/javascript">
    function add() {
        var conid = document.getElementById('<%= HdnContrID.ClientID %>').value;
        opener.document.getElementById(conid).value = document.getElementById('<%= TxtSelectDic.ClientID %>').value;
        window.close();
    }
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>