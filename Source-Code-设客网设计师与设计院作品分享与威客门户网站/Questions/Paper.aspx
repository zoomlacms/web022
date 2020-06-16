<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="Questions_Paper, App_Web_jwgp0ooj" enableviewstatemac="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%Call.Label("{$SiteName/}");%>-�����б�</title>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<style type="text/css">
    body{font-size: 9pt;}
    a{font-size: 9pt;}
</style>
</head>

<script>
    function showtab(id) {
        if (document.getElementById(id).style.display != "none") {
            document.getElementById(id).style.display = "none";
        }
        else {
            document.getElementById(id).style.display = "";
        }
        parent.SetCwinHeight();
    }

</script>

<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <hr style="height: 1px;" />
        �Ѷȣ�
        <asp:DropDownList ID="nd" runat="server">
            <asp:ListItem Text="����" Value="1"></asp:ListItem>
            <asp:ListItem Text="����" Value="2"></asp:ListItem>
            <asp:ListItem Text="�е�" Value="3"></asp:ListItem>
            <asp:ListItem Text="ƫ��" Value="4"></asp:ListItem>
            <asp:ListItem Text="����" Value="5"></asp:ListItem>
        </asp:DropDownList>
        ���ͣ�
        <asp:DropDownList ID="tx" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="����" />
        <asp:Button ID="Button2" runat="server" Text="���������� --> �����Ծ�" 
            onclick="Button2_Click" />
        &nbsp;
        <hr style="height: 1px;" />
        <div style="float: left; width: 10%; height: 24px; padding-top: 5px">
            ���򷽷���
        </div>
        <div style="float: left; width: 40%; height: 24px;">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="2" Selected="True">���ʱ��</asp:ListItem>
                <asp:ListItem Value="1">ʹ�ô���</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div style="float: left; width: 50%; height: 24px; padding-top: 5px; text-align: right;">
            �������ֲ����
        </div>
        <div style="float: left; width: 100%">
            <hr />
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                <tr>
                    <td bgcolor="#FFFFFF">
                         �� <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> ����Ϣ  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  ҳ�Σ�<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />ҳ  
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>����Ϣ/ҳ  ת����<asp:DropDownList 
                        ID="DropDownList1" runat="server" AutoPostBack="True">
              </asp:DropDownList>ҳ
                    </td>
                </tr>
            </table>
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                                <tr>
                                    <td bgcolor="#FFFFFF" height="26px" style="line-height: 26px">
                                        <span style="width: 70%; float: left; font-weight: bold">�Ѷȣ�<%#Getndname(Eval("p_Difficulty","{0}"))%>
                                            ʹ�ô�����<%#Eval("p_Views")%>
                                            ���ʱ�䣺<%#Eval("p_CreateTime", "{0:yyyy-MM-dd}")%><br />
                                            ��Դ��<font color="green" style="font-weight:normal"><%#GetPaper(Eval("Paper_Id", "{0}"))%></font> </span>
                                        <span style="width: 30%; float: left; text-align: right">
                                            <asp:HiddenField ID="PageIDs" runat="server" Value='<%#Eval("p_id") %>' />
                                            <asp:Button ID="Button4" runat="server" Text='<%#GetText(Eval("p_id","{0}")) %>'
                                                OnClick="Button4_Click" CommandArgument='<%#Eval("p_id")%>' />
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" height="26px" style="padding-bottom: 10px; padding-top: 10px">
                                        <%#Eval("p_Content")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#FFFFFF" height="26px" style="line-height: 26px">
                                        <span style="width: 60%; float: left">
                                            <input id="Button1" type="button" value="�� >>" onclick="showtab('an<%#Eval("p_id") %>');return false;"
                                                style="color: Red" />
                                            ����[��������] </span><span style="width: 40%; float: left; text-align: right">���ͣ�<font
                                                color="blue"><%#Gettxname(Eval("p_Type","{0}"))%></font> ֪ʶ�㣺<font color="blue"><%#GetKnowledge(Eval("p_Knowledge","{0}"))%></font>
                                            </span>
                                    </td>
                                </tr>
                                <tr style="display: none" id="an<%#Eval("p_id") %>" name="an<%#Eval("p_id") %>">
                                
                                    <td bgcolor="#FFFFFF" height="26px" style="line-height: 26px;border: 1px dotted #F00;">
                                        <%#Eval("p_Answer")%>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                <tr>
                    <td bgcolor="#FFFFFF">
                        �� <asp:Label ID="Allnum1" runat="server" Text=""></asp:Label> ����Ϣ  <asp:Label ID="Toppage1" runat="server" Text="" /> <asp:Label ID="Nextpage1" runat="server" Text="" /> <asp:Label ID="Downpage1" runat="server" Text="" /> <asp:Label ID="Endpage1" runat="server" Text="" />  ҳ�Σ�<asp:Label ID="Nowpage1" runat="server" Text="" />/<asp:Label ID="PageSize1" runat="server" Text="" />ҳ  
                    <asp:Label ID="Label11" runat="server" Text=""></asp:Label>����Ϣ/ҳ  ת����<asp:DropDownList 
                        ID="DropDownList11" runat="server" AutoPostBack="True">
              </asp:DropDownList>ҳ
                    </td>
                </tr>
            </table>
            <%--<asp:HiddenField ID="hiddenid" runat="server" />--%>
            <%--<asp:TextBox ID="hiddenid" runat="server"></asp:TextBox>--%>
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
