<%@ page language="C#" autoeventwireup="true" inherits="manage_Counter_Browser, App_Web_p0ir121w" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>浏览器统计报表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
            <tr class="title_link">
                <td class="title" style="height: 22px" colspan="2" align="center">
                    <a style="float:right;" href="counter.aspx">[返回]</a>
                   浏览器累计:
                    <%=SumCount%>
                </td>
            </tr>
            <tr>
                <td width="100%" style="vertical-align: top;height:100%;">
                    <div align="center">
                        <table class="table">
                            <tr>
                                <td height="100%" align="center" valign="top" bgcolor="#ffffff">
                                    <% 
                                        if (pcount1 == 0)
                                        {
                                    %>
                                    <table class="table">
                                        <tr>
                                            <td>
                                                <div align="center">
                                                    没有任何数据</div>
                                            </td>
                                        </tr>
                                    </table>
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                    <div class="user_t">
                                    <table class="table">
                                        <tr align="center" bgcolor="#e2e9ff">
                                            <td width="15%">
                                                序号
                                            </td>
                                            <td width="15%">
                                                浏览器
                                            </td>
                                            <td width="15%">
                                                访问量
                                            </td>
                                            <td >
                                                比例
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr   bgcolor="#ffffff">
                                                    <td align="center">
                                                        <%# Container.ItemIndex+1%>&nbsp;
                                                    </td>
                                                    <td align="center">
                                                        <%# DataBinder.Eval(Container.DataItem,"Count_Browser") %>
                                                    </td>
                                                    <td align="center">
                                                        <%# DataBinder.Eval(Container.DataItem,"Count_Count") %>
                                                    </td>
                                                    <td class="divCall" id="tdPx<%# Container.ItemIndex+1%>" title="访问量：<%# DataBinder.Eval(Container.DataItem,"Count_Count") %>"
                                                        style="text-align: left;">
                                                        <div id="divPx<%# Container.ItemIndex+1%>" style='height: 10px; display:none;'>
                                                        </div>
                                                        <script type="text/javascript">
                                                <% 
                                                    if (MaxCount == 0)
                                                    {%>
                                                            var leftPx<%#Container.ItemIndex+1 %> + "=0;";
                                                   <% }
                                                    else
                                                    {%>
                                                            var leftPx<%#Container.ItemIndex+1 %>=document.getElementById('tdPx<%#Container.ItemIndex+1 %>').offsetWidth* <%# DataBinder.Eval(Container.DataItem,"Count_Count") %>/<%=MaxCount %>;
                                                            document.getElementById('divPx<%#Container.ItemIndex+1 %>').setAttribute('rel1',<%# DataBinder.Eval(Container.DataItem,"Count_Count") %>);
                                                        document.getElementById('divPx<%#Container.ItemIndex+1 %>').setAttribute('rel2',<%=MaxCount %>);
                                                    <%}
                                                %>
                                                            document.getElementById("divPx<%# Container.ItemIndex+1%>").style.width=leftPx<%# Container.ItemIndex+1%>+1;
                                                    
                                                        </script>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table></div>
                                    <%}%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Counter.js" type="text/javascript"></script>
</asp:Content>

