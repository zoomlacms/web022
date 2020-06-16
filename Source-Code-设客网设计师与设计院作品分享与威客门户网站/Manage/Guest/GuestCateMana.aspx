<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Guest_GuestCateMana, App_Web_dbnpt1ot" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title>栏目管理</title><style>.modalClose{width:30px;height:20px;}.modalClose i{ display:block;margin-top:6px;font-size:12px;}</style></asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
    <asp:Repeater runat="server" ID="RPT">
        <HeaderTemplate>
            <table id="EGV" class="table table-bordered table-hover table-striped">
             <tr><td><input type="checkbox" id="ALLID_Chk"/></td><td>ID</td><td>图片</td><td>栏目名称</td><td>栏目状态</td><td>访问权限</td><td>计数(总计/今日/昨日)</td><td>操作</td></tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr data-layer="1" data-id="<%#Eval("CateID") %>" data-pid="0" onclick="ShowChild(this);">
                <td><input name="idchk" type="checkbox" value='<%#Eval("CateID")%>' /></td>
                <td><%#Eval("CateID") %></td>
                <td class='img_td'>
                    <img class="cateimg" src='<%#Eval("BarImage") %>' onerror="this.src='/Images/nopic.gif';" />
                    <img class="catebigimg" src='<%#Eval("BarImage") %>' onerror="this.src='/Images/nopic.gif';" />
                </td>
                <td style="text-align:left;"><a href="<%#Eval("GType").ToString().Equals("1")?"TieList.aspx?CateID="+Eval("CateID"):"Default.aspx?CateID="+Eval("CateID") %>"><span data-type="icon" class="<%#Convert.ToInt32(Eval("ChildCount"))>0?"glyphicon glyphicon-folder-close rep_tree_icon":"glyphicon glyphicon-file rep_tree_icon" %>" /></span></a><%#GetCateName()%></td>
                <td><span style="color:blue;"><%#GetBarStatus(Eval("BarInfo").ToString()) %></span></td>
                <td><%#GetNeedLog(Eval("NeedLog").ToString()) %></td>
                <td><%#GetCount(Eval("CateID").ToString()) %></td>
                <td class='optd'>
                    <%#(Eval("GType").ToString()=="0")?"":"<a href=\"javascript:;\" onclick=\"ShowCate(0,"+Eval("CateID")+");\">添加版面</a>" %>
                    <a href="javascript:;" onclick="ShowCate(<%#Eval("CateID") %>,0);">修改</a>
                    <%#Eval("GType").ToString().Equals("1") ? "<a href='BarAuthSet.aspx?ID=" + Eval("CateID") + "'>权限</a>" : "" %>
                    <%#Convert.ToInt32(Eval("ChildCount"))>0?"<a href=\"javascript:ShowOrder('"+Eval("Cateid")+"');\">排序</a>":"" %>
                     <a href="javascript:;" onclick="DelConfirm(<%#Eval("CateID") %>,1)">清空本版数据</a>
                     <a href="javascript:;" onclick='DelConfirm(<%#Eval("CateID") %>,0);'>删除</a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <style type="text/css">
       #EGV tr{cursor:pointer;}
       #EGV tr td{padding-left:8px;padding-bottom:3px;padding-top:3px;}
       .cateimg{width:25px;height:25px;}
       .catebigimg{position:absolute;max-width:300px;max-height:300px;display:none;margin-left:5px;}
       .optd a{margin-left:3px;}
    </style>
    <script type="text/javascript">
        // /Images/TreeLineImages/plus.gif
        // /Images/TreeLineImages/tree_line4.gif
        // /Images/TreeLineImages/t.gif
        //整理为JS插件,方便子父级显示的开发
        //动态加载tr,替换模板中值,后台返回json
        //后台返回的Json中必须包含Layer,
        var childTlp = "<tr data-layer='@Layer' data-id='@Cateid' data-pid='@ParentID' onclick='ShowChild(this);'>"
        + "<td><input name='idchk' type='checkbox' value='@Cateid'></td>"
        + "<td>@Cateid</td>"
        + "<td class='img_td'><img class='cateimg' src='@BarImage' onerror='this.src=\"/Images/nopic.gif\";'><img class='catebigimg' src='@BarImage' onerror='this.src=\"/Images/nopic.gif\";' /></td>"
        + "<td style='text-align:left;'>@LayerHtml<img src='/Images/TreeLineImages/t.gif'><a href='TieList.aspx?CateID=@Cateid'><span data-type='icon' class='@hasChImg'></span></a><a href='javascript:;' onclick='ShowCate(@Cateid,0)'>@Catename</a></td>"
        + "<td><span style='color:blue;'><span style='color:black'>@BarInfo</span></span></td><td><i data-type='func'>@NLogStr<i></td><td>@CountStr</td>"
        + "<td class='optd'><a href='javascript:;' onclick='ShowCate(0,@Cateid);'>添加版面</a>"
        + "<a href='javascript:;' onclick='ShowCate(@Cateid,0);'>修改</a>"
        + "<a href='BarAuthSet.aspx?ID=@Cateid'>权限</a><fun>HaschOrder('@_model');</fun>"
        + "<a onclick='DelConfirm(@Cateid,0);'>删除</a></td></tr>";
        var layerTlp= "<img src='/Images/TreeLineImages/tree_line4.gif' />";
        //第一次点击时加载,以后点击时显示子级
        function ShowChild(obj) {
            $.ajax({
                type: "Post",
                //url: "Guest",
                data: { action: "GetChild", value: $(obj).data("id") },
                success: function (data) {
                    if (data != "" && data != "[]") {
                        data = JSON.parse(data);
                        var html = ReplaceTlp(childTlp, $(obj).data("layer"), data);
                        obj.onclick = function () { ToggleChild(obj); }
                        $(obj).after(html);
                        $(obj).find("[data-type=icon]").attr("class", "glyphicon glyphicon-folder-open rep_tree_icon");
                        BindEvent();
                    }
                },
                error: function (data) {
                }
            });
        }
        //确定是要显示还是隐藏
        function ToggleChild(obj) {
            console.log("ToggleChild");
            var id = $(obj).data("id");
            $trs = $("#EGV tr[data-pid=" + id + "]");
            if ($trs.length < 1) return;
            var flag = $trs.is(":visible");
            if (flag) {
                HideByPid(id);
                $(obj).find("[data-type=icon]").attr("class", "glyphicon glyphicon-folder-close");
            }//隐藏的话递归  
            else {
                $trs.show();
                $(obj).find("[data-type=icon]").attr("class", "glyphicon glyphicon-folder-open");
            }
        }
        //true隐藏,false显示 
        function HideByPid(pid) {
            $trs = $("#EGV tr[data-pid=" + pid + "]");
            if (!$trs || $trs.length < 1) return;//不存在,或下再无子级时跳出递归
            for (var i = 0; i < $trs.length; i++) {
                HideByPid($($trs[i]).data("id"));
            }
            $("#EGV tr[data-pid=" + pid + "]").hide();
        }
        //附加数据
        function ReplaceTlp(tlp, layer, list) {
            var layerhtml = "";
            for (var i = 1; i < layer; i++) {
                layerhtml += layerTlp;
            }
            tlp = tlp.replace("@LayerHtml", layerhtml).replace("@Layer", ++layer);
            for (var i = 0; i < list.length; i++) {
                list[i].hasChImg = HasImg(list[i].ChildCount);
            }
            //替换模板
            return JsonHelper.FillData(tlp, list);
        }
        //---Tools用于成员判断
        function HaschOrder(model)
        {
            return parseInt(model.ChildCount) > 0 ? "<a href=\"javascript:open_page('SetCateOrder.aspx?id=" + model.Cateid + "');\">排序</a>" : ""
        }
        function HasImg(ChildCount)
        {
            return parseInt(ChildCount) > 0 ? "glyphicon glyphicon-folder-close" : "glyphicon glyphicon-file"
        }
    </script>
    <div>
        <asp:Button ID="BtnSetRecomPosation" runat="server" CssClass="btn btn-primary" Text="批量推荐" OnClick="BtnSetRecomPosation_Click" />
        <asp:Button ID="BtnSetChanlnePosation" runat="server" CssClass="btn btn-primary" Text="取消推荐" OnClick="BtnSetChanlnePosation_Click" />
    </div>
