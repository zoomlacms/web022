<%@ page language="C#" autoeventwireup="true" inherits="Install_Default, App_Web_c3lymgym" responseencoding="utf-8" enableviewstatemac="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE HTML>
<html>
<head runat="server">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>安装向导_Zoomla!逐浪CMS欢迎您!</title>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="instop">
<div class="container">
<div class="row">
<div class="col-sm-offset-1 col-lg-2">
	<a href="http://www.zoomla.cn/" target="_blank"><img src="/images/logo_w.png" class="img-responsive" alt="欢迎使用逐浪CMS" /></a>
</div>
<div class="col-lg-7">
	<ul>
		<li><a href="http://www.zoomla.cn/" target="_blank">逐浪官网</a></li>
		<li><a href="http://www.zoomla.cn/pub/" target="_blank">最新下载</a></li>
		<li><a href="http://help.zoomla.cn/" target="_blank">帮助支持</a></li>
		<li><a href="http://www.zoomla.cn/shop/" target="_blank">商业授权</a></li>
		<li><a href="http://bbs.zoomla.cn/" target="_blank">技术论坛</a></li>
		<li><a href="http://edu.zoomla.cn/" target="_blank">站长学院</a></li>
	</ul>
</div>
<div class="col-lg-1">
	<form action="http://www.zoomla.cn/search/SearchList.aspx" method="get" target="_blank">
		<div class="searchtxt">
			<div class="input-group pull-right" style="width: 200px;">
				<input name="keyword" type="text" value="官网搜索" id="TxtKeyword" class="form-control" onclick="setEmpty(this)" onblur="settxt(this)" style="width: 150px;" />
				<span class="input-group-btn">
					<input type="submit" name="ButtonSo" value="搜  索" id="ButtonSo" class="btn btn-default" /></span>
			</div>
		</div>
	</form>
</div>
</div>
</div>
</div>
    <style type="text/css">
        .pad_15 {padding:15px;}
    </style>
<form id="form2" runat="server" class="form-horizontal">
<asp:ScriptManager ID="Scriptmanager1" runat="server"></asp:ScriptManager>
<asp:Wizard ID="WzdInstall" OnNextButtonClick="WzdInstall_NextButtonClick" OnFinishButtonClick="WzdInstall_FinishButtonClick" runat="server" ActiveStepIndex="0" DisplaySideBar="False" Width="100%">
<WizardSteps>
<asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
	<div class="insbox">
		<h1>第一步：<strong>阅读许可协议</strong></h1>
		<div class="insbox_txt" style="text-align: center;">欢迎安装Zoomla!逐浪CMS,本向导将引导您部署本系统- 建议您在运行本向导前仔细阅读相关《安装说明》文档并确认在IIS的<font color="yellow">非虚拟目录</font>安装。</div>
		<div style="width: 100%; height: 82%; color: white; background: #282828; font-size: 14px; display: none; position: absolute; left: 0; top: 120px;" ondblclick="this.style.display='none';" id="tata">
			<div style="border-radius: 15px; height: 22px; width: 100%; font-size: 18px; font-weight: bolder; background-color: #bbb; color: #282828; text-align: center; vertical-align: center" onclick="tata.style.display='none';">点击此处隐藏  </div>
			<textarea id="TxtLicense" cols="100" rows="12" runat="server" readonly style="height: 84%"></textarea>
			<div style="border-radius: 15px; height: 22px; width: 100%; font-size: 18px; background-color: #bbb; color: #282828; font-weight: bolder; text-align: center; vertical-align: center" onclick="tata.style.display='none';">点击此处隐藏 </div>
		</div>
		<div onclick="tata.style.display='';tata.focus();return false;" style="margin: auto; margin-top: 20px; cursor: default; border-radius: 15px; line-height: 22px; height: 22px; border: 0px solid #333; background-color: white; text-align: center; color: #333; font-weight: bolder; font-size: 14px; width: 270px">点击显示zoomla!逐浪cms许可协议！</div>
		<div class="lbot" style="margin-top: 3em; margin-bottom: 3em;">
			<span>
				<asp:CheckBox ID="ChlkAgreeLicense" Onclick="ifchecked(this);" runat="server" /><label for="ChlkAgreeLicense">我已阅读并同意协议</label>
			</span>
			<asp:Button ID="StartNextButton" runat="server" Enabled="False" CssClass="btn btn-primary" CommandName="MoveNext" Text="下一步" />
		</div>
		<div class="install" style="margin-top: 10px;">
			<div class="biao" style="margin-top: 0px;">
				<span style="margin-left: 115px;"></span>
			</div>
			<div class="lstup">
				<p>
					<span class="lstrong">安装协议</span>
					<span>运行环境检测</span>
					<span>数据连接</span>
					<span>创建数据库</span>
					<span>配置网站信息</span>
					<span>完成安装</span>
				</p>
			</div>
		</div>
	</div>
