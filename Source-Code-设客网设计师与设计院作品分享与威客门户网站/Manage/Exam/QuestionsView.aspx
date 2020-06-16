<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_QuestionsView, App_Web_apw4n2f5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>查看试题</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">       
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
            <tr id="content1" runat="server">
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label3" runat="server" Text="试题内容："></asp:Label>
                &nbsp;
            </td>
            <td >
                <asp:Label ID="txtP_Content" runat="server" Text=""></asp:Label>
                </td>
        </tr>
        <tr id="shipin" runat="server">
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label1" runat="server" Text="视频路径："></asp:Label>
                &nbsp;
            </td>
            <td >
                <asp:Label ID="txtP_Shipin" runat="server" Text=""></asp:Label>
                </td>
        </tr>              
            <tr id="difficult" runat="server">
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label5" runat="server" Text="难度："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:Label ID="rblDiff" runat="server" Text=""></asp:Label>
                </td>
        </tr>
        <tr id="type" runat="server">
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label6" runat="server" Text="题型："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:Label ID="ddlType" runat="server" Text=""></asp:Label>
                </td>
        </tr>
        </tbody>
        <tbody id="Tabs1" runat="server">
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
            <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label2" runat="server" Text="说明："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                </td>
        </tr>
        </tbody>
    <tr class="tdbgbottom">
        <td colspan="2">
            <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="修改试题" OnClick="EBtnSubmit_Click" runat="server" />
            &nbsp;
            <asp:Button ID="BtnBack" class="btn btn-primary" runat="server" Text="返　回" OnClick="BtnBack_Click" UseSubmitBehavior="False" CausesValidation="False" />
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
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