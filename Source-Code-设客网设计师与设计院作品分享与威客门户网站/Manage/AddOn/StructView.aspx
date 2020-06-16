<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_StructView, App_Web_jzh2rzwp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
 <!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>结构成员</title>
  <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript">
    function CheckAll(spanChk)//CheckBox全选
    {
        var oItem = spanChk.children;
        var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
        xState = theBox.checked;
        elm = theBox.form.elements;
        for (i = 0; i < elm.length; i++)
            if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                if (elm[i].checked != xState)
                    elm[i].click();
            }
    }
    
</script>
</head>
<body>
    <form id="form1" runat="server">
  <div class="r_navigation">后台管理&gt;&gt; 用户管理 &gt;&gt; <a href="StructList.aspx">组织结构</a> &gt;&gt;用户列表 </div>
  <div>
      <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border"> 
       <tr  class="gridtitle" align="center" style="height: 25px"> 
      <td width="5%" height="24" align="center"><input id="CheckBox1" type="checkbox" name="CheckBox1" onclick="CheckAll(this);" /></td>
      <td align="center" width="14%"> 帐号</td>
      <td align="center" width="14%"> 名称 </td>   
      <td align="center" > 单位 </td>
      <td align="center" width="14%"> 电话 </td> 
      <td align="center" width="14%"> E-mail </td>
      <td width="14%" align="center"> 操作 </td>
    </tr>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate> 
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                id='<%#Eval("UserID") %>' ondblclick="Getinfo(this.UserID)">
          <td height="24" align="center"><input name="Item"  type="checkbox" value="<%#Eval("UserID") %>"></td>
          <td height="24" align="center"><%#Eval("UserName")%></td>
          <td height="24" align="center"><%#GetUserTruename(Eval("UserID").ToString())%> </td>
          <td height="24" align="center"> <%#CallName(Eval("StructureID").ToString())%></td>
          <td height="24" align="center"><%#GetUserMobile(Eval("UserID").ToString())%> </td> 
          <td height="24" align="center"><%#Eval("Email")%></td>
          <td height="24" align="center"><a href='/manage/User/UserInfo.aspx?id=<%#Eval("UserID") %>' >浏览</a> <asp:LinkButton ID="del_btn" runat="server" CommandArgument='<%#Eval("Userid") %>' CommandName="Del"></asp:LinkButton><a href="AddConstPassen.aspx?UserID=<%#Eval("UserID") %>">排除</a></td>
        </tr>
</ItemTemplate>
    </asp:Repeater>
 <tr class="tdbg">
      <td height="24" colspan="7" align="center" class="tdbgleft"> 共
        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
        条信息
        <asp:Label ID="Toppage" runat="server" Text="" />
        <asp:Label ID="Nextpage" runat="server" Text="" />
        <asp:Label ID="Downpage" runat="server" Text="" />
        <asp:Label ID="Endpage" runat="server" Text="" />
        页次：
        <asp:Label ID="Nowpage" runat="server" Text="" />
        /
        <asp:Label ID="PageSize" runat="server" Text="" />
        页 <span style="text-align: center">
        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" ontextchanged="txtPage_TextChanged"></asp:TextBox>
        </span>条信息/页  转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        页 </td>
    </tr>
    <tr>
      <td height="24" colspan="7"> 
   <asp:Button ID="Button1"  class="C_input" Font-Size="9pt"  Text="批量排除" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('不可恢复性数据,你确定将该成员从此结构中排除吗？');}" onclick="Button1_Click" /></td>
    </tr>
  </table>
    </div>
    </form>
</body>
</html>
