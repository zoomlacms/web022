<%@ page language="C#" autoeventwireup="true" inherits="User_Magazine_AddMagazine, App_Web_npolburt" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>我的电子杂志</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <span>
                    <asp:DropDownList runat="server" ID="DR_Find" AutoPostBack="true" class="l_input">
                        <asp:ListItem Value="杂志名称">杂志名称</asp:ListItem>
                        <asp:ListItem Value="杂志类别">杂志类别</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <div class="input-group nav_searchDiv">
                    <asp:TextBox runat="server" ID="TxtMagName" class="form-control" placeholder="请输入需要搜索的内容" />
                    <span class="input-group-btn">
                        <asp:LinkButton runat="server" CssClass="btn btn-default" ID="BntSearch" OnClick="BntSearch_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </td>
        </tr>
    </table>
<table class="table table-striped table-bordered table-hover">
   
    <tr class="tdbg">  
    <td> 
 <%=con%>
<div class="divbox" id="nocontent" runat="server"> 暂无电子杂志</div>
  <div class="user_t">
    <ZL:ExGridView ID="EGV" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="Lnk_Click" CssClass="border" AllowSorting="true" OnRowDataBound="GridView1_RowDataBound">
      <Columns>
      <asp:TemplateField HeaderText="选择">
        <ItemTemplate>
          <asp:CheckBox ID="chkSel" runat="server" />
        </ItemTemplate>
        <ItemStyle Width="5%" HorizontalAlign="Center" />
      </asp:TemplateField>
      <asp:BoundField DataField="ID" HeaderText="序号">
        <ItemStyle Width="5%" HorizontalAlign="Center" />
      </asp:BoundField>
      
      <asp:TemplateField HeaderText="杂志名称">
        <ItemTemplate> <a href="/SlPage.aspx?Content=UserID=<%#Eval("UserID")%>|MagazineName=<%#Eval("MagName")%>&id=<%#Eval("Id")%>&Num=<%# GetNum((int)Eval("Id"))%>" title='<%# Eval("MagName")%>' target="_blank"> <%# Eval("MagName")%></a> </ItemTemplate>
        <ItemStyle Width="10%" HorizontalAlign="Center" />
      </asp:TemplateField>
        <asp:TemplateField HeaderText="所属用户">
        <ItemTemplate>  <a href="AddMagazine.aspx?UID=<%#Eval("UserID")%>"><%# GetUser((int)Eval("UserID"))%> </a> </ItemTemplate>
        <ItemStyle Width="5%" HorizontalAlign="Center" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="杂志类别">
      <ItemTemplate ><%#Eval("Magclass")%></ItemTemplate>
      <ItemStyle Width="5%" HorizontalAlign="Center" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="是否开放">
        <HeaderStyle Width="7%" />
        <ItemTemplate>  <%# Getopen(Eval("IsOpen","{0}")) %> </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="创建时间">
        <ItemTemplate> <%#Eval("CreatTime")%> </ItemTemplate>
        <ItemStyle Width="7%" HorizontalAlign="Center" />
      </asp:TemplateField> 
      <asp:TemplateField HeaderText="操作">
        <ItemTemplate>
          <asp:LinkButton ID="LinkButton2" runat="server" CommandName="View" CommandArgument='<%# Eval("ID") %>' >浏览</asp:LinkButton>
           |
          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>修改</asp:LinkButton>
          |
          <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" OnClientClick="return confirm('确定要删除此杂志吗？');" CommandArgument='<%# Eval("ID") %>'>删除</asp:LinkButton>
           </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="20%" />
      </asp:TemplateField>
      </Columns>
      <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
      <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
      <PagerStyle ForeColor="#030E0E" HorizontalAlign="Center" />
      <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="" PreviousPageText="" Visible="False" />
      <HeaderStyle Font-Bold="True" ForeColor="#030E0E" BorderStyle="None" Height="30px" Font-Overline="False" CssClass="tdbg" />
      <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"  NextPageText="下一页" PreviousPageText="上一页" />
    </ZL:ExGridView>
  </div>
  <div style="text-align: center" class="tdbg" id="pages" runat="server"> <span style="text-align: center">共
    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
    条数据
    <asp:Label ID="Toppage" runat="server" Text="" />
    <asp:Label ID="Nextpage" runat="server" Text="" />
    <asp:Label ID="Downpage" runat="server" Text="" />
    <asp:Label ID="Endpage" runat="server" Text="" />
    页次：
    <asp:Label ID="Nowpage" runat="server" Text="" />
    /
    <asp:Label ID="PageSize" runat="server" Text="" />
    页
    <asp:Label ID="pagess" runat="server" Text="" />
    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
    条数据/页 转到第
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"> </asp:DropDownList>
    页
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
    </span></div>
  <div class="clearbox"> </div>
  <asp:CheckBox ID="CheckSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="CheckSelectAll_CheckedChanged" Text="全选" />
  &nbsp;
  <asp:Button ID="btndelete" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择杂志');return false;}else{return confirm('你确定要删除选中的杂志吗？')}" Text="删除选定杂志" OnClick="btndelete_Click" class="btn btn-primary" />
  &nbsp;
  <asp:DataList runat="server" ID="DL_MagaPic" RepeatColumns="4" >
    <ItemTemplate >&nbsp;&nbsp;&nbsp;&nbsp;
            <table>
            <tr><th></th></tr>
            <tr><td align="center"> 
             <a href="MagazContent.aspx?id=<%#Eval("id") %>">
            <image style=" width:100px; height:100px;" src='<%#GetPic(Eval("MagPic").ToString())%>' ></image>&nbsp;&nbsp;&nbsp;&nbsp;</a><br /></td> </tr>
    <tr><td align="center"> <a href="MagazContent.aspx?id=<%#Eval("id") %>"><%#Eval("MagName") %>&nbsp;</a></td></tr>
    </table> &nbsp;&nbsp;
    </ItemTemplate>
  </asp:DataList>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>