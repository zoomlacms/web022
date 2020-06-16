<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_Projects, App_Web_jzh2rzwp" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title><%=lang.LF("查看项目")%></title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div class="line" style="margin-bottom: 0px;">
        <asp:DropDownList ID="DDList0" CssClass="form-control text_s" runat="server">
            <asp:ListItem Value="">请选择</asp:ListItem>
            <asp:ListItem Value="0">项目名称</asp:ListItem>
            <asp:ListItem Value="1" Selected="True">项目经理</asp:ListItem>
            <asp:ListItem Value="2">技术负责人</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="TxtADName" runat="server" class="form-control text_300" onclick="if(this.value=='关键字'){this.value=this.value=='关键字'?'':this.value;}"
            onblur="if(this.value==''){ this.value=this.value==''?'关键字':this.value;}">关键字</asp:TextBox>
        &nbsp;<%=lang.LF("时间")%>：
        <select id="timeval" runat="server" class="form-control text_s" onchange="changeTime(this.value,'-1')">
            <option value="0">按月份</option>
            <option value="1">按季度</option>
            <option value="2">按年份</option>
        </select>
        &nbsp;<asp:DropDownList ID="times" CssClass="form-control text_s" runat="server">
            <asp:ListItem Value="-1" Selected="True">请选择</asp:ListItem>
            <asp:ListItem Value="1">一月</asp:ListItem>
            <asp:ListItem Value="2">二月</asp:ListItem>
            <asp:ListItem Value="3">三月</asp:ListItem>
            <asp:ListItem Value="4">四月</asp:ListItem>
            <asp:ListItem Value="5">五月</asp:ListItem>
            <asp:ListItem Value="6">六月</asp:ListItem>
            <asp:ListItem Value="7">七月</asp:ListItem>
            <asp:ListItem Value="8">八月</asp:ListItem>
            <asp:ListItem Value="9">九月</asp:ListItem>
            <asp:ListItem Value="10">十月</asp:ListItem>
            <asp:ListItem Value="11">十一月</asp:ListItem>
            <asp:ListItem Value="12">十二月</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="BntSearch" runat="server" Text="查询" OnClick="BntSearch_Click" class="btn btn-primary" />
    </div>
    <div class="divbox" id="nocontent" runat="server" style="display: none">
        <%=lang.LF("暂无项目信息")%>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a id="TabTitle0" onclick="ShowTabss(0,0)"><%=lang.LF("所有")%></a></li>
        <li><a id="TabTitle1" onclick="ShowTabss(1,0)"><%=lang.LF("未审核")%></a></li>
        <li><a id="TabTitle2" onclick="ShowTabss(2,0)"><%=lang.LF("已审核")%></a></li>
        <li><a id="TabTitle3" onclick="ShowTabss(3,0)"><%=lang.LF("未启动")%></a></li>
        <li><a id="TabTitle4" onclick="ShowTabss(4,0)"><%=lang.LF("已启动")%></a></li>
        <li><a id="TabTitle5" onclick="ShowTabss(5,0)"><%=lang.LF("已完成")%></a></li>
        <li><a id="TabTitle6" onclick="ShowTabss(1,0)"><%=lang.LF("存档")%></a></li>
    </ul>
    <table class="table table-striped table-bordered table-hover" id="EGV">
        <tbody>
            <div id="aa" runat="server">
            </div>
            <tr align="center">
                <td width="4%">
                    <%=lang.LF("选择")%>
                </td>
                <td width="3%">
                    <a href="?txtPage=<%=Request.QueryString["txtPage"] %>&tname=<%=Request.QueryString["tname"] %>&DDList0=<%=Request.QueryString["DDList0"] %>&keyword=<%=Request.QueryString["keyword"] %>&pid=<%=Request.QueryString["pid"] %>&Currentpage=<%=Request.QueryString["Currentpage"] %>&adminname=<%=Request.QueryString["adminname"] %>&timess=<%=Request.QueryString["timess"]%>&timeval=<%= Request.QueryString["timeval"]%>&OpjectID=<%=Request.QueryString["OpjectID"] %>&orderby=<%=Request.QueryString["orderby"]=="11"?"12":"11" %>"><b>ID</b></a><%=Request.QueryString["orderby"] == "11" ? "▲" : "▼"%>
                </td>
                <td width="10%">
                    <%=lang.LF("项目名称")%>
                </td>
                <td width="7%">
                    <%=lang.LF("项目类型")%>
                </td>
                <td width="9%">
                    <a href="?txtPage=<%=Request.QueryString["txtPage"] %>&tname=<%=Request.QueryString["tname"] %>&DDList0=<%=Request.QueryString["DDList0"] %>&keyword=<%=Request.QueryString["keyword"] %>&pid=<%=Request.QueryString["pid"] %>&Currentpage=<%=Request.QueryString["Currentpage"] %>&adminname=<%=Request.QueryString["adminname"] %>&timess=<%=Request.QueryString["timess"]%>&timeval=<%= Request.QueryString["timeval"]%>&OpjectID=<%=Request.QueryString["OpjectID"] %>&orderby=<%=Request.QueryString["orderby"]=="21"?"22":"21" %>"><b><%=lang.LF("项目价格")%></b></a><%=Request.QueryString["orderby"] == "21" ? "▲" : "▼"%>
                </td>
                <td width="12%">
                    <a href="?txtPage=<%=Request.QueryString["txtPage"] %>&tname=<%=Request.QueryString["tname"] %>&DDList0=<%=Request.QueryString["DDList0"] %>&keyword=<%=Request.QueryString["keyword"] %>&pid=<%=Request.QueryString["pid"] %>&Currentpage=<%=Request.QueryString["Currentpage"] %>&adminname=<%=Request.QueryString["adminname"] %>&timess=<%=Request.QueryString["timess"]%>&timeval=<%= Request.QueryString["timeval"]%>&OpjectID=<%=Request.QueryString["OpjectID"] %>&orderby=<%=Request.QueryString["orderby"]=="31"?"32":"31" %>"><b><%=lang.LF("启动时间")%></b></a><%=Request.QueryString["orderby"] == "31" ? "▲" : "▼"%>
                </td>
                <td width="8%">
                    <%=lang.LF("项目经理")%>
                </td>
                <td width="5%">
                    <%=lang.LF("审核")%>
                </td>
                <td width="7%">
                    <%=lang.LF("项目管理")%>
                </td>
                <td width="7%">
                    <%=lang.LF("当前进度")%>
                </td>
                <td width="12%">
                    <a href="?txtPage=<%=Request.QueryString["txtPage"] %>&tname=<%=Request.QueryString["tname"] %>&DDList0=<%=Request.QueryString["DDList0"] %>&keyword=<%=Request.QueryString["keyword"] %>&pid=<%=Request.QueryString["pid"] %>&Currentpage=<%=Request.QueryString["Currentpage"] %>&adminname=<%=Request.QueryString["adminname"] %>&timess=<%=Request.QueryString["timess"]%>&timeval=<%= Request.QueryString["timeval"]%>&OpjectID=<%=Request.QueryString["OpjectID"] %>&orderby=<%=Request.QueryString["orderby"]=="51"?"52":"51" %>"><b><%=lang.LF("申请时间")%></b></a><%=Request.QueryString["orderby"] == "51" ? "▲" : "▼"%>
                </td>
                <td width="20%">
                    <%=lang.LF("操作")%>
                </td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <tr id='<%#Eval("ID") %>' height="25px" align="center" onmouseover="this.className='tdbgmouseover'"
                        onmouseout="this.className='tdbg'" ondblclick="getinfo(this.id);" title="双击查看此项目详情">
                        <td>
                            <asp:CheckBox ID="ChBx" runat="server" /><asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'
                                Visible="false"></asp:Label>
                        </td>
                        <td>
                            <%# Eval("ID","{0}")%>
                        </td>
                        <td>
                            <a href="ProjectsDetail.aspx?ProjectID=<%# Eval("ID","{0}")%>">
                                <%# Eval("Name")%></a>
                        </td>
                        <td>
                            <a href="Projects.aspx?pid=<%#Eval("TypeID") %>">
                                <%# GetProType(Eval("TypeID","{0}")) %></a>
                        </td>
                        <td>
                            <%# GetManageGroup(Eval("Leader","{0}")) == 1 ? Eval("Price", "￥{0}.00") : "******"%>
                        </td>
                        <td>
                            <%#Eval("ProStatus", "{0}") == "0" ? "----" : Eval("BeginTime", "{0}")%>
                        </td>
                        <td>
                            <a href="<%#GetLink(Eval("Leader","{0}")) %>">
                                <%#GetLeader(Eval("Leader","{0}"))%></a>
                        </td>
                        <td>
                            <%# GetAudit(Eval("AuditStatus","{0}"))%>
                        </td>
                        <td>
                            <%# GetProStatus(Eval("ProStatus", "{0}"))%>
                        </td>
                        <td>
                            <a href='<%#Eval("ID","ProjectsProcesses.aspx?ID={0}") %>'>
                                <div style="width: 90%; border: solid 1px green; height: 5px">
                                    <div id="line" runat="server" style="background-color: #bddb52; height: 5px; float: left">
                                    </div>
                                </div>
                            </a>
                        </td>
                        <td>
                            <%#(Eval("ApplicationTime", "{0}") == "9999-12-31 23:59:59") ? "-" : Eval("ApplicationTime", "{0}")%>
                        </td>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="manage" CssClass="option_style"><i class="glyphicon glyphicon-pencil" title="修改"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="del" OnClientClick="if(!this.disabled) return confirm('确实要删除吗？');" CssClass="option_style"><i class="fa fa-trash" title="删除"></i></asp:LinkButton>
                            <asp:LinkButton ID="LbtnComments" runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="Comments" CssClass="option_style"><i class="fa fa-comments" title="评论"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="Run" CssClass="option_style"><i class="fa fa-play-circle"></i><%#Eval("ProStatus", "{0}") == "0" ? "启动" : "停止"%></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="Audit" CssClass="option_style"><i class="fa fa-check-square-o"></i><%#Eval("AuditStatus", "{0}") == "1" ? "<font color=green>通过审核</font>" : "<font color=red>取消审核</font>"%></asp:LinkButton> 
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
    <div style="text-align: center">
        <span style="text-align: center"><%=lang.LF("共")%>
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            <%=lang.LF("条数据")%>
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            <%=lang.LF("页次")%>：
            <asp:Label ID="Nowpage" runat="server" Text="" />/
            <asp:Label ID="PageSize" runat="server" Text="" />
            <%=lang.LF("页")%>
            <asp:Label ID="pagess" runat="server" Text="" />
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            <%=lang.LF("条数据")%>/<%=lang.LF("页")%> <%=lang.LF("转到第")%>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
            </asp:DropDownList>
            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
        </span>
    </div>
    <table>
        <tr>
            <td>
                <asp:CheckBox ID="Checkall" runat="server" onclick="javascript:CheckAll(this);" Text="全选" />
                <asp:Button ID="btnDeleteAllbutton" runat="server" Style="width: 110px;" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="批量删除" OnClick="btnDeleteAll_Click" class="btn btn-primary" />
                <asp:Button ID="BtnNoAudit" runat="server" Style="width: 110px;" OnClientClick="return confirm('你确定要执行此操作吗？请认真审核')"
                    Text="取消审核" class="btn btn-primary" OnClick="BtnNoAudit_Click" />
                <asp:Button ID="btnexcel" runat="server" class="btn btn-primary" Text="批量导出" OnClick="btnexcel_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script>
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
        function getinfo(id) {
            location.href = "ProjectsDetail.aspx?ProjectID=" + id + "";
        }

        function ShowTabss(type, orderby) {
            location.href = 'Projects.aspx?txtPage=<%=Request.QueryString["txtPage"]%>&DDList0=<%=Request.QueryString["DDList0"]%>&keyword=<%=Server.UrlEncode(Request.QueryString["keyword"]) %>&typeid=<%=Request.QueryString["typeid"] %>&tname=' + type + '&orderby=' + orderby + '&pid=<%=Request.QueryString["pid"]==null?"0":Request.QueryString["pid"]%>&timess=<%=Request.QueryString["timess"]%>&timeval=<%= Request.QueryString["timeval"]%>&adminname=<%=Request.QueryString["adminname"]%>&OpjectID=<%=Request.QueryString["OpjectID"] %>';
        }
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6");

        function pload() {
            var ID = '<%=Request.QueryString["tname"]%>';
            if (ID == null || ID == "") {
                ID = 0;
            }
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                tID = ID;
            }

        }
        function changeTime(obj, sel) {
            var select1 = document.getElementById("times");
            if (select1 != null) {
                select1.innerHTML = "";
                if (obj <= 0) {
                    var newOption0 = new Option("请选择", "-1");
                    select1.options.add(newOption0);

                    var newOption1 = new Option("一月", "1");
                    select1.options.add(newOption1);

                    var newOption2 = new Option("二月", "2");
                    select1.options.add(newOption2);

                    var newOption3 = new Option("三月", "3");
                    select1.options.add(newOption3);

                    var newOption4 = new Option("四月", "4");
                    select1.options.add(newOption4);

                    var newOption5 = new Option("五月", "5");
                    select1.options.add(newOption5);

                    var newOption6 = new Option("六月", "6");
                    select1.options.add(newOption6);

                    var newOption7 = new Option("七月", "7");
                    select1.options.add(newOption7);

                    var newOption8 = new Option("八月", "8");
                    select1.options.add(newOption8);

                    var newOption9 = new Option("九月", "9");
                    select1.options.add(newOption9);

                    var newOption10 = new Option("十月", "10");
                    select1.options.add(newOption10);

                    var newOption11 = new Option("十一月", "11");
                    select1.options.add(newOption11);

                    var newOption12 = new Option("十二月", "12");
                    select1.options.add(newOption12);
                }
                if (obj == 1) {
                    var newOption0 = new Option("请选择", "-1");
                    select1.options.add(newOption0);

                    var newOption1 = new Option("第一季度", "1");
                    select1.options.add(newOption1);

                    var newOption2 = new Option("第二季度", "4");
                    select1.options.add(newOption2);

                    var newOption3 = new Option("第三季度", "7");
                    select1.options.add(newOption3);

                    var newOption4 = new Option("第四季度", "10");
                    select1.options.add(newOption4);
                }
                if (obj == 2) {
                    var day = new Date();
                    var i = day.getFullYear();
                    j = i + 35;
                    for (i = i - 25; i <= j; i++) {
                        var newOPtion = new Option(i.toString() + "年", i.toString());
                        select1.options.add(newOPtion);
                    }
                }
                if (sel > 0) {
                    select1.value = sel;
                }
            }
        }
        $().ready(function () {
            if (getParam("tname")) {
                $("#TabTitle" + getParam("tname")).parent().addClass("active").siblings("li").removeClass("active");;
            }
        })
        HideColumn("6,7,8,9,10");
    </script>
    <style>
        .nav li a { cursor: pointer; text-decoration: none;}
    </style>
</asp:Content>