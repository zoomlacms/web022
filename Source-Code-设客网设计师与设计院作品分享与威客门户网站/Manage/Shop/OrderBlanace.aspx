<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_OrderBlanace, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商品结算</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <div class="divline">&nbsp;&nbsp;
        <asp:Label ID="lblli" runat="server" Text="显示已结算"></asp:Label>
        <asp:Label ID="lblNO" runat="server" Text="显示未结算"></asp:Label>
        </div><asp:HiddenField ID="hfid" runat="server" />
        <table  class="table table-striped table-bordered table-hover">
            <tr class="title">
                <td width="3%" height="28" align="center">
                    <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
                </td>
                <td width="3%" height="28" align="center">推广人</td>
                <td width="5%" height="28" align="center">总计售出商品（件)</td>
                <td width="5%" height="28" align="center">总价</td>
                <td width="5%" height="28" align="center">操作</td>
            </tr>
            <asp:Repeater ID="repArticlePromotion" runat="server" >
                <ItemTemplate>
                    
                    <tr>
                        <td height="24" align="center">
                            <%#getIsBalanceCheckBox(ZoomLa.Common.DataConverter.CBool(Eval("IsBalance").ToString()), ZoomLa.Common.DataConverter.CLng(Eval("cartproid").ToString()), ZoomLa.Common.DataConverter.CBool(Eval("isEnable").ToString()))%>
                        </td>
                        <td width="3%" align="center"><%#getUserNameById(ZoomLa.Common.DataConverter.CLng(Eval("PromotionUserId").ToString()))%></td>
                        <td width="3%" align="center"><%#Getprope(Eval("CartProId", "{0}"))%></td>
                        <td width="3%" align="center"><%#GetMoney(Eval("CartProId", "{0}"))%></td>
                        <td align="center">                        
                              <%#ZoomLa.Common.DataConverter.CBool(Eval("IsBalance").ToString()) ? "" : "<a style=\"color: blue;\" href='javascript:void(0)' onclick=\"opentitle('Balance.aspx?id=" + Eval("ID").ToString() + "','查看会员')\" >结算</a>  "%>
                              <%#ZoomLa.Common.DataConverter.CBool(Eval("IsBalance").ToString()) ? "<a style=\"color: #999999;\" >结算</a> " : ""%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td height="22" colspan="5" style="position:relative;" align="center" class="tdbgleft">
               共
                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条记录
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                    Text="" />页  <asp:TextBox ID="txtPage" runat="server"  AutoPostBack="true" class="l_input" Width="16px" Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
               条记录/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                页
                <div id="divBack" style="float:left;text-align:right;display:none;">
                    <input type="button" value="返回" style="right:5px;bottom:-2px;" class="btn btn-primary" onclick="history.go(-1)" />
                </div>
            </td>
            </tr>
        </table>
                <asp:Button ID="Button2"  runat="server"  Text="批量结算" title="结算所有未结算订单" class="btn btn-primary" onclick="Button2_Click" />
                <input type="button"   value="返回" title="返回上一页" class="btn btn-primary" onclick="javascript: location.href = 'PromotionBalance.aspx';" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
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
            function opentitle(url, title) {
                var diag = new Dialog();
                diag.Width = 600;
                diag.Height = 400;
                diag.Title = title;
                diag.URL = url;
                diag.show();
            }
    </script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
</asp:Content>