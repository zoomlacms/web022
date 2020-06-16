<%@ page language="C#" autoeventwireup="true" inherits="Plugins_Domain_ViewHave, App_Web_fryv1wb2" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>已购服务</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="top_opbar">
        <div style="display: inline-block;">
            <asp:TextBox runat="server" CssClass="form-control text_md" ID="keyWord" />
            <asp:Button runat="server" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" CssClass="btn btn-primary" />
        </div>
    </div>
<div id="tab3">
<div id="viewDiv" runat="server">
    <ul class="nav nav-tabs">
        <li id="tabs0" class="active"><a href="ViewHave.aspx">全部</a></li>
        <li id="tabs1"><a href="ViewHave.aspx?filter=1">生效中</a></li>
        <li id="tabs2"><a href="ViewHave.aspx?filter=2">已过期</a></li>
        <li id="tabs3"><a href="ViewHave.aspx?filter=3">未付款</a></li>
    </ul>
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" RowStyle-CssClass="tdbg"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand"
  OnRowCancelingEdit="EGV_RowCancelingEdit" PageSize="10" CssClass="table table-bordered table-hover table-striped"
EnableTheming="False" EmptyDataText="没有任何数据！"  AllowSorting="True" EnableModelValidation="True" IsHoldState="false" SerialText="">
<PagerStyle HorizontalAlign="Center" />
	<Columns>
		<asp:BoundField HeaderText="序号" DataField="ID" ReadOnly="true" />
		<asp:TemplateField HeaderText="品名">
			<ItemTemplate>
			   <%#Eval("ProName") %>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:BoundField HeaderText="金额" DataField="AllMoney" DataFormatString="{0:f2}"/>
		<asp:BoundField HeaderText="绑定主机" DataField="Internalrecords"/>
		<asp:TemplateField HeaderText="购买日期">
			<ItemTemplate>
				<%#DataBinder.Eval(Container.DataItem,"AddTime", "{0:yyyy年M月d日}") %>
				<div id="more_div"  class="border more">
					<div class="moreTitle"><span class="closeSpan" onclick="HideMoreF();">关闭</span>备注信息</div>
					<%#Eval("OrderMessage") %>
				</div>
				<div id="more_div2" class="border more">
					  <div class="moreTitle"><span class="closeSpan" onclick="HideMoreF();">关闭</span>官方标记</div><%#Eval("Internalrecords") %>
				</div>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="到期日期">
			<ItemTemplate>
				<%#DataBinder.Eval(Container.DataItem,"EndTime", "{0:yyyy年M月d日}")%>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="状态">
			<ItemTemplate>
				<%#IsExpire(Eval("EndTime")) %>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="备注信息">
			<ItemTemplate>
				<div style="width:100px;cursor:pointer;" onclick="ShowMoreF(this,'more_div');"><%#GetMessage(Eval("OrderMessage")) %></div>
			</ItemTemplate>
		</asp:TemplateField>
		  <asp:TemplateField HeaderText="官方标记">
			  <ItemTemplate>
				   <div style="width:100px;cursor:pointer;" onclick="ShowMoreF(this,'more_div2');"><%#GetMessage(Eval("Internalrecords")) %></div>
			  </ItemTemplate>
			  </asp:TemplateField>
		<asp:TemplateField HeaderText="操作">
			<ItemTemplate>
                <a href="/Shop.aspx?ID=<%#Eval("ProID") %>" target="_viewDetail">查看详情</a>
                <%#GetOP() %>
			</ItemTemplate>
		 </asp:TemplateField>
	</Columns>
</ZL:ExGridView> </div>
</div>
<style type="text/css">
    .more {width:400px;height:300px;position:absolute;display:none;top:100px;border-radius:3px;}
    .moreTitle {text-align:center;background-color:#08C;font-family:'Microsoft YaHei';font-size:14px;color:white;}
    .closeSpan {float:right;margin-right:10px;cursor:pointer; }
</style>
    <script type="text/javascript">
        function ShowMoreF(obj, id)//more_div,more_div2
        {
            $(".more").hide();
            $(obj).parent().parent().find("#" + id).show();
        }
        function HideMoreF() {
            $(".more").hide();
        }
        $(function () {
            var filter = "<%:Filter%>";
            $(".nav-tabs li").removeClass("active");
            $("#tabs" + filter).addClass("active");
        })
    </script>
</asp:Content>
