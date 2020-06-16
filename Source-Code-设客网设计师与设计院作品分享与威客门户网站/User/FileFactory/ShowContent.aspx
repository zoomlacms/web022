<%@ page language="C#" autoeventwireup="true" masterpagefile="~/User/Empty.master" inherits="ZoomLa.WebSite.Manage.Content.ShowContent, App_Web_w2om43kn" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>预览内容</title>
<link href="../../App_Themes/UserThem/edit.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../../App_Themes/UserThem/bidding.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
<script type="text/javascript" src="../../JS/thickbox-compressed.js"></script>
<script src="/JS/Common.js" type="text/javascript"></script>
<script type="text/javascript" src="../../JS/DocManage.js"></script>
<script src="/Plugins/JqueryUI/spin/spin.js"></script>
    <style type="text/css">
        .pics {
            position: relative;
            left: 200px;
            top: -10px;
            display: block;
            height: 18px;
            background: #e8f5ff;
            width: 200px;
            text-align: left;
        }

        .r_navigations {
            border-style: none;
            margin-bottom: 0px;
            line-height: 24px;
            text-align: left;
            clear: both;
            color: #000;
        }

            .r_navigations a, #r_navigation:link {
                text-decoration: none;
                color: #000;
            }

                .r_navigations a:hover {
                    color: #c00;
                    text-decoration: underline;
                }

        .auto-style1 {
            border-left: 1px solid #e8f5ff;
            border-right: 1px solid #e8f5ff;
            border-top: 1px solid #e8f5ff;
            background: #CBE6FC;
            width: 130px;
            font-weight: bold;
            text-align: center;
            line-height: 20px;
            font-size: 12px;
            height: 22px;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: 0px;
        }

        .auto-style2 {
            line-height: 20px;
            border-bottom: 1px solid #fff;
            height: 22px;
        }

        .Photo-style {
            width: 200px;
            height: 120px;
            margin-top: 6px;
            border: #b6ff00 1px solid;
        }

        #txtNode {
            border: none;
            background: #f6fdf6;
        }

        .us_topinfo {
            margin-bottom: 10px;
        }

        .spinDivCss {
            position: absolute;
            z-index: 100;
            display: block;
        }
    </style>
    <script type="text/JavaScript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2");
        function ShowTabs(ID) {
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                document.getElementById(arrTabs[tID].toString()).style.display = "none";
                document.getElementById(arrTabs[ID].toString()).style.display = "";
                tID = ID;
            }
        }
        function showCustom(value) {
            var index = parseInt(value);

            for (i = 2; i <= 20; i++) {
                if (i <= index)
                    document.getElementById("Custom" + i).style.display = "";
                else
                    document.getElementById("Custom" + i).style.display = "none";
            }
        }

        function selectnum() {

        }
        var stID = 0;
        var sarrTabTitle = new Array("sTabTitle0", "sTabTitle1", "sTabTitle2");
        function sShowTabs(ID) {
            if (ID != stID) {
                if (sarrTabTitle[stID] != null) {
                    document.getElementById(sarrTabTitle[stID].toString()).className = "tabtitle";
                }
                if (sarrTabTitle[ID] != null) {
                    document.getElementById(sarrTabTitle[ID].toString()).className = "titlemouseover";
                }
                stID = ID;
            }
        }
        function sshowCustom(value) {
            var index = parseInt(value);

            for (i = 2; i <= 20; i++) {
                if (i <= index)
                    document.getElementById("sCustom" + i).style.display = "";
                else
                    document.getElementById("sCustom" + i).style.display = "none";
            }
        }

        var diag = new Dialog();
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function open_title(ModelID, NodeID) {
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = "添加内容<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
            diag.URL = "AddContent.aspx?ModelID=" + ModelID + "&NodeID=" + NodeID;
            diag.show();
        }

        function opentitle(url, title) {
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = title;
            diag.URL = url;
            diag.show();
        }

        function closdlg() {
            Dialog.close();
        }
    </script>
    <script language="javascript">

        function svcode(obj) {
            var winname = window.open('', '_blank', 'height=1,width=1,top=200,left=300');
            winname.document.open('text/html', 'replace');
            winname.document.writeln(obj);
            winname.document.execCommand('saveas', '', 'code.txt');
            winname.close();
        }
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <div class="us_topinfo">
            <span>后台管理</span> &gt;&gt;&nbsp;<span><a href="ContentManage.aspx">内容管理</a></span>&nbsp;&gt;&gt;
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HdnModelID" runat="server" />
        </div>
        <div class="clearbox"></div>
        <div id="backDoc" style="display: none;"><a href="javascript:">返回</a></div>
        <table style="height: 500px; width: 30%; float: left;" border="0" cellpadding="5" cellspacing="1" class="border" id="left">
            <tr class="tdbg">
                <td style="margin-top: 0px; margin-left: 0px;">
                    <table class="table table-striped table-bordered table-hover">
                        <%-- 基本信息--%>
                        <tbody id="Tabs0">
                            <tr class="tdbg">
                                <td class="tdbgleft" style="width: 130px; text-align: center"><strong>所属节点</strong></td>
                                <td class="bqright">
                                    <asp:TextBox ID="txtNode" CssClass="form-control" runat="server" Width="250px" Enabled="false" Text="" />
                                    <asp:HiddenField ID="hfNode" runat="server" Value="" />
                                </td>
                            </tr>
                            <tr class="tdbg">
                                <td class="tdbgleft" align="center" height="22"><strong>ID</strong></td>
                                <td class="tdrighttxt">
                                    <asp:Label ID="GeneralID" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr class="tdbg">
                                <td class="tdbgleft" align="center"><strong>标题</strong></td>
                                <td class="tdrighttxt">
                                    <asp:Label ID="txtTitle" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <asp:Literal ID="TempHtml" runat="server"></asp:Literal>
                            <asp:Literal ID="ModelHtml" runat="server" Visible="false"></asp:Literal>
                            <tr class="tdbg"  style="font-weight: bold">
                                <td colspan="2">
                                    <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" CellPadding="4"
                                        GridLines="None" Font-Size="12px" Style="margin-bottom: 0px; margin-top: 0px;"
                                        CssClass="r_navigations" CellSpacing="1">
                                        <Fields></Fields>
                                        <FooterStyle Font-Bold="True" BackColor="#FFF" />
                                        <CommandRowStyle Font-Bold="True" CssClass="r_navigations tdlefttxt" />
                                        <RowStyle />
                                        <FieldHeaderStyle Font-Bold="True" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <HeaderStyle Font-Bold="True" />
                                        <EditRowStyle />
                                        <AlternatingRowStyle />
                                    </asp:DetailsView>
                                </td>
                            </tr>
                        </tbody>
                        <%--信息属性--%>
                        <tbody id="Tabs1" style="display: none">
                            <tr class="tdbg">
                                <td class="tdlefttxt"><strong>录入者</strong></td>
                                <td class="tdrighttxt">
                                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr class="tdbg">
                                <td class="tdlefttxt"><strong>录入时间</strong></td>
                                <td class="tdrighttxt">
                                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <center>
              <asp:Button ID="EditDoc" CssClass="btn btn-primary" runat="server" Text="修改文件" OnClick="EditDoc_Click" />
              <asp:Button ID="SaveDoc" CssClass="btn btn-primary" runat="server" Text="保存文件" OnClick="SaveDoc_Click" Visible="false"/>
              <asp:Button ID="ReBuildDoc" CssClass="btn btn-primary" runat="server" Text="生成文档" OnClientClick="return generate3('docTitle','docParamValue','preview');" OnClick="ReBuildDoc_Click"/>
              <asp:Button ID="DeleDoc" CssClass="btn btn-primary" runat="server" Text="删除文件" OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"
					OnClick="Delete_Click" />
              <asp:Button ID="BakList" CssClass="btn btn-primary" runat="server" Text="返回列表" OnClick="BakList_Click"/>
            </center>
                </td>
            </tr>
        </table>
        <div class="editdocLi" style="height: 500px; width: 68%; float: right; margin-right: 15px;" id="right">

            <div style="width:100%;text-align:center;margin-top:15px;">
           <span id="Remind" style="color:red;font-size:21px;" runat="server" visible="false">你好,<%=txtTitle.Text%>目录当前没有文档,你可以<a href="javascript:generate3('docTitle','docParamValue','preview');location=location;void(0);" style="color:blue;font-size:21px;">[点击全部生成]</a>或单击下列模板生成单个文档。</span>
                </div>
            <div style="clear: both;height:10px;"></div>
            <div id="tempListDiv">
                <ul>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                      <li>
                          <%# System.IO.File.Exists(Server.MapPath(m_ConfigUploadDir+docTitle.Value+"/"+Eval("DocName"))) ?"<span>" + "<a href='javascript:openDoc(\"" +txtTitle.Text+ "/" + Eval("DocName") + "\")' title='单击打开" + Eval("DocName") + "'>" + Eval("DocName") + "</a></span> ":"<a href='javascript:singleDocGen(\"docTitle\",\"docParamValue\",\""+ Eval("DocName")+"\");' style='background:url(/App_Themes/AdminDefaultTheme/images/System3Grey.png) no-repeat top center;' title=未生成,点击生成>" + Eval("DocName") + "</a>" %>
                      </li>
                    </ItemTemplate>
                </asp:Repeater>
                </ul>
            </div>
        </div>
        <div style="clear: both"></div>
        <iframe id="wordManage" style="width: 1px; height: 1px;" src="/edit/edit.aspx"></iframe>
        <script type="text/javascript">
            //打开Word文档
            function openDoc(title) {
                document.getElementById("wordManage").style.width = "100%";
                document.getElementById("wordManage").style.height = "750px";
                // document.getElementById("top").style.display   = "none";
                document.getElementById("left").style.display = "none";
                document.getElementById("right").style.display = "none";
                wordManage.window.openWord2(title);
            }
            function closeDoc() {
                document.getElementById("wordManage").style.width = "1px";
                document.getElementById("wordManage").style.height = "1px";
                //  document.getElementById("top").style.display = "";
                document.getElementById("left").style.display = "";
                document.getElementById("right").style.display = "";
            }
        </script>
        <asp:HiddenField ID="HiddenType" runat="server" />
        <asp:HiddenField ID="HiddenModeid" runat="server" />
        <asp:HiddenField ID="HiddenGID" runat="server" />
        <asp:HiddenField ID="HdnNode" runat="server" />
        <asp:HiddenField ID="docParamValue" runat="server" Value="" />
        <asp:HiddenField ID="docTitle" runat="server" Value="" />
        <div id="preview"  class="spinDivCss" style="display:none;">
            <span style="margin-left:30px;">正在生成，系统5秒后自动刷新。</span>
        </div>
        <script type="text/javascript">
            //----------等待图效果
            $.fn.spin = function (opts) {
                this.each(function () {
                    var $this = $(this),
                        data = $this.data();

                    if (data.spinner) {
                        data.spinner.stop();
                        delete data.spinner;
                    }
                    if (opts !== false) {
                        data.spinner = new Spinner($.extend({ color: $this.css('color') }, opts)).spin(this);
                    }
                });
                return this;
            };
            function update() {
                var opts = {};
                $('#opts input[min], #opts select').each(function () {
                    $('#opt-' + this.name).text(opts[this.name] = parseFloat(this.value));
                });
                $('#opts input:checkbox').each(function () {
                    opts[this.name] = this.checked;
                    $('#opt-' + this.name).text(this.checked);
                });
                $('#preview').spin(opts);
                if ($('#share').is(':checked')) {
                    window.location.replace('#?' + $('form').serialize());
                }
            }
            $(function () {
                var params = {};
                var hash = /^#\?(.*)/.exec(location.hash);
                if (hash) {
                    $('#share').prop('checked', true);
                    $.each(hash[1].split(/&/), function (i, pair) {
                        var kv = pair.split(/=/);
                        params[kv[0]] = kv[kv.length - 1];
                    });
                }
                $('#opts input[min], #opts select').each(function () {
                    var val = params[this.name];
                    if (val !== undefined) this.value = val;
                    this.onchange = update;
                });
                $('#opts input:checkbox').each(function () {
                    this.checked = !!params[this.name];
                    this.onclick = update;
                });
                $('#share').click(function () {
                    window.location.replace(this.checked ? '#?' + $('form').serialize() : '#!');
                });
                update();
            });
            if (!window.ActiveXObject)//如果非IE，则清除上面的Iframe，避免兼容性问题
            {
                alert("请使用IE浏览器访问，否则无法生成，浏览文档功能!");
            }
        </script>
</asp:Content>

