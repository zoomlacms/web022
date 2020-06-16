<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Questions_User_Show, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>查看用户试卷</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)">基本信息</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)">试题选项</a></li>
    </ul>
        <table  class="table table-striped table-bordered table-hover">
        <tbody  id="Tabs0">
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="ssjd_txt" runat="server" Text="试题标题："></asp:Label>
                    &nbsp;
                </td>
                <td >
                    <asp:Label ID="txtP_title" runat="server" Text=""></asp:Label>
                    <asp:HiddenField ID="hfId" runat="server" />
                   </td>
            </tr>
             <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label3" runat="server" Text="试题内容："></asp:Label>
                    &nbsp;
                </td>
                <td >
                    <asp:Label ID="txtP_Content" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
             <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label1" runat="server" Text="所属用户："></asp:Label>
                    &nbsp;
                </td>
                <td >
                    <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
              <tr class="tdbg">
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="zt_txt" runat="server" Text="分类："></asp:Label>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="txtC_Class" runat="server" Text=""></asp:Label>
                     </td>
            </tr>
             <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label5" runat="server" Text="难度："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:Label ID="rblDiff" runat="server" Text=""></asp:Label>
                   </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label6" runat="server" Text="题型："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:Label ID="ddlType" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
            </tbody>
            <tbody id="Tabs1" style="display:none">
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label2" runat="server" Text="所属试卷："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:Label ID="lblPaper" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
             <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label4" runat="server" Text="答案："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:Label ID="txtAn" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="hits_txt" runat="server" Text="知识点："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:Label ID="txtKnowledge" runat="server" Text=""></asp:Label>
                   </td>
            </tr>
            </tbody>
        <tr class="tdbgbottom">
            <td colspan="2">
               <asp:Button ID="ABtnSubmit" class="btn btn-primary" Text="添加为系统试题" runat="server" 
                    onclick="ABtnSubmit_Click" />  &nbsp;
                &nbsp;
                <asp:Button ID="BtnBack" class="btn btn-primary" runat="server" Text="返回列表" OnClick="BtnBack_Click" UseSubmitBehavior="False" CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>
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