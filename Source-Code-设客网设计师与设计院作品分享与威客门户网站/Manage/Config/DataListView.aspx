<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_DataListView, App_Web_wtoe0kjd" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>表信息</title>
</head>
<body>

    <form id="form1" runat="server">
    <div class="r_navigation">
  后台管理&gt;&gt;扩展功能&gt;&gt;<a href="RunSql.aspx">开发中心</a>&gt;&gt;<a href="DatalistProfile.aspx">系统全库概况</a>&gt;&gt; <label id="labtit" runat="server">表结构</label>   <span class="red"> [<a href="DatabaseProfile.aspx">运行库概况</a>]</span>
     <a href="EditDataList.aspx?ID=<%=Request.QueryString["ID"] %>" target="_self">[修改]</a>
        <%if (string.IsNullOrEmpty(Request.QueryString["type"])) {%>
            <a href="DataListView.aspx?ID=<%=Request.QueryString["ID"] %>&type=data" target="_self" >[表数据]</a>
      <% }else{ %>
            <a href="DataListView.aspx?ID=<%=Request.QueryString["ID"] %>" target="_self" >[表结构]</a>
        <%} %>
</div>
    <div>
   <Label ID="RunOK" runat="server"></Label> 
    </div>
    </form>
</body>
</html>