</asp:WizardStep>
<asp:WizardStep ID="WizardStep6" runat="server" Title="Step 2">
	<div id="DivInstall6" runat="server">
		<div class="insbox">
			<h1>第二步:<strong>运行环境检测</strong></h1>
			<table cellspacing="0" cellpadding="0" class="ins_table" align="center">
				<tr>
					<td><asp:Label ID="NetVersion_L" runat="server" Style="padding-right: 15px;"></asp:Label></td>
					<td><asp:Image ID="Image1" runat="server" /></td>
					<td rowspan="4" class="pad_15"><div id="lable5" runat="server"></div></td>
					<td rowspan="4" class="pad_15"><div id="img5" runat="server"></div></td>
					<td rowspan="4" class="pad_15"><div id="lable6" runat="server"></div></td>
					<td rowspan="4" class="pad_15"><div id="img6" runat="server"></div></td>
				</tr>
				<tr>
					<td><asp:Label ID="Label2" runat="server"></asp:Label></td>
					<td><asp:Image ID="Image2" runat="server" /></td>
				</tr>
				<tr>
					<td><asp:Label ID="Label3" runat="server"></asp:Label></td>
					<td><asp:Image ID="Image3" runat="server" /></td>
				</tr>
				<tr>
					<td><div id="lable4" runat="server"></div></td>
					<td><div id="img4" runat="server"></div></td>
				</tr>
				<tr>
					<td id="Td1" colspan="2" runat="server"><asp:Label ID="lbltip" runat="server" ForeColor="Red" /></td>
				</tr>
			</table>
			<div class="lbot2">
				<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="MovePrevious" 
					Text="上一步" OnClick="PreviousButtonStep3_Click" CssClass="btn btn-primary" UseSubmitBehavior="false" />
				<asp:Button ID="Button1" runat="server" CommandName="MoveNext" OnClick="NextButtonStep3_Click" Text="下一步" CssClass="btn btn-primary" />
			</div>
			<div class="install" style="margin-top: 10px;">
				<div class="biao" style="margin-top: 0;">
					<span style="margin-left: 230px; _margin-left: 235px;"></span>
				</div>
				<div class="lstup">
					<p>
						<span>安装协议</span>
						<span class="lstrong">运行环境检测</span>
						<span>数据连接</span>
						<span>创建数据库</span>
						<span>配置网站信息</span>
						<span>完成安装</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</asp:WizardStep>
<asp:WizardStep ID="WizardStep2" runat="server" Title="Step 3">
	<div id="DivInstall2" runat="server">
		<div class="insbox">
			<h1>第三步:<strong>配置数据库连接</strong> <small>请确保目标数据库中没有同名表和存储过程。</small></h1>
		</div>
		<div id="checkedshi">
			<div class="container" style="max-width: 620px;">
				<div class="form-group">
					<label for="DropSqlVersion" class="col-sm-2 control-label">数据库版本</label>
					<div class="col-sm-5">
						<asp:DropDownList ID="DropSqlVersion" onchange="sqlselect()" runat="server" class="form-control">
							<asp:ListItem Selected="True" Value="2005">Sql Server 2005及更高版本</asp:ListItem>
							<asp:ListItem Value="Oracle10g">Oracle10g</asp:ListItem>
						</asp:DropDownList>
						<asp:HiddenField ID="HDSql" runat="server" />
					</div>
					<div class="col-sm-5"></div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtDataSource" class="col-sm-2 control-label">数据源地址</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtDataSource" runat="server" class="form-control" onkeydown="return GetEnterCode('focus','TxtDataBase');" Text="(local)"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						如本地:(local)或远程主机名!<asp:RequiredFieldValidator ID="ValrDataSource" runat="server" ControlToValidate="TxtDataSource" ErrorMessage="数据源不能为空!"></asp:RequiredFieldValidator>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtDataBase" class="col-sm-2 control-label">数据库名称</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtDataBase" runat="server" Text="ZoomLa" onkeydown="return GetEnterCode('focus','TxtUserID');" class="form-control"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						<asp:CheckBox ID="cbnewDatabase" name="cbnewDatabase" runat="server" onclick="isSelected(this)" />创建新数据库&nbsp;<%--<br />请确认是否该数据是否存在!--%>&nbsp;
