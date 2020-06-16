<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_BidManage_ShowBuyer, App_Web_g0x3iq3z" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>购买者列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>
    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
    <div class="divbox" id="nocontent" runat="server" style="width :100%">暂无购买记录</div>     
    <div id="cont" runat="server">
    <table width="100%" cellpadding="2" cellspacing="1" style="background-color: white;" class="table table-striped table-bordered table-hover">
    <tr class="tdbg">
        <td align="center" class="title" width="5%">选择</td>
        <td align="center" class="title" width="5%">竞拍ID</td>
        <td align="center" class="title" width="5%">商品ID</td>
        <td align="center" class="title" width="10%">商品名称</td>
        <td align="center" class="title" width="9%">价格</td>
        <td align="center" class="title" width="7%">出价者</td>
        <td align="center" class="title" width="17%">操作</td>
    </tr>
    <asp:Repeater ID="repter" runat="server" onitemcommand="repter_ItemCommand" onitemdatabound="repter_ItemDataBound">
        <ItemTemplate>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td align="center"><asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("ID") %>' /> <asp:CheckBox ID="chkSel" runat="server" /></td>
                <td align="center"><asp:Label ID="lblUserid" runat="server" Text='<%#Eval("AuctionID") %>' ></asp:Label></td>
                <td align="center"><asp:Label ID="Label1" runat="server" Text='<%#Eval("ShopID") %>' ></asp:Label></td>
                <td align="center"><asp:Label ID="lblName" runat="server" Text='<%#GetName(Eval("ShopID","{0}") )%>' ></asp:Label></td>
                <td align="center"><asp:Label ID="CardID" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price", "{0:N2}") %>'></asp:Label></td>             
                <td align="center"><asp:Label ID="Label3" runat="server" Text='<%#GetAdminName(Eval("UserID","{0}")) %>'></asp:Label></td>
                <td align="center"><asp:LinkButton ID="del" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del">删除</asp:LinkButton></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr class="tdbg"> 
        <td colspan="7">
            <div class="tdbg">
                <span>
                    <asp:CheckBox ID="CheckSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="CheckSelectAll_CheckedChanged"
                        Text="全选" />
                    <asp:Button ID="BtnDelete" runat="server" class="btn btn-primary" OnClick="BtnDelete_Click"
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
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="form-control" Width="16px"
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

    
   

   
