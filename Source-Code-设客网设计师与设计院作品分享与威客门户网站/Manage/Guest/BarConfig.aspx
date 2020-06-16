<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Guest_BarConfig, App_Web_dbnpt1ot" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
#BreadNav {display: none;}
.mysite {display: none;}
.optext {text-align: right;}
</style>
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />

<title>贴吧栏目设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ul class="nav nav-tabs" style="border-bottom: none;">
<li class="active"><a href="#basic" data-toggle="tab">基本设置</a></li>
<li><a href="#auth" data-toggle="tab">权限设定</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane active" id="basic">
        <table class="table table-bordered table-hover table-striped">
            <tr class="onlybar">
                <td style="text-align: right;">父栏目：</td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" style="width:300px;text-align:left;" id="dropdownMenu1" runat="server" data-toggle="dropdown" aria-expanded="true">
                            <span id="dr_text"></span>
                           <span class="caret pull-right" style="margin-top:7px;"></span>
                            <asp:HiddenField id="selected_Hid" runat="server" />
                        </button>
                        <ul id="PCate_ul" runat="server" class="dropdown-menu" style="overflow:auto;height:200px;width:300px;" role="menu" aria-labelledby="dropdownMenu1">
                        </ul>
                    </div>
                    </td>
            </tr>
            <tr>
                <td style="width: 120px;"><span class="pull-right" style="line-height: 34px">栏目名称：</span></td>
                <td>
                    <asp:TextBox ID="txtCateName" class="form-control text_md" runat="server" placeholder="栏目名称"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Style="float: left; margin-top: 10px; color: red;" ValidationGroup="add" ErrorMessage="必填项" ControlToValidate="txtCateName" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="optext">栏目类型：</td>
                <td>
                    <asp:RadioButtonList runat="server" ID="GType_Rad" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">贴吧栏目</asp:ListItem>
                        <asp:ListItem Value="0">留言栏目</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td class="optext">是否开启审核：</td>
                <td>
                   <input type="checkbox" id="IsCheck_Ra" class="switchChk" runat="server" />
                </td>
            </tr>
            <tr id="checkopt_tr" style="display:none;">
                <td class="optext"></td>
                <td style="line-height:30px;">
                    <input type="checkbox" id="CheckOpt_Ra" runat="server" class="pull-left switchChk" />
                    <span>(未审核帖子是否显示在列表)</span>
                </td>
            </tr>
            <tr class="onlybar">
                <td class="optext">发贴积分：</td>
                <td>
                    <asp:TextBox ID="SenderScore_T" Text="0" CssClass="form-control td_s" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="onlybar">
                <td class="optext">回贴积分：</td>
                <td>
                    <asp:TextBox ID="ReplyScore_T" Text="0" CssClass="form-control td_s" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="onlybar">
                <td class="optext">注册发帖：</td>
                <td>
                    <asp:TextBox ID="UserTime_T" runat="server" Text="120" CssClass="form-control td_s"></asp:TextBox> <span>分钟</span>
                </td>
            </tr>
            <tr>
                <td class="optext">发帖间隔：</td>
                <td>
                    <asp:TextBox ID="SendTime_T" runat="server" Text="5" CssClass="form-control td_s"></asp:TextBox> <span>分钟</span>
                </td>
            </tr>
            <tr class="onlybar">
                <td><span class="pull-right" style="line-height:34px;">所属类别：</span></td>
                <td>
                    <asp:RadioButtonList ID="PostType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">论坛版面</asp:ListItem>
                        <asp:ListItem Value="1">论坛分类</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr class="barFile_div onlybar">
                <td><span class="pull-right">图片压缩：</span></td>
                <td>
                    <div class="input-group pull-left" style="width:300px;">
                        <asp:TextBox runat="server" ID="ZipImgSize_T" CssClass="form-control" />
                        <span style="width:30px;" class="btn btn-default input-group-addon">KB</span>
                    </div><div class="pull-left" style="line-height:30px; margin-left:5px;"><span>0为不压缩,如输入2048,则超过2M的图片会自动等比压缩</span> </div>
                </td>
            </tr>
            <tr class="onlybar">
                <td><span class="pull-right">同步能力中心：</span></td>
                <td>
                    <input type="checkbox" id="IsPlat" class="switchChk" runat="server" />
                </td>
            </tr>
            <tr class="barFile_div">
                <td><span class="pull-right" style="line-height: 34px;">栏目图片：</span></td>
                <td>
                    <asp:TextBox runat="server" ID="ImageInfo_T" CssClass="form-control text_md" Style="display: inline;"></asp:TextBox>
                    <button type="button" onclick="SelFile()" class="btn btn-primary">选择图片</button>
                </td>
            </tr>
            <tr class="barFile_div">
                <td><span class="pull-right" style="line-height: 34px;">栏目简介：</span></td>
                <td>
                    <asp:TextBox ID="BarDesc_T" class="form-control pull-left" runat="server" TextMode="MultiLine" Width="300px" placeholder="栏目简介"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="pv2" ValidationExpression="^((.){0,300}$)" ValidationGroup="add" Display="Dynamic" ForeColor="Red" ErrorMessage="简介内容不能大于30位！" ControlToValidate="BarDesc_T" />
                </td>
            </tr>
            <tr class="onlybar">
                <td class="optext">吧主：</td>
                <td ng-app="app">
                    <div ng-controller="appController" class="text_500">
                        <table class="table table-bordered">
                            <tr><td>ID</td><td>用户名</td><td>操作</td></tr>
                            <tbody ng-repeat="item in list">
                                <tr>
                                    <td>{{item.id}}</td>
                                    <td>{{item.username}}</td>
                                    <td><a href="javascript:;" ng-click="remove(item.id);" title="移除"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="button" class="btn btn-primary" value="选择" onclick="SelBarOwner();" />
                    </div>

                    <asp:HiddenField runat="server" ID="BarOwner_T" />
                    <div style="padding-top: 3px;">
                        
                        <span style="padding-left: 5px;">提示：包含拥有在前台修改,删除,置顶,精华权限</span>
                    </div>
                    <asp:HiddenField runat="server" ID="BarOwner_Hid" />
                </td>
            </tr>
        </table>
    </div>
    <div class="tab-pane" id="auth">
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <td style="width: 120px;"><span class="pull-right" style="line-height: 34px;">访问权限：</span></td>
                <td>
                    <asp:RadioButtonList ID="NeedLog" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">允许匿名</asp:ListItem>
                        <asp:ListItem Value="1">登录用户</asp:ListItem>
                        <asp:ListItem Value="2">指定用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td><span class="pull-right" style="line-height: 34px;">发贴权限：</span></td>
                <td>
                    <asp:RadioButtonList ID="PostAuth" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">允许匿名</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">登录用户</asp:ListItem>
                        <asp:ListItem Value="2">指定用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>
    <div class="text-center">
         <asp:Button runat="server" CssClass="btn btn-primary" ID="AddBar_Btn" OnClientClick="return CheckData()" Text="添加栏目" OnClick="AddBar_Btn_Click" />
         <input type="button" data-dismiss="modal" value="关闭" class="btn btn-primary" />
    </div>
    </div>
    <div id="userdiv" style="position: fixed; top: 10px; left: 20%; background: #fff; display: none;">
        <iframe runat="server" id="User_IFrame" style="visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 430px;" name="main_right" src="/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo" frameborder="0"></iframe>
    </div>
   
    <div style="display: none;">
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ZL_Regex.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script type="text/javascript">
        var barmod={id:0,username:""}//吧主信息模型
        var curScope;
        //选择吧主(angular)
        var app = angular.module("app", []).controller("appController", function ($scope, $compile) {
            curScope = $scope;
            $scope.list = [];
            //加载吧主信息
            var barids=$("#BarOwner_Hid").val().split(',');
            var barnames=$("#BarOwner_T").val().split(',');
            for (var i = 0; i < barids.length; i++) {
                if(barids[i]==""){continue;}
                $scope.list.push({id:barids[i],username:barnames[i]});
            }
            $scope.remove = function (id) {
                $scope.list.forEach(function (v, i, _) {
                    if (v.id == id) {
                        _.splice(i, 1);
                    }
                });
            }
        })

        function HideBarSet() {
            $(".onlybar").hide();
        }
        $().ready(function () {
            $("#GType_Rad :radio").click(function () { if (this.value == "1") $(".onlybar").show(); else $(".onlybar").hide(); });
            $("#dropdownMenu1").find("#dr_text").text($("#PCate_ul").find("[role=" + $("#selected_Hid").val() + "]").children().first().text().trim());
            InitIsCheck();
            $("#IsCheck_Ra").on('switchChange.bootstrapSwitch', function (e, data) {
                InitIsCheck();
            });
            $("#PostAuth :radio").click(function () {
                if ($(this).val() == "2") {
                    ShowDiag("请指定用户权限","BarAuthSet.aspx?ID="+<%=CateID %>);
                }
            });
            $("#NeedLog :radio").click(function () {
                if ($(this).val() == "2") {
                    ShowDiag("请指定用户权限","BarAuthSet.aspx?ID="+<%=CateID %>);
                }
            });
        });
        function ShowDiag(title, url) {
            diag.title = title;
            diag.url = url;
            diag.maxbtn = false;
            diag.ShowModal();
        }
        function CloseDiag(){
            diag.CloseModal();
        }
        function CheckData() {
            if (!ZL_Regex.isNum($("#SenderScore_T").val()) || !ZL_Regex.isNum($("#ReplyScore_T").val())) {
                alert('积分格式不对！');
                return false;
            }
            if(!ZL_Regex.isNum($("#UserTime_T").val()) || !ZL_Regex.isNum($("#SendTime_T").val())){
                alert('用户发贴时间或发贴间隔格式不对!');
                return false;
            }
            return true;
        }
        //初始化审核状态
        function InitIsCheck() {
            if ($("#IsCheck_Ra")[0].checked)
                $("#checkopt_tr").show();
            else
                $("#checkopt_tr").hide();
        }
        function Refresh() {
            parent.location = parent.location;
        }
        var bardiag=new ZL_Dialog();
        function SelBarOwner() {
            //$("#select").css("margin-top", $(document).scrollTop());
            //$("#User_IFrame")[0].contentWindow.ClearChk();
            bardiag.title = "选择吧主";
            bardiag.content = "userdiv";
            bardiag.ShowModal();
            //$("#userdiv").show();
        }
        //选择用户回调
        function UserFunc(json, select) {
            curScope.$apply(function ($compile) {
                for (var i = 0; i < json.length; i++) {
                    curScope.list.pushNoDup({id:json[i].UserID,username:json[i].UserName});
                }
            })
            $("#BarOwner_Hid").val(curScope.list.GetIDS());
            bardiag.CloseModal();
        }
        function selectCate(data) {
            $("#selected_Hid").val($(data).attr("role"));
            $("#dropdownMenu1").find("#dr_text").text($(data).children().first().text().trim());
        }
        var diag = new ZL_Dialog();
        function SelFile() {
            diag.title = "选择图片";
            diag.url = "/common/SelFiles.aspx?pval={}";
            diag.maxbtn = false;
            diag.ShowModal();
        }
        function PageCallBack(action, src, pval) {
            $("#ImageInfo_T").val(src.split('|')[0]);
            diag.CloseModal();
        }
        function CloseDiag() {
            diag.CloseModal();
        }
    </script>
</asp:Content>