<asp:RequiredFieldValidator ID="ValrDataBase" runat="server" ControlToValidate="TxtDataBase" ErrorMessage="数据库名称不能为空!"></asp:RequiredFieldValidator>
					</div>
					<div class="clearfix"></div>
				</div>

				<!--创库begin -->
				<table id="newDatabase">
					<tr>
						<td colspan="2" class="insp">
							<img src="images/icon.gif" />
							如果您拥有SA权限可以在此直接创建数据库，SA是System Admin全局权限简称，MSSQL2000以上版本默认为禁止登录模式请开启后进行操作，只有正确填写SA帐号信息才能创建相应的权限。<br />
						</td>
					</tr>
					<tr>
						<td class="insp" style="display: inline-block; width: 40px;">SA帐号:</td>
						<td>
							<asp:TextBox ID="sqlmanager" CssClass="form-control" name="sqlmanager" runat="server" onkeydown="return GetEnterCode('focus','sqlmanagerpassword');" Style="width: 220px" Text="sa"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="sqlmanager" ErrorMessage="帐号不能为空!"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td class="insp">密码:</td>
						<td>
							<asp:TextBox ID="sqlmanagerpassword" CssClass="form-control" runat="server" onkeydown="return GetEnterCode('focus','TxtUserID');" TextMode="Password" Style="width: 220px" onblur="checkid(this,'sql_managerpassword')"></asp:TextBox>
							<span id='isnull_sql_managerpassword' style="color: #ff0000; display: none">密码不能为空！</span>
							<asp:HiddenField ID="TxtsqlPwd" runat="server" />
						</td>
					</tr>
				</table>
				<!--创库end -->
				<div class="form-group">
					<label for="TxtUserID" class="col-sm-2 control-label">数据库用户</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtUserID" runat="server" onkeydown="return GetEnterCode('focus','TxtPassword');" class="form-control" Text="ZoomLa"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						有权限访问该数据库的用户名!&nbsp;<asp:RequiredFieldValidator ID="ValrUserID" runat="server" ControlToValidate="TxtUserID" ErrorMessage="数据库用户名称不能为空!"></asp:RequiredFieldValidator>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtPassword" class="col-sm-2 control-label">数据库口令</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" onkeydown="return GetEnterCode('click','NextButtonStep3');" Text="ZoomLa" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						<asp:RequiredFieldValidator ID="ValrPassword" runat="server" ControlToValidate="TxtPassWord" ErrorMessage="数据库用户口令不能为空"></asp:RequiredFieldValidator>
						<asp:HiddenField ID="TxtPwd" runat="server" />
						<asp:Label ID="LblCheckConnectString" Visible="False" runat="server" ForeColor="Red">请检查数据库连接字符串设置是否正确或数据库服务器身份验证模式是否SQL Server和Windows混合模式！</asp:Label>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-12">
						<asp:Button ID="PreviousButtonStep3" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="上一步" OnClick="PreviousButtonStep3_Click" CssClass="btn btn-primary" UseSubmitBehavior="false" />
						<asp:Button ID="NextButtonStep3" runat="server" CommandName="MoveNext" OnClick="NextButtonStep3_Click" Text="下一步" CssClass="btn btn-primary" />
					</div>
				</div>
			</div>
			<div class="lbot2">
			</div>
		</div>
		<div class="install" style="margin-top: 5em;">
			<div class="biao">
				<span style="margin-left: 345px; _margin-left: 350px;"></span>
			</div>

			<div class="lstup">
				<p>
					<span>安装协议</span>
					<span>运行环境检测</span>
					<span class="lstrong">数据连接</span>
					<span>创建数据库</span>
					<span>配置网站信息</span>
					<span>完成安装</span>
				</p>
			</div>
		</div>
	</div>
