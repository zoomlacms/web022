<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="Manage_User_CapitalLog, App_Web_1jbandww" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>财务流水</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
        <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li><a href='<%=customPath2 %>User/UserManage.aspx'>会员管理</a></li><li class='active'>财务流水</li>
        <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
        <div id="sel_box" class="padding5">
            <div class="input-group sel_box">
                <span class="input-group-btn">
                    <asp:DropDownList ID="Search_Drop" runat="server" CssClass="form-control" style="width:120px;">
                         <asp:ListItem Value="1">用户ID</asp:ListItem>
                         <asp:ListItem Value="2">用户名</asp:ListItem>
                     </asp:DropDownList>
                 </span>
                <asp:TextBox runat="server" ID="Search_T" class="form-control" placeholder="检索当前位置" />
                <span class="input-group-btn">
                        <asp:LinkButton runat="server" CssClass="btn btn-default" ID="LinkButton1" OnClick="Search_Btn_Click">搜索</asp:LinkButton>
                        <asp:Button runat="server" ID="Search_Btn_Hid" OnClick="Search_Btn_Click" style="display:none;" />
                </span>
            </div>
        </div> 
    </ol>
    <ul class="nav nav-tabs" role="tablist">
    <li data-type="1" class=''><a href="?type=1">余额操作</a></li>
    <li data-type="3" class=''><a href="?type=3">积分记录</a></li>
    <li data-type="2" class=''><a href="?type=2">银币记录</a></li>
    <li data-type="4" class=''><a href="?type=4">点券记录</a></li>
    <li data-type="6" class=''><a href="?type=6">信誉值记录</a></li>
    <li data-type="7" class=''><a href="?type=7">订单流水</a></li>
  </ul>
    <div class="tab-content">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  
    CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
    OnPageIndexChanging="EGV_PageIndexChanging" >
        <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                    </ItemTemplate>
                    <ItemStyle CssClass="td_s" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-Height="22" />
                <asp:BoundField HeaderText="用户ID" DataField="UserID" />
                <asp:TemplateField HeaderText="用户名">
                <ItemTemplate>
                    <a href='Userinfo.aspx?id=<%#Eval("UserID") %>'><%#Eval("UserName") %></a>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="操作时间" DataField="HisTime" />
                <asp:BoundField HeaderText="操作金额" DataField="Score" DataFormatString="{0:f2}" />
                <asp:BoundField HeaderText="详细" DataField="Detail" />
            </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Dels_Btn" runat="server" CssClass="btn btn-primary" Text="批量删除" OnClick="Dels_Btn_Click" OnClientClick="return confirm('是否删除选定记录!')" />
    </div>
    <script>
        //选择滑动门
        function CheckType(id) {
            $("[data-type='"+id+"']").addClass('active');
        }
        $("#sel_btn").click(function (e) {
            if ($("#sel_box").css("display") == "none") {
                $(this).addClass("active");
                $("#sel_box").slideDown(300);
            }
            else {
                $(this).removeClass("active");
                $("#sel_box").slideUp(200);
            }
        });
    </script>
</asp:Content>


