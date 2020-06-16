<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_AddCourseware, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title>添加试听文件</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Literal ID="liCoures" runat="server" Visible="false"></asp:Literal>
    <table class="table table-striped table-bordered table-hover">
    <tr align="center" class="title">
        <td width="25%">课件名称</td>
        <td width="10%">主讲人</td>
        <td width="10%">设计者</td>
        <td width="8%">课件次序</td>
        <td width="25%">试听地址</td>
        <td width="6%">试听</td>
        <td width="20%" class="title">操作</td>
    </tr>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <tr>
                <td height="22" align="center">
                    <%#Eval("Courseware")%>
                </td>
                <td align="center"><%#Eval("Speaker")%></td>
                <td align="center"><%#Eval("SJName")%></td>
                <td height="22" align="center">
                    第<%#Eval("CoursNum")%>讲
                </td>
                <td height="22" align="center">
                    <a href="<%#Eval("FileUrl")%>" target="_blank"><%#Eval("FileUrl")%></a>
                </td>
                <td height="22" align="center">
                <%#GetListon(Eval("Listen", "{0}"))%>
                </td>
                <td height="22" align="center">               
                    <a href="AddCourseware.aspx?CourseID=<%=Request.QueryString["CourseID"] %>&id=<%#Eval("ID")%>">修改</a>&nbsp;<a href="AddCourseware.aspx?CourseID=<%=Request.QueryString["CourseID"] %>&id=<%#Eval("ID")%>&menu=del" onclick="return confirm('确实要删除此课程吗？');">删除</a>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr class="tdbg">
        <td height="22" colspan="9" align="center" class="tdbg">
          共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class=" form-control" Width="16px"
                            Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        条数据/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
        </td>
    </tr>
</table>
    <table class="table table-striped table-bordered table-hover">
        <tr><td colspan="2"> <asp:Label ID="Label1" runat="server" Text="添加课件"></asp:Label></td></tr>
        <tbody id="Tabs0">
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">

                    <asp:Label ID="ssjd_txt" runat="server" Text="课件主题："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txt_Courename" runat="server" class=" form-control" Width="200px"></asp:TextBox>&nbsp;<font color="red">*</font>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="课件主题不能为空!" ControlToValidate="txt_Courename"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label3" runat="server" Text="主讲人："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="TextBox1" runat="server" class=" form-control" Width="200px"></asp:TextBox>&nbsp;  
                     <asp:HiddenField ID="hfid" runat="server" />
                    <input type="button" value="选择主讲人 " class="btn btn-primary" style="width: 100px;" data-toggle="modal" data-target="#Teacher_div" onclick="Openwin(); void (0)" />
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label6" runat="server" Text="设计者："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="TextBox2" runat="server" class=" form-control" Width="200px"></asp:TextBox>&nbsp;<font color="red">*</font>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="设计者不能为空!" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label4" runat="server" Text="课件次序："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txt_Order" runat="server" class=" form-control" Width="100px"></asp:TextBox>
                    <span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="课件次序不能为空!" ControlToValidate="txt_Order"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label7" runat="server" Text="课件类型："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="0">外部课件</asp:ListItem>
                        <asp:ListItem Value="1">SCORM标准课件 </asp:ListItem>
                    </asp:RadioButtonList><span>                    
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label8" runat="server" Text="状态："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="0">可用</asp:ListItem>
                        <asp:ListItem Value="1">不可用 </asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label5" runat="server" Text="可否试听："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                     <input type="checkbox" runat="server" id="rblHot" class="switchChk"/>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">

                    <asp:Label ID="Label9" runat="server" Text="简介："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtP_Content" runat="server" class=" form-control" TextMode="MultiLine" Height="152px" Width="380px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label2" runat="server" Text="试听地址："></asp:Label>&nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtUrl" runat="server" class=" form-control" Width="306px"></asp:TextBox>
                    <input type="button" value="选择模板 " class="btn btn-primary" style="width: 100px;" onclick="WinOpenDialog('/manage/Template/TemplateList.aspx?OpenerText=' + escape('txtUrl') + '&FilesDir=', 650, 480)" />
                </td>
            </tr>
        </tbody>
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:HiddenField ID="coureId" runat="server" />
                <asp:HiddenField ID="cid" runat="server" />
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存" runat="server" OnClick="EBtnSubmit_Click" />
                &nbsp;
                <asp:Button ID="BtnBack" class="btn btn-primary" runat="server" Text="返回列表" OnClientClick="location.href='CoureseManage.aspx';return false;" UseSubmitBehavior="False" CausesValidation="False" />
            </td>
        </tr>
    </table>
    
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript">
        var typediag = new ZL_Dialog();
        function Openwin() {
            typediag.titile = "选择分类";
            typediag.url = "SelectTeacherName.aspx";
            typediag.ShowModal();
        }
    </script>
</asp:Content>