</asp:WizardStep>
<asp:WizardStep ID="WizardStep3" runat="server" Title="Step 4">
	<div id="DivInstall3" runat="server" class="left140">

		<div class="insbox">
			<h1>第四步：创建数据库表与存储过程</h1>
			<div class="insbox_txt" style="text-align: center;">点击"<strong>开始创建</strong>"按钮开始后将创建数据库表单与存储过程，大约需要1～2分钟请耐心等候。</div>
			<div class="ins_biao">
				<label style="padding-top: 6em; color: yellow" for="ChlkIsCreateDataBase">↓点击下方按钮创建表与存储过程，提示成功后点下一步继续</label>
				<small>(如已手工预执行点此<asp:CheckBox ID="ChlkIsCreateDataBase" runat="server" AutoPostBack="True" OnCheckedChanged="ChlkIsCreateDataBase_CheckedChanged" />勾选略过:不推荐)。</small>。
				<asp:UpdatePanel ID="UpdatePanel1" runat="server">
					<ContentTemplate>
						<table>
							<tr>
								<td>
									<asp:UpdateProgress ID="UpdateProgress1" runat="server">
										<ProgressTemplate>
											正在创建数据表与存储过程...&nbsp;
										</ProgressTemplate>
									</asp:UpdateProgress>
								</td>
							</tr>
							<tr>
								<td>
									<asp:Button ID="BtnCreateDateBase" runat="server" OnClientClick="ShowProgress();disBtn(this);" Text="开始创建" OnClick="BtnCreateDateBase_Click" Width="70" Height="26" />
								</td>
							</tr>
						</table>
					</ContentTemplate>
				</asp:UpdatePanel>
			</div>
			<div class="lbot2">
				<asp:Button ID="PreviousButtonStep4" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="上一步" OnClick="PreviousButtonStep4_Click" CssClass="btn btn-primary" UseSubmitBehavior="false" />
				<asp:Button ID="NextButtonStep4" runat="server" Text="下一步" CssClass="btn btn-primary" OnClick="NextButtonStep4_Click1" />
			</div>
			<div class="clearfix"></div>
			<div class="install" style="_margin-top: 60px; margin-top: 40px;">
				<div class="biao" style="margin-top: 0px; _margin-top: 0px;">
					<span style="margin-left: 450px; _margin-left: 455px;"></span>
				</div>
				<div class="lstup">
					<p>
						<span>安装协议</span>
						<span>运行环境检测</span>
						<span>数据连接</span>
						<span class="lstrong">创建数据库</span>
						<span>配置网站信息</span>
						<span>完成安装</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</asp:WizardStep>
