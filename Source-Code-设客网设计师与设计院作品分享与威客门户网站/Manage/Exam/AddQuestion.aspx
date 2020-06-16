<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="manage_Question_AddQuestion, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <title>编辑试题</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr align="center">
                        <td id="TabTitle0" class="titlemouseover" onclick="ShowTabss(0)">基本信息
                        </td>
                        <td id="TabTitle1" class="tabtitle" onclick="ShowTabss(1)">试题选项
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tbody id="Tabs0">
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="ssjd_txt" runat="server" Text="试题标题："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtP_title" runat="server" class="form-control text_md"  ></asp:TextBox>
                    &nbsp;<font color="red">*</font>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="试题标题不能为空!"
                        ControlToValidate="txtP_title"></asp:RequiredFieldValidator>
                    <asp:HiddenField ID="hfC_Id" runat="server" Value="" />
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="zt_txt" runat="server" Text="分类："></asp:Label>
                    &nbsp;
                </td>
                <td>
                    <%--       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                    <asp:TextBox ID="txtC_Class" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="hfC_ClassId" runat="server" />
                    <asp:Button ID="btnSelect" class="btn btn-primary" runat="server" Text="选择" CausesValidation="False"
                        OnClick="btnSelect_Click" />
                    &nbsp;<font color="red">*</font>
                    <asp:TreeView ID="tvClass" runat="server" OnSelectedNodeChanged="tvClass_SelectedNodeChanged">
                    </asp:TreeView>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="试题分类不能为空!"
                        ControlToValidate="txtC_Class"></asp:RequiredFieldValidator>
                    <%--   </ContentTemplate>
                    </asp:UpdatePanel>--%>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label5" runat="server" Text="难度："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <div style="width: auto; float: left">
                        <asp:RadioButtonList ID="rblDiff" runat="server" RepeatDirection="Horizontal" Height="22px">
                            <asp:ListItem Selected Value="1">基础</asp:ListItem>
                            <asp:ListItem Value="2">容易</asp:ListItem>
                            <asp:ListItem Value="3">中等</asp:ListItem>
                            <asp:ListItem Value="4">偏难</asp:ListItem>
                            <asp:ListItem Value="5">极难</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div style="width: auto; float: left">
                        <font color="red">*</font>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="难度不能为空!"
                            ControlToValidate="rblDiff"></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label6" runat="server" Text="题型："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:DropDownList ID="ddlType" runat="server">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtAddType" class="form-control" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAddType" runat="server" Text="添加题型" class="btn btn-primary" CausesValidation="False"
                        OnClick="btnAddType_Click" />
                    &nbsp;<font color="red">*</font>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="题型不能为空!"
                        ControlToValidate="ddlType"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label7" runat="server" Text="所属试卷："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:DropDownList ID="ddPaper" runat="server">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtAddPaper" class="form-control" runat="server" Visible="False"></asp:TextBox>
                    <asp:Button ID="btnAddPaper" runat="server" Text="添加试卷" class="btn btn-primary" CausesValidation="False"
                        OnClick="btnAddPaperr_Click" />
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label3" runat="server" Text="试题内容："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtP_Content" runat="server" TextMode="MultiLine" Height="300px" Width="700px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label8" runat="server" Text="排序："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="Order" runat="server" CssClass="form-control text_md">0</asp:TextBox>
                </td>
            </tr>
        </tbody>

        <tbody id="Tabs1" style="display: none">
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label4" runat="server" Text="答案："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtAn" runat="server" class="form-control" TextMode="MultiLine" Height="152px"
                        Width="380px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="hits_txt" runat="server" Text="知识点："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:DropDownList ID="ddlKnow" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </td>
            </tr>
        </tbody>
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存试题" OnClick="EBtnSubmit_Click"
                    runat="server" />
                &nbsp;
                <asp:Button ID="BtnBack" class="btn btn-primary" runat="server" Text="返回" OnClick="BtnBack_Click"
                    UseSubmitBehavior="False" CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <%=Call.GetUEditor("txtP_Content",2) %>
    <script type="text/javascript">
        var aid = 0;
        var showID = 0;
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1");
        var arrTabs = new Array("Tabs0", "Tabs1");
        function ShowTabss(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
                aid = SID;
            }
        }
    </script>
</asp:Content>
