<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_AddNode, App_Web_tomlqwem" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
<script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
<script type="text/javascript" src="/JS/JQueryAjax.js"></script>
<title>添加节点</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<ul class="nav nav-tabs">
	<li class="active"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
	<li><a href="#Tabs1" data-toggle="tab">栏目选项</a></li>
	<li><a href="#Tabs2" data-toggle="tab">收费设置</a></li>
	<li><a href="#Tabs3" data-toggle="tab">模板选项</a></li>
	<li><a href="#Tabs4" data-toggle="tab">生成选项</a></li>
	<li><a href="#Tabs5" data-toggle="tab">自设内容</a></li>
	<li><a href="#Tabs6" data-toggle="tab">浏览权限</a></li>
	<li><a href="#Tabs7" data-toggle="tab">操作权限</a></li>
</ul>
<div class="tab-content">
	<div class="tab-pane active" id="Tabs0">
		<table width="100%" class="table table-striped table-bordered table-hover" cellpadding="2" cellspacing="1">
			<%-- 基本信息--%>
			<script type="text/javascript">
				function GetPYDir()
				{
					var NodeName = document.getElementById("<%= TxtNodeName.ClientID %>");                    
			if(NodeName.value!="")
			{
				CallTheServer(NodeName.value,"");
			}                        
		}
		function CallTheServer(arg,context)
		{
<%= CallBackReference %>
		}
				function ReceiveServerData(result)
				{
					var NodeDir = document.getElementById("<%= TxtNodeDir.ClientID %>");
			NodeDir.value=result;
		}
		function EBtnS() {
			var inLen = $("#BGroups").children("input[type='text']").length;
			var Hidd="";
			for (var i = 0; i < inLen; i++) {
				Hidd+=$("#BGroups").children("input[type='hidden']").eq(i).val()+"="+$("#BGroups").children("input[type='text']").eq(i).val()+"|";
			}
			$("#EDHid").val(Hidd);
			return true;
		}
			</script>
			<tbody>
				<tr>
					<td style="width: 288px"">
						<strong>所属栏目：</strong>
					</td>
					<td>
						<input id="EDHid" type="hidden" value="" runat="server" />
						&nbsp;<asp:Label ID="LblNodeName" runat="server" Text=""></asp:Label>
						<asp:HiddenField ID="HdnParentId" Value="0" runat="server" />
						<asp:HiddenField ID="HdnDepth" Value="0" runat="server" />
						<asp:HiddenField ID="HdnOrderID" Value="0" runat="server" />
						<asp:HiddenField ID="NODEID" Value="0" runat="server" />
						<asp:HiddenField ID="HdnNodeID" Value="0" runat="server" />
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>栏目名称：</strong>
					</td>
					<td>
						<asp:TextBox ID="TxtNodeName" class="form-control" style="max-width:200px;" runat="server" Columns="30"  onblur="CheckNodeName();" onkeyup="Getpy('TxtNodeName','TxtNodeDir')"></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="TxtNodeName" ErrorMessage="RequiredFieldValidator">栏目名不能为空</asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>栏目标识名：</strong>
					</td>
					<td>
						<asp:TextBox ID="TxtNodeDir" class="form-control pull-left" style="max-width:200px;" MaxLength="20" runat="server" Columns="20" onblur="CheckNodeDir();"></asp:TextBox>
						<span class="tips" style="color: Blue">注意，目录名只能是字母、数字、下划线组成，首字符不能是数字
							<asp:RegularExpressionValidator ID="RegTxtNodeDir" runat="server" ControlToValidate="TxtNodeDir" Display="Dynamic" ValidationExpression="[_a-zA-Z][_a-zA-Z0-9]*" ErrorMessage="目录名格式错误" SetFocusOnError="True"></asp:RegularExpressionValidator>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtNodeDir" ErrorMessage="标识码不能为空"></asp:RequiredFieldValidator>
						</span>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>栏目图片地址：</strong>
					</td>
					<td>
						<asp:TextBox ID="TxtNodePicUrl" style="max-width:200px;" class="form-control" MaxLength="255" runat="server" Columns="50"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>栏目提示：</strong>
					</td>
					<td>
						<asp:TextBox ID="TxtTips" class="form-control" style="max-width:300px;" runat="server" Columns="60" Height="66px" Width="500px" Rows="2" TextMode="MultiLine"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" style="max-width:300px;" onmouseout="this.className='tdbg'">
					<td style="width: 288px"">
						<strong>栏目说明：</strong>
					</td>
					<td>
						<asp:TextBox ID="TxtDescription" class="form-control" style="max-width:300px;" runat="server" Columns="60" Height="63px" Width="500px" Rows="2" TextMode="MultiLine"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>栏目META关键词：</strong>
					</td>
					<td>
						<asp:TextBox ID="TxtMetaKeywords" class="form-control" style="max-width:300px;" runat="server" Height="65" Width="500" Columns="60" Rows="4" TextMode="MultiLine"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>栏目META网页描述：</strong>
					</td>
					<td>
						<asp:TextBox ID="TxtMetaDescription" class="form-control" style="max-width:300px;" runat="server" Height="65" Width="500" Columns="60" Rows="4" TextMode="MultiLine"></asp:TextBox>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tab-pane" id="Tabs1">
		<table width="100%" class="table table-striped table-bordered table-hover" cellpadding="2" cellspacing="1">
			<%--栏目选项--%>
			<tbody>
				<tr>
					<td style="width: 288px"">
						<strong>打开方式：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="RBLOpenType" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
							<asp:ListItem Value="1">新窗口打开</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>内容打开方式：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="RBLItemOpenType" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
							<asp:ListItem Value="1">新窗口打开</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td style="width: 288px;""><strong>栏目权限：</strong></td>
					<td>
						<asp:RadioButtonList ID="RBLPurviewType" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Selected="True" Value="0">开放</asp:ListItem>
							<asp:ListItem Value="1">认证</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td><strong>文章状态(从用户中心添加)：</strong></td>
					<td>
						<asp:RadioButtonList ID="SiteContentAudit_Rad" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Selected="True" Value="0">待审核</asp:ListItem>
							<asp:ListItem Value="99">已审核</asp:ListItem>
							<asp:ListItem Value="-1">回收站</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>评论权限：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="RBLCommentType" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Selected="True" Value="0">允许评论</asp:ListItem>
							<asp:ListItem Value="1">开放评论</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>点击统计时间：</strong>
					</td>
					<td>
						<asp:DropDownList ID="ClickTimeout" CssClass="form-control text_md" runat="server">
							<asp:ListItem Text="1秒" Value="1" Selected="True"></asp:ListItem>
							<asp:ListItem Text="30秒" Value="30"></asp:ListItem>
							<asp:ListItem Text="1分钟" Value="60"></asp:ListItem>
							<asp:ListItem Text="5分钟" Value="300"></asp:ListItem>
							<asp:ListItem Text="10分钟" Value="600"></asp:ListItem>
							<asp:ListItem Text="半小时" Value="1800"></asp:ListItem>
							<asp:ListItem Text="1小时" Value="3600"></asp:ListItem>
							<asp:ListItem Text="8小时" Value="28800"></asp:ListItem>
							<asp:ListItem Text="24小时" Value="86400"></asp:ListItem>
						</asp:DropDownList>
						<%--<asp:TextBox ID="ClickTimeout" class="form-control" runat="server" Columns="30">0</asp:TextBox>--%>
					</td>
				</tr>
				<tr>
					<td>
						<strong>热点的点击数：</strong>
					</td>
					<td>
						<asp:TextBox ID="TxtHitsOfHot" class="form-control text_md" runat="server" Columns="5">0</asp:TextBox>
						<asp:RangeValidator ID="ValgHitsOfHot" runat="server" Display="Dynamic" ControlToValidate="TxtHitsOfHot" ErrorMessage="请输入整数" MinimumValue="0" MaximumValue="2147483647" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
					</td>
				</tr>
				<tr>
					<td>
						<strong>工作流：</strong>
					</td>
					<td>
						<asp:DropDownList ID="ddlState" CssClass="form-control text_md" runat="server"></asp:DropDownList>
					</td>
				</tr>
					<tr>
						<td>
							<strong>是否只读：</strong>
						</td>
						<td>
							<asp:RadioButtonList ID="ReadOnly" runat="server" RepeatColumns="2">
								<asp:ListItem Selected="True" Value="0">否</asp:ListItem>
								<asp:ListItem Value="1">是</asp:ListItem>
							</asp:RadioButtonList>
						</td>
					</tr>
					<tr>
						<td>
							<strong>文章是否只读：</strong>
						</td>
						<td>
							<asp:RadioButtonList ID="ArticleSite" runat="server" RepeatColumns="2">
								<asp:ListItem Selected="True" Value="0">否</asp:ListItem>
								<asp:ListItem Value="1">是</asp:ListItem>
							</asp:RadioButtonList>
						</td>
					</tr>
				<tr>
					<td>
						<strong>内容防护：</strong>
					</td>
					<td>
						<asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="SafeGuard">
							<asp:ListItem Value="1">是</asp:ListItem>
							<asp:ListItem Value="0" Selected="True">否</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>简洁模式：</strong>
					</td>
					<td>
						<input type="checkbox" runat="server" id="isSimple_CH" class="switchChk"  />
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>绑定互动管理：</strong><br />
					</td>
					<td>
						<asp:DropDownList ID="DropDownList1" CssClass="form-control pull-left" style="max-width:200px;" runat="server"></asp:DropDownList>
						<span class="tips" style='color: #1e860b;'>只能绑定节点类别的互动模块</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tab-pane" id="Tabs2">
		<table width="100%" class="table table-striped table-bordered table-hover" cellpadding="2" cellspacing="1">
			<%--收费设置--%>
			<tbody>
				<tr>
					<td style="width: 288px"">
						<strong>默认消费点券数：</strong><br />
						注：会员在此栏目下阅读内容时，该内容默认的收费点券数
					</td>
					<td>
						<asp:TextBox ID="TxtConsumePoint" style="max-width:150px;" class="form-control pull-left" runat="server" Columns="5">0</asp:TextBox><span class="tips">点</span>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>重复收费方式：</strong><br />
						注：会员在此栏目下阅读内容时，该内容的重复收费方式
					</td>
					<td>
						<input name="ConsumeType" value="0" type="radio" checked="true" />不重复收费<div class="clearfix"></div>
						<span class="pull-left" style="line-height:32px;margin-right:5px;"><input id="Radio1" name="ConsumeType" value="1" type="radio" />距离上次收费时间</span>
						<asp:TextBox ID="TxtConsumeTime" class="form-control pull-left" style="max-width:150px;" runat="server" Columns="5">0</asp:TextBox><span class="tips">小时后重新收费</span><div class="clearfix"></div>
						<span class="pull-left" style="line-height:32px;margin-right:5px;"><input id="Radio2" name="ConsumeType" value="2" type="radio" />会员重复阅读此文章</span>
						<asp:TextBox ID="TxtConsumeCount" class="form-control pull-left" style="max-width:150px;" runat="server" Columns="5">0</asp:TextBox><span class="tips">次后重新收费</span><div class="clearfix"></div>
						<input id="Radio3" name="ConsumeType" value="3" type="radio" />上述两者都满足时重新收费<div class="clearfix"></div>
						<input id="Radio4" name="ConsumeType" value="4" type="radio" />上述两者任一个满足时就重新收费<div class="clearfix"></div>
						<input id="Radio5" name="ConsumeType" value="5" type="radio" />每阅读一次就重复收费一次（建议不要使用）<div class="clearfix"></div>
					</td>
				</tr>
				<tr>
					<td>
						<strong>可浏览篇数：</strong><br />
						注：会员在此栏目下查看内容时,该节点可浏览篇数
					</td>
					<td id="BGroups">
						<asp:Repeater ID="BGroup" runat="server">
							<ItemTemplate>
								<span class="tips" style="width: 70px; display: block; float: left"><%# Eval("GroupName")%> </span>
								<input type="hidden" value='<%# Eval("GroupID") %>' />
								<asp:TextBox ID="CNode1" class="form-control pull-left" style="max-width:80px;" runat="server" Text="0" Columns="5"></asp:TextBox><span class="tips">篇</span><div class="clearfix"></div>
							</ItemTemplate>
						</asp:Repeater>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>分成比例：</strong><br />
						注：会员在此栏目下添加内容时，该内容默认的分成比例
					</td>
					<td>
						<asp:TextBox ID="TxtShares" style="max-width:80px;" class="form-control pull-left" runat="server" Columns="5">0</asp:TextBox><span class="tips">%</span>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>发布内容收费：</strong><br />
						注：会员在此栏目下发布内容时，每发布一篇内容收费
					</td>
					<td>
						<asp:TextBox ID="TxtAddMoney" style="max-width:80px;margin-bottom:5px;" class="form-control pull-left" runat="server" Columns="8">0</asp:TextBox>
						<span class="tips">元</span><div class="clearfix"></div>
						<asp:TextBox ID="TxtAddPoint" style="max-width:80px;" class="form-control pull-left" runat="server" Columns="8">0</asp:TextBox>
						<span class="tips">点券</span><div class="clearfix"></div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tab-pane" id="Tabs3">
		<table width="100%" class="table table-striped table-bordered table-hover" cellpadding="2" cellspacing="1">
			<tbody>
				<tr>
					<td style="width: 288px"">
						<strong>栏目首页模板：</strong>
					</td>
					<td>
                        <%=PageCommon.GetTlpDP("IndexTemplate") %>
                        <asp:HiddenField ID="IndexTemplate_hid" runat="server" />
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>栏目列表页模板：</strong>
					</td>
					<td>
                         <%=PageCommon.GetTlpDP("TxtTemplate") %>
                         <asp:HiddenField ID="TxtTemplate_hid" runat="server" />
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>最新信息模板：</strong>
					</td>
					<td>
                        <%=PageCommon.GetTlpDP("LastinfoTemplate") %>
                        <asp:HiddenField ID="LastinfoTemplate_hid" runat="server" />
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>热门信息模板：</strong>
					</td>
					<td>
                        <%=PageCommon.GetTlpDP("HotinfoTemplate") %>
                        <asp:HiddenField ID="HotinfoTemplate_hid" runat="server" />
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>推荐信息模板：</strong>
					</td>
					<td>
                        <%=PageCommon.GetTlpDP("ProposeTemplate") %>
                        <asp:HiddenField ID="ProposeTemplate_hid" runat="server" />
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>选择内容模型:</strong>
					</td>
					<td>
						<asp:HiddenField ID="HdnModeID" runat="server" />
						<table class="table table-striped table-bordered table-hover">
							<asp:Repeater ID="Repeater1" runat="server">
								<ItemTemplate>
									<tr class="tdbg">
										<td style="width: 150px">
											<%# GetChk(Eval("ModelID","{0}")) %>
											<%# Eval("ModelName") %>
										</td>
										<td>
                                            <%#PageCommon.GetTlpDP("ModelTemplate_"+Eval("ModelID")) %>
                                            <input type="hidden" id="ModelTemplate_<%# Eval("ModelID") %>_hid" name="ModelTemplate_<%# Eval("ModelID") %>" value="<%# GetTemplate(Eval("ModelID","{0}")) %>" />
										</td>
									</tr>
								</ItemTemplate>
							</asp:Repeater>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tab-pane" id="Tabs4">
		<table class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td style="width: 288px"">
						<strong>栏目首页扩展名：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="RBLListEx" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="0">.html</asp:ListItem>
							<asp:ListItem Value="1">.htm</asp:ListItem>
							<asp:ListItem Value="2">.shtml</asp:ListItem>
							<asp:ListItem Selected="True" Value="3">.aspx(不生成静态)</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td style="width: 288px"">
						<strong>栏目列表页面扩展名：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="ListPageEx" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="0">.html</asp:ListItem>
							<asp:ListItem Value="1">.htm</asp:ListItem>
							<asp:ListItem Value="2">.shtml</asp:ListItem>
							<asp:ListItem Selected="True" Value="3">.aspx(不生成静态)</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>最新信息页扩展名：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="LastinfoPageEx" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="0">.html</asp:ListItem>
							<asp:ListItem Value="1">.htm</asp:ListItem>
							<asp:ListItem Value="2">.shtml</asp:ListItem>
							<asp:ListItem Selected="True" Value="3">.aspx(不生成静态)</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>热门信息页扩展名：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="HotinfoPageEx" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="0">.html</asp:ListItem>
							<asp:ListItem Value="1">.htm</asp:ListItem>
							<asp:ListItem Value="2">.shtml</asp:ListItem>
							<asp:ListItem Selected="True" Value="3">.aspx(不生成静态)</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>推荐信息扩展名：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="ProposePageEx" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="0">.html</asp:ListItem>
							<asp:ListItem Value="1">.htm</asp:ListItem>
							<asp:ListItem Value="2">.shtml</asp:ListItem>
							<asp:ListItem Selected="True" Value="3">.aspx(不生成静态)</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>内容页扩展名：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="RBLContentEx" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="0">.html</asp:ListItem>
							<asp:ListItem Value="1">.htm</asp:ListItem>
							<asp:ListItem Value="2">.shtml</asp:ListItem>
							<asp:ListItem Selected="True" Value="3">.aspx(不生成静态)</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>节点目录生成位置：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="RBLPosition" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Selected="True" Value="1">继承父节点目录</asp:ListItem>
							<asp:ListItem Value="0">根目录下</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<strong>内容页文件名规则：</strong>
					</td>
					<td>
						<asp:DropDownList ID="DDLContentRule" CssClass="form-control" style="max-width:200px;" runat="server">
							<asp:ListItem Value="0">栏目目录/年/月/日/infoid</asp:ListItem>
							<asp:ListItem Value="1">栏目目录/年-月/InfoID</asp:ListItem>
							<asp:ListItem Selected="True" Value="2">栏目目录/InfoID</asp:ListItem>
							<asp:ListItem Value="3">栏目目录/年月日/标题</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<div class="tab-pane" id="Tabs5">
		<table class="table table-striped table-bordered table-hover">
			<%# GetChk(Eval("ModelID","{0}")) %>
			<tbody>
				<tr>
					<td style="width: 288px"">
						<strong>自设内容项目数：</strong>
					</td>
					<td>
						<asp:DropDownList ID="SelCount" CssClass="form-control" style="max-width:80px;" runat="server" onchange="showCustom(this.value);selectnum();">
							<asp:ListItem Selected="True" Value="1"></asp:ListItem>
							<asp:ListItem Value="2"></asp:ListItem>
							<asp:ListItem Value="3"></asp:ListItem>
							<asp:ListItem Value="4"></asp:ListItem>
							<asp:ListItem Value="5"></asp:ListItem>
							<asp:ListItem Value="6"></asp:ListItem>
							<asp:ListItem Value="7"></asp:ListItem>
							<asp:ListItem Value="8"></asp:ListItem>
							<asp:ListItem Value="9"></asp:ListItem>
							<asp:ListItem Value="10"></asp:ListItem>
							<asp:ListItem Value="11"></asp:ListItem>
							<asp:ListItem Value="12"></asp:ListItem>
							<asp:ListItem Value="13"></asp:ListItem>
							<asp:ListItem Value="14"></asp:ListItem>
							<asp:ListItem Value="15"></asp:ListItem>
							<asp:ListItem Value="16"></asp:ListItem>
							<asp:ListItem Value="17"></asp:ListItem>
							<asp:ListItem Value="18"></asp:ListItem>
							<asp:ListItem Value="19"></asp:ListItem>
							<asp:ListItem Value="20"></asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr class="tdbg" id="Custom1">
					<td style="width: 288px"">
						<strong>自设内容1：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="1"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox1" class="form-control" style="max-width:300px;" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Height="65px"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom2" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容2：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="2"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox2" class="form-control" style="max-width:300px;" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Height="65px"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom3" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容3：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="3"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox3" class="form-control" style="max-width:300px;" runat="server" TextMode="MultiLine" Height="65px" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom4" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容4：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="4"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox4" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom5" style="display: none" >
					<td style="width: 288px"">
						<strong>自设内容5：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="5"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox5" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom6" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容6：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="6"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox6" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom7" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容7：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="7"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox7" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom8" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容8：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="8"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox8" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom9" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容9：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="9"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox9" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom10" style="display: none" height="65px">
					<td style="width: 288px"">
						<strong>自设内容10：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="10"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox10" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom11" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容11：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="11"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox11" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom12" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容12：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="12"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox12" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom13" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容13：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="13"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox13" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom14" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容14：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="14"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox14" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom15" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容15：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="15"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox15" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom16" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容16：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="16"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox16" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom17" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容17：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="17"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox17" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom18" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容18：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="18"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox18" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom19" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容19：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="19"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox19" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
				<tr class="tdbg" id="Custom20" style="display: none">
					<td style="width: 288px"">
						<strong>自设内容20：</strong><br />
						在列表模板页面插入{PH.Label id="自设节点内容" nodeid="@Request_id" num="20"/}
					</td>
					<td>
						<asp:TextBox ID="TextBox20" class="form-control" style="max-width:300px;" Height="65px" runat="server" TextMode="MultiLine" Rows="5" Width="99%"></asp:TextBox>
					</td>
				</tr>
			</tbody>
			<%# Eval("ModelName") %>
		</table>
	</div>
	<div class="tab-pane" id="Tabs6">
		<table width="100%" class="table table-striped table-bordered table-hover" cellpadding="2" cellspacing="1">
			<tbody>
				<tr>
					<td>
						<strong>角色权限：</strong>
					</td>
					<td>
						<ZL:ExGridView ID="Egv" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="RoleID"
							Width="100%">
							<Columns>
								<asp:BoundField DataField="RoleName" HeaderText="角色名">
									<HeaderStyle Width="35%" />
									<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
								</asp:BoundField>
								<asp:TemplateField HeaderText="查看">
									<HeaderStyle Width="10%" />
									<ItemTemplate>
										<asp:CheckBox ID="chkSel1" runat="server" />
									</ItemTemplate>
									<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="录入">
									<HeaderStyle Width="10%" />
									<ItemTemplate>
										<asp:CheckBox ID="chkSel2" runat="server" />
									</ItemTemplate>
									<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="审核">
									<HeaderStyle Width="10%" />
									<ItemTemplate>
										<asp:CheckBox ID="chkSel3" runat="server" />
									</ItemTemplate>
									<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="信息管理">
									<HeaderStyle Width="10%" />
									<ItemTemplate>
										<asp:CheckBox ID="chkSel4" runat="server" />
									</ItemTemplate>
									<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="仅当前节点">
									<HeaderStyle Width="15%" />
									<ItemTemplate>
										<asp:CheckBox ID="chkSel5" runat="server" />
									</ItemTemplate>
									<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="评论管理">
									<ItemTemplate>
										<asp:CheckBox ID="chkSel6" runat="server" />
									</ItemTemplate>
									<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
								</asp:TemplateField>
							</Columns>
						</ZL:ExGridView>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tab-pane" id="Tabs7">
		<table width="100%" class="table table-striped table-bordered table-hover" cellpadding="2" cellspacing="1">
			<!--浏览权限-->
			<tbody>
				<tr>
					<td style="width: 288px">
						<strong>浏览/查看权限：</strong><br />
						栏目权限为继承关系。例如：当父栏目设为“认证栏目”时，子栏目的权限设置将继承父栏目设置，即使子栏目设为“开放栏目”也无效。相反，如果父栏目设为“开放栏目”，子栏目可以设为“半开放栏目”或“认证栏目”。
					</td>
					<td>
						<asp:RadioButton ID="allUser" GroupName="group" Checked="true" runat="server" />开放栏目 任何人（包括游客）可以浏览和查看此栏目下的信息。
						<br />
						<asp:RadioButton ID="moreUser" GroupName="group" runat="server" />半开放栏目 任何人（包括游客）都可以浏览。游客不可查看，其他会员根据会员组的栏目权限设置决定是否可以查看。 
						<br />
						<asp:RadioButton ID="onlyUser" GroupName="group" runat="server" />认证栏目 游客不能浏览和查看，其他会员根据会员组的栏目权限设置决定是否可以浏览和查看。 
						<br />
					</td>
				</tr>
				<tr>
					<td style="width: 288px">
						<strong>允许浏览此栏目的会员组：</strong><br />
						如果栏目是“半开放栏目”或“认证栏目”，请在此设置允许浏览此栏目的会员组
					</td>
					<td>
						<asp:CheckBoxList ID="ViewGroup" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%">
							<asp:ListItem Value="-2">待验证会员</asp:ListItem>
							<asp:ListItem Value="-1">已验证会员</asp:ListItem>
						</asp:CheckBoxList>
					</td>
				</tr>

				<tr>
					<td style="width: 288px">
						<strong>允许查看此栏目下信息的会员组：</strong><br />
						如果栏目是“认证栏目”，请在此设置允许查看此栏目下信息的会员组
