<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabelSql.aspx.cs" Inherits="Manage_I_Content_LabelSql" MasterPageFile="~/Manage/I/Default.master" ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
<link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
<script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
<script src="/Plugins/CodeMirror/mode/xml.js"></script>
<script src="/Plugins/CodeMirror/mode/javascript/javascript.js"></script>
<script src="/Plugins/CodeMirror/addon/selection/active-line.js"></script>
<script src="/Plugins/CodeMirror/addon/edit/matchbrackets.js"></script>
<script src="/Plugins/CodeMirror/mode/htmlmixed.js"></script>
<title>标签查询</title>
<style>.modal-sm { width: 450px; }</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="BreadDiv" class="container-fluid mysite">
<div class="row">
	<ol class="breadcrumb navbar-fixed-top">
		<li><a href="LabelManage.aspx">标签管理</a></li>
		<li class="active">
            <a href="<%=Request.RawUrl %>">标签编辑</a>
			<asp:Label ID="LabelName" runat="server" />
			<a href="../Config/CreateTable.aspx" id="a1">添加新表</a>
			<a href="labelSqlOne.aspx?LabelName=<%=Request["LabelName"] %>">一步式编辑</a></li>
		<%=Call.GetHelp(25) %>
	</ol>
</div>
</div>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="False" Width="100%" ActiveStepIndex="0" FinishCompleteButtonText="保存标签" OnFinishButtonClick="BtnSave_Click">
<HeaderTemplate></HeaderTemplate>
<WizardSteps>
  <asp:WizardStep ID="WizardStep1" EnableTheming="true" runat="server" Title="step1">
	<table class="table table-striped table-bordered table-hover">
	  <tr><td class="spacingtitle" colspan="2" align="center">第一步：基本信息</td></tr>
	  <tr class="tdbg">
		<td class="text-right td_m"><strong>标签名称：</strong></td>
		<td class="text-left"><asp:TextBox ID="TxtLabelName" class="form-control text_md" runat="server" />
		  <asp:RequiredFieldValidator CssClass="tips" runat="server" ID="NReq" ControlToValidate="TxtLabelName" Display="Dynamic" ErrorMessage="必须输入名称" SetFocusOnError="True" />
		  <asp:CustomValidator ID="CustomValidator1" Display="Dynamic" runat="server" ControlToValidate="TxtLabelName" ErrorMessage="名称重复" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True" /></td>
	  </tr>
	  <tr class="tdbg">
		<td class="text-right"><strong>标签分类：</strong></td>
		<td class="text-left"><asp:TextBox ID="TxtLabelType" class="form-control text_md" runat="server"></asp:TextBox>
		  <asp:DropDownList ID="DropLabelType" CssClass="form-control text_md" runat="server" onchange="changecate();"></asp:DropDownList>
		  <asp:RequiredFieldValidator CssClass="tips" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtLabelType" ErrorMessage="分类不能为空" ForeColor="Red" /></td>
	  </tr>
	  <tr>
		<td class="text-right"><strong>标签类型：</strong></td>
		<td><asp:RadioButtonList ID="RBLType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
			<asp:ListItem Value="2" Selected="True">动态标签</asp:ListItem>
			<asp:ListItem Value="4">分页列表标签</asp:ListItem>
			<asp:ListItem Value="3">数据源标签</asp:ListItem>
		  </asp:RadioButtonList></td>
	  </tr>
	  <tr class="tdbg">
		<td class="text-right"><strong>标签说明：</strong></td>
		<td><asp:TextBox ID="TxtLabelIntro" class="form-control" Width="200" runat="server" TextMode="MultiLine" Rows="3" Height="60px"></asp:TextBox></td>
	  </tr>
	  <tr class="tdbg">
		<td class="text-right"><strong>数据架构：</strong></td>
		<td><asp:TextBox runat="server" CssClass="form-control text_md" ID="schema_Text" Text="DBO"></asp:TextBox>
		  <span style="margin-left:5px;line-height:30px;color:green;"><small>*常规应用忽略此项（私有架构定义时用于区别DBO）</small> </span></td>
	  </tr>
        <tr class="tdbg">
            <td></td>
            <td>
                <asp:DropDownList ID="DropDownList1" CssClass="form-control pull-left" Width="120" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="1" Text="基本信息"></asp:ListItem>
                    <asp:ListItem Value="2" Text="数据查询"></asp:ListItem>
                    <asp:ListItem Value="3" Text="参数设定"></asp:ListItem>
                    <asp:ListItem Value="4" Text="标签内容"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="下一步" class="btn btn-primary" OnClick="StartNextButton_Click" Style="margin-left: 5px;" />
                <asp:Button ID="Button13" OnClick="BtnSave_Click" class="btn btn-primary" runat="server" Text="保存标签" />
                <a href="LabelManage.aspx" class="btn btn-primary">取消</a>
                <asp:LinkButton OnClick="UseLable_Click" runat="server">引用标签</asp:LinkButton>
            </td>
        </tr>
	</table>
      <div>
          <strong>辅助说明:</strong>本操作用于定义标签基本信息,标签建好后可以在前台任意位置调用输出动态数据：
		  <ul class="disc">
              <li>动态标签可以在任何页面引用,分页列表支持分页显示,数据源标签可节省查询效率,需要在模板中引用数据输出。</li>
              <li>动态标签的调用格式为{ZL.Label id="标签名" NodeID="0" /}，其中 NodeID="0" 为变量参数，可于第二步编辑中定义或增减变量。</li>
              <li>标签支持在任意动态页面输出，如&#60;%Call.Label("{ZL.Label id=\"标签名称\" NodeID=\"91\" /}"); %&#62;方法则能在非模板引擎页输出动态标签。</li>
              <li>系统采用智能多库算法，数据库名请不要采用数字开头并夹带小数点等特殊符号，如[2009data.1]格式则是非法数据库名格式，不符合数据库联查标准。</li>
          </ul>
      </div>
  </asp:WizardStep>
  <asp:WizardStep ID="WizardStep2" runat="server" Title="step2">
	<table class="table table-striped table-bordered">
	  <tr>
		<td class="spacingtitle" colspan="2" align="center">第二步：数据查询</td>
	  </tr>
	  <tr>
		<td class="text-right td_m">选择数据：</td>
		<td><table style="width: 100%; margin: 0 auto;">
			<tr>
			  <td><div id="selectdatediv" class="selectlist">
				  <table>
					<tr>
					  <td><table class="table table-striped table-bordered">
						  <tr>
							<td style="width: 120px; text-align: right;">请选择数据库： </td>
							<td style="height: 22px"><asp:DropDownList ID="DatabaseList" CssClass="form-control" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="TableDownList_SelectedIndexChanged" /></td>
						  </tr>
						  <tr>
							<td style="text-align: right;">主表： </td>
							<td style="height: 22px"><asp:DropDownList ID="DbTableDownList" CssClass="form-control" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DBTableDownList_SelectedIndexChanged" /></td>
						  </tr>
						  <tr>
							<td style="width: 50px; text-align: right;">输出字段： </td>
							<td><asp:ListBox ID="DbFieldDownList" CssClass="form-control" runat="server" Height="220px" Width="200px" SelectionMode="Multiple" /></td>
						  </tr>
						</table></td>
					  <td><table id="table2" class="table table-striped table-bordered" runat="server">
						  <tr>
							<td style="width: 120px; text-align: right; height: 22px;">请选择数据库： </td>
							<td style="height: 22px"><asp:DropDownList ID="DatabaseList2" CssClass="form-control" runat="server" Width="200px" /></td>
						  </tr>
						  <tr>
							<td style="width: 50px; text-align: right; height: 22px;">从表： </td>
							<td style="height: 22px"><asp:DropDownList ID="DbTableDownList2" CssClass="form-control" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="DBTableDownList2_SelectedIndexChanged" /></td>
						  </tr>
						  <tr>
							<td style="width: 50px; text-align: right;">输出字段： </td>
							<td><asp:ListBox ID="DbFieldDownList2" CssClass="form-control" runat="server" Height="220px" Width="200px" SelectionMode="Multiple" /></td>
						  </tr>
						</table></td>
					</tr>
				  </table>
				  <font color="red">先取数据表后再选择输出字段，支持Ctrl或Shift选取操作</font> </div></td>
			</tr>
		  </table></td>
	  </tr>
	  <tbody id="tj" runat="server" visible="false">
		<tr>
		  <td class="text-right">约束字段： </td>
		  <td class="tdbg"><div id="ycdiv" class="selectlist">
			  <asp:DropDownList ID="Dbtj" runat="server" CssClass="form-control pull-left" style="margin-right:5px;" Width="120" AutoPostBack="True" OnSelectedIndexChanged="TableJoin">
				<asp:ListItem Value="left join">LeftJoin</asp:ListItem>
				<asp:ListItem Value="Inner join">InnerJoin</asp:ListItem>
				<asp:ListItem Value="outer join">OuterJoin</asp:ListItem>
				<asp:ListItem Value="right join">RightJoin</asp:ListItem>
			  </asp:DropDownList>
			  <asp:DropDownList ID="DbFieldList" runat="server" CssClass="form-control pull-left" Width="120" AutoPostBack="True" OnSelectedIndexChanged="TableJoin" />
			  <span class="tips pull-left" style="margin-right:5px;">=</span>
			  <asp:DropDownList ID="DbFieldList2" runat="server" CssClass="form-control pull-left" Width="120" AutoPostBack="True" OnSelectedIndexChanged="TableJoin" />
			  &nbsp; </div></td>
		</tr>
	  </tbody>
	  <tbody>
		<tr>
		  <td class="text-right">查询表： </td>
		  <td class="tdbg"><asp:TextBox ID="TxtSqlTable" class="form-control" runat="server" Rows="7" style="max-width:500px;" TextMode="MultiLine" AutoPostBack="true" Height="90"></asp:TextBox>
			<br />
			<asp:Label ID="Label1" runat="server" ForeColor="Red" Text="从选择数据中选择主表，若选择了从表，请在约束字段中设定表连接条件"></asp:Label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="，查询表不能为空!" ControlToValidate="TxtSqlTable"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
		  <td style="width: 80px; text-align: right;">查询字段： </td>
		  <td class="tdbg"><asp:TextBox ID="TxtSqlField" class="form-control" runat="server" style="max-width:500px;" Rows="7" TextMode="MultiLine" AutoPostBack="true" Height="90"></asp:TextBox>
			<br />
			<asp:Button ID="Button3" class="btn btn-info" Style="width: 110px;" runat="server" Text="查询字段" OnClick="Button3_Click" />
			<asp:Label ID="Label2" runat="server" ForeColor="Red" Text="从输出字段中选择查询的字段，未选字段点击为全选操作"></asp:Label></td>
		</tr>
	  </tbody>
	  <tbody>
		<tr style="display:none;">
		  <td class="text-right">存储过程名： </td>
		  <td class="tdbg"><asp:TextBox runat="server" ID="ProceName_Text" CssClass="form-control"></asp:TextBox></td>
		</tr>
	  </tbody>
	  <tr>
        <td></td>
		<td class="tdbg">
			<asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control pull-left" Width="120" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
			  <asp:ListItem Value="1" Text="基本信息"></asp:ListItem>
			  <asp:ListItem Value="2" Text="数据查询"></asp:ListItem>
			  <asp:ListItem Value="3" Text="参数设定"></asp:ListItem>
			  <asp:ListItem Value="4" Text="标签内容"></asp:ListItem>
			</asp:DropDownList>
			<asp:Button ID="PreviousButtonStep3" runat="server" CausesValidation="False" class="btn btn-primary" CommandName="MovePrevious" Text="上一步" OnClick="PreviousButtonStep3_Click" />
			<asp:Button ID="NextButtonStep3" runat="server" class="btn btn-primary" CommandName="MoveNext" OnClick="StartNextButton_Click" Text="下一步" />            
			<asp:Button ID="Button10" OnClick="BtnSave_Click" class="btn btn-primary" runat="server" Style="cursor: pointer;" Text="保存标签" />
			<input id="Button9" type="button" class="btn btn-primary" value="取　消" onclick="window.location.href='LabelManage.aspx'" style="cursor: pointer; cursor: pointer;" />
            <asp:LinkButton OnClick="UseLable_Click" runat="server" >引用标签</asp:LinkButton>
            </td>
	  </tr>
	</table>
      <div>
          <strong>辅助说明:</strong>数据库一般查询主数据库[仅高级版本支持从数据库]：
		  <ul class="disc">
              <li>多表查询应采用ID关联,比如文章模型则采用ZL_CommonModel left join ZL_C_Article on ZL_CommonModel.ItemID=ZL_C_Article.ID方法关联查询。</li>
              <li>为保持查询效率，每次查询请撷取所需字段，从而提升效率。</li>
              <li>建立标签时应注意多表间的逻辑，点此<a href="javascript:void(0);" onclick="javascript:window.open('http://www.zoomla.cn/learn')">下载数据字典</a>以提升开发效率。</li>
          </ul>
      </div>
  </asp:WizardStep>
  <asp:WizardStep ID="WizardStep3" runat="server" Title="step3">
	<table class="table table-striped table-bordered">
	  <tr>
		<td class="spacingtitle" colspan="2" align="center">第三步：参数设定</td>
	  </tr>
	  <tr>
		<td style="width:120px; text-align: right;">添加参数： </td>
		<td class="tdbg"><table class="table table-striped table-bordered" style="text-align: center">
			<tr class="tdbg" align="center">
			  <td style="width: 10%">参数名称 </td>
			  <td style="width: 10%">默认值 </td>
			  <td style="width: 15%">参数类型 </td>
			  <td style="width: 25%">参数说明 </td>
			  <td>操作 </td>
			</tr>
			<asp:Repeater ID="repParam" runat="server" OnItemCommand="repParam_ItemCommand">
			  <ItemTemplate>
				<tr class="tdbg">
				  <td align="center"><%#Eval("ParamName")%></td>
				  <td align="center"><%#Eval("ParamValue") %>
				  <td align="center"><%# GetParamType(Eval("ParamType","{0}"))%></td>
				  <td align="center"><%#Eval("ParamDesc")%></td>
				  <td align="center">&nbsp;
					<asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("Param") %>'>修改</asp:LinkButton>
					|
					<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%# Eval("Param") %>'>删除</asp:LinkButton></td>
				</tr>
			  </ItemTemplate>
			</asp:Repeater>
		  </table>
		  <table class="table table-striped table-bordered">
			<tr class="tdbg" align="center">
			  <td class="td_m"><asp:TextBox ID="TxtParamName" CssClass="form-control text_md required" runat="server" placeholder="参数名称" /></td>
			  <td><asp:TextBox ID="TxtParamValue" runat="server" placeholder="默认值" CssClass="form-control text_md" /></td>
			  <td class="tdbg" align="left" style="width: 100px; height: 25px"><asp:DropDownList ID="DDLParamType" CssClass="form-control" Width="120px" runat="server">
				  <asp:ListItem Selected="True" Value="1">普通参数</asp:ListItem>
				  <asp:ListItem Value="2">页面参数</asp:ListItem>
				  <asp:ListItem Value="3">单选参数</asp:ListItem>
				  <asp:ListItem Value="4">多选参数</asp:ListItem>
				</asp:DropDownList></td>
			  <td><asp:TextBox ID="TxtParamDesc" runat="server" placeholder="参数说明" CssClass="form-control text_md" /></td>
			  <td><asp:Button ID="BtnAddParam" runat="server" Text="添加" class="btn btn-info" OnClientClick="return VoteCheck();" OnClick="BtnAddParam_Click" Style="cursor: pointer;" /></td>
			  <td><asp:HiddenField ID="HdnParam" runat="server" />
				<asp:HiddenField ID="HdnTempParam" runat="server" /></td>
			</tr>
		  </table></td>
	  </tr>
	  <tr class="tdbg">
		<td class="text-right">参数[可拖放]：</td>
		<td><div id="plist" class="plist">
			<asp:Label ID="attlist" runat="server"></asp:Label>
		  </div></td>
	  </tr>
	  <tr class="tdbg">
		<td class="text-right td_m">查询条件： </td>
		<td><div id="gridviewclause" class="fielddiv">
			<asp:DropDownList ID="DDLJointj" CssClass="form-control pull-left" Width="80" runat="server">
			  <asp:ListItem Selected="True">And</asp:ListItem>
			  <asp:ListItem>OR</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList ID="DDLFTable" CssClass="form-control pull-left" Width="80" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BindTableField">
			  <asp:ListItem Selected="True" Value="1">主表</asp:ListItem>
			  <asp:ListItem Value="2">从表</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList ID="DDLTjField" CssClass=" form-control pull-left" runat="server" Width="140px" />
			<asp:DropDownList ID="DDLtj" CssClass=" form-control pull-left" Width="80" runat="server">
			  <asp:ListItem>等于</asp:ListItem>
			  <asp:ListItem>大于</asp:ListItem>
			  <asp:ListItem>小于</asp:ListItem>
			  <asp:ListItem>大于等于</asp:ListItem>
			  <asp:ListItem>小于等于</asp:ListItem>
			  <asp:ListItem>不等于</asp:ListItem>
			  <asp:ListItem>在</asp:ListItem>
			  <asp:ListItem>象</asp:ListItem>
			  <asp:ListItem>不在</asp:ListItem>
			</asp:DropDownList>
			<asp:TextBox ID="TxtTjValue" class="form-control" Width="150" runat="server"></asp:TextBox>
			<asp:Button ID="Button1" runat="server" class="btn btn-info" Text="添加查询条件" OnClick="Button1_Click" />
			<br />
			<asp:TextBox ID="TxtSqlWhere" runat="server" class="form-control"  style="max-width:500px; margin-top:10px;height:100px;" onmouseup="dragend5(this)"  TextMode="MultiLine"></asp:TextBox>
		  </div></td>
	  </tr>
	  <tr>
		<td class="text-right td_m">字段排序： </td>
		<td><div id="Div2" class="fielddiv">
			<asp:DropDownList ID="DDLOrderTable" CssClass="form-control" Width="80" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BindOrderField">
			  <asp:ListItem Selected="True">主表</asp:ListItem>
			  <asp:ListItem>从表</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList ID="DDLOrderField" CssClass="form-control" runat="server" Width="140px" />
			<asp:DropDownList ID="DDLOrder" CssClass="form-control" Width="80" runat="server">
			  <asp:ListItem Value="DESC">降序</asp:ListItem>
			  <asp:ListItem Value="ASC">升序</asp:ListItem>
			</asp:DropDownList>
			<asp:Button ID="Button2" class="btn btn-info" runat="server" Text="添加排序字段" OnClick="Button2_Click" Style="cursor: pointer;" ValidationGroup="false" />
			<br />
			<asp:TextBox ID="TxtOrder" class="form-control" runat="server" style="max-width:500px; margin-top:10px;" Rows="7" TextMode="MultiLine" Height="100" onmouseup="dragText(this)"></asp:TextBox>
			<br />
			<span style="color: Red;">(大部分时候需要填写，建议：字段排序不能为空)</span>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtOrder"
								Display="None" ErrorMessage="当标签为分页标签时,字段排序不能为空" Style="display: none" SetFocusOnError="True"></asp:RequiredFieldValidator>
		  </div></td>
	  </tr>
	  <tr style="display:none;">
		<td class="text-right">存储过程参数： </td>
		<td><asp:TextBox runat="server" ID="ProceParam_Text" CssClass="form-control" TextMode="MultiLine" Height="100" onmouseup="dragText(this);"></asp:TextBox></td>
	  </tr>
	  <tr class="tdbg">
		<td class="text-right">数据数目： </td>
		<td><asp:TextBox ID="TextBox1" class="form-control" runat="server" Text="10" Width="80"></asp:TextBox></td>
	  </tr>
	  <tr><td></td>
		<td>
			<asp:DropDownList ID="DropDownList3" CssClass="form-control pull-left" Width="120" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
			  <asp:ListItem Value="1" Text="基本信息"></asp:ListItem>
			  <asp:ListItem Value="2" Text="数据查询"></asp:ListItem>
			  <asp:ListItem Value="3" Text="参数设定"></asp:ListItem>
			  <asp:ListItem Value="4" Text="标签内容"></asp:ListItem>
			</asp:DropDownList>
			<asp:Button ID="Button4" runat="server" CausesValidation="False" class="btn btn-primary" CommandName="MovePrevious" Text="上一步" OnClick="PreviousButtonStep3_Click" />
			<asp:Button ID="Button5" runat="server" class="btn btn-primary" CommandName="MoveNext" OnClick="StartNextButton_Click" Text="下一步" />
			<asp:Button ID="Button12" OnClick="BtnSave_Click" class="btn btn-primary" runat="server" Style="cursor: pointer;" Text="保存标签" />
			<input id="Button11" type="button" class="btn btn-primary" value="取　消" onclick="window.location.href='LabelManage.aspx'" style="cursor: pointer;" />
            <asp:LinkButton OnClick="UseLable_Click" runat="server" >引用标签</asp:LinkButton>
		  </td>
	  </tr>
	</table>
	<div style="margin-top:5px;">
        <ul class="disc">
			<li>支持中文名定义参数,参数可以在前台模板中传递数值。</li>
			<li>支持采用页面采数传递信息。</li>
			<li>参数可自由拖放到查询条件、排序规则、数据条目等位置。</li>
			<li>参数支持普通参数、页面参数、单选参数、多选参数四种模式，其中单选参数与多选参数的值以$符号切割，如：华东$华南$华西$华北。</li>
			<li>查询条件支持嵌入T-sql语法规则，例如一条查询指定节点下的二级数据规则，可设定条件：NodeID in (select NodeID from ZL_Node where ParentID=@NodeID) or NodeID=@NodeID,当然也可以采用更高效的父节点属性查询：NodeID=@NodeID or FirstNodeID=@NodeID（注@NodeID为节点变量）。</li>
		  </ul>
	</div>
  </asp:WizardStep>
  <asp:WizardStep ID="WizardStep4" runat="server" Title="step4">
	<table class="table table-striped table-bordered">
	  <tr>
		<td class="spacingtitle" colspan="2" align="center">第四步：标签内容</td>
	  </tr>
	  <tr>
		<td class="text-right" style="width:120px;">参数[可拖放]：</td>
		<td><div id="Div3" class="plist"><asp:Label ID="attlist1" runat="server"></asp:Label></div></td>
	  </tr>
	  <tr>
		<td class="text-right td_m">判断模式： </td>
		<td>  
            <asp:CheckBox ID="boolmodel" runat="server" Text="判断模式" AutoPostBack="True" />
		    <span class="rd_red">[开启后将根据判断条件输出内容]</span>
		    <asp:Label ID="Label8" runat="server" Text="(<font color=red>满足</font>判断)" Visible="false"></asp:Label>
		</td>
	  </tr>
	  <tr id="isbool" runat="server" visible="false">
		<td class="text-right td_m">模式设置： </td>
		<td><asp:DropDownList ID="Modeltypeinfo" CssClass="form-control pull-left" Width="110" runat="server" AutoPostBack="True">
			<asp:ListItem Value="计数判断">计数判断</asp:ListItem>
			<asp:ListItem Value="用户登录判断">用户登录判断</asp:ListItem>
			<asp:ListItem Value="参数判断">参数判断</asp:ListItem>
		  </asp:DropDownList>
		  <asp:TextBox ID="Valueroot" runat="server" CssClass="form-control pull-left" Width="179px" onmousedown="inputtxt(this)" onfocus="inputtxt(this)" value="这里放入标签"></asp:TextBox>
		  <asp:DropDownList ID="addroot" runat="server" CssClass="form-control td_m" Visible="false" AutoPostBack="True">
			<asp:ListItem Value="循环计算">循环计算</asp:ListItem>
			<asp:ListItem Value="一直累加">一直累加</asp:ListItem>
		  </asp:DropDownList>
		  <asp:DropDownList ID="setroot" CssClass="form-control td_m" runat="server">
			<asp:ListItem Value="大于">大于</asp:ListItem>
			<asp:ListItem Value="等于" Selected="True">等于</asp:ListItem>
			<asp:ListItem Value="小于">小于</asp:ListItem>
			<asp:ListItem Value="不等于">不等于</asp:ListItem>
		  </asp:DropDownList>
		  <asp:TextBox ID="Modelvalue" class="form-control" runat="server" Width="140px" ToolTip="注意：当判断是否为空时，请不要填写任何内容"></asp:TextBox>
		  <asp:Label ID="Label3" runat="server" ForeColor="#339933" Visible="False" Font-Bold="True"></asp:Label></td>
	  </tr>
	  <tr>
		<td class="padding-t0" colspan="2">
        <div id="labeldiv">
        <ul class="nav nav-tabs top_opbar" style="margin-bottom:0px;border-bottom:none;">
            <li class="active"><a href="#Tabs0" data-toggle="tab">自定标签</a></li>
            <li><a href="#Tabs1" data-toggle="tab">字段标签</a></li>
            <li><a href="#Tabs2" data-toggle="tab">系统标签</a></li>
            <li><a href="#Tabs3" data-toggle="tab">扩展函数</a></li>
        </ul>
        <div class="col-lg-4 col-md-4" style="height:536px;max-width:450px; overflow-y:auto;border:1px solid #ddd;border-right:none;padding:0px;">
            <div class="tab-content">
                <div class="tab-pane active" id="Tabs0" runat="server">
                    <div class="panel panel-default">
                       <div class="panel-heading">
                            <asp:DropDownList ID="CustomLabel_DP" runat="server" CssClass="form-control text_md" onchange="GetCustom(this);"></asp:DropDownList>
                       </div>
                        <div class="panel-body" id="CustomLabel_div" runat="server"></div>
                    </div>
                </div>
                <div class="tab-pane" id="Tabs1">
                    <div class="panel panel-default">
                       <%-- <div class="panel-heading">
                            <asp:DropDownList ID="Field_DP" runat="server" CssClass="form-control text_md" onchange="GetField(this);"></asp:DropDownList>
                        </div>--%>
                        <div class="panel-body" id="Field_div" runat="server"></div>
                    </div>
                </div>
                <div class="tab-pane" id="Tabs2">
                    <div class="list-group">
                        <asp:Label ID="lblSys" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="tab-pane" id="Tabs3">
                    <div class="list-group">
                        <asp:Label ID="lblFun" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-md-8" style="border:1px solid #ddd;padding:0px;">
            <iframe style="height: 30px; width: 530px; z-index: -1;border:none;" name="I1" id="I1" scrolling="no" src="/manage/Template/label.htm"></iframe>
            <div id="Textarea">
                <asp:TextBox TextMode="MultiLine" runat="server" ID="textContent" Style="max-width: 100%; width: 100%; height: 530px;" />
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
		</td>
	  </tr>
	  <tr id="s1" runat="server" visible="false">
		<td class="spacingtitle" style="width: 100%; text-align: left;" colspan="2"><strong>标签内容:(<font color="red">不满足</font>判断)</strong></td>
	  </tr>
	  <tr id="s2" runat="server" visible="false">
		<td style="width: 100%; text-align: right;" colspan="2"><table style="width: 100%">
			<tr>
			  <td align="left"><font color="red"><b>当选择计数判断时，下面只能填写{Repeate}标签里面的内容</b></font>
				<asp:TextBox TextMode="MultiLine" runat="server" ID="falsecontent" Width="100%" Height="231px" onmouseup="dragend4(this)"></asp:TextBox></td>
			</tr>
		  </table></td>
	  </tr>
	  <tr class="tdbg">
		<td align="center" colspan="2"><asp:HiddenField ID="HdnlabelID" runat="server" />
		  <div style="float: left; padding-left: 250px; display: none">
			<input id="BtnCancel" type="button" class="btn btn-primary" value="取　消" onclick="window.location.href='LabelManage.aspx'" style="cursor: pointer;" />
			&nbsp;&nbsp;&nbsp;
			<asp:Button ID="BtnSave" OnClick="BtnSave_Click" class="btn btn-primary" runat="server" Style="cursor: pointer;" Text="保存标签" />
			&nbsp;&nbsp;&nbsp; </div>
		  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" /></td>
	  </tr>
        <tr>
            <td colspan="2">
                <div style="width: 440px; margin: auto;">
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" Width="120" AutoPostBack="true" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                        <asp:ListItem Value="1" Text="基本信息"></asp:ListItem>
                        <asp:ListItem Value="2" Text="数据查询"></asp:ListItem>
                        <asp:ListItem Value="3" Text="参数设定"></asp:ListItem>
                        <asp:ListItem Value="4" Text="标签内容"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="PreviousButtonFinish" runat="server" CausesValidation="False" class="btn btn-primary" CommandName="MovePrevious" Text="上一步" OnClick="PreviousButtonStep3_Click" />
                    <asp:Button ID="Button6" OnClick="BtnSave_Click" class="btn btn-primary" runat="server" Text="保存标签" />
                    <a href="LabelManage.aspx" class="btn btn-primary">取消</a>
                    <asp:LinkButton OnClick="UseLable_Click" runat="server">引用标签</asp:LinkButton>
                </div>
            </td>
        </tr>
	</table>
    <div style="margin-top: 5px;">
          <ul class="disc">
              <li>标签内容支持CSS等HTML定义，可以从左侧拖拽标签参数使用。</li>
              <li>重复输出数据请需要在{Repeate}{/Repeate}内进行排序输出。</li>
              <li>扩展函数支持字段格式化、截取、重新筛选、取值获值等操作，使数据输出更加科学合理。</li>
              <li>由于多浏览器兼容与W3C规则严谨度要求，建议标签预览仅作为预览使用，不作为保存操作，以免产生乱码。</li>
          </ul>
      </div>
  </asp:WizardStep>
