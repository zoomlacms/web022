<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_ListHtmlContent, App_Web_tln5ra1b" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>内容生成管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <table class="table table-bordered">
        <tr>
            <td>
                <div class="pull-left">
                    <b>请选择排列顺序：</b>
                    <asp:DropDownList ID="txtbyfilde" CssClass="form-control" Width="150" runat="server" OnSelectedIndexChanged="SelectBind"></asp:DropDownList>
                    <asp:DropDownList ID="txtbyOrder" CssClass="form-control" Width="150" runat="server" OnSelectedIndexChanged="SelectBind"></asp:DropDownList>
                </div>
                <div class="pull-left">
                    <div class="pull-left">
                        <b style="margin-left: 10px;">查找：</b>
                        <asp:DropDownList ID="DropDownList1" Width="120" CssClass="form-control" runat="server">
                            <asp:ListItem Value="1">ID检索</asp:ListItem>
                            <asp:ListItem Value="0">标题检索</asp:ListItem>
                            <asp:ListItem Value="2">录入者检索</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="input-group pull-left" style="width:300px;">
                        <asp:TextBox ID="TextBox1" runat="server" onkeydown="return GetEnterCode('click','Button4');" CssClass="form-control"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button4_Click" CssClass="btn btn-primary"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                        </span>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" style="display:none;" CssClass="btn btn-primary" /> 
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="20" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("GeneralID") %>' />
                </ItemTemplate>
                <HeaderStyle Width="5%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="GeneralID">
                <HeaderStyle Width="5%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <a href="ListHtmlContent.aspx?orderby=title"><font color="green"><b>标题</b></font></a>
                </HeaderTemplate>
                <ItemTemplate>
                    <%# GetPic(Eval("ModelID", "{0}"))%> <%# GetTitle(Eval("GeneralID", "{0}"), Eval("NodeID", "{0}"), Eval("Title", "{0}"), Eval("ModelID", "{0}"))%>
                </ItemTemplate>
                <HeaderStyle Width="55%" />
                <ItemStyle />
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <a href="ListHtmlContent.aspx?orderby=Status"><font color="green"><b>状态</b></font></a>
                </HeaderTemplate>
                <ItemTemplate>
                    <%# GetStatus(Eval("Status", "{0}")) %>
                </ItemTemplate>
                <HeaderStyle Width="10%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="生成操作">
                <ItemTemplate>
                    <%# GetCteate(Eval("IsCreate", "{0}"))%>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="MakeHtml" CommandArgument='<%# Eval("GeneralID") %>' CausesValidation="false">生成文件</asp:LinkButton>
                    |
                    <%--<a href="ListHtmlContent.aspx?ContentID=<%# Eval("GeneralID") %>" target="_blank">查看文件</a>--%>
                    <a href="<%#(geturl(Eval("GeneralID","{0}"))=="")?"javascript:void(0);":geturl(Eval("GeneralID","{0}"))%>">查看文件</a>
                    |
				<a href="ListHtmlContent.aspx?GeneralID=<%# Eval("GeneralID") %>">删除文件</a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
    <asp:Button ID="btnAudit" CssClass="btn btn-primary" CausesValidation="false" runat="server" Text="生成文件" OnClientClick="if(!IsSelectedId()){alert('请选择生成项');return false;}else{return confirm('你确定要生成选中内容吗？')}" OnClick="btnAudit_Click" />&nbsp;
    <asp:Button ID="btnUnAudit" CausesValidation="false" runat="server" Text="删除文件" CssClass="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要取消审核选中内容吗？')}" OnClick="btnUnAudit_Click" />&nbsp;
    <asp:HiddenField ID="HiddenNodeID" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
           
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=idchk]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        function displayToolbar() {
            var dr = document.getElementById("search");
            if (dr.style.display == "none") {
                dr.style.display = "block";
            }
            else {
                dr.style.display = "none";
            }
        }
    </script>
</asp:Content>
