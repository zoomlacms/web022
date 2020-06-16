//博客
function Blog_Chk() {
    $li = $(event.srcElement).parent("li");
    var chk = $li.find(":checkbox")[0];
    chk.checked = !chk.checked;
    setCookie("plat_" + chk.value, chk.checked)
    switch (chk.value) {
        case "sina":
            $li.find("#weibo_icon").css("color", chk.checked ? "#0AA4E7" : "#ccc");
            break;
        case "qqblog":
            $li.find("#qq_icon").css("color", chk.checked ? "#0AA4E7" : "#ccc");
            break;
    }
}
function Blog_StatusChk() {
    var haschk = getCookie("plat_qqblog");
    if (haschk && haschk == "true" && $("#qqblog_li").length > 0) {
        $("#qqblog_li").find("#qq_icon").css("color", "#0AA4E7");
        $("#qqblog_li").find(":checkbox")[0].checked = true;
    }
    haschk = getCookie("plat_sina");
    if (haschk && haschk == "true" && $("#sina_li").length > 0) {
        $("#sina_li").find("#weibo_icon").css("color", "#0AA4E7");
        $("#sina_li").find(":checkbox")[0].checked = true;
    }
}
//站内邮(仅能发送给本公司部门同事)
function PrivateSend() {
    var msgjson = { msg: $("#MailContent").val(), receuser: "1,2", action: "privatesend" };
    if (msgjson.msg == "") { alert("内容不能为空"); return false; }
    if (msgjson.receuser == "") { alert("收信人不能为空"); return false; }
    UE.getEditor("MailContent").setContent(""); document.getElementById("prvatesend_btn").disabled = "disabled";
    $.post("/Plat/Common/Common.ashx", msgjson, function (data) { PrivateCallBack(data); }, "json");
}
//发送成功或失败后,启用发送按钮
function PrivateCallBack(data) {
    document.getElementById("prvatesend_btn").disabled = "";
    if (data != "99") alert("发送失败");
}
function PrivateOpen(uid, uname) {
    $("#ReceUser").val(uname);
    $("#ReceUser_Hid").val(uid);
    $("#privatediv").modal({});
}
//$("#privatediv").modal({});
function PrivateClose() {
    $("#ReceUser").val(""); $("#ReceUser_Hid").val("");
    UE.getEditor("MailContent").setContent("");
    $("#privatediv").modal("hide");
}
//参数,divid,iframeid,#后参数,#后参数对应的txt与hid
function PrivateSelUser(select) {
    $("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#" + select);
    //$("#User_IFrame")[0].contentWindow.ClearChk();
    $("#seluserdiv").show();
}
function UserFunc(json, select) {
    var uname = "";
    var uid = "";
    for (var i = 0; i < json.length; i++) {
        uname += json[i].UserName + ",";
        uid += json[i].UserID + ",";
    }
    if (uid) uid = uid.substring(0, uid.length - 1);
    switch (select)//#后带的参数
    {
        case "private":
            $("#ReceUser").val(uname);
            $("#ReceUser_Hid").val(uid);
            break;
    }
    $("#seluserdiv").hide();
}
//私信聊天
function ChatShow(id, uname) {
    //$("#chatdiv").css("bottom", "0px");
    //$("#chatdiv").show();
    //if (id > 0)
    //    $("#chat_if")[0].contentWindow.ChangeTalker(id, uname);
    window.open("/Common/Chat/Chat.aspx?uid="+id);
}
function ChatClose() {
    $("#chatdiv").hide();
}
//用户信息
var uinfoArr=[];
function UInfoShow(obj){
    var uid=$(obj).data("uid");
    $uinfodiv=$(obj).parent().parent().find(".uinfodiv");
    $(".uinfodiv").hide();
    $uinfodiv.show();
    var model=ArrCommon.GetModelByID(uinfoArr,uid);
    if(model)
    {
        if($uinfodiv.text().indexOf("@User")>0)//已有数据则不更新
        {
            UInfoTlpDeal($uinfodiv,model);
        }
        return;
    }
    $.post("/Plat/Common/Common.ashx",{action:"getuinfo",value:uid},function(data){UInfoCallBack(data,$uinfodiv);},"json");
}
function UInfoClose(obj){
    $(obj).closest(".uinfodiv").hide();
    $("#chatdiv").hide();
}
//只允许查看本公司的
function UInfoCallBack(data,$uinfodiv)
{
    if(data=="")
    {
        $uinfodiv.find(".loading").text("加载失败");
    }
    else
    {
        UInfoTlpDeal($uinfodiv,data);
        uinfoArr.push(data);
    }
}
function UInfoTlpDeal($uinfodiv,data){
    var tlp = $uinfodiv.html().replace("/Images/ajax-loader.gif", data.UserFace).replace(/@UserName/g, data.UserName).replace("@Mobile", data.Mobile).replace(/@UserID/g, data.UserID).replace("@GroupName", data.GroupName);
    $uinfodiv.html(tlp);
    $uinfodiv.find(".loading").hide();
    $uinfodiv.find(".loadok").show();

}
var ArrCommon =
 {
     DelByID: function (arr, id) {
         for (var i = 0; i < arr.length; i++) {
             if (arr[i].id == id) {
                 for (var j = i; j < (arr.length - 1) ; j++) {
                     arr[j] = arr[j + 1];
                 }
                 arr.pop();
             }
         }
     },//DelByID End;
     GetModelByID: function (arr, id) {
         for (i = 0; i < arr.length; i++) {
             if (id == arr[i].id) return arr[i];
         }
     }
 }
