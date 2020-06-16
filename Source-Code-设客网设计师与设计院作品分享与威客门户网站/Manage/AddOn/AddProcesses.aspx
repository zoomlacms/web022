<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_AdvProcesses, App_Web_tfdav4no" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>添加项目流程</title>
<script src="/JS/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/dist/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
<link href="/App_Themes/V3.css" type="text/css" rel="stylesheet" />  
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="r_navigation">
            后台管理 &gt;&gt; CRM应用 &gt;&gt; <a href="Projects.aspx">项目管理</a> &gt;&gt; 新建项目流程
        </div>
    <div class="clearbox"></div>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
        <tbody id="Tabs0">
            <tr  class="spacingtitle" style="height:"30px;">
			    <td align="center" colspan="2" ><asp:Label ID="lblText" runat="server"></asp:Label></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td style="width: 288px" class="tdbgleft"><strong>名称：</strong><br />所属项目名称（不可修改）</td>
                <td>
                    <asp:TextBox ID="TxtProName" class="form-control text_300" runat="server" ReadOnly="True" />
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td style="width: 288px" class="tdbgleft"><strong>流程名称：</strong></td>
                <td>
                    <asp:TextBox ID="TxtProcessesName" class="form-control text_300" runat="server" />
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td style="width: 288px" class="tdbgleft">
                    <strong>简介：</strong><br />
                    该流程的相关信息和介绍
                </td>
                <td>
                    <asp:TextBox ID="TxtProcessesInfo" class="form-control text_300" runat="server" Height="82px" 
                        TextMode="MultiLine" Width="381px" />
                </td>        
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td style="width: 288px" class="tdbgleft"><strong>当前进度：</strong><br />
                    请输入0-100间的数字
                </td>
                <td>
                    <asp:TextBox ID="TxtProgress" class="form-control text_300" runat="server" />%<font color="red">&nbsp;&nbsp;&nbsp;还剩下<asp:Label 
                        ID="Lbl" runat="server" Text=""></asp:Label>%</font><asp:RangeValidator ID="RV" runat="server" ControlToValidate="TxtProgress" Display="Dynamic" MinimumValue="0" Type="Integer">,总进度不可超过100%</asp:RangeValidator></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td style="width: 288px" class="tdbgleft"><strong>完成时间：</strong><br />
                    请选择该流程完成时间
                </td>
                <td>
                    <asp:TextBox ID="TxtTime" class="form-control text_300" runat="server"  onfocus="WdatePicker({ dateFmt: 'yyyy/MM/dd' });"/>
                    <font color="red">(请选择时间)</font></td>
            </tr>
        </table>
        <div class="clearbox"></div>
        <div class="text-center m715-50"">
            <asp:Button ID="BtnCommit" runat="server" Text="提交"  class="btn btn-primary" onclick="Button1_Click"/> 
            <asp:Button ID="BtnBack" runat="server" Text="返回" class="btn btn-primary" onclick="Button2_Click" CausesValidation="False" />
        </div>
    </form>
</body>
</html>