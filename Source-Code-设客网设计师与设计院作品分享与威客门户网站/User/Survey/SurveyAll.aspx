<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_survey_SurveyAll, App_Web_bqcjfasq" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>竞猜游戏</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">  
 <div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">问卷投票调查</li>
		<div class="clearfix"></div>
    </ol><asp:HiddenField ID="Hidd" runat="server" />  
    </div>
    <div class="container">  
    <table >
    <ZL:ExGridView ID="EGV" RowStyle-HorizontalAlign="Center" DataKeyNames="SurveyID" runat="server" AutoGenerateColumns="False" AllowPaging="True"
         PageSize="10" class="table table-bordered table-hover table-striped" OnPageIndexChanging="Egv_PageIndexChanging"  EmptyDataText="无相关数据">
        <Columns>   
            <asp:BoundField DataField="SurveyID" HeaderText="ID">
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            <HeaderStyle Width="10%" />
            </asp:BoundField>  
            <asp:TemplateField HeaderText="问卷名">
                <ItemTemplate>                                
                <a href="/Plugins/UserVote.aspx?SID=<%#Eval("SurveyID") %>" target="_blank"><%# Eval("SurveyName")%></a>     <%-- SurveyScore.aspx?surveyID=<%#Eval("SurveyID") %>--%>              
                </ItemTemplate>
                    <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
                    <HeaderStyle Width="30%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="投票类型">
                <ItemTemplate>                                
                    <%# Eval("SurType","{0}")=="1"?"投票":"问卷" %>
                </ItemTemplate>
                    <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
                    <HeaderStyle Width="10%" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">                
            <ItemTemplate>
                <a href="/Plugins/UserVote.aspx?SID=<%#Eval("SurveyID") %>" target="_blank">回答</a> | 
                 <a href="/Plugins/VoteResult.aspx?SID=<%#Eval("SurveyID") %>" target="_blank">结果</a>
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns> 
        <PagerStyle HorizontalAlign="Center"/>
    </ZL:ExGridView>                                  
</table>
</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="scriptContent" runat="Server">
    <script type="text/javascript">
        var x_open_path = ""; //设置图标地址 
    </script>
    <script type="text/javascript" src="../../JS/x_open.js"></script>
</asp:Content>
