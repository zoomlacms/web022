<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_AddMap, App_Web_jzh2rzwp" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>标注地图</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div>
	<div style="margin: auto; margin-top: 20px; width: 80%; height: 30px; line-height: 30px; text-align: left; font-size: 12px">
		地区选择：
		<input value="放大" class="btn btn-primary" id="maxmap" type="button" />
		<input id="minmap" class="btn btn-primary" type="button" value="缩小" />
		<asp:DropDownList CssClass="form-control " runat="server" ID="drop"></asp:DropDownList>
		<asp:DropDownList CssClass="form-control" runat="server" ID="drop1">
			<asp:ListItem Value="" Text="请选择"></asp:ListItem>
		</asp:DropDownList>
	</div>
	<div id="map" style="height: 400px"></div>
	<p class="tips" style="font-size: 12px;">提示：鼠标在地图区拖动可以创建您的标注</p>
	<div style="margin: auto; margin-top: 20px; width: 90%; height: 50px; line-height: 50px; text-align: center;">
		<input type="submit" id="Bbtn" class="btn btn-primary" onclick="Getvs()" value="保存地图" />
	</div>
</div>
<div style="display: none;">
	<input runat="server" id="hlngx" name="hlngx" />
	<input runat="server" id="hlngy" name="hlngy" />
	<input runat="server" id="hlngz" name="hlngz" />
	<input runat="server" id="hmid" name="hmid" />
	<input runat="server" id="haddtxt" name="haddtxt" value="您的位置" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=" type="text/javascript"></script>
<script type="text/javascript" src="http://fw.qq.com/ipaddress" charset="gb2312"></script>
<script src="/JS/GoogleMap.js" type="text/javascript"></script>
<script type="text/javascript"> 
	function Getvs() 
	{
		$("#hmid").val($("#addtxt").val());
	}
	$("#drop").change(function () {
		ShowMap(<%=uid %>,$("#drop").val(),<%=mid %>);
		$.get('GoogleMap.ashx?mt=' + new Date().getTime() + "&v2=xml&Xname=" + escape($("#drop").val()), function (data) {
			var tr=data.split(',');
			var gm;
			for(var i=0;i<tr.length;i++)
			{
				gm +="<option value=\""+tr[i]+"\" >"+tr[i]+"</option>";
			}
			$("#drop1").html(gm);
		});
	});
		$("#drop1").change(function () {
			if($("#drop1").val().replace(" ","").length>0)
			{
				ShowMap(<%=mid %>,$("#drop1").val());  
	}
		});
$().ready(function (){
	ShowMap(<%=uid %>,'',<%=mid %>);
});
</script>
</asp:Content>