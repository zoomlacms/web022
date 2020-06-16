<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_OrderSql, App_Web_1lmqzdkx" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>账单申请</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
         <table class="table table-striped table-bordered table-hover">
            <tr  class="tdbg">
                <td class="title" height="24" align="center">ID </td>
                <td class="title" height="24" align="center">帐单类型</td>
                <td class="title" height="24" align="center">会员名</td>
                <td class="title" height="24" align="center">提交金额 </td>
                <td class="title" height="24" align="center">返分会员名</td>
                <td class="title" height="24" align="center">备注 </td>
                <td class="title" height="24" align="center">状态</td>
                <td class="title" height="24" align="center">执行次数</td>
                <td class="title" height="24" align="center">提交时间 </td>
                <td class="title" height="24" align="center">操作</td>
            </tr>
           <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemBind">
                 <ItemTemplate>
 <tr class="tdbg" id="<%#Eval("id") %>" ondblclick="getinfo(this.id)" > 
     <td > <%#Eval("ID")%> </td>
      <td ><a href="OrderSql.aspx?Type=<%#Eval("OrderType")%>"> <%#getOrderType(Eval("OrderType","{0}"))%></a>  </td>
                <td > <%#getUserName(Convert.ToInt32(Eval("UserName")))%> </td>
                <td> <%#Eval("money","{0:N2}")%></td>
                <td > <%#getUserName(Convert.ToInt32(Eval("PuserID")))%> </td>
                <td style="padding-left:5px;text-align:left;"> <%#Eval("remark")%></td>
                <td> <%#getStatus(Eval("status","{0}"))%> | <%#getPayStatus(Eval("PayState","{0}"))%> | <%#getRunStatus(Eval("SqlState","{0}"))%></td> 
                <td> <%#Eval("RunNum")%></td>
                <td>  <%#Eval("AddTime")%></td>
     <td><a href="EditOrderSql.aspx?ID=<%#Eval("id") %>">查看</a> | <asp:LinkButton ID="StatBtn" runat="server" CommandName='Status' Text='<%#getStabtn(Eval("status","{0}"))%>'  CommandArgument='<%#Eval("ID") %>' ><span style='color:red'></span></asp:LinkButton>  |  <asp:LinkButton ID="PayBtn" runat="server" Text='<%#getPaybtn(Eval("PayState","{0}"))%>'  CommandName="pay"  CommandArgument='<%#Eval("ID") %>'>  </asp:LinkButton>  | <asp:LinkButton ID="runBtn" runat="server" Text='执行' CommandName="Run"  CommandArgument='<%#Eval("ID") %>'> 执行批处理 </asp:LinkButton> | <asp:LinkButton ID="LinkButton1" runat="server" Text='生成' CommandName="save"  CommandArgument='<%#Eval("ID") %>'>生成脚本文件 | </asp:LinkButton><asp:LinkButton ID="save_btn" runat="server" Text='下载' CommandName="save1"  CommandArgument='<%#Eval("ID") %>'>下载数据库脚本 </asp:LinkButton> | <asp:LinkButton ID="Del_btn" runat="server" CommandName='Del' Text='删除'  CommandArgument='<%#Eval("ID") %>' ></asp:LinkButton> </td>
            </tr>
                 </ItemTemplate>
           </asp:Repeater>
             <tr class="tdbg"><td height="24" align="center" class="tdbgleft" colSpan="13">
                 共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条记录
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />
                    /
                    <asp:Label ID="PageSize" runat="server" Text="" />
                    页
                  <asp:Label ID="txtPage" runat="server" Text="" />
                    条记录/页 转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    页
                              </td></tr>
        </table> 
        <div class="clear"></div>
        <div id="RunOK" runat="server"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function getinfo(id) {
            location.href = 'EditOrderSql.aspx?ID=' + id;}
    </script>
</asp:Content>


    
