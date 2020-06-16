<%@ page language="C#" autoeventwireup="true" inherits="Plat_DocContent, App_Web_tbedsbxg" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title runat="server" id="title_str"></title>
<link type="text/css" rel="stylesheet" href="/JS/Plugs/date/bootstrap-datetimepicker.css" />
 <script type="text/javascript" src="/JS/Plugs/date/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/JS/jquery.validate.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<nav class="navbar navbar-default ">
      <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-7" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand nav_title" href="/home"><span class="glyphicon glyphicon-home"></span> </a><a class="navbar-brand" href="/home"><asp:Literal runat="server" id="UserName_Li"></asp:Literal>的日程</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-7">
          <ul class="nav navbar-nav dailyplan_nav">
            <li class="active"><a href="DailyPlan.aspx<%=Request.Url.Query %>"><span class="glyphicon glyphicon-calendar"></span> 月</a></li>
            <li><a href="SubjectForWeek.aspx<%=Request.Url.Query %>"><span class="fa fa-calendar"></span> 周</a></li>
            <li><a href="SubjectForDay.aspx<%=Request.Url.Query %>"><span class="fa fa-clock-o"></span> 日</a></li>
          </ul>
         <ul class="nav navbar-nav pull-right right_option dailyplan_nav">
             <li><a href="/home"><span class="fa fa-soccer-ball-o fa-spin pull-left"></span> <span class="loginout_str">能力中心</span></a></li>
             <li><a href="/User/" title="会员中心"><span class="loginout_str">会员中心</span></a></li>
            <li><a class="login_out" href="/User/Logout.aspx?url=/mis/ke/DailyPlan.aspx"><span class="loginout_str">退出</span></a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div>
    </nav>
<div class="container-fluid">
<div class="col-md-2">
    <div class="panel panel-default">
    <div class="panel-heading">日程列表[<a href="DailyPlan.aspx?type=-1">所有日程</a>]<span class="pull-right"><a href="javascript:;" title="添加日程" onclick="ShowTypeDiag()"><span class="glyphicon glyphicon-plus"></span></a></span></div>
        <ul class="list-group ullist" id="sublist">
        <asp:Repeater ID="SubList_RPT" runat="server" OnItemCommand="SubList_RPT_ItemCommand">
            <ItemTemplate>
                <li class="list-group-item" data-uid="<%#Eval("MID") %>" data-type="<%#Eval("ID") %>"><%#GetSubName() %>
                    <span class="pull-right">
                        <a href="javascript:;" title="修改" onclick="event.stopPropagation();ShowEditType(<%#Eval("ID") %>,'<%#Eval("Title") %>')"><span class="glyphicon glyphicon-pencil"></span></a>
                        <asp:LinkButton runat="server" CommandName="DelType" OnClientClick="event.stopPropagation(); return confirm('确认删除该日程吗?')" CommandArgument='<%#Eval("ID") %>'><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    </span>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        <div class="panel-body empty_div" runat="server" visible="false" id="EmptySub_Div">
            <p>没有相关日程!</p>
        </div>
    </div>
</div>
    <div class="col-md-7">
<table class="table table-bordered" id="DateTable" >
  <thead>
    <tr>
      <td colspan="7">
          <asp:Button ID="PreMonth_B" style="display:none;" runat="server" OnClick="PreMonth_Btn_Click" />
          <asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="PreMonth_Btn_Click" ToolTip="上一月"><i class="glyphicon glyphicon-chevron-left"></i></asp:LinkButton>
        <strong style="font-size: 25px; position: relative; top: 4px;">
        <%:CurDate.ToString("yyyy年MM月") %>
        </strong>
          <asp:Button ID="NextMonth_B" style="display:none;" runat="server" OnClick="NextMonth_Btn_Click" />
        <asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="NextMonth_Btn_Click" ToolTip="下一月"><i class="glyphicon glyphicon-chevron-right"></i></asp:LinkButton></td>
    </tr>
    <tr>
      <td>周一</td>
      <td>周二</td>
      <td>周三</td>
      <td>周四</td>
      <td>周五</td>
      <td>周六</td>
      <td>周日</td>
    </tr>
  </thead>
  <tbody runat="server" id="DateBody" data-toggle="modal">
    <tr>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D7"></asp:Literal>
    </tr>
    <tr>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D7"></asp:Literal>
    </tr>
    <tr>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D7"></asp:Literal>
    </tr>
    <tr>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D7"></asp:Literal>
    </tr>
    <tr>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D7"></asp:Literal>
    </tr>
  </tbody>
</table>
</div>
<div class="col-md-3">
    <div class="panel panel-default">
    <div class="panel-heading"><asp:Literal ID="TopSubName_Li" runat="server"></asp:Literal>日程</div>
        <ul class="list-group ullist" id="lastlist">
        <asp:Repeater ID="MyTop_RPT" runat="server">
            <ItemTemplate>
                <li class="list-group-item" data-id="<%#Eval("ID") %>"><span class="last_title"><%#Eval("Name") %></span> <span class="pull-right last_date"><%#Eval("StartDate") %></span></li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        <div class="panel-body empty_div" runat="server" visible="false" id="listempty_div">
            <p>您还没有日程!</p>
        </div>
    </div>
