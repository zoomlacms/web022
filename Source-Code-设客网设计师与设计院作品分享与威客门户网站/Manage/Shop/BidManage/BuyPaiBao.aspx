<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_BidManage_BuyPaiBao, App_Web_g0x3iq3z" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>宝点套餐</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <div class="clearbox">
        </div>
        <table id="EGV" width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover" style="margin: 0 auto;">
            <tr align="center" class="title" style="height:26px">
                <th width="10%">套餐ID </th>
                <th width="15%">套餐名称</th>
                <th width="15%">显示图片</th>
                <th width="15%">兑换比例<br />(金钱/宝点)</th>
                <th width="10%">赠送玩点</th>
                <th width="25%">套餐说明</th>
                <th width="10%">操作</th>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td height="22" align="center" class="buyid"> <%# Eval("id")%></td>
                        <td height="22" align="center"><%#Eval("Tname")%></td>
                        <td height="22" align="center"><img src="<%=uploadDir %><%# Eval("Timg") %>" width="32" /></td>
                        <td height="22" align="center"><%#Eval("Tform")%>/<%#Eval("Ito")%></td>
                        <td height="22" align="center"><%#Eval("point")%></td>
                        <td height="22" align="center"><%#Eval("Tinfo")%></td>
                        <td height="22" align="center">
                            <a class="option_style" href="AddPaibao.aspx?menu=edit&id=<%#Eval("id") %>"><i class="glyphicon glyphicon-pencil" title="修改"></i></a>&nbsp;<a
                                class="option_style" href="?menu=del&id=<%#Eval("id") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"><i class="glyphicon glyphicon-trash" title="删除"></i></a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
             <tr class="tdbg">
                <td class="tdbgleft" colspan="7" align="center">共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条信息  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>条信息/页  转到第<asp:DropDownList 
                        ID="DropDownList1" runat="server" AutoPostBack="True">
              </asp:DropDownList>页
                </td>
            </tr>
        </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
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
        HideColumn("0,2,5");
        $().ready(function () {
            $("#EGV tr").dblclick(function () {
                var id = $(this).find(".buyid").text();
                if (id) {
                    location = "AddPaibao.aspx?menu=edit&id="+id;
                }
            });
        });
    </script>
</asp:Content>
    
  
  