function AddAT(uname,uid)
{
    var v = $("#MsgContent_T").val();
    $("#MsgContent_T").val(v + "@" + uname + "[uid:" + uid + "]");
}
//--------------------------------
function ContentShow(){
    $('#article_div').modal({});
}
function ArtColl(){  
    $(event.srcElement).parent().parent().hide().parent().find(".detail_div").show();
}
function ArtUnfold(){
    $(event.srcElement).parent().parent().hide().parent().find(".synposis_div").show();
}
function InitAt(json)
{
    // onerror=\"this.src=\"/Images/userface/noface.gif\"\"
    json=eval(json);
    $(".atwho").atwho({
        tpl: '<li data-value="${atwho-at}${name}${suffix}"><img src="${imageUrl}" onerror="this.src=\'/Images/userface/noface.gif\'" style="width:25px;height:25px;" />&nbsp;${name}</li>',
        at: "@",
        search_key: "name",
        title: "请选择要@的同事名称",
        data:json,
        limit: 8,
        max_len: 20,
        start_with_space: false,
        //data:jsonArr,
        callbacks: {
            remote_filter:function(query,callback)//@之后的语句
            {
                //callback(json);
            }
        }//callback
    });
}
function GetMsgMainID(id)
{
    return "msgitem-"+id;
}
function DataChk() {
    var val = $("#MsgContent_T").val();
    if (val == "" || val.replace(/ /g, "")=="") {
        TextAlert("MsgContent_T", 3);
        return false;
    }
    else {
        window.localStorage.PlatMsg = "";
        disBtn(document.getElementById("Share_Btn"), 2000); 
        disBtn(document.getElementById("Share_Btn2"), 2000);
    }
}
//背景色警告
function TextAlert(id, time) {
    if (!time || time < 1) time = 3;
    for (var i = 0, span = 200; i < time; i++) {
        setTimeout(function () { $("#" + id).css("background-color", "#f9f2f4") }, span);
        span += 200;
        setTimeout(function () { $("#" + id).css("background-color", "#fff") }, span);
        span += 200;
    }
}
function DisReply() {
    $(event.srcElement).parent().parent().parent().find(".reply").show("middle");
}
function DisReplyOP(pid,rid,uname) {
    //$(event.srcElement).parent().siblings(".replyOP").show();
    $("#reply_div_"+pid).show();
    $("#MsgContent_"+pid).val("").attr("placeholder", "回复"+uname+":");
    $("#Reply_Rid_Hid_"+pid).val(rid);
}
//-------
function PreView(vpath)
{
    $("#Model_Btn").click();
    if (vpath != $("#preview_down_a").attr("href"))//如果预览的文件变更，则重新加载
    {
        $("#preview_down_a").attr("href", vpath);
        $("#preview_if").attr("src", "/PreView.aspx?vpath=" + escape(vpath));
        $("#largepre_a").attr('href', "/PreView.aspx?vpath=" + escape(vpath));
    }
}
function LoadReply(pid,pageSize,pageIndex)
{
    $("#reply_" + pid).load("/Plat/Blog/ReplyList.aspx?code="+Math.random()+"&pid=" + pid + "&PageSize=" + pageSize + "&PageIndex=" + pageIndex + " start");
}
function ClearChk(name){
    $("input[name='GroupIDS_Chk']").each(function () { this.checked = false; });
}
//--------------投票相关JS
function MsgTypeFunc(css)
{
    var s=".tab1,.tab2";
    $(s).hide();
    $(css).show();
    $("#child_nav_ul a").each(function(){
        if($(this).attr("data-type")==css)
        {
            $(this).addClass("active");
        }
        else{$(this).removeClass("active");}
    });
}
function AddVoteOP()
{
    var index = parseInt($(".vote_op_label").last().text().replace(".", ""))+1;
    var tr = "<tr class='votetr'><td></td><td><label class='vote_op_label'>" + index + ".</label><input type='text' name='VoteOption_T' class='vote_op_input form-control' /><span class='glyphicon glyphicon-remove' onclick='RemoveVoteOP();'></span></td></tr>";
    $(".votetr").last().after(tr);
}
function RemoveVoteOP()
{
    $(".votetr").last().remove();
}
function VoteCheck()
{
    var validator = $("#form1").validate({meta: "validate"}); 
    return validator.form();
}
//this,与控件参数
function ShowMsgDiv(id,args1,arsg2)
{
    var parent=$("#"+GetMsgMainID(id));
    $(parent).find(args1).hide();
    $(parent).find(arsg2).show();
}
//转发
function ShowForWard(id)
{
    $("#Forward_ID_Hid").val(id);
    var text=" 转发内容：<br />"+$("#"+GetMsgMainID(id)).find(".msg_content_article_div").text();
    $("#forward_his_div").html(text);
    $("#Forward_Btn").click();
}
//话题相关
function ShowDiv(id) {
    var $obj = $("#" + id);
    var flag = $obj.is(":visible");
    $(".msgex").hide();
    switch (id) {
        case "ImgFace_Div":
            if ($("#ImgFace_if").attr("src") == "") {
                $("#ImgFace_if").attr("src", "/Plugins/Ueditor/dialogs/emotion/ImgFace.html");
            }
            break;
        case "GroupAT_ifr":
            if (!$obj.attr("src") || $obj.attr("src") == "") {
                $obj.attr("src", "../Common/GroupAT.aspx");
            }
            break;
    }
    if (!flag) $obj.show();
}
function AddTopic()
{
    //如果话题中包含str,则不添加str而改为选中,否则添加完成后再选中
    var str =event.srcElement.innerText;
    var id="#MsgContent_T";
    var index = GetIndexByStr($(id),str);
    if (index > 0)
    {
        $(id).setSelection(index, index + (str.length-2));
    }
    else
    {
        $(id).val($(id).val()+str);
        index =GetIndexByStr($(id),str);
        $(id).setSelection(index, index + (str.length-2));
    }
    $("#topicDiv").hide();
}
function GetIndexByStr($obj,str)
{
    var index=0;
    if($obj.val()==""||$obj.val().length<str.length)
    {
        return index;
    }
    else return ($obj.val().indexOf(str)+1);
}
//表情
function InsertSmiley(json)
{
    var arr=JSON.parse($("#ImgFace_Hid").val()); arr.push(json);
    $("#ImgFace_Div").hide();
    $("#ImgFace_Hid").val(JSON.stringify(arr));
    $("#MsgContent_T").val($("#MsgContent_T").val()+json.title);
}
//显示用户详情
function ShowUser(uid)
{
    $("#ShowUser_Div").show();
    $("#ShowUser_if").attr("src","/Plat/Common/UserDetail.aspx?ID="+uid);
}
//哪些组可看见该信息
function CanSeeFun(op){
    $allChk = $("#viewgroup input[name=GroupIDS_Chk]");
    $edChk = $("#viewgroup input[name=GroupIDS_Chk]:checked");//已选中
    onlymeChk = $("#viewgroup input[name=GOnlyMe_Chk]")[0];
    switch (op) {
        case "all":
            $allChk.each(function () { this.checked = true; });
            $edChk = $("#viewgroup input[name=GroupIDS_Chk]:checked");
            onlymeChk.checked = false;
            break;
        case "single":
            onlymeChk.checked = false;
            break;
        case "onlyme":
            $allChk.each(function () { this.checked = false; });
            break;
    }
    //----------------
    if (onlymeChk.checked) {
        $("#canSee_Span").text("仅自己");
    }
    else if ($allChk.length == $edChk.length || $edChk.length == 0) {
        $("#canSee_Span").text("所有人可见");
    }
    else if ($edChk.length == 1) {
        $("#canSee_Span").text($edChk.attr("data-gname"));
    }
    else {
        $("#canSee_Span").text("已选" + $edChk.length + "项");
    }
}
//---群组@
function GroupATFunc(obj) {
    var v=$(obj).attr("userinfo").split(':')[0];
    var n=$(obj).attr("userinfo").split(':')[1];
    var tlp="@"+n+"[uid:"+v+"]";
    var text=$("#MsgContent_T").val();
    if(obj.checked)
    {
        $("#MsgContent_T").val(text+tlp+" ");
    }
    else
    {
        $("#MsgContent_T").val(text.replace(tlp,""));
    }
}
function GroupFunc(obj){
    var v=obj.value.split(':')[0];
    var n=obj.value.split(':')[1];
    var tlp="@"+n+"[gid:"+v+"]";
    var text=$("#MsgContent_T").val();
    if(obj.checked)
    {
        $("#MsgContent_T").val(text+tlp+" ");
    }
    else
    {
        $("#MsgContent_T").val(text.replace(tlp,""));
    }
}
function DisGroupAT() {
    $("#GroupAT_ifr").hide();
}
//----------------AJAX区
function PostDelMsg(msgid)
{
    if(confirm("确定要删除该条信息吗!!"))
    {
        $("#"+GetMsgMainID(msgid)).remove();
        PostToCS("DeleteMsg",msgid,null);
    }
}
//增加自己的头像链接,移除自己的头像链接
function PostLike(id)//点赞
{
    var tlp="<li title='{0}' class='likeids_li'><a href='javascript:;'><img src='{1}' /></a></li>", a="";
    var $main=$("#"+GetMsgMainID(id));
    var uname=$("#UserInfo_Hid").val().split(':')[0];
    var likeobj=$main.find(".likeids_div_ul").find("li[title='"+uname+"']");
    if(likeobj.length>0){ 
        a="RemoveLike";
        likeobj.remove();
        $main.find(".glyphicon-thumbs-up").attr("title","点赞");
    }
    else{
        a="AddLike";
        var uface=$("#UserInfo_Hid").val().split(':')[1];
        tlp=tlp.replace("{0}",uname).replace("{1}",uface);
        $main.find(".likeids_div_ul").append(tlp);
        $main.find(".glyphicon-thumbs-up").attr("title","取消赞");
    }
    var num=$main.find(".likeids_li").length;
    $main.find(".likenum_span").html("("+num+")");
    if(num>0){
        $main.find(".likeids_div_ul:hidden").show("middle");
    }
    else{
        $main.find(".likeids_div_ul").hide("middle");
    }
    PostToCS(a,id,function(){});     
}
function PostUserVote(id) {
    var name="vote_"+id;
    var v = $("input:radio[name='" + name + "']:checked").val();//opid
    if (v) {
        v=id+":"+v;
        PostToCS("UserVote", v, function (data) {location=location; });
    }
    else{console.log('选项不存在');}
}
function CollFunc(obj,id)//收藏,取消收藏
{
    if ($(obj).hasClass("colled"))//如已收藏,取消收藏
    {
        $(obj).removeClass("colled").addClass("nocolled");
        PostToCS("CancelColl", id, function () { });
    }
    else//加入收藏
    {
        $(obj).removeClass("nocolled").addClass("colled");
        PostToCS("AddColl", id, function () { });
    }
}
function AddReply(id) {//回复主信息或子信息
    var msg = $("#MsgContent_" + id).val();$("#MsgContent_" + id).val("");
    var rid=$("#Reply_Rid_Hid_"+id).val();
    if (msg == "") { alert('信息不能为空!!'); return; }
    var value = id +":::"+rid+":::"+ msg; 
    PostToCS("AddReply", value, function () {LoadReply(id, pageSize, 1);  });
}
function AddMessage(id) {//对回复者回复
    var msg = $("#MsgContent_" + id).val();
    var pid = $("#MsgInfo_" + id + "_Hid").val().split(':')[0]; 
    if (msg == "") { alert('信息不能为空!!'); return; }
    var value = pid + ":::" + id + ":::" + msg;
    PostToCS("AddReply2", value, function () { LoadReply(pid, pageSize, 1); });
}
function PostToCS(a, v, CallBack) {
    PostToCS2("/Plat/Blog/Default.aspx",a,v,CallBack);
}//Post To CS end;
function PostToCS2(u, a, v, CallBack) {
    $.ajax({
        type: "Post",
        url: u,
        data: { action: a, value: v },
        success: function (data) {
            if (data)
                CallBack(data);
        },
        error: function (data) {
        }
    });
}