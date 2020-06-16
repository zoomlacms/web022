<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.AddContentpage, App_Web_j2dqvgme" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>添加内容</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<style>
.tdbgleft{text-align:right;}
.alert{ margin:0; background:#eee; border-radius:0;}
.fd_td_l{ width:200px;}
.user_addcnt table tr{ display:none;} 
input[name=txt_endDate]{ padding-left:10px; width:50%; max-width:715px; height:36px; line-height:36px; border:1px solid #ccc; border-radius:4px; }
 .step_btn{ padding-top:20px; padding-bottom:20px;}
#step_btn{ padding:10px 30px; border-radius:30px; border:1px solid #449d44; background:#449d44; color:#fff; font-size:1.2em;}
#step_btn:hover,#step_btn:focus{ outline:none;}
.user_addcnt h3{ padding-left:20px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="  user_addcnt">
<div class="alert alert-danger text-center">发布项目</div>         
<table class="table table-striped table-bordered table-hover">
<tr class="hidden">
<td colspan="2" class="text-center"> 
<span class="hidden"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span></td>
</tr>
<tr class="hidden">
<td class="text-right text_150">所属节点</td>
<td>
<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td class="text-right text_200"><span class="hidden"><asp:Label ID="Title_L" runat="server"></asp:Label></span>项目名称</td>
<td>
<asp:TextBox ID="txtTitle" CssClass="form-control m715-50" runat="server" onblur="getstrKeys()" Text=''></asp:TextBox>
<span><font color="red">*</font></span>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTitle">内容标题必填</asp:RequiredFieldValidator>
</td>
</tr>
<tr class="hidden">
<td class="text-right">关键字</td>
<td>
<asp:TextBox ID="TxtTagKey" CssClass="form-control m715-50" runat="server" Text=''></asp:TextBox>
</td>
</tr>
<asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
<tr>
<td colspan="2" class="text-center">
<asp:Button ID="EBtnSubmit" Text="" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
<input type="button" id="BtnBack" class="btn btn-primary" value="返回列表" onclick="javascript: getContentUrl()" />
<asp:HiddenField ID="HdnNode" runat="server" />
<asp:HiddenField ID="HdnModel" runat="server" />
<asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
</td>
</tr>
<tr class="text-center step_btn">
<td colspan="2"><button type="button" class="step1" id="step_btn">完成，保存下一步填写设计师要求</button></td>
</tr>
</table>
<table class="table table-striped table-bordered table-hover" id="pay_table">
<tr>
<th class="text_200 text-right"><strong>分次付款</strong></th><th><select id="pay_num"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select></th><th>需设计师提供内容</th><th>完成时间</th> 
</tr>
<tr class="paytr">
<td class="text-right"><strong>第1次付款</strong></td><td><select name="pay_n1" id="pay_n1"><option value="20%">20%</option><option value="30%">30%</option><option value="40%">40%</option><option value="100%">50%</option></select></td><td>设计师开始工作</td><td>预付款</td>
</tr>
<tbody id="pay_steps"></tbody> 
<tr>
<td class="text-right">修改付费</td>
<td colspan="3">
<label><input type="radio" name="editpay" value="1">修改
<select>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
次以内，修改面积小于
<select>
<option value="10%">10%</option>
<option value="20%">20%</option>
<option value="30%">30%</option>
<option value="40%">40%</option>
<option value="50%">50%</option>
<option value="60%">60%</option>
<option value="70%">70%</option>
<option value="80%">80%</option>
<option value="90%">90%</option>
</select></label><br />
<label>
<input type="radio" name="editpay" value="2">自行约定</label>
<textarea class="form-control" rows="3"></textarea>
<button type="button" class="btn btn-success" id="pub1">实名发布+100分</button>
<button type="button" class="btn btn-success" id="pub2">匿名发布</button></td>
</tr>
</table>
</div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript"  src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript"  src="/JS/ZL_Content.js"></script>
<script> 
$().ready(function(e) {
    $("#txtTitle").parent().parent().show();
	$("[name=txt_sjjd]").parent().parent().show();
	$("#Drop_xmdd").parent().parent().show();
	$("#txt_xxdz").parent().parent().show();
	$("[name=txt_xmlx]").parent().parent().show();
	$("[name=txt_sjfg]").parent().parent().show();
	$("[name=txt_sjgm]").parent().parent().show();
	$("[name=txt_endDate]").parent().parent().show();
	$("[name=txt_sjfy]").parent().parent().show();
	$("[name=txt_isown]").parent().parent().parent().show();
	$("[name=txt_faxmnryq]").parent().parent().before("<td class='add_td' colspan='2'><h3>方案项目提供内容(可多选)</h3></td>"); 
	$("[name=txt_faxmnryq]").parent().parent().show();	
	$("[name=txt_zyyq]").parent().parent().before("<td class='add_td' colspan='2'><h3>施工图项目提供内容(可多选)</h3></td>"); 
	$("[name=txt_zyyq]").parent().parent().show();
	$("[name=txt_spxyts]").parent().parent().parent().show();
	$("[name=txt_spbhzt]").parent().parent().parent().show();
	$("[name=txt_spec]").parent().parent().show();	
	$("[name=txt_require]").parent().parent().before("<td class='add_td' colspan='2'><h3>施工服务项目提供内容(可多选)</h3></td>"); 
	$("[name=txt_require]").parent().parent().show(); 		
	$("[name=txt_dqRequire]").parent().parent().before("<td class='add_td' colspan='2'><h3>电气专业项目内容要求(可多选)</h3></td>"); 
	$("[name=txt_dqRequire]").parent().parent().show();

	
	$(".step_btn").show();
});
$("[name=txt_isown]").change(function(e) {
	if($(this).val()=="不需要，我自己填"){ 
		if(document.getElementById("txt_sjjd_1").checked==true){
			
		} 
		if(document.getElementById("txt_sjjd_3").checked==true){
			
		} 
		if(document.getElementById("txt_sjjd_4").checked==true){
			
		}
	} 
});
$("[name=txt_zyyq]").change(function(e) {
    if($(this).val()=="电气"){
	}
});
function cancel_before(){
	$("[name=txt_faxmnryq]").parent().parent().before(""); 
	$("[name=txt_zyyq]").parent().parent().before(""); 
	$("[name=txt_require]").parent().parent().before(""); 
	$("[name=txt_dqRequire]").parent().parent().before("");
}
$("#step_btn").click(function(e) {
    $(".user_addcnt table tr").fadeOut();
	$("[name=txt_sjry]").parent().parent().parent().before("<td class='add_td' colspan='2'><h3>对设计师的要求（选填）</h3></td>");  
	$("[name=txt_sjry]").parent().parent().parent().show();
	$("[name=txt_ryyq]").parent().parent().parent().show();
	$("[name=txt_jyyq]").parent().parent().show();
	$("[name=txt_zcyq]").parent().parent().show();
	$("[name=txt_szd]").parent().parent().show();
	$("[name=txt_zcyq]").parent().parent().show();
	$("[name=txt_sex]").parent().parent().parent().show();
	$("[name=txt_qtyq]").parent().parent().parent().show();
	$("[name=txt_xzqx]").parent().parent().show();
	$("[name=txt_xzqxmax]").parent().parent().show();
	$(".add_td").hide();
 	$("#pay_table tr").show();
});
$("#pay_num").change(function(e) { 
	var str="";
	var opstr="<option value='10%'>10%</option><option value='20%'>20%</option><option value='30%'>30%</option><option value='40%'>40%</option><option value='50%'>50%</option><option value='60%'>60%</option><option value='70%'>70%</option><option value='80%'>80%</option><option value='90%'>90%</option><option value='100%'>100%</option>"; 
	if($(this).val()>1){ 
		for(var i=1; i<$(this).val(); i++){
			str+="<tr><td class='text-right'><strong>第"+(i+1)+"次付款</strong></td><td><select name='pay_n"+i+1+"'>"+opstr+"</select></td><td><input type='text' name='finish_cnt"+i+1+"' id='finish_cnt"+i+1+"' class='form-control text_150'></td><td><input type='text' name='finish_date"+i+1+"' id='finish_date"+i+1+"' class='form-control text_150' onClick='WdatePicker({ dateFmt: 'yyyy年MM月dd日' });' /></td></tr>";
		}	
		$("#pay_steps").html(str);
		$("#pay_steps tr").show(); 
	}   
});
$("#pub1").click(function(e) {
    $("#EBtnSubmit").click();
});
$("#pub2").click(function(e) {
    $("#EBtnSubmit").click();
});
</script>
</asp:Content>
