<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_ClassManage, App_Web_tbedsbxg" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>添加班级</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
        <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/">逐浪CMS</a></li>
        <li><a href="/User/">用户中心</a></li>
        <li class="active">班级管理 [<a href="AddClass.aspx">添加班级</a>]</li>
        </ol>
</div>
    <div class="container btn_green">
        <table class="table table-striped table-bordered table-hover" id="EGV">
        <tr align="center" class="title">
            <td width="2%">
                
            </td>
            <td width="10%">班级名称</td>
            <td width="8%">负责人</td>
            <td width="10%">课程名称</td>
            <td width="8%">班级类别</td>
            <td width="6%">售价</td>
            <td width="6%">优惠价</td>
            <td width="8%">是否赠送</td>
            <td width="13%">建立时间</td>
            <td width="13%">结束时间</td>
            <td width="12%" class="title">操作</td>
        </tr>
        <ZL:ExRepeater ID="Repeater1" PageSize="10" runat="server" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='10'><div class='text-center'>" PageEnd="</div></td></tr>">
            <ItemTemplate>
                <tr id="<%#Eval("GroupID") %>" ondblclick="ShowTabs(this.id)">
                    <td height="22" align="center">
                        <input name="Item" type="checkbox" value='<%#Eval("GroupID") %>' />
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Regulationame")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Regulation")%>
                    </td>
                       <td height="22" align="center">
                        <%#GetCourseName(Eval("CourseID","{0}"))%>
                    </td>                    
                       <td align="center">
                        <%#GetClassName(Eval("ClassID","{0}"))%>
                       </td>
                      <td height="22" align="center">
                       <%#DataBinder.Eval(Container, "DataItem.ShiPrice", "{0:N2}")%>
                    </td>
                      <td height="22" align="center">
                      <%#DataBinder.Eval(Container, "DataItem.LinPrice", "{0:N2}")%>
                    </td>
                      <td height="22" align="center">
                        <%#GetPresented(Eval("Presented","{0}"))%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Setuptime")%>
                    </td>
                    <td height="22" align="center">
                        <%#Eval("Endtime")%>
                    </td>
                    <td height="22" align="center">
                        <a href="AddClass.aspx?cid=<%#Eval("GroupID")%>">修改</a> 
                        <a href="?menu=delete&cid=<%#Eval("GroupID")%>" OnClick="return confirm('确实要删除此学员吗？');">删除</a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
        
    </table>
        <asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" Text="批量删除" onclick="Button3_Click" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $().ready(function () {
            $("#chkAll").click(function () {
                $("[name='Item']").each(function (i, v) {
                    $(v)[0].checked = $("#chkAll")[0].checked;
                });
            });
        });
        HideColumn("4,5,6,7,8");
    </script>
</asp:Content>