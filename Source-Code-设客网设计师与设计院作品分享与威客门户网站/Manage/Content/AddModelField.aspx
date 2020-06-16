<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_AddModelField, App_Web_ckin0fxz" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title>字段管理</title>
    <style type="text/css">
        .modeldesc {color:#808000;}
    </style>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" runat="Server">
<ol class="breadcrumb">
<li><a href="<%=customPath2 %>I/Main.aspx">工作台</a></li>
<li><a href="<%=customPath2 %>I/Config/SiteOption.aspx">系统设置</a></li>
<li><a href="ModelManage.aspx?ModelType=<%=Request.QueryString["ModelType"] %>"><%=bll.GetModelType(Convert.ToInt32(Request.QueryString["ModelType"]))%></a></li>
<li><a href="ModelField.aspx?ModelId=<%=Request.QueryString["ModelID"] %>&ModelType=<%=Request.QueryString["ModelType"] %>">字段列表</a></li>
<li><asp:Label ID="lblModel" runat="server" Text="Label"></asp:Label>当前表:<asp:Label ForeColor="Red" Style="margin-left: 5px;" ID="Label1" runat="server" Text=""></asp:Label></li>
<%= Call.GetHelp(64) %>
</ol>
<table class="table table-striped table-bordered table-hover">
<tr>
	<td class="td_l">
		<strong>字段别名：</strong>
	</td>
	<td>
		<asp:TextBox ID="Alias" runat="server" CssClass="form-control text_md" MaxLength="20" onkeyup="Getpy('Alias','Name')" />
		<span class="tips rd_red">*</span>
		<span class="tips modeldesc">如：文章标题</span>
	</td>
</tr>
<tr>
	<td>
		<strong>字段名称：</strong>
	</td>
	<td>
		<asp:TextBox ID="Name" MaxLength="50" CssClass="form-control text_md" runat="server" />
		<span class="tips rd_red">*</span>
		<span class="tips modeldesc">字段名由字母、数字、下划线组成，不接受空格</span>
	</td>
</tr>
<tr>
	<td>
		<strong>字段提示：</strong>
	</td>
	<td>
		<asp:TextBox ID="Tips" CssClass="form-control text_md" MaxLength="50" runat="server" />
		<span class="tips modeldesc">显示在字段别名下方作为重要提示的文字</span>
	</td>
</tr>
<tr>
	<td>
		<strong>字段描述：</strong>
	</td>
	<td>
		<asp:TextBox ID="Description" Style="height:78px;" CssClass="form-control text_300" runat="server" TextMode="MultiLine" />
	</td>
</tr>
<%--<tr runat="server" visible="false">
    <td><strong>操作权限:</strong></td>
    <td>
         <asp:TextBox runat="server" ID="EditAuth_T" ReadOnly="true"  Style="height:78px;" CssClass="form-control text_300" TextMode="MultiLine" />
         <asp:HiddenField runat="server" ID="EditAuth_Hid" />
         <input type="button" class="btn btn-primary" value="选择用户" onclick="ShowSelUser('EditAuth');" />
         <div style="color: #808000">为空不限定用户,否则只有指定用户才可修改控件的值(仅用于OA)</div>
    </td>
</tr>--%>
  <tr>
	<td><strong>是否启用：</strong></td>
    <td>
        <input type="checkbox" runat="server" id="rblCopy" class="switchChk" checked="checked" />
        <span class="modeldesc">如果您暂时不需要使用此字段，可设为禁用从而避免录入</span>
    </td>
</tr>
<tr>
	<td><strong>前台显示：</strong></td>
    <td>
        <input type="checkbox" runat="server" id="IsShow" class="switchChk" checked="checked" />
        <span class="modeldesc">选择“否”可作为相关隐藏识别符而不能输出在前台(仅能后台录入)</span>
    </td>
</tr>
<tr>
	<td><strong>是否必填：</strong></td>
	<td><input type="checkbox" runat="server" id="IsNotNull" class="switchChk" /></td>
</tr>
<tr>
	<td>
		<strong>设为下载专用字段：</strong>
	</td>
	<td>
		<input type="checkbox" runat="server" id="SetDownFiled" class="switchChk" onchange="$('#SetDownFiled_Btn').click();" /><span style="color: #808000;"> 启用此选项将关联下载服务器↓↓</span>
		<asp:Button runat="server" ID="SetDownFiled_Btn" style="display:none;" />
	</td>
</tr>
<tr class="tdbg" id="downserver" runat="server" visible="false">
	<td>
		<strong>关联下载服务器：</strong><br />
		[<a href="../file/DownServerManage.aspx" target="_blank">管理下载服务器</a>]
	</td>
	<td>
		<asp:DropDownList ID="serverlist" runat="server" CssClass="form-control text_300"></asp:DropDownList>
	</td>
</tr>
<tr>
	<td>
		<strong>是否批量添加：</strong>
	</td>
	<td>
		<div>
			 <input type="checkbox" runat="server" id="Islotsize" class="switchChk" />
			 <span style="color: #808000;">字段类型只允许文本类型</span>
		</div>
	</td>
</tr>
<tr>
	<td>
		<strong>是否允许内链：</strong>
	</td>
	<td>
		 <input type="checkbox" runat="server" id="IsChain" class="switchChk" />
	</td>
</tr>
<tbody>
	<tr>
		<td><strong>是否在搜索表单显示：</strong></td>
		<td><input type="checkbox" runat="server" id="IsSearchForm" class="switchChk" /></td>
	</tr>
</tbody>
<tr>
	<td>
		<strong>字段类型：</strong>
	</td>
	<td>
		<asp:RadioButtonList ID="Type" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" onclick="SelectModelType()"></asp:RadioButtonList>
	</td>
</tr>
<!--  单行文本   -->
<tbody id="DivTextType" runat="server">
	<tr>
		<td><strong>文本框长度：</strong></td>
		<td>
			<asp:TextBox ID="TitleSize" CssClass="form-control text_s" runat="server" MaxLength="4">300</asp:TextBox><span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td><strong>是否为密码：</strong></td>
		<td><input type="checkbox" runat="server" id="IsPassword" class="switchChk" /></td>
	</tr>
	<tr>
		<td><strong>默认值：</strong></td>
		<td>
			<asp:TextBox ID="TextType_DefaultValue" CssClass="form-control text_md" runat="server" Text="{nowuser}|匿名|本站作者" />
            <span class="rd_green">以|号分隔</span>
		</td>
	</tr>
    <tr><td><strong>扩展选项：</strong></td><td>
        <asp:CheckBox runat="server" ID="Text_SelVideo_Chk" Text="选择视频" />
        <asp:CheckBox runat="server" ID="Text_SelIcon_Chk" Text="BootStrap图标" /></td></tr>
</tbody>
<!--  多行文本(不支持Html)-->
<tbody runat="server" id="DivMultipleTextType" style="display: none">
	<tr>
		<td><strong>显示的宽度：</strong></td>
		<td>
			<asp:TextBox ID="MultipleTextType_Width" CssClass="form-control text_x" runat="server" MaxLength="4">500</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td><strong>显示的高度：</strong></td>
		<td>
			<asp:TextBox ID="MultipleTextType_Height" CssClass="form-control text_x" runat="server"  MaxLength="4">200</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
    <tr><td><strong>扩展功能：</strong></td>
        <td>
            <asp:CheckBox runat="server" id="MText_SelUser_Chk" Text="选择用户" />
            <asp:CheckBox runat="server" ID="MText_Down_Chk" Text="下载字段" />
        </td>
    </tr>
</tbody>
<!--  多行文本(支持Html)    -->
<tbody runat="server" id="DivMultipleHtmlType" style="display: none">
	<tr>
		<td>
			<strong>编辑器类型：</strong>
		</td>
		<td>
			<asp:DropDownList ID="IsEditor" CssClass="form-control text_md" runat="server">
				<asp:ListItem Value="1">简洁型编辑器</asp:ListItem>
				<asp:ListItem Value="4">简单型编辑器</asp:ListItem>
				<asp:ListItem Value="2">标准型编辑器</asp:ListItem>
				<asp:ListItem Value="3">增强型编辑器</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
    <tr><td><strong>扩展图片</strong></td>
        <td>
            <input type="checkbox" id="Topimg_Chk" runat="server" class="switchChk" />
            <input type="text" value="Topimg" disabled="disabled" class="form-control text_md" /><span class="rd_green">字段名必须为TopImg,编辑界面显示为"主编辑器扩展图",只能唯一</span>
        </td>
    </tr>
	<tr>
		<td><strong>允许Word转换：</strong></td>
		<td><input type="checkbox" id="AllowWord_Chk" runat="server" checked="checked" class="switchChk" /></td>
	</tr>
	<tr>
		<td>
			<strong>显示的宽度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MultipleHtmlType_Width" runat="server" CssClass="form-control text_x" MaxLength="4">715</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示的高度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MultipleHtmlType_Height" runat="server" CssClass="form-control text_x" MaxLength="4">400</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
</tbody>
<!--  单选项    -->
<tbody id="DivOptionType" style="display: none" runat="server">
	<tr>
		<td>
			<strong>分行键入每个选项：</strong>
		</td>
		<td>
			<input id="Button3" type="button" value="从数据字典中选择选项" class="btn btn-primary" onclick="SelectDictionary('RadioType_Content');" />
			<input id="Button5" type="button" value="添加数据字段" class="btn btn-primary" style="width: 150px;" onclick='SubPage("RadioType_Content");' /><br />
			<asp:TextBox ID="RadioType_Content" runat="server" Style="margin-top: 5px;" TextMode="MultiLine"  CssClass="form-control text_300" Height="80px" />
			<span style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="RadioType_Default" CssClass="form-control text_300"  runat="server" />
			<span class="tips" style="color: #808000">注：没有数据录入的默认值，与前台显示无关.</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示选项：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="RadioType_Type" runat="server" RepeatColumns="2">
				<asp:ListItem Selected="True" Value="1">单选下拉列表框</asp:ListItem>
				<asp:ListItem Value="2">单选按钮</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>是否设置属性值：</strong>
		</td>
		<td>
        <input type="checkbox" id="RadioType_Property" runat="server" checked="checked" class="switchChk" />			 
		</td>
	</tr>
</tbody>
<!--  多选项    -->
<tbody runat="server" id="DivListBoxType" style="display: none">
	<tr>
		<td>
			<strong>分行键入每个选项：</strong>
		</td>
		<td>
			<input id="Button4" type="button" value="从数据字典中选择选项" class="btn btn-primary" onclick="SelectDictionary('ListBoxType_Content');" />
			<input id="Button6" type="button" value="添加数据字段" class="btn btn-primary" onclick="SubPage('ListBoxType_Content');" /><br />
			<asp:TextBox ID="ListBoxType_Content" Style="margin-top: 5px;" runat="server" TextMode="MultiLine" Height="80px" Width="285px" CssClass="form-control pull-left" />
			<span style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示选项：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="ListBoxType_Type" runat="server" RepeatColumns="3">
				<asp:ListItem Selected="True" Value="1">复选框</asp:ListItem>
				<asp:ListItem Value="2">多选列表框</asp:ListItem>
				<asp:ListItem Value="3">多填选项框</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
</tbody>
<!--  日期型    -->
<tbody runat="server" id="DivDateType" style="display: none">
	<tr>
		<td>
			<strong>日期类型：</strong>
		</td>
		<td>
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td>
						<asp:RadioButtonList ID="DateSearchType" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="0" Selected="True">默认空</asp:ListItem>
							<asp:ListItem Value="1">自抽取</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<asp:TextBox ID="DateSearchRang" CssClass="form-control pull-left" runat="server" TextMode="MultiLine" Columns="40" Rows="6" Height="78px" Width="248px" Visible="false" />
						<asp:RadioButtonList ID="DateSearchUnit" runat="server" RepeatDirection="Horizontal" Visible="false">
							<asp:ListItem Value="0" Selected="True">小时</asp:ListItem>
							<asp:ListItem Value="1">天</asp:ListItem>
							<asp:ListItem Value="2">月</asp:ListItem>
							<asp:ListItem Value="3">年</asp:ListItem>
						</asp:RadioButtonList>
					</td>
					<td>
						<span style="color: red; display: none;">选择了自定范围时请输入此项内容,格式：范围名|范围<br />
							分行输入范围，单位选择 天 如：<br />
							3天内|0-3<br />
							7天内|0-7<br />
							7天-15天|7-15<br />
							1个月内|0-30</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</tbody>
<!--  图片类型    -->
<tbody runat="server" id="DivPicType" style="display: none">
	<tr>
		<td><strong>图片是否加水印：</strong></td>
		<td>
        	<input type="checkbox" id="RBLPicWaterMark" runat="server" checked="checked" class="switchChk" />		 
		</td>
	</tr>
	<tr>
		<td><strong>开启选择已上传文件：</strong></td>
		<td>
			<asp:RadioButtonList ID="rblSelUpfile" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="1">是</asp:ListItem>
				<asp:ListItem Selected="True" Value="0">否</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<td><strong>允许上传的图片大小：</strong></td>
		<td>
			<asp:TextBox ID="TxtSPicSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的图片类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtPicExt" CssClass="form-control pull-left" Style="max-width: 200px;" Text="jpg|png|gif|bmp|jpeg" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--组图-->
<tbody id="DivImages" style="display: none">
        <tr>
            <td><strong>允许上传的图片类型：</strong></td>
            <td>
                <asp:TextBox ID="TextBox1" CssClass="form-control pull-left" Text="jpg,png,gif,bmp" Style="max-width: 200px;" runat="server" Columns="30" />
                <span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“,”号分割</span>
            </td>
        </tr>
        <tr>
            <td><strong>是否开启水印</strong></td>
            <td>
                <input type="checkbox" id="IsWater_Images" class="switchChk" runat="server" />
            </td>
        </tr>
    </tbody>
<!--  多图片    -->
<tbody runat="server" id="DivMultiPicType" style="display: none">
	<tr>
		<td><strong>缩略图选项：</strong></td>
		<td>
			<span class="tips" style="float: left; margin-left: 0;">
				<asp:CheckBox ID="ChkThumb" runat="server" Text="是否保存缩略图地址" />保存缩略图地址字段：</span>
			<asp:TextBox ID="TxtThumb" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" Columns="20" />
			<span style="color: Red; display: none;">保存缩略图地址字段名不能与主字段名重复！</span>
		</td>
	</tr>
	<tr>
		<td><strong>图片是否加水印：</strong></td>
		<td>
        <input type="checkbox" id="RBLWaterMark" runat="server" checked="checked" class="switchChk" />			 
		</td>
	</tr>
	<tr>
		<td><strong>允许上传的图片大小：</strong></td>
		<td>
			<asp:TextBox ID="TxtPicSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td><strong>允许上传的图片类型：</strong></td>
		<td>
			<asp:TextBox ID="TextImageType" CssClass="form-control pull-left" Text="jpg|png|gif|bmp|jpeg" Style="max-width: 200px;" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--  图片入库    -->
<tbody runat="server" id="DivSqlType" style="display: none">
	<tr>
		<td><strong>允许上传的图片大小：</strong></td>
		<td>
			<asp:TextBox ID="TxtMaxPicSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：仅支持2005及更高SQL Server版本</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td><strong>允许上传的图片类型：</strong></td>
		<td>
			<asp:TextBox ID="TxtPicSqlType" CssClass="form-control pull-left" Style="max-width: 200px;" Text="jpg|png|gif|bmp|jpeg" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--  文件入库    -->
<tbody runat="server" id="DivSqlFile" style="display: none">
	<tr>
		<td><strong>允许上传的文件大小：</strong></td>
		<td>
			<asp:TextBox ID="TxtMSqlFileSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：仅支持2005及更高SQL Server版本</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtSqlFiletext" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|zip|docx|pdf" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：rar|zip|doc|docx等等</span>
		</td>
	</tr>
</tbody>
<!--  文件类型    -->
<tbody runat="server" id="DivSmallFileType" style="display: none">
	<tr>
		<td><strong>允许上传的文件大小：</strong></td>
		<td>
			<asp:TextBox ID="TxtMaxFileSizes" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>开启选择已上传文件：</strong>
		</td>
		<td>
            <input id="rblSelUploadFile" type="checkbox" class="switchChk" runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtUploadFileTypes" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|zip|docx|pdf" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：rar|jpg|gif|bmp等等</span>
		</td>
	</tr>
    <tr>
        <td>
            <strong>大文件上传：</strong>
        </td>
        <td>
            <input id="isBigFile" type="checkbox" class="switchChk" runat="server" />
        </td>
    </tr>
</tbody>
<!--  下拉文件类型    -->
<tbody runat="server" id="DivPullFileType" style="display: none">
	<tr>
		<td>
			<strong>文件路径：</strong>
		</td>
		<td>
			<asp:TextBox ID="PullFileText" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" />
			<span class="tips" style="color: Blue">填写图片存储的路径如：UploadFiles/demo</span>
		</td>
	</tr>
</tbody>
<!--  多文件类型    -->
<tbody runat="server" id="DivFileType" style="display: none">
	<tr>
		<td>
			<strong>保存文件大小设置：</strong>
		</td>
		<td>
			<span style="float: left; line-height: 32px;">
				<asp:CheckBox ID="ChkFileSize" runat="server" Text="是否保存文件大小" Checked="false" /><strong style="margin-left: 5px;">保存文件大小字段名：</strong></span>
			<asp:TextBox ID="TxtFileSizeField" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" Columns="20" />
			<span style="color: Red; display: none;">注：字段名由字母、数字、下划线组成，并且仅能字母开头，不以下划线结尾。不能与已有字段名重复</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>选项：</strong>
		</td>
		<td>
			<asp:CheckBox ID="IsSwfFileUpload" runat="server" Text="是否智能多文件上传" Checked="false" /><br />
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMaxFileSize" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtUploadFileType" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|zip|docx|pdf" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span>
			<span class="tips" style="color: Blue">注：允许多个类型请用"|"号分割，如：rar|jpg|gif|bmp 等等</span>
		</td>
	</tr>
</tbody>
<!--  单选 多选    -->
<tbody runat="server" id="DivOperatingType" style="display: none">
	<tr>
		<td>
			<strong>分行键入</strong><br />
			每个平台选项：
		</td>
		<td>
			<asp:TextBox ID="TxtOperatingOption" CssClass="form-control pull-left" runat="server" TextMode="MultiLine" Style="max-width: 300px;" Columns="40" Rows="6" />
			<span style="color: red">*</span> <span style="color: blue">注：一行一个默认项</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>文本框长度：</strong>
		</td>
		<td>
			<asp:TextBox ID="OperatingType_TitleSize" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="10" MaxLength="4">35</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="OperatingType_DefaultValue" Text="Win2000|XP|Win2003" Style="max-width: 200px;" CssClass="form-control pull-left" runat="server" Columns="30" />
			<span class="tips" style="color: green">例：Win2000|XP|Win2003</span>
		</td>
	</tr>
</tbody>
<!--  超链接    -->
<tbody runat="server" id="DivSuperLinkType" style="display: none">
	<tr>
		<td>
			<strong>文本框长度：</strong>
		</td>
		<td>
			<asp:TextBox ID="SuperLinkType_TitleSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">50</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="SuperLinkType_DefaultValue" runat="server" Columns="30" Style="max-width: 200px;" CssClass="form-control pull-left" />
			<span class="tips" style="color: green">例：http://127.0.0.1/</span>
		</td>
	</tr>
</tbody>
<!--  多级选项    -->
<tbody runat="server" id="DivGradeOptionType" style="display: none">
	<tr>
		<td>
			<strong>选择分级数据分类：</strong>
		</td>
		<td>
			<asp:DropDownList ID="GradeOptionType_Cate" CssClass="form-control" runat="server" Style="max-width: 200px;"></asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>选项下拉框排列格式化：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="GradeOptionType_Direction" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="0" Selected="True">一行横排</asp:ListItem>
				<asp:ListItem Value="1">多行竖排</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
</tbody>
<!--  数字类型    -->
<tbody runat="server" id="DivNumType" style="display: none">
	<tr>
		<td>
			<strong>文本框长度：</strong>
		</td>
		<td>
			<asp:TextBox ID="NumberType_TitleSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">35</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>数字类型：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="NumberType_Style" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Selected="True" Value="1" onclick="show(this.value);">整数</asp:ListItem>
				<asp:ListItem Value="2" onclick="show(this.value);">小数</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr id="showdec" style="display: none">
		<td>
			<strong>小数位：</strong>
		</td>
		<td>
			<asp:TextBox ID="txtdecimal" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Text="2" />
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="NumberType_DefaultValue" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" Columns="10" />
		</td>
	</tr>
</tbody>
<!-- 双时间字段 -->
<tbody id="DivDoubleDateType" style="display: none" runat="server"></tbody>
<!--颜色代码-->
<script type="text/javascript">
    function SelectColors(t, clientId) {
	    var url = "/Common/SelectColor.aspx?d=f&t=6";
		var old_color = (document.getElementById(clientId).value.indexOf('#') == 0) ? '&' + document.getElementById(clientId).value.substr(1) : '&' + document.getElementById(clientId).value;
		var color = "";
		if (document.all) {
			color = showModalDialog(url + old_color, "", "dialogWidth:18.5em; dialogHeight:16.0em; status:0");
			if (color != null) {
				document.getElementById(clientId).value = color;
			} else {
				document.getElementById(clientId).focus();
			}
		} else {
			color = window.open(url + '&' + clientId, "hbcmsPop", "top=200,left=200,scrollbars=yes,dialog=yes,modal=no,width=300,height=260,resizable=yes");
		}
	}
</script>
<tbody id="DivColorType" style="display: none" runat="server">
	<tr>
		<td>
			<strong>默认颜色值：</strong>
		</td>
		<td>
			<asp:TextBox ID="ColorDefault" CssClass="form-control text_s" runat="server" Style="max-width: 100px;" MaxLength="7" Columns="7" />
            <span class="glyphicon glyphicon-text-color" title="颜色选择" style="font-size:20px;cursor:pointer;" onclick="SelectColors(this,'ColorDefault')"></span>
		</td>
	</tr>
</tbody>
<!--Office转换为falsh-->
<tbody runat="server" id="DivUpload" style="display: none">
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TextBox2" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TextBox3" CssClass="form-control pull-left" Style="max-width: 200px;" Text="doc|docx|txt|pdf|xls|xlsx" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：doc|xls|pdf等等</span>
		</td>
	</tr>
</tbody>
<!--google地图-->
<tbody runat="server" id="DivGoogleMapType" style="display: none">
	<tr>
		<td>
			<strong>显示的宽度：</strong>
		</td>
		<td>
			<asp:TextBox ID="WidthTxt" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="10" MaxLength="4">500</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示的高度：</strong>
		</td>
		<td>
			<asp:TextBox ID="HeigthTxt" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="10" MaxLength="4">200</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
</tbody>
<!--智能多文件上传-->
<tbody runat="server" id="DivSwfFileUpload" style="display: none">
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMaxFileSize1" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtUploadFileType1" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|jpg|gif|bmp" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span>
			<span class="tips" style="color: Blue">注：允许多个类型请用"|"号分割，如：rar|jpg|gif|bmp 等等</span>
		</td>
	</tr>
</tbody>
<!--远程文件-->
<tbody runat="server" id="DivRemoteFile" style="display: none">
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMaxFileSize2" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtUploadFileType2" CssClass="form-control text_md" Text="rar|jpg|gif|bmp" runat="server" />
			<span class="tips" style="color: red">*</span>
			<span class="tips" style="color: Blue">注：允许多个类型请用"|"号分割，如：rar|jpg|gif|bmp 等等</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>FTP服务器名：</strong>
		</td>
		<td>
			<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="150">
			</asp:DropDownList>
		</td>
	</tr>
</tbody>
<!--  手机短信    -->
<tbody id="DivMobileSMS" style="display: none">
	<tr>
		<td>
			<strong>显示的宽度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MobileSMSType_Width" class="form-control text_x" runat="server" MaxLength="4">500</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示的高度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MobileSMSType_Height" class="form-control text_x"  runat="server" MaxLength="4">200</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
</tbody>
<tbody id="DivTableField" style="display: none"><!--库选字段-->
	<tr>
		<td>
			<strong>字段值(Text)：</strong>
		</td>
		<td>
			<asp:TextBox ID="TableField_Text" class="form-control" runat="server" /><span style="line-height: 30px;"> *示例：ZL_User.UserName，出现在下拉列表中值。</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>实际入库值(Value)：</strong>
		</td>
		<td>
			<asp:TextBox ID="TableField_Value" class="form-control" runat="server" /><span style="line-height: 30px;">示例：ZL_User.UserID，可为空，用于实际的Value存值使用</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>筛选条件：</strong>
		</td>
		<td>
			<asp:TextBox ID="Where_Text" class="form-control" runat="server" /><span style="line-height: 30px;"> T-Sql条件筛选如：UserID<10 （仅支持单条件不可录入and等属性）</span>
		</td>
	</tr>
</tbody>
<tbody id="DivRandom" style="display: none"><!--随机数字段-->
	<tr>
		<td><strong>类型</strong></td>
		<td>
            <asp:RadioButtonList runat="server" ID="Random_Type_Rad" RepeatDirection="Horizontal">
                <asp:ListItem Value="2" Selected="True">仅数字</asp:ListItem>
                <asp:ListItem Value="3">仅英文</asp:ListItem>
                <asp:ListItem Value="1">英文数字</asp:ListItem>
            </asp:RadioButtonList>
		</td>
	</tr>
    <tr>
		<td><strong>长度</strong></td>
		<td><asp:TextBox ID="Random_Len_T" class="form-control t_min" runat="server" Text="6" /></td>
    </tr>
</tbody>
<!--拍照字段-->
<tbody id="DivCameraType" runat="server" style="display:none">
    <tr>
        <td><strong>拍照大小：</strong></td>
        <td>宽度:<asp:TextBox ID="CameraWidth_T" Text="120" runat="server" CssClass="form-control text_s" />px 高度:<asp:TextBox ID="CameraHeight_T" Text="120" runat="server" CssClass="form-control text_s" />px</td>
    </tr>
    <tr>
        <td><strong>照片大小：</strong></td>
        <td>宽度:<asp:TextBox ID="CameraImgWidth_T" Text="100"  CssClass="form-control text_s" runat="server" />px 高度:<asp:TextBox ID="CameraImgHeight_T" Text="100" runat="server" CssClass="form-control text_s" />px</td>
        <td></td>
    </tr>
</tbody>
<tr>
	<td></td><td>
		<asp:Button ID="Button1" runat="server" Text=" 添加字段 " CssClass="btn btn-primary" OnClientClick="return isok()" OnClick="Button1_Click" />
        <asp:Button runat="server" ID="Return_Btn" CssClass="btn btn-primary" OnClick="Return_Btn_Click" Text="返回字段列表" />
		<asp:HiddenField ID="HdfTableName" runat="server" />
	</td>
</tr>
</table>
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/ModelField.js"></script>
<script src="/JS/chinese.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript">
function show(chvalue) {
	if (chvalue == '1') {
		document.getElementById('showdec').style.display = 'none';
	}
	else {
		document.getElementById('showdec').style.display = '';
	}
}
function Getpy(ontxt, id) {
	if (!document.getElementById(id).disabled) {

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
				document.getElementById(id).value = str.split(',', 1);
			}
		}
	}
}
</script>
</asp:Content>