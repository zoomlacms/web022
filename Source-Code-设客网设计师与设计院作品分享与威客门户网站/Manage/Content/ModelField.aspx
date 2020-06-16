<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_ModelField, App_Web_ckin0fxz" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>字段列表</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div>
        <table id="FieldList" class="table table-striped table-bordered table-hover">
            <tr class="gridtitle text-center">
                <th class="td_m"><strong>字段名</strong></th>
                <th class="td_m"><strong>字段别名</strong></th>
                <th><strong>字段类型</strong></th>
                <th class="td_m"><strong>字段级别</strong></th>
                <th class="td_m"><strong>是否启用</strong></th>
                <th class="td_m"><strong>前端显示</strong></th>
                <th class="td_m"><strong>是否必填</strong></th>
                <th class="td_m"><strong>批量添加</strong></th>
                <th class="td_m"><strong>允许内链</strong></th>
                <th class="td_m"><strong>排序</strong></th>
                <th class="td_m"><strong>手动排序</strong></th>
                <th class="td_m"><strong>操作</strong></th>
            </tr>
            <asp:Repeater ID="rptSystemModel" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("FieldName")%></td>
                        <td align="center"><%#Eval("FieldAlias")%></td>
                        <td align="center"><%#Eval("FieldType", "{0}")%></td>
                        <td align="center"><span class="rd_green">系统</span></td>
                        <td align="center"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Repeater ID="rptModelField" runat="server" OnItemCommand="rptModelField_ItemCommand">
                <ItemTemplate>
                    <tr ondblclick="location.href='AddModelField.aspx?FieldID=<%# Eval("FieldID") %>&ModelID=<%# Eval("ModelID") %>&ModelType=<%=Request["ModelType"] %>'">
                        <td>
                            <%#Eval("IsShow", "{0}") == "False" ? "<font color=#999999>" :""%><%#Eval("FieldName")%><%#Eval("IsShow","{0}")=="False"?"</font>":"" %>
                        </td>
                        <td class="text-center"><%#Eval("FieldAlias")%></td>
                        <td class="text-center"><%#GetFieldType(Eval("FieldType", "{0}"))%></td>
                        <td class="text-center"><%#IsSysField()%></td>
                        <td class="text-center"><%#IsValid(Eval("IsCopy", "{0}"),"iscopy") %></td>
                        <td class="text-center"><%#IsValid(Eval("ShowList", "{0}")) %></td>
                        <td class="text-center"><%#IsValid(Eval("IsNotNull", "{0}")) %></td>
                        <td class="text-center"><%#IsValid(Eval("Islotsize", "{0}")) %></td>
                        <td class="text-center"><%#IsValid(Eval("IsChain", "{0}")) %></td>
                        <td class="text-center">
                            <asp:LinkButton ID="lbtnMove" runat="server" CssClass="option_style" CommandName="UpMove" CommandArgument='<%# Eval("FieldID") %>' Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '>↑上移 </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="option_style" CommandName="DownMove" CommandArgument='<%# Eval("FieldID") %>' Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '>下移↓</asp:LinkButton>
                        </td>
                        <td class="text-center">
                            <input type="text" class="text_x text-center" name="order" data-id="<%# Eval("FieldID") %>" data-old="<%#Eval("OrderID") %>" value="<%#Eval("OrderID") %>" />
                        </td>
                        <td class="text-center">
                            <a class="option_style" href="AddModelField.aspx?FieldID=<%# Eval("FieldID") %>&ModelID=<%# Eval("ModelID") %>&ModelType=<%=Request["ModelType"] %>"><i class="glyphicon glyphicon-pencil" title="修改"></i></a>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CssClass="option_style" CommandName="Delete" CommandArgument='<%# Eval("FieldID") %>' OnClientClick="return confirm('确定删除此字段吗?\r\n\r\n删除后请更新相应字段输出配置以确保应用')" Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '><i class="glyphicon glyphicon-trash"></i></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    <div class="clearbox"></div>
    <table class="border" style="width: 100%">
        <tr>
            <td style="width: 30%">
                <%=PageCommon.GetTlpDP("TxtTemplate") %>
                <asp:HiddenField runat="server" ID="TxtTemplate_hid" />
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="设定模板" OnClick="SetTemplate" />
                <asp:HiddenField ID="Order_Hid" runat="server" Value="" />
                <asp:Button ID="Order_B" runat="server" OnClientClick="return CheckOrder()" CssClass="btn btn-info" Text="保存排序" OnClick="Order_B_Click" />
            </td>
        </tr>
    </table>
   <ZL:TlpDown runat="server" />
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            Tlp_initTemp();
        });
        window.onload = function () {
            $("#FieldList tr td:contains('系统')").parent().hide();
        }
        function ShowList() {
            $("#FieldList tr td:contains('系统')").parent().toggle();
            $("#ShowLink").text($("#ShowLink").text() == "[显示所有字段]" ? "[隐藏系统字段]" : "[显示所有字段]");
        }
        function WinOpenDialog(url, w, h) {
            var feature = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;center:yes;status:no;help:no";
            showModalDialog(url, window, feature);
        }
        function CheckOrder() {
            $("[name='order']").each(function (i, v) {
                if ($(v).val() != $(v).data('old')) {
                    $("#Order_Hid").val($("#Order_Hid").val() + ","+$(v).data('id')+"|"+ $(v).val());
                }
            });
            return true;
        }
    </script>
</asp:Content>
