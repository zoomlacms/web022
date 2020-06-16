<%@ page language="C#" autoeventwireup="true" inherits="Manage_WeiXin_ReplyList, App_Web_cbrc5gz1" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>微信回复管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" 
        OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="td_s">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="关键词" DataField="Filter" ItemStyle-CssClass="td_m" />
            <asp:TemplateField HeaderText="类型" ItemStyle-CssClass="td_m" >
                <ItemTemplate>
                    <%#GetMsgType() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="回复信息" DataField="Content"/>
            <asp:BoundField HeaderText="创建时间" ItemStyle-CssClass="td_l"  />
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
                <ItemTemplate>
                    <a href="AddReply.aspx?ID=<%#Eval("ID") %>&appid=<%=AppId %>">修改</a>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del2" OnClientClick="return confirm('确定要删除吗');">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
<asp:Button runat="server" ID="BatDel_Btn" OnClick="BatDel_Btn_Click" Text="批量删除" CssClass="btn btn-primary" OnClientClick="return confirm('确定要删除吗');" />
</asp:Content>
