<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_StoreEdit, App_Web_0mdweblp" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的店铺</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">修改申请信息</li> 
    </ol>
    </div>
    <div class="container">
    <div style="width: 100%">
        <table class="table table-striped table-bordered" id="Auditing" runat="server" visible="false">
            <tr>
                <td class="text-center" style="line-height: 80px;">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server" OnClick="LinkButton1_Click">修改我提交的信息!</asp:LinkButton>
                </td>
            </tr>
        </table>
        <div id="add" runat="server">
            <table class="table table-striped table-bordered">
                <tr>
                    <td colspan="2" class="text-center">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">商铺名称</td>
                    <td>
                        <asp:TextBox ID="Nametxt" runat="server" Text="" CssClass="form-control m715-50"></asp:TextBox>
                        <span><font color="red">*</font></span>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Nametxt">名称必填</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">商铺类型</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" CssClass="form-control m715-50" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        <span><font color="red">*</font></span>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="类型必填" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                <tr>
                    <td colspan="2" class="text-center">
                        <asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="信息提交" runat="server" OnClick="EBtnSubmit_Click" />
                        <input id="Button1" type="button" class="btn btn-primary" value="返  回" onclick="javascript: history.go(-1)" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/Common/Common.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script src="/JS/calendar.js" type="text/javascript"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
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
        $().ready(function () {
            $("input[type=text]").addClass("form-control");
        })
    </script>
</asp:Content>