<asp:WizardStep ID="WizardStep4" runat="server" Title="Step 5">
	<div id="DivInstall4" runat="server" class="left140">
		<div class="insbox">
			<h1>第五步：配置网站基本信息<small>也可安装完成进入后台配置更新此信息</small></h1>
		</div>
		<div class="container" style="max-width: 620px;">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="TxtSiteName" class="col-sm-2 control-label">网站名称</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtSiteName" runat="server" Text="逐浪CMS" onkeydown="return GetEnterCode('focus','TxtSiteTitle');" class="form-control"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtSiteName" ErrorMessage="网站名称不能为空!"></asp:RequiredFieldValidator>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtSiteTitle" class="col-sm-2 control-label">网站标题</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtSiteTitle" runat="server" Text="逐浪CMS" onkeydown="return GetEnterCode('focus','TxtSiteUrl');" class="form-control"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						<asp:RequiredFieldValidator ID="ValrSiteTitle" runat="server" ControlToValidate="TxtSiteTitle" ErrorMessage="网站标题不能为空!"></asp:RequiredFieldValidator>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtSiteUrl" class="col-sm-2 control-label">网站地址</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtSiteUrl" runat="server" onkeydown="return GetEnterCode('focus','TxtEmail');" class="form-control"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						<asp:RequiredFieldValidator ID="ValrSiteUrl" runat="server" ControlToValidate="TxtSiteUrl" ErrorMessage="网站地址不能为空!"></asp:RequiredFieldValidator>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtEmail" class="col-sm-2 control-label">E-mail</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtEmail" runat="server" onkeydown="return GetEnterCode('focus','TxtAdminPassword');" class="form-control" Text="web@Zoomla.cn"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Email不能为空!" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
							ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email格式不正确" ControlToValidate="TxtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtAdminName" class="col-sm-2 control-label">管理员名称</label>
					<div class="col-sm-5">
						<asp:TextBox CssClass="form-control" ID="TxtAdminName" runat="server" Enabled="False">admin</asp:TextBox>
					</div>
					<div class="col-sm-5">
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtAdminPassword" class="col-sm-2 control-label">管理员密码</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtAdminPassword" runat="server" TextMode="Password" onkeydown="return GetEnterCode('focus','TxtAdminPasswordAgain');" class="form-control"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						不少于6位字母数字组合
						<asp:RegularExpressionValidator ID="ValgTextMaxLength" ControlToValidate="TxtAdminPassword"
							ValidationExpression="^[a-zA-Z0-9_\u4e00-\u9fa5\@\.]{6,40}$" SetFocusOnError="false"
							runat="server" Display="Dynamic" ErrorMessage="密码少于六位"></asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="ValrAdminPassword" runat="server" ControlToValidate="TxtAdminPassword" ErrorMessage="管理员密码不能为空!"></asp:RequiredFieldValidator>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="TxtAdminPasswordAgain" class="col-sm-2 control-label">确认密码</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtAdminPasswordAgain" runat="server" onkeydown="return GetEnterCode('click','NextButtonStep5');" TextMode="Password" class="form-control"></asp:TextBox>

					</div>
					<div class="col-sm-5">
						<asp:RequiredFieldValidator ID="ValrAdminPasswordAgain" runat="server" ControlToValidate="TxtAdminPasswordAgain"
							ErrorMessage="确认密码不能为空!" Display="Dynamic"></asp:RequiredFieldValidator><asp:CompareValidator ID="ValcAdminPasswordAgain" runat="server" ErrorMessage="两次密码不相同" ControlToCompare="TxtAdminPassword" ControlToValidate="TxtAdminPasswordAgain"></asp:CompareValidator>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="form-group">
					<label for="TxtCustomPath" class="col-sm-2 control-label">后台路径</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtCustomPath" runat="server" onkeydown="return GetEnterCode('focus','TxtSiteManageCode');" class="form-control" Text="Admin" MaxLength="10" onkeyup="value=value.replace(/[^\w]/ig,'');check(this);" Title="请输入最少三位,最多十位,可英文与数字组合" />
					</div>
					<div class="col-sm-5">
						<span id="Remind1" style="color: #BFDFFF;">*安装完成后可在后台进行配置</span>
						<script type="text/javascript">
							function check(obj) {
								if (obj.value.length > 9 || obj.value.length < 4) {
									Remind1.style.color = "red";
									Remind1.innerText = "最少三位,最多不能超过十位,英文或数字";
								}
								else {
									Remind1.style.color = "#BFDFFF"
									Remind1.innerText = "*安装完成后可在后台进行配置";
								}
							}
							function check2(obj) {
								if (obj.value.length < 1) {
									Remind2.style.color = "red";
									Remind2.innerText = "后台管理认证码不能为空";
								}
								else {
									Remind2.style.color = "#BFDFFF"
									Remind2.innerText = "*初始为不开通管理认证码功能";
								}
							}
						</script>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtCustomPath" Display="None" ErrorMessage="后台路径不能为空,最小三位!"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TxtCustomPath"
							ValidationExpression="^[a-zA-Z0-9_\u4e00-\u9fa5\@\.]{3,10}$" SetFocusOnError="false"
							runat="server" Display="None" ErrorMessage="后台路径不能少于三位"></asp:RegularExpressionValidator>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="form-group">
					<label for="TxtSiteManageCode" class="col-sm-2 control-label">管理认证码</label>
					<div class="col-sm-5">
						<asp:TextBox ID="TxtSiteManageCode" runat="server" Text="8888" onkeydown="return GetEnterCode('click','NextButtonStep5');" class="form-control" onkeyup="check2(this)"></asp:TextBox>
					</div>
					<div class="col-sm-5">
						<span id="Remind2" style="color: #BFDFFF;">*初始为不开通管理认证码功能</span>
						<asp:RequiredFieldValidator ID="ValrSiteManageCode" runat="server" ControlToValidate="TxtSiteManageCode" Display="None" ErrorMessage="后台管理认证码不能为空!"></asp:RequiredFieldValidator>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-12">
						<asp:Button ID="PreviousButtonStep5" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="上一步" CssClass="btn btn-primary" UseSubmitBehavior="false" />
						<asp:Button ID="NextButtonStep5" runat="server" CommandName="MoveNext" OnClick="NextButtonStep5_Click" Text="下一步" CssClass="btn btn-primary" />
					</div>
				</div>
		</div>
		<div class="lbot2"></div>
		<div class="clearfix"></div>
		<div class="install" style="margin-top: 3em;">
			<div class="biao"><span style="margin-left: 570px; _margin-left: 580px;"></span></div>
			<div class="lstup">
				<p>
					<span>安装协议</span>
					<span>运行环境检测</span>
					<span>数据连接</span>
					<span>创建数据库</span>
					<span class="lstrong">配置网站信息</span>
					<span>完成安装</span>
				</p>
			</div>
		</div>
	</div>
