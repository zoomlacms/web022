<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Guest_WdCheck, App_Web_dbnpt1ot" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>问答管理</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div style="margin-bottom: 10px;">
        <div class="pull-left" style="line-height: 32px;">
            按问题内容搜索：
        </div>
        <div class="input-group pull-left" style="width: 300px;">
            <asp:TextBox CssClass="form-control" ID="Key_T" runat="server"></asp:TextBox>
            <span class="input-group-btn">
                <asp:Button ID="SearchBtn" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="SearchBtn_Click" />
            </span>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="borders">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab0" onclick="ShowTabss(0)" data-toggle="tab">所有问答</a></li>
            <li><a href="#tab1" data-toggle="tab" onclick="ShowTabss(1)"><%=lang.LF("待审核")%></a></li>
            <li><a href="#tab2" data-toggle="tab" onclick="ShowTabss(2)"><%=lang.LF("已审核")%></a></li>
            <li><a href="#tab3" data-toggle="tab" onclick="ShowTabss(3)">新版本待审</a></li>
        </ul>
    </div>
    <div class="claerfix"></div>
    <div>
        <div >
            <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Lnk_Click" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <input type="checkbox" name="idchk" title="" value='<%#Eval("ID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <HeaderStyle Width="5%" />
                        <ItemTemplate>
                            <%#Eval("ID")%>
                        </ItemTemplate>
                        <HeaderStyle Width="5%"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-Width="0%" Visible="false">
                        <ItemTemplate>
                        </ItemTemplate>
                        <HeaderStyle Width="0%"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="问题内容" HeaderStyle-Width="15%">
                        <ItemTemplate>
                            <a href="Asklist.aspx?ID=<%# Eval("ID") %>"><%# GetContent(Eval("Qcontent") as string) %></a>
                        </ItemTemplate>
                        <HeaderStyle Width="18%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="问题类型" HeaderStyle-Width="12%">
                        <ItemTemplate>
                            <a href="WdCheck.aspx?QueType=<%#Eval("QueType") %>"><%#gettype(Eval("QueType").ToString())%></a>
                        </ItemTemplate>
                        <HeaderStyle Width="12%"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="提交人" HeaderStyle-Width="12%">
                        <ItemTemplate>
                            <%#Eval("UserName")%>
                        </ItemTemplate>
                        <HeaderStyle Width="12%"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="提交时间" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <%#Eval("AddTime")%>
                        </ItemTemplate>
                        <HeaderStyle Width="10%"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="推荐">
                        <ItemTemplate>
                            <%#gettj(Eval("Elite").ToString())%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核">
                        <ItemTemplate>
                            <%#getcommend(Eval("status"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="Asklist.aspx?ID=<%#Eval("ID")%>">留言</a>| <a href="/Guest/Ask/SearchDetails.aspx?soure=manager&ID=<%#Eval("ID") %>" target="_blank">预览</a>
                            |
                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Audit" CausesValidation="false">审核</asp:LinkButton>
                            | <a href="WdAlter.aspx?ID=<%#Eval("ID")%>" target="_self">修改</a>
                            | <a href="javascript:;" onclick="SelUser(<%#Eval("ID") %>)">推送</a>
                            |
                <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确实要删除吗？');" CommandArgument='<%#Eval("ID") %>'
                    CommandName="Del" CausesValidation="false">删除</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
        <div class="text-center">
            <asp:Button ID="Button1" runat="server" Text="删除" OnClick="BtnSubmit1_Click" UseSubmitBehavior="False" OnClientClick="if(!confirm('确定要批量删除吗？')){return false;}" CssClass="btn btn-primary" />
            <asp:Button ID="Button2" runat="server" Text="审核通过" OnClick="BtnSubmit2_Click" UseSubmitBehavior="False" CssClass="btn btn-primary" />
            <asp:Button ID="Button3" runat="server" Text="取消审核" OnClick="BtnSubmit3_Click" UseSubmitBehavior="False" CssClass="btn btn-primary" />
            <asp:Button ID="Button4" runat="server" Text="批量推荐" OnClick="BtnSubmit4_Click" UseSubmitBehavior="False" CssClass="btn btn-primary" />
            <asp:Button ID="Button5" runat="server" Text="取消推荐" OnClick="BtnSubmit5_Click" UseSubmitBehavior="False" CssClass="btn btn-primary" />
            <button type="button" class="btn btn-primary" onclick="SelUser(0)">批量推送</button>
            <asp:Button ID="BtnQuest" runat="server" style="display:none;" OnClick="BtnQuest_Click" />
            <asp:Button ID="SetLike_B" runat="server" style="display:none;" OnClick="SetLike_B_Click" />
            
        </div>
    </div>
    <asp:HiddenField ID="CurUser_Hid" runat="server" />
    <asp:HiddenField ID="QuesId_Hid" runat="server" />
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3");
        window.onload = function () {
            pload();
        }
        function ShowTabss(ID) {
            location.href = 'WdCheck.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
        }
        function pload() {
            var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
    }
    $().ready(function () {
        if (getParam("type")) {
            $("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
        }
        $("#Egv tr").dblclick(function () {
            var id = $(this).find(".wdid").text();
            if (id) {
                location = "WdAlter.aspx?ID="+id;
            }
        });
    })
    var diag = new ZL_Dialog();
    function SelUser(qid) {
        $("#QuesId_Hid").val(qid);
        diag.title = "选择推送用户";
        diag.maxbtn = false;
        diag.url = "/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo";
        diag.ShowModal();
    }
    function UserFunc(data) {
        if (data[0].UserName != "undefined") {
            $("#CurUser_Hid").val(JSON.stringify(data));
            if ($("#QuesId_Hid").val() == "0") {//如果当前问题id为0，则视为批量推送
                $("#BtnQuest").click();
            }else
             $("#SetLike_B").click();
        }
        diag.CloseModal();
    }
    </script>
</asp:Content>