</WizardSteps>
<StepNavigationTemplate>
  <center>
  </center>
</StepNavigationTemplate>
<StartNavigationTemplate>
  <center>
  </center>
</StartNavigationTemplate>
<FinishNavigationTemplate>
  <center>
  </center>
</FinishNavigationTemplate>
</asp:Wizard>
<script src="/Design/JS/sea.js"></script>
<script src="/JS/jquery.validate.min.js"></script> 
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/Plugins/CodeMirror/LabelCall.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script> 
<script type="text/javascript">
    var diag=new ZL_Dialog();
	function opentitle(url, title) {
		diag.url=url;
		diag.title=title;
		diag.ShowModal();
	}
	function closeCuModal() {
		diagLabel.CloseModal();
	}
	  //新增Div参数块,拥有绑定功能
	function pdrag(ev) {
		var code = $(ev.target ? ev.target : ev.srcElement).attr("code");
		ev.dataTransfer.setData("Text", code);
	}
	function allowDrop(ev) {
		ev.preventDefault();
	}
	function drop(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("Text");
		ev.target.appendChild(document.getElementById(data));
	}
	function addubb(ubb) {
		var textEl = document.getElementById("<%=textContent.ClientID %>");
		var text = ubb;

		if (textEl.createTextRange && textEl.caretPos) {
			var caretPos = textEl.caretPos;
			caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ? text + ' ' : text;
		}
		else
			textEl.value = textEl.value + text;
	}
	function admin_Size(num, objname) {
		var obj = document.getElementById(objname)
		if (parseInt(obj.rows) + num >= 3) {
			obj.rows = parseInt(obj.rows) + num;
		}
		if (num > 0) {
			obj.width = "90%";
		}
	}

	function selectvalue(vas, vas2) {
		if (document.getElementById("<%=DbTableDownList.ClientID %>")) {
			for (var i = 0; i < document.getElementById("<%=DbTableDownList.ClientID %>").length; i++) {
				if (document.getElementById("<%=DbTableDownList.ClientID %>").options[i].value == vas) {
					document.getElementById("<%=DbTableDownList.ClientID %>").selectedIndex = i;
				}
			}
			setTimeout('__doPostBack(\'Wizard1$DbTableDownList\',\'\')', 0);

			document.getElementById("<%=DbTableDownList2.ClientID %>").length;
			for (var i = 0; i < document.getElementById("<%=DbTableDownList2.ClientID %>").length; i++) {
				if (document.getElementById("<%=DbTableDownList2.ClientID %>").options[i].value == vas2) {
					document.getElementById("<%=DbTableDownList2.ClientID %>").selectedIndex = i;
				}
			}
			setTimeout('__doPostBack(\'Wizard1$DbTableDownList2\',\'\')', 0);
		}
	}
	function VoteCheck() {
		var validator = $("#form1").validate({ meta: "validate" });
		return validator.form();
	}
	function changecate() {
		var obj = document.getElementById("<%=DropLabelType.ClientID %>");
				var tar = document.getElementById("<%=TxtLabelType.ClientID %>");
				var text = obj.value;
				if (text != "") {
					tar.value = text;
				}
	}
    var base64 = null;
    seajs.use(["base64"], function (instance) {
        base64 = instance;
    })
</script> 
</asp:Content>
