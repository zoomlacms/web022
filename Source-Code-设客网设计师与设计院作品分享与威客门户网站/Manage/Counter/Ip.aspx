<%@ page language="C#" autoeventwireup="true" inherits="manage_Counter_Ip, App_Web_p0ir121w" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>总访问报表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
		<tr class="title_link">
           <td><a style="float: right;" href="counter.aspx">[返回]</a>访客累计：<%=allcount%>  </td>
            </tr>
        </table>
                          <%  if (allcount == 0) { %>
                          <div style="text-align:center;">没有任何数据</div>
                                    <% } else {%>
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr align="center" bgcolor="#e2e9ff" class="tdbg">
                                            <td width="10%">
                                                记录号
                                            </td>
                                            <td width="10%">访问者IP </td>
                                            <td width="10%">所在地</td>
                                            <td width="15%"> 访问日期</td>
                                            <td width="30%"> 引用页 </td>
                                            <td width="30%">  来源 </td>
                                        </tr>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr  bgcolor="#ffffff">
                                                    <td align="center">
                                                        <%# DataBinder.Eval(Container.DataItem,"CountId") %>&nbsp;
                                                    </td>
                                                    <td align="center">
                                                        <%# DataBinder.Eval(Container.DataItem,"CountIp") %>&nbsp;
                                                    </td>
                                                    <td align="center">
                                                        <%# DataBinder.Eval(Container.DataItem,"CountCountry") %>
                                                    </td>
                                                    <td align="center">
                                                        <%# DataBinder.Eval(Container.DataItem,"CountLogtime") %>
                                                    </td>
                                                    <td align="center">
                                                        <%# DataBinder.Eval(Container.DataItem,"CountSource") %>
                                                    </td>
                                                    <td align="center">
                                                        <a href="#" title="<%# DataBinder.Eval(Container.DataItem,"CountReferer") %>">
                                                            <%# DataBinder.Eval(Container.DataItem,"CountReferer") %>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr class="tdbg">
                                            <td align="center" class="tdbg" style="height: 24px;" colspan="8">
                                                共
                                                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                                                条信息
                                                <asp:Label ID="Toppage" runat="server" Text="" />
                                                <asp:Label ID="Nextpage" runat="server" Text="" />
                                                <asp:Label ID="Downpage" runat="server" Text="" />
                                                <asp:Label ID="Endpage" runat="server" Text="" />
                                                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                                                    Text="" />页
                                                <asp:Label ID="pagess" runat="server" Text="" />10条信息/页 转到第
                                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                页
                                            </td>
                                        </tr>
                                    </table>

                                    <%}%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>