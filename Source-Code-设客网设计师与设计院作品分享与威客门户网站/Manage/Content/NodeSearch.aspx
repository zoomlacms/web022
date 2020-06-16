<%@ page language="C#" autoeventwireup="true" inherits="Manage_Content_NodeSearch, App_Web_ckin0fxz" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>节点搜索</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
	<tr class="gridtitle" align="center" style="height: 25px;"> 
		<td style="width: 3%; text-align: center;"><strong>ID</strong></td>
		<td style="width: 15%;"><strong>节点名称</strong></td>
		<td style="width: 10%; height: 20px;"><strong>节点类型</strong></td>                
        <td style="width: 25%; height: 20px;"><strong>绑定模型</strong></td>
        <td style="width: 20%; height: 20px;"><strong>节点模板</strong></td>
	</tr>
    <ZL:Repeater runat="server" ID="RPT" PageSize="10" PagePre="<tr class='hidden'><td></td><td colspan='12'><div class='text-center'>" PageEnd="</div></td></tr>">
        <ItemTemplate>
            <tr>
                 <td><%#Eval("NodeID") %></td>
                <td><a href="ContentManage.aspx?NodeID=<%#Eval("NodeID") %>"><span class="<%# GetIconPath(Convert.ToInt32(Eval("NodeID")))%> " title='浏览内容管理'></span></a>
                    <a href="EditNode.aspx?NodeID=<%#Eval("NodeID") %> "><%#Eval("NodeName") %></a></td>
                <td><%# GetNodeType(DataBinder.Eval(Container, "DataItem.NodeType", "{0}"))%></td>
                <td><%# GetTemplate(Convert.ToInt32(Eval("NodeID")))%></td>
                <td><a href="/Admin/Template/TemplateEdit.aspx?filepath=/<%# GetTemplateurl(Convert.ToInt32(Eval("NodeID")))%>"><%# GetTempName(Convert.ToInt32(Eval("NodeID")))%></a></td>                
            </tr>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:Repeater>
</table>  
</asp:Content>
