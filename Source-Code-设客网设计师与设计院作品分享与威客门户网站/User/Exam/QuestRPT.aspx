<%@ page language="C#" autoeventwireup="true" inherits="User_Exam_QuestRPT, App_Web_nzoqprnw" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%--<asp:Content runat="server" ContentPlaceHolderID="head"><title></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">--%>
   <form id="form1" runat="server">
<start>
    <div style="border:1px solid #ddd;padding:5px;margin-bottom:3px;">总计：<span class="r_red" runat="server" id="count_sp">0</span>道相关试题</div>
    <div runat="server" id="login_div" visible="false" class="alert alert-danger">你当前尚未登录,无法添加试题进试题篮,<a href="/User/Login.aspx?ReturnUrl=/User/Exam/QuestionManage.aspx">点击登入</a></div>
    <asp:Repeater runat="server" EnableViewState="false" ID="RPT">
        <ItemTemplate>
            <div class="panel panel-default" style="margin-bottom: 10px;">
                <div class="panel-body">
                    <%#GetContent()%>
                </div>
                <div class="panel-footer">
                    <a href="QuestView.aspx?ID=<%#Eval("p_id") %>" target="_blank"><i class="fa fa-check-circle"></i>查看解析</a>
                 <%--   <a href="#" class="disabled"><i class="fa fa-cloud-download"></i>下载</a>--%>
                    <%if(!IsNotLogin){ %>
                    <a href="javascript:;" <%#GetIsContain()?"style='display:none;'":"" %> class="cart_op addQid" data-type="<%#Eval("p_type") %>" data-qid="<%#Eval("p_id") %>"><i class="fa fa-plus-circle"></i>试题篮</a>
                    <a href="javascript:;" <%#GetIsContain()?"":"style='display:none;'" %> class="cart_op removeQid" data-type="<%#Eval("p_type") %>" data-qid="<%#Eval("p_id") %>"><i class="fa fa-minus-circle">试题篮(已加入试题篮)</i></a>
                     <%} %>
                    <div style="float: right;">
                        <span>题型:<span class="r_green"><%#GetClass(Eval("p_Class","{0}"))%></span></span>
                      <%--  <span>难度:<span class="r_green"><%#GetDifficult() %></span></span>--%>
                        <span>知识点:<span class="r_green"><%#Eval("TagKey").ToString().Trim(',')%></span></span>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </asp:Repeater>
    <asp:Literal runat="server" ID="Page_Lit"></asp:Literal>
    <div runat="server" id="empty_div" visible="false" style="width:100%;text-align:center;">
      对不起,当前条件下没有试题,<%:Call.SiteName %>正在加速上载试题,敬请期待！
    </div>
 </start>
    </form>
<%--</asp:Content>--%>