<%@ page language="C#" autoeventwireup="true" inherits="manage_Flex_Chart, App_Web_nw2myhlo" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>图表管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<iframe id="colorPalette" src="/common/setcolor.htm" style="visibility: hidden; position: absolute; border: 1px gray solid; left: 2px; top: 1px;" frameborder="0" scrolling="no"></iframe>
<table class="table table-striped table-bordered table-hover">
	<tr>
		<td colspan="2" style="text-align: center;"><strong>
			<asp:Label ID="Label1" runat="server" Text="添加图表"></asp:Label>
		</strong>
		</td>
	</tr>
	<tr>
		<td align="left" style="width: 200px;"><strong>图表标题：</strong></td>
		<td align="left">
			<asp:TextBox ID="TxtChartTitle" class="form-control text_md" runat="server" MaxLength="100" TextMode="SingleLine"></asp:TextBox>
			&nbsp;*   
	<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtChartTitle" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
	</tr>
	<tr>
		<td align="left" style="width: 200px;"><strong>图表类型：</strong></td>
		<td align="left">
			<input type="hidden" value="饼状图" id="zhuhid" runat="server" />
			<input type="radio" value="饼状图" id="Bzhuang" onclick="Sethid(this.id)" name="Btype" runat="server" checked /><label for="Bzhuang" style="cursor: pointer">饼状图</label>
			<input type="radio" value="线状图" id="Xzhuang" onclick="Sethid(this.id)" name="Btype" runat="server" /><label for="Xzhuang" style="cursor: pointer">线状图</label>
			<input type="radio" value="柱状图" id="Zzhuang" onclick="Sethid(this.id)" name="Btype" runat="server" /><label for="Zzhuang" style="cursor: pointer">柱状图</label>
		</td>
	</tr>
	<tr>
		<td align="left" style="width: 200px;"><strong>图表单位：</strong></td>
		<td align="left">
			<asp:TextBox ID="TxtChartUnit" class="form-control text_md" runat="server" MaxLength="100" TextMode="SingleLine" Text="位"></asp:TextBox>
			&nbsp;*
			<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtChartUnit" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
	</tr>
	<tr>
		<td align="left" style="width: 200px;"><strong>图表尺寸：</strong></td>
		<td align="left">
			<table>
				<tr>
					<td>宽度：
						<asp:TextBox ID="TxtChartWidth" runat="server" class="form-control text_md" MaxLength="4" Text="300" TextMode="singleLine" Width="50px"></asp:TextBox>px  &nbsp; &nbsp; 高度：
						<asp:TextBox ID="TxtChartHeight" class="form-control text_md" runat="server" MaxLength="4" Text="200" TextMode="singleLine" Width="50px"></asp:TextBox>px 
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" style="width: 200px;"><strong>图表数据：</strong></td>
		<td align="left">
			<textarea id="TbBase" style="height: 300px; width: 500px;" class="form-control text_md" runat="server">1,2,3|a,b,c</textarea>
			&nbsp;*<span id="baseGz" style="color: Red" runat="server"></span>
		</td>
	</tr>
	<tr>
		<td align="left" style="width: 200px;"></td>
		<td align="left">
			<input id="tBYl" type="button" onclick="tBopen(3)" value="预览" class="btn btn-primary" />
			<asp:Button ID="Get" Text="生成图表" runat="server" class="btn btn-primary" OnClick="Get_Click" /></td>
	</tr>
</table>
<table class="table table-bordered">
	<tr>
		<td align="left" style="padding-left: 60px; padding-bottom: 20px;">
			<div>预览区：</div>
			<iframe width="300" style="height: 350px;" id="TbLocation" src="" frameborder="0" scrolling="no"></iframe>
		</td>
	</tr>
</table>
<asp:HiddenField ID="HdnChartId" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" charset="utf-8">
	function copy() {
		var innerHTML = "复制失败您的浏览器不支持复制，请手动复制代码。";
		if (window.clipboardData) {
			innerHTML = "复制成功您现在可以将代码粘贴（ctrl+v）到网页中预定的位置。";

			var str = $("#TxtCode").html();
			while (str.indexOf("&lt;") >= 0) {
				str = str.replace("&lt;", "<");
			}
			while (str.indexOf("&gt;") >= 0) {
				str = str.replace("&gt;", ">");
			}

			window.clipboardData.setData("Text", str);
			alert(innerHTML);

		}
		else { alert(innerHTML); }
	}
	function back() {
		window.location = "../Plus/ChartManage.aspx";
	}
