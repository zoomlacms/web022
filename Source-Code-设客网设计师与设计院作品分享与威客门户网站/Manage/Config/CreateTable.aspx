<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_Default2, App_Web_zol0bvcz" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/SPwd.ascx" TagPrefix="uc1" TagName="SPwd" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>快速建表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<uc1:SPwd runat="server" ID="SPwd" Visible="false" />
<div id="maindiv" runat="server" visible="false">
<table class="table table-striped table-bordered table-hover">
<tr class="tdbg">
	<td class="tdbgleft" align="right" style="width: 180px"><strong>表名：</strong></td>
	<td>ZL_My_<asp:TextBox ID="txtVName" runat="server"></asp:TextBox>
	</td>
</tr>
<tr class="tdbg">
	<td class="tdbgleft" align="right" style="width: 180px"><strong>字段：</strong></td>
	<td>
		<table>
			<tr>
				<td style="width: 50px;"></td>
				<td style='width: 200px;' align="center">列名</td>
				<td style='width: 100px;' align="center">数据类型</td>
				<td style='width: 100px;' align="center">字段长</td>
				<td style='width: 50px;' align="center">允许空</td>
				<td style='width: 200px;' align="center">字段说明</td>
			</tr>
		</table>
		<table id="tab1">
		</table>
	</td>
</tr>
<tr>
	<td></td>
	<td><asp:Button ID="CreateBtn" runat="server" Text="创建" OnClick="CreateBtn_Click" class="btn btn-primary" /></td>
</tr>
</table>
<div id="RunOK" runat="server">
</div>
</div>
<asp:HiddenField runat="server" ID="hfNumber" Value="" /></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/js/ajaxrequest.js"></script>
<script>
var ajax = new AJAXRequest();
var count = 0, number = 0;
var save = "";
function deleteItem(obj, string) {
 if (number > 1) {
	 number = number - 1;
	 var curRow = obj.parentNode.parentNode;
	 var tb3 = document.getElementById("tab1");
	 var i;
	 string = string + ",";
	 i = save.indexOf(string);
	 saveh1 = save.substr(0, i);
	 saveh2 = save.substr(i + 2, save.length - i - 2);
	 save = saveh1 + saveh2;
	 tb3.deleteRow(curRow.rowIndex);
	 document.getElementById("hfNumber").value = save;
 }
}
function additem(id) {
 var row, cell, str;
 var tab1 = document.getElementById(id);
 row = tab1.insertRow(number);
 if (row != null) {
	 row.insertCell(0).innerHTML = "<td align=\"right\" style=\"width:90px\">&nbsp;<input type=\"button\" title=\"添加\" value=\"\" style=\" border:none; background:url(../../../App_Themes/AdminDefaultTheme/images/Add.png) no-repeat; width:20px; height:20px;\"  onclick=\"additem('tab1')\" /> <input title=\"删除\"  name=\"Acollection" + count + "\" type=\"button\" style=\" border:none; background:url(../../../App_Themes/AdminDefaultTheme/images/del.png) no-repeat; width:20px; height:20px;\"  class=\"button\"  onclick=\'deleteItem(this," + count + ");\'> ";
	 row.insertCell(1).innerHTML = "<td> <input style='width:200px;' id=\"field" + count + "\" type=\"text\" name=\"field" + count + "\"></td>";
	 row.insertCell(2).innerHTML = "<td> <select id=\"fieldtype" + count + "\"  name=\"fieldtype" + count + "\"><option value='Binary'>Binary</option><option value='Bit'>Bit</option><option value='Char'>Char</option><option value='Cursor'>Cursor</option><option value='Datetime'>Datetime</option><option value='Decimal'>Decimal</option><option value='Float'>Float</option><option value='Image'>Image</option> <option value='Int'>Int</option><option value='Money'>Money</option><option value='Nchar'>Nchar</option><option value='Ntext'>Ntext</option><option value='Numeric'>Numeric</option><option value='Nvarchar'>Nvarchar</option><option value='Real'>Real</option><option value='Smalldatetime'>Smalldatetime</option><option value='Smallint'>Smallint</option><option value='Smallmoney'>Smallmoney</option><option value='Sysname'>Sysname</option><option value='Text'>Text</option><option value='Tinyint'>Tinyint</option><option value='Timestamp'>Timestamp</option><option value='Uniqueidentifier'>Uniqueidentifier</option><option value='Varchar'>Varchar</option><option value='Varbinary'>Varbinary</option><select> ";//<input style='width:200px;' id=\"fieldtype" + count + "\" type=\"text\" name=\"fieldtype" + count + "\"></td>";
	 row.insertCell(3).innerHTML = "<td style='width:100px;' align='center'><input style='width:100px;' id=\"leg" + count + "\" type=\"text\" name=\"leg" + count + "\"></td>";
	 row.insertCell(4).innerHTML = "<td style='width:100px;' align='center'>&nbsp;&nbsp; <input type='checkbox'  id=\"nul" + count + "\"  name=\"nul" + count + "\" value='1'>&nbsp;&nbsp;</td>";
	 row.insertCell(5).innerHTML = "<td> <input style='width:200px;' id=\"remark" + count + "\" type=\"text\" name=\"remark" + count + "\"></td>";
	 save = save + count + ",";
	 count++;
	 number++;
 }
 document.getElementById("hfNumber").value = save;
}
$(window).load(function () {
 additem("tab1");
});
</script>
</asp:Content>