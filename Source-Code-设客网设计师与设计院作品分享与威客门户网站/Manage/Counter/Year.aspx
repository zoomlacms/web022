<%@ page language="C#" autoeventwireup="true" inherits="manage_Counter_Year, App_Web_p0ir121w" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>月统计报表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
            <tr class="title_link">
                <td class="title" style="height: 22px" colspan="2" align="center">
                 <a style="float:right;" href="counter.aspx">[返回]</a>
                    统计年份：<%=Cyear%>
                        本年累计：<%=SumCount%>
                   [<a href="year.aspx">当前年</a>] [<a href="year.aspx?step=1">前一年</a>] [<a href="year.aspx?step=2">前两年</a>]
                   
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;height:100%;" width="100%">
                    <div align="center">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td style="vertical-align: top;height:100%;" align="center" bgcolor="#ffffff" height="100%">
                                    <% 
                                        if (pmonth == 0)
                                        {%>
                                    <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <div align="center">
                                                    没有任何数据</div>
                                            </td>
                                        </tr>
                                    </table>
                                    <%			}
                                        else
                                        {
                                    %><div class="user_t">
                                    <table  cellspacing="1" cellpadding="2" width="100%" class="border" align="center"
                                       border="0">
                                        <tr align="center" bgcolor="#e2e9ff">
                                            <td width="20%">
                                                月份
                                            </td>
                                            <td width="20%">
                                                访问量
                                            </td>
                                            <td >
                                                比例
                                            </td>
                                        </tr>
                                        <%
                                            for (int i = 1; i <= 12; i++)
                                            {		
                                        %>
                                        <tr  bgcolor="#ffffff">
                                            <td align="center">
                                                <% = i %>
                                                &nbsp;
                                            </td>
                                            <td align="center">
                                                <%=dsadmin.Tables[0].Rows[0][i].ToString()%>&nbsp;
                                            </td>
                                            <td class="divCall" id="tdPx<%=i %>"  title="访问量：<%=dsadmin.Tables[0].Rows[0][i].ToString() %>"
                                                style="text-align: left;">
                                                <div id="divPx<%=i %>" style='height: 10px;display:none;'>
                                                </div>
                                                <script type="text/javascript">
                                                <%
                                                    if (MaxCount == 0)
                                                    {
                                                        Response.Write("var leftPx" + i + "=0;");
                                                    }
                                                    else
                                                    {
                                                        LeftPx = Convert.ToInt32(250 * Convert.ToInt32(dsadmin.Tables[0].Rows[0][i].ToString()) / MaxCount);
                                                        Response.Write("var leftPx" + i + "="+"document.getElementById('tdPx"+i+"').offsetWidth*"+Convert.ToInt32(dsadmin.Tables[0].Rows[0][i].ToString())+"/"+MaxCount+";");
                                                        Response.Write("document.getElementById('divPx"+i+"').setAttribute('rel1',"+Convert.ToInt32(dsadmin.Tables[0].Rows[0][i].ToString())+");");
                                                        Response.Write("document.getElementById('divPx"+i+"').setAttribute('rel2',"+MaxCount+");");
                                                    }
                                                %>
                                                    document.getElementById("divPx<%=i %>").style.width = leftPx<%=i%> + 1;
                                                    
                                                </script>
                                            </td>
                                        </tr>
                                        <%}%>
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