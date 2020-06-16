<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_BountOrder, App_Web_aytmmguf" masterpagefile="~/Manage/Site/OptionMaster.master" title="站点详情" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head" >
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="/JS/Common.js"></script>  
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script src="dist/js/bootstrap.min.js" type="text/javascript"></script>
<title>绑定订单</title>
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet" />
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site">
        <p>站群中心 >> 配置管理 >> 网站详情 >> 绑定订单</p>
    </div>     
<div id="site_main">
    <div id="Div1" runat="server" style="margin-top:2px;">
    <div class="pull-left">
        <span class="pull-left" style="line-height:32px;">
            订单搜索：
        </span>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control pull-right " Width="110" data-container="body">
            <asp:ListItem value="1">订单编号</asp:ListItem>
            <asp:ListItem value="4">会员名</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="input-group" style="width:250px;">
        <asp:TextBox ID="TxtKeyword" runat="server" onclick="setEmpty(this)" onblur="settxt(this)" Text="请输入关键字" CssClass="form-control"></asp:TextBox>
        <span class="input-group-btn">
            <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" CssClass="btn btn-default" />
        </span>
    </div><!-- /input-group -->
</div><div style="clear:both"></div>
    <div id="tab3" >
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" RowStyle-CssClass="tdbg" OnRowCommand="EGV_RowCommand"  OnPageIndexChanging="EGV_PageIndexChanging" CellPadding="2" CellSpacing="1" Width="100%" PageSize="10" GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <input type="checkbox" name="chk" value="<%#Eval("OrderNo") %>" style="margin-right:10px;" />
                        <%#Eval("ID") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="订单编号">
                    <ItemTemplate>
                        <%#Eval("OrderNo") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="客户名">
                    <ItemTemplate>
                        <%# Eval("Receiver") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用户名">
                    <ItemTemplate>
                        <%# Eval("Reuser") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="下单时间">
                    <ItemTemplate>
                        <%# Eval("AddTime") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="实际金额">
                    <ItemTemplate>
                        <%# Eval("Ordersamount") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="收款金额">
                    <ItemTemplate>
                        <%# Eval("Receivablesamount") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="绑定状态">
                    <ItemTemplate>
                        <%#GetBound(DataBinder.Eval(Container,"DataItem.OrderNo","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("OrderNo") %>' CommandName="select" runat="server">选择</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%#Eval("OrderNo") %>' CommandName="delete1" runat="server">移除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
</div>
<script type="text/javascript">
    function selectAll(obj, name) {
        var allInput = document.getElementsByName(name);
        var loopTime = allInput.length;
        for (i = 0; i < loopTime; i++) {
            if (allInput[i].type == "checkbox") {
                allInput[i].checked = obj.checked;
            }
        }
    }
    $(function () 
    {
        $("#<%=EGV.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll' style='margin-right:10px;floa'/>ID");//EGV顶部
        $("#<%=EGV.ClientID%>  tr>th").css("height", "30px").css("line-height", "30px");
        $("#chkAll").click(function ()
        {
            selectAll(this, "chk");
        });
    })
    function setEmpty(obj) {
        if (obj.value == "请输入关键字") {
            obj.value = "";
        }
    }
    function settxt(obj) {
        if (obj.value == "") {
            obj.value = "请输入关键字";
        }
    }
    $().ready(function () {
        $(":text").addClass("site_input");
    });
</script>
</asp:Content> 