</div>
</div>
<div style="display:none;" id="addsubject_div">
    <table id="Add_Table" class="table">
      <tr>
        <td class="text-right td_m"><span><span style="color: red; margin-left: 1em;">*</span>日程名称:</span></td>
        <td><asp:TextBox runat="server" type="text" ID="Name_T" class="form-control text_300 day_text" ></asp:TextBox></td>
      </tr>
      <tr>
        <td class="text-right"><span><span style="color: red; margin-left: 1em; text-decoration: none;">*</span>开始时间:</span></td>
        <td><asp:TextBox class="form-control text_x day_text formdate" ID="txtBeginTime" runat="server"></asp:TextBox>
            <select name="startHour" class="date_hour"></select>
            <select name="startMinitue" class="date_minitue"></select>
            <asp:HiddenField ID="StartDate_Hid" runat="server" />
        </td>
      </tr>
    <tr>
        <td class="text-right">
            <span><span style="color: red; margin-left: 1em; text-decoration: none;">*</span>结束时间:</span>
        </td>
        <td>
            <asp:TextBox class="form-control text_x day_text formdate" ID="txtEndTime" runat="server"></asp:TextBox>
             <select name="endHour" class="date_hour"></select>
            <select name="endMinitue" class="date_minitue"></select>
            <span style="color:red">结束时间不能早于开始时间!</span>
            <asp:HiddenField ID="EndDate_Hid" runat="server" />
        </td>
    </tr>
      
     <%-- <tr>
        <td class="text-right"><span>负责人:</span></td>
        <td><input type="text" id="LeaderIDS_T" class="form-control text_300 day_text"/>
          <input type="button" value="选择" onclick="selRuser();" class="btn btn-primary" style="margin-left:5px;" />
          <asp:HiddenField runat="server" ID="LeaderIDS_Hid" /></td>
      </tr>
      <tr>
        <td class="text-right"><span>参与人:</span></td>
        <td><input type="text" id="PartTakeIDS_T" class="form-control text_300 day_text"  placeholder="选择用户名或姓名"/>
          <input type="button" value="选择" onclick="selCuser();" class="btn btn-primary" style="margin-left:5px;"/>
          <asp:HiddenField runat="server" ID="PartTakeIDS_Hid" /></td>
      </tr>--%>
      <tr>
        <td class="text-right"><span>日程描述:</span></td>
        <td><textarea class="form-control day_text" style="width: 75%; height: 8em;" name="describe" placeholder="点击此处添加日程描述"></textarea></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><asp:Button ID="Add_Btn" runat="server" Text="提交" CssClass="btn btn-primary" OnClientClick="return SetData()" OnClick="BtnAdd_Click" ValidationGroup="Add" />
          <input type="button" class="btn btn-default" onclick="ViewTaskDetail()"  data-dismiss="modal"value="取消" /></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
      </tr>
    </table>
</div>
<div id="addtype_div" style="display:none;">
    <div class="input-group text_300">
    <asp:TextBox ID="Type_T" CssClass="form-control" placeholder="日程名" Text="" runat="server"></asp:TextBox>
        <asp:HiddenField ID="TypeID_Hid" runat="server" />
        <span class="input-group-btn">
            <asp:Button ID="AddType_B" runat="server" OnClick="AddType_B_Click" Text="确定" OnClientClick="return CheckTypeData()" CssClass="btn btn-primary" />
        </span>
    </div>
</div>
<!--用户选取-->
<div id="select" style="position: absolute; display: none; width: 800px; background: #FFF; border: 1px solid #ddd; top: 20%; left: 20%; z-index: 99999;">
<div id="Free_Div" runat="server" class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title" style="text-align: center; width: 600px; float: left;">请选择用户</h3>
    <span style="float: right; cursor: pointer;" class="glyphicon glyphicon-remove" title="关闭" onclick="$('#select').hide();"></span>
    <div class="clearfix"></div>
  </div>
  <div class="panel-body">
    <iframe runat="server" id="User_IFrame" style="visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 430px;" name="main_right" src="/Plat/Common/SelUser.aspx?Type=AllInfo" frameborder="0"></iframe>
  </div>