</asp:WizardStep>
<asp:WizardStep ID="WizardStep5" runat="server" Title="Step 6">
	<div id="DivIntallComplete" runat="server" class="left140">
		<div class="insbox">
			<h1>第六步：恭喜完成安装！</h1>
			<div class="insbox_txt" style="width: 300px; margin: auto; padding-left: 0px; margin-top: 50px;">
				已经成功安装，<br />
				请点击“<strong>完成安装</strong>”按钮跳转到首页。<br />
				<br />
				<br />
				<input id="HdnPassword" type="hidden" visible="False" runat="server" />
				<asp:Button ID="PreviousButtonFinish" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="重新配置" CssClass="btn btn-primary" UseSubmitBehavior="false" />
				<input name="Finish" class="btn btn-primary" type="button" id="Finish" value="完成安装" onclick="javascript: window.location.href = '../Default.aspx'" />
			</div>
			<div class="center"></div>
			<div class="install" style="margin-top: 100px;">
				<div class="biao" style="margin-top: 0px;">
					<span style="margin-left: 685px; _margin-left: 695px;"></span>
				</div>
				<div class="lstup">
					<p>
						<span>安装协议</span>
						<span>运行环境检测</span>
						<span>数据连接</span>
						<span>创建数据库</span>
						<span>配置网站信息</span>
						<span class="lstrong">完成安装</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</asp:WizardStep>
</WizardSteps>
<StepNavigationTemplate>
<center></center>
</StepNavigationTemplate>
<StartNavigationTemplate></StartNavigationTemplate>
<FinishNavigationTemplate></FinishNavigationTemplate>
</asp:Wizard>
</form>
<div id="bottom">
&copy; Copyright
<script type="text/javascript">
var year = "";
mydate = new Date();
myyear = mydate.getYear();
year = (myyear > 200) ? myyear : 1900 + myyear;
document.write(year);
</script>
All rights reserved 逐浪软件zoomla.cn版权所有  经营许可证号:工商3601002021063<br />
网警备案号:3601040103  商业订购与技术支持热线：021-50391046/13177777714<br />
</div>
</body>
</html>
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script>
function ShowProgress() {
var labelDoingID = document.getElementById("LblCreateDataProgress");
var labelBeforeID = document.getElementById("LblCreateDataBaseBefore");

if (labelDoingID != null) {
	labelDoingID.style.visibility = "visible";
}
if (labelBeforeID != null) {
	labelBeforeID.innerText = "正在创建数据库。";
}
}
function ifchecked(obj) {
if (obj.checked) {
	document.getElementById("StartNextButton").disabled = false;
}
if (!obj.checked) {
	document.getElementById("StartNextButton").disabled = true;
}
return false;

}
function isSelected(obj) {
if (obj.checked) {
	document.getElementById("newDatabase").style.display = "block";
	document.getElementById("confirmPassword").style.display = "block";
	document.getElementById("checkedshi").style.height = "150px";
}
else {
	document.getElementById("newDatabase").style.display = "none";
	document.getElementById("confirmPassword").style.display = "none";
	document.getElementById("checkedshi").style.height = "";
}
}
function checkid(obj, id) {
var v = obj.value;
if (v.length == 0)
	$('#isnull_' + id).show();
else
	$('#isnull_' + id).hide();
}

//搜索关键字
function setEmpty(obj) {
if (obj.value == "官网搜索") {
	obj.value = "";
}
}
function settxt(obj) {
if (obj.value == "") {
	obj.value = "官网搜索";
}
}
function sqlselect() {
if ($("#DropSqlVersion").val() == "Oracle10g") {
	alert('抱歉，该版本仅对商业用户开放，请选择其它版本或联系逐浪软件取得授权。');
	window.open('http://www.zoomla.cn/corp/about/83.shtml', '', '');
}
}
</script>