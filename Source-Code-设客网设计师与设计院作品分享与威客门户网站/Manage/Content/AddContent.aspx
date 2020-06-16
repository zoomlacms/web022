<%@ page language="C#" autoeventwireup="true" inherits="V_Content_AddContent, App_Web_ckin0fxz" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>
<%@ Register Src="~/Manage/I/ASCX/TemplateView.ascx" TagPrefix="ZL" TagName="TlpListView" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title><asp:Literal runat="server" ID="Title_L"></asp:Literal></title>
<style>
.speDiag{width:500px;}
.specDiv{width:110px;padding-left:5px;}
.specDiv .spec{border:solid 1px #ccc;margin:5px;}
.specDiv .specname{text-align:left;padding-left:5px;display:inline-block}
.specDiv span{display:inline-block;float:right;line-height:20px;}
.tabinput{ border:none; padding-left:5px; height:30px; line-height:30px;}
.radius{margin:2px;margin-top:20px;height:24px; line-height:24px; background:#eee; border:1px solid #ddd;border-radius:3px;padding:3px;}
#OAkeyword{ max-width:460px; height:36px; border:1px solid #ccc; display:inline-block;min-width:300px;padding-top:3px;}
#Keywords {display: none;}
</style>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#ConInfo" data-toggle="tab">内容信息</a></li>
            <li><a href="#InfoAttr" data-toggle="tab">信息属性</a></li>
            <li><a href="#Process " data-toggle="tab">流程控制</a></li>
            <li><a href="#Reward " data-toggle="tab">悬赏定义</a></li>
        </ul><style></style>
        <div class="tab-content">
            <div class="tab-pane active" id="ConInfo">
                <table id="mainTable" class="table table-bordered table_padding0 addcontent_modeltale" >
                    <tr>
                        <td style="overflow-x:hidden;" class="col-sm-1 col-xs-1 text-right"><asp:Label ID="bt_txt" runat="server" Text="标题"></asp:Label>&nbsp;&nbsp;</td>
                        <td class="col-sm-11 col-xs-11">
                            <asp:TextBox ID="txtTitle" style="background:url(/Images/bg1.gif) repeat-x;" CssClass="form-control m715-50" onkeyup="isgoEmpty('txtTitle','span_txtTitle');Getpy('txtTitle','PYtitle')"  runat="server"></asp:TextBox>
                            <span class="vaild_tip">*</span>
                            <a href="javascript:;" id="Button11" class="btn btn-info btn-sm" onclick="ShowTitle()" ><i class="fa fa-info"></i> 标题属性</a>
                            <button type="button" class="btn btn-info btn-sm" onclick="ShowContentList()"><i class="fa fa-chain"></i> 关联内容</button>
                            <button type="button" class="btn btn-info btn-sm" onclick="ShowSys();"><i class="fa fa-list"></i></button>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="标题不能为空" ForeColor="Red" Display="Dynamic" />
                            <span id="span_txtTitle" name="span_txtTitle"></span>
                            <asp:HiddenField ID="ThreadStyle" runat="server" />
                            <div id="duptitle_div" class="alert alert-warning" style="position: absolute;margin-left:315px;display:none;">
                                <ul id='duptitle_ul'></ul>
                            </div>
                        </td>
                    </tr>
                    <tbody id="Sys_Fied" runat="server" style="display:none;">
                    <tr>
                        <td class="text-right"><asp:Label ID="py" runat="server" Text="拼音缩写"></asp:Label>&nbsp;&nbsp;</td>
                        <td>
                            <asp:TextBox ID="PYtitle" CssClass="form-control m715-50" runat="server" />
                        </td>
                    </tr>
                   <tr id="spec_tr">
                        <td class="text-right">所属专题&nbsp;&nbsp;</td>
                        <td>
                            <div class="specDiv"></div>
                            <span id="specbtn_span"><asp:Literal ID="SpecInfo_Li" runat="server"></asp:Literal></span>
                            <asp:HiddenField ID="Spec_Hid" runat="server" />
                        </td>
                    </tr>
                    <tr runat="server">
                        <td class="tdbgleft" align="right"> 
                            <asp:Label ID="gjz_txt" runat="server" Text="关键字"></asp:Label>
                            &nbsp;
                        </td>
                        <td>                             
                            <div id="OAkeyword"></div>
                            <asp:TextBox ID="Keywords" runat="server" CssClass="form-control" />
                            <asp:HiddenField runat="server" ID="IgnoreKey_Hid" />
                            <span class="rd_green">(使用空格键或回车键分隔关键字,每个关键字长度不超过10个,每个中文计两个字符)</span>
                        </td>                        
                    </tr>
                    <tr runat="server">
                        <td class="text-right"><asp:Label ID="Label4" runat="server" Text="副标题"></asp:Label>&nbsp;&nbsp;</td>
                        <td>
                            <asp:TextBox ID="Subtitle" CssClass="form-control m715-50" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                    </tbody>
                    <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                    <tr id="attPic" runat="server">
                        <td class="text-right">主编辑器扩展图</td>
                        <td style="height:80px;">
                            <ul id="ThumImg_ul" class="preview_img_ul">
                            </ul>
                            <div class="clearfix"></div>
                            <select name="selectpic" id="selectpic" onchange="ShowPic(this.value)" class="form-control text_300">
                                <option value="" selected="selected">不指定附属图片</option>
                            </select>
                        </td>
                    </tr>
                    <tr id="CreateHTML" runat="server">
                        <td class="text-right">
                            <asp:Label ID="Label1" runat="server" Text="生成"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:CheckBox ID="quickmake" runat="server" Checked="false" Text="是否立即生成" />&nbsp;
                        </td>
                    </tr>
                </table>
                <div style="height:50px;"></div>
            </div>
            <div class="tab-pane fade" id="InfoAttr">
                <table class="table table-bordered table_padding0">
                    <tr>
                        <td class="text-right">录入者</td>
                        <td>
                            <asp:TextBox ID="txtInputer" CssClass="form-control text_md" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">添加时间</td>
                        <td>
                            <asp:TextBox ID="txtAddTime" CssClass="form-control text_md" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right"><asp:Label ID="gx_time" runat="server" Text="修改时间"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdate" CssClass="form-control text_md" onClick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right"><span>自动审核</span></td>
                        <td>
                            <asp:TextBox ID="CheckDate_T" CssClass="form-control text_md" onClick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right"><span>自动过期</span></td>
                        <td>
                            <asp:TextBox ID="TimeDate_T" CssClass="form-control text_md" onClick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right"><asp:Label ID="hits_txt" runat="server" Text="点击统计"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtNum" CssClass="form-control text_md" runat="server">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">允许评论</td>
                        <td>
                            <asp:RadioButtonList ID="IsComm_Radio" runat="server" CssClass="pull-left" RepeatColumns="2">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList> <span class="pull-left rd_green">(该操作只在节点管理下配置了允许发表评论时生效!)</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">个性模板</td>
                        <td>
                            <%=PageCommon.GetTlpDP("TxtTemplate") %>
                            <asp:HiddenField ID="TxtTemplate_hid" runat="server" />

                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">生成PDF文件</td>
                        <td>
                            <asp:CheckBox ID="Makepdf" runat="server" Text="启用" />
                        </td>
                    </tr>
                </table>
                <ZL:TlpListView ID="TlpView_Tlp" TemplateTitle="name" runat="server" />
            </div>
            <div class="tab-pane fade" id="Process">
                <table class="table table-bordered">
                    <tr>
                        <td class="text-right">
                            <asp:Label ID="tj_txt" runat="server" Text="推荐级别"></asp:Label></td>
                        <td>
                            <asp:CheckBox ID="ChkAudit" runat="server" />推荐
                        </td>
                    </tr>
                    <tr id="contentsk" runat="server">
                        <td class="text-right"><asp:Label ID="zht_txt" runat="server" Text="状态"></asp:Label></td>
                        <td>
                            <asp:RadioButtonList ID="ddlFlow" runat="server" RepeatColumns="5">
                            <%--    <asp:ListItem Value="99" Selected="True">已审</asp:ListItem>
                                <asp:ListItem Value="0">待审</asp:ListItem>
                                <asp:ListItem Value="-1">退稿</asp:ListItem>--%>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane fade" id="Reward">
                <table class="table table-bordered table_padding0">
                    <tr>
                        <td class="text-right">发布悬赏</td>
                        <td>
                            <asp:DropDownList ID="BidType" CssClass="form-control text_md" runat="server" onchange="changevalue(this.value);">
                                <asp:ListItem Value="0">选择方式</asp:ListItem>
                                <asp:ListItem Value="1">单人中标</asp:ListItem>
                                <asp:ListItem Value="2">记件工资</asp:ListItem>
                            </asp:DropDownList>
                            <div id="changeins" style="display: none">
                                <span>我想要</span><asp:TextBox ID="pronum" Width="30px" runat="server" CssClass="form-control text_xs">0</asp:TextBox><span> 个方案，每个</span>
                                <asp:TextBox ID="bidmoney" Width="30px" runat="server" CssClass="form-control text_xs">0</asp:TextBox><span>元</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">项目完成周期 </td>
                        <td>
                            <asp:TextBox ID="proweek" CssClass="form-control text_xs" runat="server"></asp:TextBox>天
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="Conent_fix">
        <asp:HiddenField runat="server" ID="RelatedIDS_Hid" />
        <asp:HiddenField runat="server" ID="nodename"  />
        <asp:Button runat="server" CssClass="btn btn-primary" ID="EBtnSubmit" Text="添加项目" OnClick="EBtnSubmit_Click" />
        <asp:Button runat="server" CssClass="btn btn-primary" ID="DraftBtn" Text="存为草稿" OnClick="DraftBtn_Click"/> 
        <a href="ContentManage.aspx?NodeID=<%=NodeID %>" class="btn btn-primary">返回列表</a> 
        <a href="javascript:;" id="toTop" onclick="pageScroll();"><i class="glyphicon glyphicon-upload"></i>Top</a>
    </div>
    <div id="pushcon_div" class="alert alert-info">
        <div>保存时自动推送<a href="javascript:$('#pushcon_div').hide();;" title='隐藏'><span class="glyphicon glyphicon-remove"></span></a></div>
        <ul id="pushcon_ul" class="list-unstyled"></ul>
        <asp:HiddenField runat="server" ID="pushcon_hid" />
    </div>
    <ZL:TlpDown runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    var zlconfig = {
        updir: "<%=ZoomLa.Components.SiteConfig.SiteOption.UploadDir.ToLower()%>",
        duptitlenum: "<%=ZoomLa.Components.SiteConfig.SiteOption.DupTitleNum%>",
        modelid: "<%=ModelID%>",
        keys:<%=keys%>
        };
</script>
<script type="text/javascript" src="/JS/OAKeyWord.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/chinese.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/ICMS/tags.json"></script>
<script type="text/javascript" src="/JS/ZL_Content.js"></script>
<script>
    $().ready(function () {
        Tlp_initTemp();
    });
    //智能模板选择事件
    function OnTemplateViewCheck(value) {
        $("#TxtTemplate_hid").val(value);
    }
    //function CheckTlp(obj, name) {
    //    $('.Template_box').removeClass('tlp_active');
    //    var $box = $(obj).closest(".Template_box");
    //    $box.addClass("tlp_active");
    //    $("#TxtTemplate_hid").val(name);
    //}
</script>
</asp:Content>