</script>
<script type="text/javascript">
	$(function () {
		if ('<%=Request["ChartID"] %>' != "") {
			tBopen(1);
		} else {
			tBopen(2);
		}
	})
	function Sethid(va) {
		$("#zhuhid").val($("#" + va).val());
		var gz = $("#baseGz");
		if ($("#zhuhid").val() == "饼状图") {
			if ('<%=Request["ChartID"] %>' == "") {
				$("#TbBase").val("1,2,3|a,b,c");
			}
			gz.text("规则：X|Y 例:1,2,3|a,b,c  纯百分比");
		} else {
			if ('<%=Request["ChartID"] %>' == "") {
				$("#TbBase").val("{2011|1,2,3|a,b,c}^{2012|2,4,7|a,b,c}");
			}
			gz.text("规则：单组:{组名|X|Y},多组以^隔开 例: {2011|1,2,3|a,b,c}^{2012|2,4,7|a,b,c} Y轴以第一组为准");
		}
		tBopen(2);
	}
	function tBclose() {
		$("#YlTb").hide();
	}

	function tBopen(ty) {
		var obj = new Object();
		obj.tbtype = $("#zhuhid").val();
		obj.tbwidth = $("#TxtChartWidth").val();
		obj.tbheight = $("#TxtChartHeight").val();
		obj.tbunit = escape($("#TxtChartUnit").val());
		obj.tbtitle = escape($("#TxtChartTitle").val());
		obj.tbbase = escape($("#TbBase").val());
		obj.tbsrc = $("#TbLocation");

		if (ty == 1) {
			if (obj.tbtype == "饼状图") {
				obj.tbsrc.attr("src", "/Plugins/Chart/pie-basic.aspx?Cid=" + '<%=Request["ChartID"] %>');
			} else if (obj.tbtype == "线状图") {
				obj.tbsrc.attr("src", "/Plugins/Chart/line.aspx?Cid=" + '<%=Request["ChartID"] %>');
			} else if (obj.tbtype == "柱状图") {
				obj.tbsrc.attr("src", "/Plugins/Chart/colum.aspx?Cid=" + '<%=Request["ChartID"] %>');
			}
} else if (ty == 2) {
	if (obj.tbtype == "饼状图") {
		obj.tbsrc.attr("src", "/Plugins/Chart/pie-basic.aspx?Cid=0&wihi=" + obj.tbwidth + "|" + obj.tbheight);
	} else if (obj.tbtype == "线状图") {
		obj.tbsrc.attr("src", "/Plugins/Chart/line.aspx?Cid=0&wihi=" + obj.tbwidth + "|" + obj.tbheight);
	} else if (obj.tbtype == "柱状图") {
		obj.tbsrc.attr("src", "/Plugins/Chart/colum.aspx?Cid=0&wihi=" + obj.tbwidth + "|" + obj.tbheight);
	}
} else if (ty == 3) {
	if (obj.tbtype == "饼状图") {
		obj.tbsrc.attr("src", "/Plugins/Chart/pie-basic.aspx?Bases=" + obj.tbwidth + "|" + obj.tbheight + "|" + obj.tbtitle + "|" + obj.tbunit + "&Datas=" + obj.tbbase);
	} else if (obj.tbtype == "线状图") {
		obj.tbsrc.attr("src", "/Plugins/Chart/line.aspx?Bases=" + obj.tbwidth + "|" + obj.tbheight + "|" + obj.tbtitle + "|" + obj.tbunit + "&Datas=" + obj.tbbase);
	} else if (obj.tbtype == "柱状图") {
		obj.tbsrc.attr("src", "/Plugins/Chart/colum.aspx?Bases=" + obj.tbwidth + "|" + obj.tbheight + "|" + obj.tbtitle + "|" + obj.tbunit + "&Datas=" + obj.tbbase);
	}
}
obj.tbsrc.width(obj.tbwidth).height(obj.tbheight);
}
</script>
</asp:Content>
