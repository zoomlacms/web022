<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_SaleList, App_Web_p5upeauk" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的店铺</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="pageflag" data-nav="shop" data-ban="shop"></div>
    <div class="container margin_t5">
        <ol class="breadcrumb">
            <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
            <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
            <li><a href="ProductList.aspx">我的店铺</a></li>
            <li class="active">明细记录</li>
        </ol>
    </div>
    <div class="container btn_green">
        <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
        <div class="us_topinfo" style="margin-top: 10px;">
            <br />
             <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="交易时间" DataField="PayTime" />
                    <asp:TemplateField HeaderText="用户名">
                        <ItemTemplate>
                            <%#getusername(Eval("UserID","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="交易方式">
                        <ItemTemplate>
                            <%#getPayPlat(Eval("PayPlatID","{0}"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="交易方式" DataField="PaymentNum" />
                    <asp:BoundField HeaderText="支付序号" DataField="MoneyPay" />
                    <asp:BoundField HeaderText="金额" DataField="PayTime" />
                    <asp:BoundField HeaderText="实际金额" DataField="MoneyTrue" />
                    <asp:TemplateField HeaderText="交易状态">
                        <ItemTemplate><%# GetStatus(Eval("Status","{0}"))%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="处理状态">
                        <ItemTemplate><%# GetCStatus(Eval("CStatus","{0}"))%></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center"/>
                   <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>