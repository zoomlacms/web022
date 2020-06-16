<%@ page language="C#" autoeventwireup="true" masterpagefile="~/User/Empty.master" inherits="User_Shopfee_DgouFreeSplit, App_Web_2mub5day" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>自由拆分</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody2">
            <tr class="tdbg">
            <td class="td_s">选择</td>
               <td width="10%" align="center" class="title">
                    图片
                </td>
                <td width="27%" align="center" class="title">
                    商品名称
                </td>
                <td width="15%" align="center" class="title">
                     来源
                </td>
                <td width="10%" align="center" class="title">
                     单价
                </td>
                <td width="10%" align="center" class="title">
                    数量
                </td>
                <td width="15%" align="center" class="title">
                    备注
                </td>
               
            </tr>
            <asp:Repeater ID="procart" runat="server" >
                <ItemTemplate>
                    <tr class="tdbg"
                        <%#(Eval("Bindpro","{0}")=="")?"":"style=background-color:#E6E6E6"%>>
                        <td width="5%" align="center"><input name="Item" type="checkbox" value='<%# Eval("ProID")%>' /></td>
                      <td align="center" width="10%">
                            <%#getproimg(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                        <td width="27%" align="center">
                           <a href='http://<%#Eval("Procontent") %>' target='_blank'> <%#Getprotype(Eval("ProID","{0}"))%>
                            <%#Eval("proname")%>
                            </a>
                        </td>
                        <td width="15%" align="center">
                            <%#Eval("ProSeller") %>
                        </td>
                        <td width="10%" align="center">
                           <%#Eval("shijia") %>
                        </td>
                        <td width="10%" align="center">
                            <%#Eval("pronum") %> 
                        </td>
                        <td width="15%" align="center">
                           <%#Eval("Proinfo")%>
                        </td>
                        
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr class="tdbg"
                                style="background-color: #F6F6F6;">
                                <td height="24" align="center">
                                    <%#getproimg(Eval("id","{0}"))%>
                                </td>
                                <td align="center">
                                    <%#Getprotype(DataBinder.Eval(Container, "DataItem.id", "{0}"))%><%#Eval("proname")%>
                                </td>
                                <td width="6%" align="center">
                                    <%#getProUnit(DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td width="6%" align="center">
                                    1
                                </td>
                                <td width="6%" align="center">
                                    <%#getjiage("1", DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td width="6%" align="center">
                                    <%#getjiage("2", DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td align="center">
                                    -
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
            </tbody>
            </table>
<div>是否保存原订单：<asp:RadioButton ID="CB_Yes" runat="server" GroupName="oldorder"  Text="是"  />
    <asp:RadioButton ID="CB_No" runat="server" GroupName="oldorder" Text="否" Checked="True" />
</div>
  <asp:Button Text="确定" ID="confirm" CssClass="btn btn-primary" runat="server" 
    onclick="confirm_Click" />
</asp:Content>