<div id="footer" style="display:none;">
    <input type="button" id="addbtn" class="btn btn-primary" value="添加" onclick="SaveTie()" />
    <input type="button" data-dismiss="modal" value="关闭" class="btn btn-primary" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script>
        $(function () {
            $("#ALLID_Chk").click(function () { selectAllByName(this, "idchk"); });
            BindEvent();
        });
        function BindEvent() {
            $(".img_td").hover(function () { ShowImg(this); }, function () { $(".catebigimg").hide(); });
        }
        function ShowImg(obj) {
            $(obj).find(".catebigimg").show();
        }
        function DelConfirm(id,type) {
            if (type == 0 && confirm("确实要删除吗？当系统无栏目数据时，则不能发表留言!"))
            {
                location = "GuestCateMana.aspx?Type=" + gtype + "&Del=" + id;
            }
            if (type==1&&confirm("确实要清空本版数据吗？")) {
                location = "TieList.aspx?CateID=" + id + "&type=del";
            }
        }
        function ShowDesk() {
            var ifr = $("#cate_ifr")[0];
            window.location = ifr.contentWindow.location;
        }
        function ShowDesk2() {
            var ifr = $("#order_ifr")[0];
            window.location = ifr.contentWindow.location;
        }
        var gtype = "<%:GType%>";
        var diag = new ZL_Dialog();
        var diag2 = new ZL_Dialog();
        function ShowCate(id, pid) {
            location.href="BarConfig.aspx?ID=" + id + "&GType=" + gtype + "&PID=" + pid;
        }
        function ShowOrder(id) {
            diag2.title = "栏目排序";
            diag2.url = "SetCateOrder.aspx?id=" + id;
            diag2.ShowModal();
        }
    </script>
</asp:Content>