</div>
</div>
<div id="taskDetail_Div" style="height: 100%; width: 610px; position: fixed; bottom: 0px; right: 0px; border-left: 1px solid #ddd; background-color: white; display: none; z-index: 1031;" onfocus="console.log('11');" onblur="console.log('22');">
<iframe id="taskDetail_if" style=" border: none; height: 100%; width: 100%; overflow:hidden;"></iframe>
</div>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript">
    
    function VoteCheck() {
        var validator = $("#form1").validate({ meta: "validate" });
        return validator.form();
    }
    var diag=new ZL_Dialog();
    var flag=0;
    //初始化时间数据
    function InitDateData(){
        var hourstr="";
        for (var i = 0; i < 24; i++) {//初始化小时
            hourstr+="<option>"+i+"</option>";
        }
        $(".date_hour").html(hourstr);
        var minites="";
        var startvalue=-5;//初始分钟
        for (var i = 0; i < 12; i++) {
            startvalue+=5;
            var tempdata=startvalue;
            if(tempdata<10)
                tempdata="0"+tempdata;//强制两位数
            minites+="<option>"+tempdata+"</option>";
        }
        $(".date_minitue").html(minites);

    }
    $().ready(function () {
        //上一个月
        $("#DateBody .premonth").click(function(){
            $("#PreMonth_B").click();
        });
        //下一个月
        $("#DateBody .nextmonth").click(function(){
            $("#NextMonth_B").click();
        });
        InitDateData();
        $("#DateBody .datas").dblclick(function () {
            diag.title = "添加日程";
            diag.width = "adddiag";
            diag.content = "addsubject_div";
            diag.ShowModal();
            $(".day_text").val('');
            $(".date_hour").val('0');
            $(".date_minitue").val('00');
            var date=$(this).data('date');
            $("#txtBeginTime").val(date);
            $("#txtEndTime").val(date);
            $("select[name='endMinitue']").next().hide();//时间错误提示
            $('[name=place]').val('<%=TypeID %>');
            if(flag==0){
                //时间控件
                $(".formdate").datetimepicker({
                    format:"yyyy-mm-dd",
                    language:"zh-CN",
                    weekStart: 1,
                    todayBtn:1,
                    autoclose: 1,
                    startView:2,
                    minView:2,
                    maxView:2,
                    initialDate:new Date()
                })
                flag++;
            }
        });
       
        //日程列表
        var type='<%=TypeID %>',userid=<%=UserID %>;
        $("#sublist [data-uid='"+userid+"'][data-type='"+type+"']").addClass("sub_active");
        $("#sublist li").click(function(){
              window.location.href="DailyPlan.aspx?userid="+$(this).data('uid')+"&type="+$(this).data("type");
        });
        //最近日程点击事件
        $("#lastlist li").click(function () { ViewDetail($(this).data('id')); });
    });
   
    //替换开始时间与结束时间格式
    function SetData() {
        if($("#Name_T").val()==""){
            alert('日程名称不能为空!');
            return false;
        }
        if ($("#txtBeginTime").val() == "" || $("#txtEndTime").val() == "") {
            alert('开始时间或结束时间不能为空!');
            return false;
        }
        if($("[name='place']").val()==""){
            alert("日程类别不能为空!")
            return false;
        }
        var startdate=$("#txtBeginTime").val()+" "+$("select[name='startHour']").val()+":"+$("select[name='startMinitue']").val();//开始时间
        var enddate=$("#txtEndTime").val()+" "+$("select[name='endHour']").val()+":"+$("select[name='endMinitue']").val();//结束时间
        if(Date.parse(startdate.replace('-','/'))>Date.parse(enddate.replace('-','/'))){
            $("select[name='endMinitue']").next().show();//时间错误提示
            return false;
        }
        $("select[name='endMinitue']").next().hide();
        return true;
    }
    function ViewDetail(id) {
        $("#taskDetail_if").attr("src", "DailyDetail.aspx?ID=" + id);
        $("#taskDetail_Div").show();
    }
    function HideMe() {
        $("#taskDetail_Div").fadeOut("fast");
    }
    function UpdateData(id,content){
        $(".td_content_div[data-id='"+id+"'] a").text(content);
        $("#lastlist [data-id='"+id+"'] .last_title").text(content);
        $("#taskDetail_Div").hide();
    }
    function DelData(id){
        $(".td_content_div[data-id='"+id+"']").remove();
        $("#lastlist [data-id='"+id+"']").remove();
        $("#taskDetail_Div").hide();
    }
    //添加日程类型
    var typediag=new ZL_Dialog();
    function ShowTypeDiag(){
        EmptyTypeDate();
        typediag.title="新建日程类别";
        typediag.content="addtype_div";
        typediag.width="typediag";
        typediag.ShowModal();
    }
    //修改日程类型
    function ShowEditType(id,title){
        EmptyTypeDate();
        typediag.title="修改日程类别";
        typediag.content="addtype_div";
        typediag.width="typediag";
        typediag.ShowModal();
        $("#Type_T").val(title);
        $("#TypeID_Hid").val(id);
        $("#AddType_B").val("修改");
        return false;
    }
    //清空编辑日程类型信息
    function EmptyTypeDate(){
        $("#Type_T").val('');
        $("#TypeID_Hid").val('');
        $("#AddType_B").val("添加");
    }
    function CheckTypeData(){
        if($("#Type_T").val()==""){
            alert("日程名称不能为空!");
            return false;
        }
        return true;
    }
</script> 
</asp:Content>

