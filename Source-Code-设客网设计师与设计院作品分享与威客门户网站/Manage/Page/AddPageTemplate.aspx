<%@ page language="C#" autoeventwireup="true" inherits="manage.Page.AddPageTemplate, App_Web_qc5jcwta" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDP" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加栏目</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField runat="server" ID="Label1_Hid" />
    <asp:HiddenField runat="server" ID="Label2_Hid" />
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabss(0)">基本信息</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="ShowTabss(1)">栏目选项</a></li>
        <li><a href="#tab2" data-toggle="tab" onclick="ShowTabss(2)">模板选项</a></li>
    </ul>
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tabs0">
            <tr>
                <td colspan="2" align="center">
                    <span>
                        <asp:Label ID="Label3" runat="server"></asp:Label></span>
                </td>
            </tr>
            <tr>
                <td width="20%"><strong>栏目名称：</strong></td>
                <td width="80%">
                    <asp:TextBox ID="templateName" class="form-control text_md" runat="server" onblur="GetPYDir()"></asp:TextBox>
                    <font color="red">*
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="templateName" ErrorMessage="栏目名称不能为空!"></asp:RequiredFieldValidator></font></td>
            </tr>
            <tr id="11">
                <td><strong>栏目类型</strong></td>
                <td>
                    <asp:RadioButtonList ID="templateType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                        <asp:ListItem Value="1">单页型栏目</asp:ListItem>
                        <asp:ListItem Value="2">栏目型栏目</asp:ListItem>
                        <asp:ListItem Value="3">Url转发型栏目</asp:ListItem>
                        <asp:ListItem Value="4">功能型栏目</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr id="Tr14">
                <td><strong>打开方式：</strong></td>
                <td>
                    <asp:RadioButtonList ID="OpenType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="_blank">新窗口打开</asp:ListItem>
                        <asp:ListItem Value="_self">原窗口打开</asp:ListItem>
                        <asp:ListItem Value="_top">父页面打开</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr id="Tr12" style="display:none;">
                <td><strong>所属栏目：</strong></td>
                <td>
                    <asp:Label ID="ParentID" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><strong>绑定样式：</strong></td>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control text_md" ID="PageStyle_DP" DataTextField="PageNodeName" DataValueField="PageNodeID"></asp:DropDownList></td>
            </tr>
        </tbody>
        <asp:Panel ID="nodetype" runat="server">
            <tr id="Tr6">
                <td style="width: 20%;"><strong>栏目图片地址</strong></td>
                <td>
                    <asp:TextBox ID="Nodeimgurl" class="form-control text_md" runat="server" ></asp:TextBox></td>
            </tr>
            <tr id="Tr7">
                <td><strong>栏目提示</strong></td>
                <td>
                    <asp:TextBox ID="Nodeimgtext" class="form-control tarea_l" runat="server" Height="44px" TextMode="MultiLine" Width="433px"></asp:TextBox>
                </td>
            </tr>
            <tr id="Tr8">
                <td><strong>说明：</strong><br />
                    用于在单页页详细介绍单页信息，支持HTML</td>
                <td>
                    <asp:TextBox ID="Pagecontent" class="form-control tarea_l" runat="server" Height="79px" TextMode="MultiLine" Width="433px"></asp:TextBox></td>
            </tr>
            <tbody id="Tabs1" style="display: none">
                <tr id="1">
                    <td><strong>启用状态</strong></td>
                    <td>
                        <asp:RadioButtonList ID="isTrue" runat="server" RepeatDirection="Horizontal" Width="109px">
                            <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
                            <asp:ListItem Value="0">停用</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr id="Tr3">
                    <td><strong>标识符<br />
                    </strong>用于前台调用时可以直接用标签取代ID的标识</td>
                    <td>
                        <asp:TextBox ID="identifiers" class="form-control" runat="server" Width="247px"></asp:TextBox></td>
                </tr>
                <tr id="Tr11">
                    <td><strong>排列顺序<br />
                    </strong>用于前台显示栏目顺序,越大越靠前</td>
                    <td>
                        <asp:TextBox ID="OrderID" class="form-control" runat="server" Width="247px"></asp:TextBox></td>
                </tr>
                <asp:Panel ID="typetxt" runat="server">
                    <tr id="Tr4">
                        <td><strong>栏目扩展名</strong><br />
                            例如：html、htm、shtml、aspx</td>
                        <td>
                            <asp:RadioButtonList ID="NodeFileEx" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">html</asp:ListItem>
                                <asp:ListItem>htm</asp:ListItem>
                                <asp:ListItem>shtml</asp:ListItem>
                                <asp:ListItem>aspx</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                </asp:Panel>
                <asp:Panel ID="typenode" runat="server">
                    <tr id="Tr1">
                        <td><strong>内容页扩展名</strong><br />
                            例如：html、htm、shtml、aspx</td>
                        <td>
                            <asp:RadioButtonList ID="ContentFileEx" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">html</asp:ListItem>
                                <asp:ListItem>htm</asp:ListItem>
                                <asp:ListItem>shtml</asp:ListItem>
                                <asp:ListItem>aspx</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </asp:Panel>
                <tr id="Tr2">
                    <td><strong>添加时间</strong></td>
                    <td>
                        <asp:TextBox ID="addtime" class="form-control" runat="server" Width="165px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>
                    </td>
                </tr>
                <tr id="Tr9">
                    <td><strong>META关键词：</strong><br />
                        针对搜索引擎设置的关键词</td>
                    <td>
                        <asp:TextBox ID="PageMetakeyword" class="form-control" runat="server" Height="79px" TextMode="MultiLine" Width="433px"></asp:TextBox></td>
                </tr>
                <tr id="Tr10">
                    <td><strong>META网页描述：</strong><br />
                        针对搜索引擎设置的网页描述</td>
                    <td>
                        <asp:TextBox ID="PageMetakeyinfo" class="form-control" runat="server" Height="79px" TextMode="MultiLine" Width="433px"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
        </asp:Panel>
        <tbody id="Tabs2" style="display: none">
            <asp:Panel ID="urltype" runat="server">
                <tr id="Tr13">
                    <td><strong>外部链接地址：</strong></td>
                    <td>
                        <asp:TextBox ID="linkurl" class="form-control tarea_l" runat="server"></asp:TextBox></td>
                </tr>
                <tr id="Tr15">
                    <td><strong>外部链接图片地址：</strong></td>
                    <td>
                        <asp:TextBox ID="linkimg" class="form-control tarea_l" runat="server" ></asp:TextBox></td>
                </tr>
                <tr id="Tr16">
                    <td><strong>外部链接提示：</strong></td>
                    <td>
                        <asp:TextBox ID="linktxt" class="form-control tarea_l" runat="server" Height="79px" TextMode="MultiLine" ></asp:TextBox></td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="tempurl" runat="server">
                <tr id="Tr17">
                    <td><strong>栏目模板地址</strong></td>
                    <td>
                        <%=PageCommon.GetTlpDP("templateUrl") %>
                        <asp:HiddenField runat="server" ID="templateUrl_hid" />
                    </td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="SelectModel" runat="server">
                <tr id="Tr5">
                    <td><strong>选择模型</strong></td>
                    <td>
                        <table class="table table-striped table-bordered table-hover">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# GetChk(Eval("ModelID","{0}")) %>
                                            <%# Eval("ModelName") %>                                                
                                        </td>
                                        <td>
                                            <%#PageCommon.GetTlpDP("TxtModelTemplate_"+Eval("ModelID")) %>
                                            <input type="hidden" id="TxtModelTemplate_<%# Eval("ModelID") %>_hid" name="TxtModelTemplate_<%# Eval("ModelID") %>" value="<%# GetTemplate(Eval("ModelID","{0}")) %>" maxlength="255" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </td>
                </tr>
            </asp:Panel>
        </tbody>
        <tr id="Tr18">
            <td colspan="2" align="center">
                <asp:HiddenField ID="lblmodelstr" runat="server" />
                <asp:HiddenField ID="TemplateID" runat="server" />
                <asp:HiddenField ID="UserGroup" runat="server" />
                <asp:HiddenField ID="Username" runat="server" />
                <asp:HiddenField ID="Userids" runat="server" />
                <asp:HiddenField ID="StyleID_Hid" runat="server" />
                <asp:Button ID="Button1" runat="server" Text="添加栏目" class="btn btn-primary" OnClick="Button1_Click" />
                <a href="PageTemplate.aspx?StyleID=<%:StyleID %>" class="btn btn-primary">返回</a>
            </td>
        </tr>
    </table>
<ZL:TlpDP runat="server" ID="TlpDP" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6", "TabTitle7");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2", "Tabs3", "Tabs4", "Tabs5", "Tabs6", "Tabs7");
        function ShowTabss(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabTitle[tID].toString()) != null)
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                if (document.getElementById(arrTabTitle[SID].toString()) != null)
                    document.getElementById(arrTabTitle[SID].toString()).className = "titlemouseover";
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
            }
        }
        function OpenDialog2(mid)
        {
            var url="../Template/TemplateList.aspx?OpenerText=TxtModelTemplate_"+mid+"&StyleID=<%=StyleID_Hid.Value%>&FilesDir=";
            WinOpenDialog(url);
        }
        $(function(){
            Tlp_initTemp();
        })
    </script>
</asp:Content>

