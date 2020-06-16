<%@ page language="C#" autoeventwireup="true" inherits="manage_Page_SheetStyleManage, App_Web_qc5jcwta" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>标签管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr>
        <td>
            <span>
                <a href="SheetStyleManage.aspx?classes=1">所有商品</a>
                <a href="SheetStyleManage.aspx?classes=2">付费标签</a>
                <a href="SheetStyleManage.aspx?classes=3">免费标签</a></span>
            <span>快速查找：
                    <asp:DropDownList ID="quicksouch" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="quicksouch_SelectedIndexChanged" CssClass="form-control">
                        <asp:ListItem Value="1">所有商品</asp:ListItem>
                        <asp:ListItem Value="2">付费标签</asp:ListItem>
                        <asp:ListItem Value="3">免费标签</asp:ListItem>
                    </asp:DropDownList></span>
            <span>
                 <b>商品操作：</b><asp:Label ID="lblAddContent" runat="server" Text=""></asp:Label>
            </span>
            <span>
                <asp:DropDownList ID="souchtable" runat="server"  CssClass="form-control">
                    <asp:ListItem Value="0">请选择</asp:ListItem>
                    <asp:ListItem Value="1" Selected="True">商品名称</asp:ListItem>
                    <asp:ListItem Value="2">标签名字</asp:ListItem>
                    <asp:ListItem Value="3">标签价格</asp:ListItem>
                </asp:DropDownList>
            </span>
            <div class="input-group nav_searchDiv">
                <asp:TextBox runat="server" ID="souchkey" class="form-control" placeholder="请输入需要搜索的内容" />
                <span class="input-group-btn">
                    <asp:LinkButton runat="server" CssClass="btn btn-default" ID="souchok" OnClick="souchok_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                </span>
            </div>
        </td>
    </tr>
</table>
<table  class="table table-striped table-bordered table-hover">
  <tbody id="Tbody1">

    <tr class="tdbg">
      <td align="center" class="title" width="10%" align="center" class="title"><span class="tdbgleft">样式ID</span></td>
      <td width="20%" align="center" class="title"><span class="tdbgleft">标签标题(别名)</span></td>
      <td width="30%" align="center" class="title"><span class="tdbgleft">标签名</span></td>
      <td width="15%" align="center" class="title"><span class="tdbgleft">价格</span></td>
      <td width="15%" align="center" class="title"><span class="tdbgleft">缩略图</span></td>
      <td width="20%" align="center" class="title"><span style="background-color: #e0f7e5">相关操作</span></td>
    </tr>
    <asp:Repeater ID="Styleable" runat="server">
    <ItemTemplate>
    <tr class="tdbg" id="<%#Eval("ID")%>" ondblclick="getinfo(this.id)" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td height="24" align="center"><%#Eval("ID")%></td>
      <td height="24" align="center"><%#Eval("Alias")%></td>
      <td height="24" align="center"><%#Eval("Lname")%></td>
      <td height="24" align="center"><%#Eval("Price")%>元</td>
      <td height="24" align="center"><img src="<%# "\\UploadFiles\\"+Eval("Img")%>" width="60" height="60" /></td>
      <td height="24" align="center"><a href="AddSheetStyle.aspx?menu=edit&sid=<%#Eval("id") %>">修改</a>　<a href="?menu=del&id=<%#Eval("id") %>" OnClick="return confirm('确实要删除此样式吗？');">删除</a></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
    <tr class="tdbg">
      <td height="24" colspan="6" align="center" class="tdbgleft">共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条信息  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  
    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged"
            Width="30px"></asp:TextBox>条信息/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
          </asp:DropDownList>页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
          </td>
    </tr>
  </tbody>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function getinfo(id) {
            location.href = "AddSheetStyle.aspx?menu=edit&sid=" + id + "";
        }
</script>
</asp:Content>

