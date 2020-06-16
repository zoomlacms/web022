<%@ page language="C#" autoeventwireup="true" inherits="Plat_Mail_MailReBox, App_Web_qf403px0" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Plat/Common/EmailNav.ascx" TagPrefix="uc1" TagName="EmailNav" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>回收站</title>
<style>
.Messge_nav { margin-bottom: 10px; margin-top: 10px; }
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="mainDiv">
        <ol class="breadcrumb">
            <li><a href="/Plat/Blog/">首页</a></li>
            <li><a href="/Plat/EMail/">邮件</a></li>
            <li class="active">回收站</li>
        </ol>
        <uc1:EmailNav runat="server" ID="EmailNav" />
        <div id="site_main">
        <div class="input-group pull-left hidden-xs hidden-sm" style="width: 240px;margin-bottom:10px;">
        <asp:TextBox runat="server" ID="Main_Skey_T" placeholder="信息搜索" class="form-control" Style="width: 190px;float:left;" EnableViewState="false" />
        <span class="input-group-btn">
        <asp:Button runat="server" ID="Search_Btn" class="btn btn-default" Text="搜索" />
        </span>
        </div>
        <div style="margin-top:5px;">
          <ZL:ExGridView runat="server" ID="EGV" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" OnPageIndexChanging="EGV_PageIndexChanging" EmptyDataText="当前没有信息!!">
            <Columns>
            <asp:TemplateField HeaderText="选择" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
              <ItemTemplate>
                <input type="checkbox" name="idchk" value='<%#Eval("ID")%>' />
              </ItemTemplate>
              <HeaderStyle Width="5%"></HeaderStyle>
              <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="主题">
              <HeaderStyle Width="40%" />
              <ItemTemplate> <a href="MessageRead.aspx?read=1&id=<%# Eval("ID")%>"><%# Eval("Title", "{0}")%></a> </ItemTemplate>
              <ItemStyle HorizontalAlign="left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="收件人" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="center">
              <ItemTemplate> <%# GetUserName(Eval("UserID","{0}")) %> </ItemTemplate>
              <HeaderStyle Width="10%"></HeaderStyle>
              <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发件人" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="center" >
              <ItemTemplate> <%# Eval("Sender","{0}") %> </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CDate" HeaderText="发送日期" HeaderStyle-Width="20%"
					ItemStyle-HorizontalAlign="center">
              <HeaderStyle Width="20%"></HeaderStyle>
              <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="操作" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="center">
              <ItemTemplate>
                <asp:LinkButton ID="lbRead" runat="server" CommandName="ReadMsg" CommandArgument='<%# Eval("ID")%>'>阅读信息</asp:LinkButton>
                <%--          <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('是否彻底删除该信息？');"
							CommandArgument='<%# Eval("MsgID")%>' Text="删除"></asp:LinkButton>--%>
              </ItemTemplate>
              <HeaderStyle Width="20%"></HeaderStyle>
              <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
          </ZL:ExGridView>
        </div>
      </div>
      <asp:Button ID="Dels" runat="server" Text="批量删除" class="btn btn-primary" OnClick="Dels_Click" OnClientClick="return confirm('确定要彻底删除选定邮件吗!!');"/>
      <asp:Button id="ReBox" runat="server" Text="批量还原" OnClick="ReBox_Click" class="btn btn-primary" />
    </div>
</asp:Content>