如果在信息中设置了查看权限，则以信息中的权限设置优先
					</td>
					<td>
						<asp:CheckBoxList ID="ViewGroup2" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%">
							<asp:ListItem Value="-2">待验证会员</asp:ListItem>
							<asp:ListItem Value="-1">已验证会员</asp:ListItem>
						</asp:CheckBoxList>
				</tr>

				<tr>
					<td style="width: 288px">
						<strong>发表权限：</strong><br />
						请在此设置允许在此栏目发表信息的会员组。
游客没有发表信息权限。
					</td>
					<td>
						<asp:CheckBoxList ID="ViewGroup3" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%">
							<asp:ListItem Value="-2">待验证会员</asp:ListItem>
							<asp:ListItem Value="-1">已验证会员</asp:ListItem>
						</asp:CheckBoxList>
				</tr>

				<tr>
					<td style="width: 288px">
						<strong>评论权限：</strong><br />
					</td>
					<td>
						<asp:CheckBoxList ID="forum" runat="server">
							<asp:ListItem Selected="True" Value="1">允许在此栏目发表评论</asp:ListItem>
							<asp:ListItem Selected="True" Value="2">评论需要审核</asp:ListItem>
						</asp:CheckBoxList>
				</tr>
			</tbody>
			<%# Eval("GroupName")%>
		</table>
	</div>
