<%@ page language="C#" autoeventwireup="true" inherits="User_PrintServer_FeightOrder, App_Web_ivqqslkk" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>航班订单管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="shop"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">航班订单管理</li>
    </ol>
</div>
<div class="container">
    <div class="btn-group btn_green btn_green_xs">
            <a href="PreViewOrder.aspx?menu=Cartinfo" class="btn btn-primary">购物车管理</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo" class="btn btn-primary">订单管理</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=1" class="btn btn-primary">已确定的订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=2" class="btn btn-primary">已发货订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=3" class="btn btn-primary">正常订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=4" class="btn btn-primary">成交订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=5" class="btn btn-primary">回收站</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=0" class="btn btn-primary">代购订单</a>
            <a href="PreViewOrder.aspx?menu=Orderinfo&type=1&panel=1" class="btn btn-primary">代购历史订单</a>
            <a href="HotelOrder.aspx?menu=Cartinfo" class="btn btn-primary">酒店订单</a>
            <a href="FeightOrder.aspx?menu=Cartinfo" class="btn btn-primary">机票订单</a>
            <a href="TripOrder.aspx?menu=Cartinfo" class="btn btn-primary">旅游订单</a>
            <a class="btn btn-primary" href="/User/Info/UserRecei.aspx">收货地址</a>
    </div>
</div>
    <div class="container margin_t10">
	<div class="us_seta btn_green">
			 <asp:Panel ID="Panel1" runat="server" Width="100%">
                 <asp:Label runat="server" ID="TableTitle_L" Visible="false"></asp:Label>
                 <ZL:ExGridView ID="EGV1" runat="server" CssClass="table table-striped table-bordered table-hover" 
                     EmptyDataText="无订单数据" AllowPaging="true" AutoGenerateColumns="false" PageSize="10">
                     <Columns>
                         <asp:TemplateField>
                             <ItemTemplate>
                                 <input name="idchk" value="<%#Eval("id") %>" type="checkbox" />
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="订单编号">
                             <ItemTemplate>
                                 <a href="OrderProList?OrderNo=<%#Eval("OrderNo") %>">
								<%#Eval("OrderNo")%></a>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="客户名称">
                             <ItemTemplate>
                                <%#Eval("Reuser") %>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="起飞时间">
                             <ItemTemplate>
                                 <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd}")%>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="订单金额">
                             <ItemTemplate>
                                <%#formatcc(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="实际金额">
                             <ItemTemplate>
                                <%#formatcc(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="操作">
                             <ItemTemplate>
                                <%#getbotton(Eval("id","{0}")) %>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                 </ZL:ExGridView>
                 <asp:Button ID="Dels" CssClass="btn btn-primary" runat="server" Text="批量作废" OnClick="Dels_Click" />
		</asp:Panel>
			<asp:Panel ID="Panel3" runat="server" Width="100%" Visible="false">
                <ZL:ExGridView ID="EGV3" runat="server" CssClass="table table-striped table-bordered table-hover" EmptyDataText="无相关数据" AutoGenerateColumns="false" PageSize="10">
                     <Columns>
                         <asp:TemplateField HeaderText="乘客名称">
                             <ItemTemplate>
                                 <%#Eval("Name")%> <%#Eval("Name_EN")%>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="证件类型">
                             <ItemTemplate>
                                 <%# GetCreType(GetCreID(Eval("CreID", "{0}"), 0))%>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="证件号码">
                             <ItemTemplate>
                                  <%# GetCreID(Eval("CreID", "{0}"),1)%> 
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="联系电话">
                             <ItemTemplate>
                                   <%#Eval("Mobile")%>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                </ZL:ExGridView>
		 </asp:Panel>
		<asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
		<h1 style="text-align: center">
			<asp:Label ID="Label10" runat="server" Text=""></asp:Label></h1>
             <ZL:ExGridView ID="EGV2" runat="server" CssClass="table table-striped table-bordered table-hover" EmptyDataText="无相关数据" AutoGenerateColumns="false" PageSize="10">
                 <Columns>
                     <asp:TemplateField HeaderText="航班号">
                         <ItemTemplate>
                             <%#DataBinder.Eval(Container, "DataItem.proname", "{0}")%>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="起飞">
                         <ItemTemplate>
                             <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd}")%>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="价格">
                         <ItemTemplate>
                             <%# DataBinder.Eval(Container, "DataItem.Shijia", "{0:N2}")%>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="机建/燃油">
                         <ItemTemplate>
                             <%#Eval("Proinfo")%>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </ZL:ExGridView>
			<br />
			<ul >
				<li style="width:45%; float: none; line-height: 24px; text-align: left;">
					保险数量：<asp:Label ID="lblIns" runat="server" Text=""></asp:Label> 份 </li>
				<li style="width:90%; float: none; line-height: 24px; text-align: left;">
					合计：<asp:Label ID="preojiage" runat="server" Text=""></asp:Label> 元 </li>
			   
			</ul>
		 </asp:Panel>
	</div>
    </div>
</asp:Content>
