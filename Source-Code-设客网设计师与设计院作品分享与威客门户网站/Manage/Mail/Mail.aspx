<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail, App_Web_li2c4mic" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮箱</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td style="width: 90px;">类别分类：</td>
            <td>
                <span><a href="Mail.aspx">所有邮箱&nbsp;&nbsp;</a></span>|
            <asp:Label ID="lblLabel" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <table id="EGV" class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="7">
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
                    <div id="Import" style="display: none;float:left;width:360px;">
                        <asp:FileUpload ID="fileImps" class="form-control pull-left" runat="server" />
                        <asp:Button ID="btnImport" runat="server" CssClass="btn btn-default pull-right" OnClientClick="if(document.getElementById('fileImps').value.length==0){alert('请选择Excel(CSV)文件,可下载模板!');return false};" Text="导入" CausesValidation="true"  OnClick="btnImport_Click" />
                    </div>
                    <div id="ImpTip" style="float: left; position: relative; display: none;">
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClick="lbtnSaveTempter_Click"><font color="red">*</font>
                            <span style="color:#0E529D;">下载[邮箱列表]的邮箱模型CSV导入模板</span>  
                        </asp:LinkButton>(下载后用EXCEL打开从第二行开始按规范填写并保存即可)
                        <asp:Label ID="lblKai" runat="server" Style="color: Red; font-size: 14px;" Text=""></asp:Label>
                    </div>
                </div>
            </td>
        </tr>
        <tr align="center" style="height: 25px;">
            <td width="50">选择</td>
            <td width="50">ID</td>
            <td width="200">别名</td>
            <td width="400">邮箱</td>
            <td width="120">类别</td>
            <td width="200">时间</td>
            <td width="150">操作</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Lnk_Click">
            <ItemTemplate>
                <tr ondblclick="location.href('MailSet.aspx?ID=<%#Eval("ID") %>')">
                    <td align="center">
                        <input name="Item" type="checkbox" value='<%# Eval("id")%>' />

                        <asp:Label ID="LabelHiddenID" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
                    </td>
                    <td align="center" style="cursor: pointer"><%#Eval("ID") %></td>
                    <td align="center" title="双击修改" style="cursor: pointer"><%#Eval("FromName") %></td>
                    <td align="center" title="双击修改" style="cursor: pointer"><%#Eval("ReEmail") %></td>
                    <td width="100" align="center" title="双击修改" style="cursor: pointer"><%#Eval("TypeName") %></td>
                    <td width="100" align="center" style="cursor: pointer"><%#Eval("CreateTime") %></td>
                    <td width="150" align="center"><a href="MailSet.aspx?ID=<%#Eval("ID") %>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<asp:LinkButton ID="LnkDelete" runat="server" CommandName="DeleteAdmin" OnClientClick=" return confirm('确实要删除此邮箱吗？');" CommandArgument='<%# Eval("ID")%>'>删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td style="height: 22px; text-align: center;" colspan="7" class="tdbgleft">
                <span style="text-align: center">共
        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条数据
        <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
        <asp:Label ID="Nowpage" runat="server" Text="" />/
        <asp:Label ID="PageSize" runat="server" Text="" />页
        <asp:Label ID="pagess" runat="server" Text="" />
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    条数据/页 转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
                    页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="1000" MinimumValue="0"></asp:RangeValidator>
                </span>
            </td>
        </tr>
    </table>

    全选：<input id="Checkall" type="checkbox" name="Checkall" onclick="javascript: CheckAll(this);" />
    <asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click"
        OnClientClick="return confirm('你确定要将所有选择的邮箱删除吗？')" class="btn btn-primary" UseSubmitBehavior="true" />
    <input id="MoveView" value="批量移动" type="button" class="btn btn-primary" onclick="ontips()" />
    <div id="Divtips" style="display: none;">
        <div>
            <a id="fancybox-close" style="display: inline;" onclick="tb_remove()" href="javascript:void(0);"></a>
            <asp:DropDownList ID="drtype" runat="server">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="确定" OnClick="btnMove_Click" OnClientClick="return confirm('你确定要将所有选择的邮箱移动吗？')" class="btn btn-primary" UseSubmitBehavior="true" />
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function dialogOpen(str) {
            document.getElementById("Import").style.display = "block";
            document.getElementById("ImpTip").style.display = "block";
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
        function ontips() {


            document.getElementById("Divtips").style.display = "";
        }
        function tb_remove() {
            document.getElementById("Divtips").style.display = "none";
        }
    </script>
    <style>
        .breadcrumb .active a{ margin-left:5px;}
    </style>
</asp:Content>
