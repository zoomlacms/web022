<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_BidComplete_Manage, App_Web_g0x3iq3z" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>竞拍商品管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>
    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">      
<asp:Label ID="Label1" runat="server"></asp:Label>
<div class="divbox" id="nocontent" runat="server" style="display: none;width:100%">暂无竞拍商品</div>
<table width="100%" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover" style="background-color: white;">
    <tr class="tdbg">
        <td width="34%" height="24" align="center" class="tdbgleft">
            快速查找：
            <asp:DropDownList ID="quicksouch" runat="server" AutoPostBack="True" 
                onselectedindexchanged="quicksouch_SelectedIndexChanged">
                <asp:ListItem Value="0" Selected="True">请选择</asp:ListItem>
                <asp:ListItem Value="1">正在竞拍</asp:ListItem>
                <asp:ListItem Value="2">结束竞拍</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td width="66%" class="tdbgleft">
          <table style="float:left;margin-left:15%"><tr>
              <td>
            商品名称：</td></tr></table>
            <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;float:left;margin-left:10px;" class="l_input"><tr >
           <td> <asp:TextBox ID="souchkey" runat="server" class="form-control pull-left"/></td>
           <td> <asp:Button ID="souchok" runat="server" Text="搜索" class="btn btn-primary pull-left"  OnClick="souchok_Click" /></td>
                </tr></table>
        </td>
    </tr>
</table>
<div class="clearbox"> </div>
<div class="divline" style="padding-left: 10px"><b>可添加商品：</b><asp:Label ID="lblAddContent" runat="server" Text=""></asp:Label></div>
<div class="clearbox"></div>
<div class="divline"><asp:Button ID="btn" runat="server" Text="数据升级" 
        class="btn btn-primary" onclick="btn_Click"/></div>
<div class="clearbox"></div>
<div id="cont" runat="server">
<table width="100%" cellpadding="2" cellspacing="1" style="background-color: white;">
    <tr class="tdbg">
        <td align="center" class="title" width="5%">选择</td>
        <td align="center" class="title" width="5%">竞拍ID</td>
        <td align="center" class="title" width="5%">商品ID</td>
        <td align="center" class="title" width="10%">商品名称</td>
        <td align="center" class="title" width="7%">商品数量</td>
        <td align="center" class="title" width="9%">消耗宝点数量</td>
        <td align="center" class="title" width="9%">价格增加</td>
        <td align="center" class="title" width="9%">反弹秒数</td>
        <td align="center" class="title" width="9%">竞价机制</td>
        <td align="center" class="title" width="7%">状态</td>
        <td align="center" class="title" width="17%">操作</td>
    </tr>
    <asp:Repeater ID="repter" runat="server" onitemcommand="repter_ItemCommand" onitemdatabound="repter_ItemDataBound">
        <ItemTemplate>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td align="center"><asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("ID") %>' /> <asp:CheckBox ID="chkSel" runat="server" /></td>
                <td align="center"><asp:Label ID="lblUserid" runat="server" Text='<%#Eval("ID") %>' ></asp:Label></td>
                <td align="center"><asp:Label ID="Label1" runat="server" Text='<%#Eval("ShopID") %>' ></asp:Label></td>
                <td align="center"><asp:Label ID="lblName" runat="server" Text='<%#GetName(Eval("ShopID","{0}") )%>' ></asp:Label></td>
                <td align="center"><asp:Label ID="lblTreName" runat="server" Text='<%#Eval("ShopNum") %>'></asp:Label></td>
            <%--    <td align="center"><asp:Label ID="Account" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PaulPrice", "{0:N2}")%>' ></asp:Label></td>--%>
                <td align="center"><asp:Label ID="Name" runat="server" Text='<%#Eval("DepVal") %>'></asp:Label></td>
                <td align="center"><asp:Label ID="CardID" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AddPrice", "{0:N2}") %>'></asp:Label></td>
                <td align="center"><asp:Label ID="lblState" runat="server" Text='<%#Eval("Timedown") %>' ></asp:Label></td>
                <td align="center"><asp:Label ID="Label2" runat="server" Text='<%#GetTypes(Eval("AucExecType","{0}")) %>' ></asp:Label></td>
                <td align="center"><asp:Label ID="Label4" runat="server" Text='<%#GetState(Eval("comState","{0}")) %>' ></asp:Label>
                        <asp:HiddenField ID="state" runat="server" Value='<%#Eval("comState") %>' /></td>
                <td align="center"><asp:LinkButton ID="btnUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("ID") %>'>修改</asp:LinkButton>
                <asp:LinkButton ID="del" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del">删除</asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="add" CommandArgument='<%#Eval("ID") %>'>添加为新拍品</asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr class="tdbg">
        <td colspan="11">
            <div class="tdbg">
                <span>
                    <asp:CheckBox ID="CheckSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="CheckSelectAll_CheckedChanged"
                        Text="全选" />
                    <asp:Button ID="BtnDelete" runat="server" class="C_input" OnClick="BtnDelete_Click"
                        OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}"
                        Text="批量删除选定内容" Width="134px" />
                </span>  <span style="text-align: center">
                共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:Label ID="pagess" runat="server" Text="" />
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                            Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox> 条数据/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                    </span>
            </div>
        </td>
    </tr>
</table>
</div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>