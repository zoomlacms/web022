<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.WebSite.Manage.Page.UserModelManage, App_Web_qc5jcwta" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
      <title>申请设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table  class="table table-striped table-bordered table-hover">
    <tbody>
        <tr class="gridtitle" align="center" style="height:25px; text-align:center;">
            <td width="5%" height="24">
                <strong>ID</strong></td>                
            <td width="25%">
                <strong>模型名称</strong></td>
            <td width="25%">
                <strong>表名</strong></td>  
            <td width="25%">
                <strong>模型描述</strong></td>                      
            <td width="20%">
                <strong>操作</strong></td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <tr class="tdbg" align="center"  id="<%# Eval("ModelID") %>" ondblclick="getinfo(this.id)">                        
                    <td align="center" height="24">
                        <%# Eval("ModelID") %></td>                        
                    <td align="center">
                        <%# Eval("ModelName")%></td>                                             
                    <td align="center">
                        <%# Eval("TableName")%></td> 
                    <td align="center">
                        <%# Eval("Description")%></td>                         
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" class="option_style" CommandName="Edit" CommandArgument='<%# Eval("ModelID") %>'><span class="glyphicon glyphicon-pencil" title="修改"></span></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" class="option_style" runat="server" CommandName="Field" ToolTip="字段列表" CommandArgument='<%# Eval("ModelID") %>'><i class="glyphicon glyphicon-th-list"></i></asp:LinkButton>                            
                        <%#showdelbotton(DataBinder.Eval(Container,"DataItem.ModelID","{0}"))%>
                        </td>
                </tr>
            </ItemTemplate>
         </asp:Repeater>                        
    </tbody>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        function getinfo(id) {
            location.href = "UserModel.aspx?ModelID=" + id + "";
        }
</script>
</asp:Content>