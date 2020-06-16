<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_Arrive_ArriveManage, App_Web_rillxipg" enableviewstate="true" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>优惠劵管理</title>
    <style>
        .searchDiv{
            float:left;
            margin-left:5px;
            margin-right:5px;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>
                    <div class="searchDiv"><asp:TextBox ID="txtName" placeholder="优惠劵名：" runat="server" class="form-control pull-left"></asp:TextBox></div>
                    <div class="searchDiv"><asp:TextBox ID="txtCreateTime" placeholder="有效时间：" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" class="form-control"></asp:TextBox></div>
                    <div class="searchDiv"><asp:TextBox ID="txtEndTime" placeholder="过期时间：" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" class="form-control"></asp:TextBox></div>
                    <asp:Button ID="btnName" runat="server" Text="搜索" class="btn btn-primary" OnClick="btnName_Click" />
                    <asp:Button ID="Button1" runat="server" Text="清空" class="btn btn-primary" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
        <div class="clearbox"></div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#cur" onclick="ShowTabs(2)">全部</a></li>
            <li><a href="#cur0" onclick="ShowTabs(0)">现金卡</a></li>
            <li><a href="#cur1" onclick="ShowTabs(1)">现金卡</a></li>
        </ul>
        <div class="divbox" id="nocontent" runat="server" style="display: none">
            暂无优惠劵信息
        </div>
        <div>
            <ZL:ExGridView ID="gvCard" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" RowStyle-CssClass="tdbg"
                EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="98%" EmptyDataText="当前无数据"
                OnRowCommand="gvCard_RowCommand" OnRowDataBound="gvCard_RowDataBound" OnPageIndexChanging="EGV_PageIndexChanging" class="table table-striped table-bordered table-hover">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <input type="checkbox" name="chk" value="<%# Eval("ID") %>" style="float: left; margin-left: 20%;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="Id" runat="server" Text='<%# Eval("ID") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="卡别名" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <%# Eval("ArriveName") %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编号" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblNo" runat="server" Text='<%#Eval("ArriveNO") %>' />
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="密码" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblPwd" runat="server" Text='<%#Eval("ArrivePwd") %>' />
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="金额" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>' />
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="所属用户" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server"></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="生效时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblAginTime" runat="server" Text='<%# Eval("AgainTime","{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="到期时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblEndTime" runat="server" Text='<%#Eval("EndTime","{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="使用时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblUseTime" runat="server" Text='<%#GetUseTime(Eval("UseTime","{0}")) %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblState" runat="server"></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="类型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblType" runat="server"></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <a id="abc" href='<%#Gethref(Eval("ID","{0}")) %>'>修改</a>
                            <a id="a1" href='<%#del(Eval("ID","{0}")) %>'>删除</a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
            <asp:Button runat="server" ID="batActive" OnClick="batActive_Click" Text="批量激活" class="btn btn-primary" />
            <asp:Button runat="server" ID="batBtn" OnClick="BtnDelete_Click" Text="批量删除" class="btn btn-primary" OnClientClick="return confirm('确定要删除选中吗');" Style="margin-left: 20px;" />
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#<%=gvCard.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll' style='margin-left:20%;float:left;'/>");//EGV顶部
            $("#chkAll").click(function () {//EGV 全选
                selectAll(this, "chk");
            });
            if (getParam("type"))
            {
                $("li a[href='#cur" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
            }
        });


        function selectAll(obj, name) {
            var allInput = document.getElementsByName(name);
            var loopTime = allInput.length;
            for (i = 0; i < loopTime; i++) {
                if (allInput[i].type == "checkbox") {
                    allInput[i].checked = obj.checked;
                }
            }
        }
    </script>
    <script type="text/javascript">
        function ShowTabs(Type) {
            var dt = Type;
            if (Type == 2) {
                location.href = 'ArriveManage.aspx'
            }
            else {
                location.href = 'ArriveManage.aspx?type=' + Type;
            }
        }
        function change(id) {
            location.href = 'AddArrive.aspx?menu=update&id=' + id;
        }
    </script>
</asp:Content>
