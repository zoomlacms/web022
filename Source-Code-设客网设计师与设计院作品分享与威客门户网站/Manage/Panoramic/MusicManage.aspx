<%@ page language="C#" autoeventwireup="true" inherits="manage_Panoramic_MusicManage, App_Web_rm1hbh3m" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>音乐库管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
      <table  class="table table-striped table-bordered table-hover">
        <tr>
          <td colspan="5" class="spacingtitle" align="center"> 音乐库管理 </td>
        </tr>
        <tr class="tdbgleft">
          <td class="tdbgleft" align="center" style="width: 10%">ID</td>
          <td class="tdbgleft" align="center" style="width: 20%">音乐名称</td>
          <td class="tdbgleft" align="center" style="width: 20%">是否启用</td>
          <td class="tdbgleft" align="center" style="width: 20%">添加时间</td>
          <td class="tdbgleft" align="center" style="width: 30%">操作</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
          <ItemTemplate>
            <tr class="tdbg" height="25px"ondblclick='View(<%#Eval("ID") %>)' title="双击修改" style=" cursor:pointer;">
              <td align="center"><%#Eval("ID") %></td>
              <td align="center"><a href="AddMusic.aspx?menu=edit&id=<%#Eval("ID") %>"><%#Eval("MusicName")%></a></td>
              <td align="center"><%#Eval("IsTrue","{0}")=="1"?"<font color=green>启用</font>":"<font color=red>停用</font>"%></td>
              <td align="center"><%#Eval("AddTime")%></td>
              <td align="center"><a href="AddMusic.aspx?menu=edit&id=<%#Eval("ID") %>">修改</a> <a href="?menu=delete&id=<%#Eval("ID") %>" onclick="return confirm('确实要删除吗？删除后该信息无法恢复!')">删除</a></td>
            </tr>
          </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
          <td height="22" colspan="8" align="center" class="tdbg"> 共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            个信息
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />
            /
            <asp:Label ID="PageSize" runat="server" Text="" />
            页
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            条信息/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
            页 </td>
        </tr>
      </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function View(ID) {
            location.href = "AddMusic.aspx?menu=edit&id=" + ID;
        }
    </script>
</asp:Content>