</div>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td align="center">
&nbsp; &nbsp;
<asp:Button ID="EBtnSubmit" Text="保存" OnClientClick="disableBtn(this);EBtnS();" OnClick="EBtnSubmit_Click" runat="server" CssClass="btn btn-primary" UseSubmitBehavior="false"/>&nbsp;
&nbsp;
<input name="Cancel" type="button" id="BtnCancel" value="取消" class="btn btn-primary" onclick="window.location.href='NodeManage.aspx'" />
</td>
</tr>
</table>
   <ZL:TlpDown runat="server" />
<style>
.tips{ line-height:32px;margin-left:5px;}
th{ text-align:center;}
</style>
<script type="text/javascript" src="/JS/chinese.js" ></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script  type="text/JavaScript">
var tID = 0;
var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6", "TabTitle7", "TabTitle8");
var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2", "Tabs3", "Tabs4", "Tabs5", "Tabs6", "Tabs7", "Tabs8");
function ShowTabs(ID) {
	if (ID != tID) {
		document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
		document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
		document.getElementById(arrTabs[tID].toString()).style.display = "none";
		document.getElementById(arrTabs[ID].toString()).style.display = "";
		tID = ID;
	}
}

var diag=new ZL_Dialog();
function ShowTList(url){
    diag.title="选择模板";
    diag.url=url;
    diag.maxbtn=false;
    diag.ShowModal();
}
function CloseDialog(){
    diag.CloseModal();
}
function showCustom(value) {
	var index = parseInt(value);

	for (i = 2; i <= 20; i++) {
		if (i <= index)
			document.getElementById("Custom" + i).style.display = "";
		else
			document.getElementById("Custom" + i).style.display = "none";
	}
}
function Getpy(ontxt, id) {
	var str = document.getElementById(ontxt).value.trim();
	if (str == "") {
		document.getElementById(id).value = ""; 
		return;
	}  
	var arrRslt = makePy(str);
	if (arrRslt.length > 0) {
		document.getElementById(id).value = arrRslt.toString().toLowerCase();
		if (document.getElementById(id).value.indexOf(',') > -1) {//判断栏目名称有多音字后栏目标识名“，”并去掉逗号后面的数据
			var str = document.getElementById(id).value;
			document.getElementById(id).value = str.split(',',1);
		}
	}
}
function disableBtn(o) { setTimeout(function () { o.disabled = true; }, 50) }
//提交锁定
var namelockflag = false;
var dirlockflag = false;
function CheckNodeName()
{
    if (dirlockflag) { return; }
	var v=$("#TxtNodeName").val()+":"+$("#HdnDepth").val()+":"+$("#HdnParentId").val()+":"+$("#HdnNodeID").val();
	PostToCS2("EditNode.aspx","CheckNodeName",v,function(data){
		if(data=="-1")
		{
		    $("#TxtNodeName").css("color", "red");
		    $("#TxtNodeName").next().text("栏目名重复!");
		    $("#TxtNodeName").next().show();
		}
		else if (data == "-2") {
		    namelockflag = true;
		    $("#EBtnSubmit").attr("disabled", "disabled");
		    $("#TxtNodeName").css("color", "red");
		    $("#TxtNodeName").next().text("同级下栏目名重复!");
		    $("#TxtNodeName").next().show();
		}
		else {
		    namelockflag = false;
		    $("#EBtnSubmit").removeAttr("disabled", "");
		    $("#TxtNodeName").css("color", "black");
		    $("#TxtNodeName").next().hide();
		}
		
	});
}
function CheckNodeDir()
{
    if (namelockflag) { return; }
    var v = $("#TxtNodeDir").val() + ":" + $("#HdnDepth").val() + ":" + $("#HdnParentId").val() + ":" + $("#HdnNodeID").val();
	PostToCS2("EditNode.aspx","CheckNodeDir",v,function(data){
		if(data=="-1")
		{
		    $("#TxtNodeDir").css("color", "red");
		    $("#TxtNodeDir").next().text("栏目标识名重复!")
		    $("#TxtNodeDir").next().show();
		}
		else if (data == "-2") {
		    dirlockflag = true;
		    $("#EBtnSubmit").attr("disabled", "disabled");
		    $("#TxtNodeDir").css("color", "red");
		    $("#TxtNodeDir").next().text("同级下栏目标识名重复!")
		    $("#TxtNodeDir").next().show();
		} else {
		    dirlockflag = false;
		    $("#EBtnSubmit").removeAttr("disabled", "");
		    $("#TxtNodeDir").css("color", "black");
		    $("#TxtNodeDir").next().hide();
		}
		
	});
}
$().ready(function(){
    Tlp_initTemp();
});


</script>
</asp:Content>