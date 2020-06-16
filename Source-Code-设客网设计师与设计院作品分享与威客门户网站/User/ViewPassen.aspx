<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_ViewPassen, App_Web_arwftbfq" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>客户预览</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="ConstPassen"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">客户管理<a href="AddConstPassen.aspx?FieldName=Person_Add">[添加客户]</a></li>
    </ol>
</div>
<div class="container">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)">基本信息</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)">联络信息</a></li> 
    </ul> 
  <table  class="table table-striped table-bordered table-hover">
            <tr class="tdbg">
                <td  valign="top">
                    <table id="Tabs0" class="table table-striped table-bordered table-hover">
                        <tr>
                            <td align="right" class="text-left">
                                客户类别：
                            </td>
                            <td>
                                <asp:Label ID="ClientType" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right" class="text-left">
                            </td>
                            <td>
                                <table id="Table1" border="0">
                                    <tr>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 15%" align="right" class="text-left">
                                客户名称：
                            </td>
                            <td style="width: 35%">
                                <asp:Label ID="TxtClientName" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 15%" align="right" class="text-left">
                                客户编号：
                            </td>
                            <td style="width: 35%">
                                <asp:Label ID="TxtClientNum" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="text-left">
                                助记名称：
                            </td>
                            <td>
                                <asp:Label ID="TxtShortedForm" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right" class="text-left">
                                证件号码：
                            </td>
                            <td>
                                <asp:Label ID="TxtIDCard" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="text-left">
                                区域：
                            </td>
                            <td>
                                <asp:Label ID="DropArea" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right" class="text-left">
                                行业：
                            </td>
                            <td>
                                <asp:Label ID="DropClientField" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="text-left">
                                价值评估：
                            </td>
                            <td>
                                <asp:Label ID="DropValueLevel" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right" class="text-left">
                                信用等级：
                            </td>
                            <td>
                                <asp:Label ID="DropCreditLevel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="text-left">
                                重要程度：
                            </td>
                            <td>
                                <asp:Label ID="DropImportance" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right" class="text-left">
                                关系等级：
                            </td>
                            <td>
                                <asp:Label ID="DropConnectionLevel" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="text-left">
                                客户来源：
                            </td>
                            <td>
                                <asp:Label ID="DropSourceType" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right" class="text-left">
                                阶段：
                            </td>
                            <td>
                                <asp:Label ID="DropPhaseType" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="text-left">
                                客户组别：
                            </td>
                            <td>
                                <asp:Label ID="DropGroupID" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="right" class="text-left">
                            </td>
                            <td>
                                <table id="Table2" border="0">
                                    <tr>
                                    </tr>
                                </table>
                            </td>
                        <asp:Literal runat="server" ID="htmlStr"></asp:Literal>
                    </table>
                    <table id="Tabs1" class="table table-striped table-bordered table-hover" style="display: none"> 
                        <tr>
                            <td style="width: 100px" align="right" class="text-left">
                                国家/地区：&nbsp;&nbsp;
                            </td>
                            <td colspan="2" align="left">
                                <asp:Label ID="country" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px" align="right" class="text-left">
                                省/市/自治区：
                            </td>
                            <td align="left">
                                <asp:Label ID="province" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="text-left">
                                市/县/区/旗：&nbsp;
                            </td>
                            <td align="left">
                                <asp:Label ID="city" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr class="tdbg">
                        <td style="width: 15%"  class="text-left">
                            联系地址：
                        </td>
                        <td>
                            <asp:Label ID="TxtAddress" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td  class="text-left">
                            邮政编码：
                        </td>
                        <td>
                            <asp:Label ID="TxtZipCodeW" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr id="t1">
                        <td style="width: 15%" align="right" class="text-left">
                            联系电话：
                        </td>
                        <td>
                            <asp:Label ID="TxtPhone" runat="server" Text=""></asp:Label>
                        </td> 
                    </tr>   
                 </table>
    <div class="btn_green text-center">
        <asp:Button ID="Button1" runat="server" Text="修改" class="btn btn-primary" onclick="Button1_Click" />
        <a href="ConstPassen.aspx" class="btn btn-primary">返回</a> 
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    function ShowTabs(ID) {
        for (i = 0; i < 8; i++) {
            if (i == ID) {
                document.getElementById("Tabs" + i).style.display = "";
            }
            else {
                document.getElementById("Tabs" + i).style.display = "none";
            }
        }
    }
</script>
</asp:Content>
