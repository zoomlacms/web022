<%@ page language="C#" autoeventwireup="true" inherits="MIS_OA_Mail_Message, App_Web_jaatvzyj" enableviewstatemac="false" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>收件箱</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script>
$().ready(function () {
	$("#EGV tr:last >td>:text").css("line-height", "normal");
	$("#EGV tr:first >th").css("text-align", "center");
	$("#<%=EGV.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
	$("#chkAll").click(function () { selectAllByName(this, "idChk"); });
});
$().ready(function () {
	$("tr:gt(1)").addClass("tdbg");
	$("tr:gt(1)").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
	$("tr:gt(1)").dblclick(function () { v = $(this).find("[name='idChk']").val(); location = "MessageRead.aspx?read=1&id=" + v; });
	$("tr:last").unbind("mouseover").unbind("dblclick");
});
</script>
<style>
.Messge_nav { margin-bottom: 10px; margin-top: 10px; }
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div class="container-fluid">
    <ol class="breadcrumb">
      <li><a href="/Plat/Blog/">首页</a></li>
      <li><a href="/Plat/Task/">邮件</a></li>
      <li class="active">收件箱</li>
    </ol>
  </div>
  <div class="mainDiv">
    <div class="btn-group Messge_nav"> <a class="btn btn-primary" href="MessageSend.aspx">写邮件</a> <a class="btn btn-primary" href="Default.aspx">收件箱</a> <a class="btn btn-primary" href="MessageOutbox.aspx">发件箱</a> <a class="btn btn-primary" href="MessageDraftbox.aspx">草稿箱</a> <a class="btn btn-primary" href="MessageGarbagebox.aspx">垃圾箱</a> <a class="btn btn-primary" href="Mobile.aspx">手机短信</a> </div>
    <div class="clearfix"></div>
    <div class="us_seta" style="margin-top: 5px;">
      <div id="site_main">
        <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control" />
        <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" Style="height: 34px; margin-left: 2px;" />
        <div style="margin-top: 5px;">
          <ZL:ExGridView runat="server" ID="EGV" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="Row_Command">
            <Columns>
            <asp:TemplateField HeaderText="选择" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
              <ItemTemplate>
                <input type="checkbox" name="idChk" value='<%#Eval("MsgID") %>' />
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="主题">
              <HeaderStyle Width="40%" />
              <ItemTemplate><a href="MessageRead.aspx?read=1&id=<%# Eval("MsgID")%>"><%# Eval("Title", "{0}")%>（<%#getStatus(Eval("ReadUser","{0}"))%>)</a></ItemTemplate>
              <ItemStyle HorizontalAlign="left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发件人" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="center">
              <HeaderStyle Width="10%"></HeaderStyle>
              <ItemStyle HorizontalAlign="Center"></ItemStyle>
              <ItemTemplate> <%# GetUserName(Eval("Sender","{0}")) %> </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PostDate" HeaderText="发送日期" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="center">
              <HeaderStyle Width="20%"></HeaderStyle>
              <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="操作" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="center">
              <ItemTemplate>
                <asp:LinkButton ID="lbRead" runat="server" CommandName="ReadMsg" CommandArgument='<%# Eval("MsgID")%>'><%#getMess(Eval("ReadUser","{0}"))%></asp:LinkButton>
                <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此信息到垃圾箱吗？');"
								CommandArgument='<%# Eval("MsgID")%>' Text="删除"></asp:LinkButton>
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
      <asp:Button runat="server" ID="batDelBtn" Text="批量删除" OnClick="batDelBtn_Click" CssClass="btn btn-primary" />
      <asp:Button runat="server" ID="batReadBtn" Text="设为已读" OnClick="batReadBtn_Click" CssClass="btn btn-primary" />
    </div>
  </div>
</asp:Content>