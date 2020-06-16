<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_AddComp, App_Web_2rwfiian" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="/Design/res/css/edit/common.css" rel="stylesheet" />
    <title>添加组件</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="addPanel" class="left-panel-frame add-panel">
    <ul class="category-list"  style="min-height:500px;">
        <asp:Repeater runat="server" ID="CateRPT" EnableViewState="false">
            <ItemTemplate>
                <li class="category <%#Eval("Name") %>" data-type="<%#Eval("Name") %>">
                    <span class="category-name-wrapper">
                        <span class="category-name"><%#Eval("Alias") %></span>
                    </span>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
        <div id="compview" class="category-view-wrapper"  style="min-height:500px;"></div>
    </div>
       </asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
   <script>
       $(function () {
           $(".category").click(function () {
               $(".category-name-wrapper").removeClass("is-selected");
               $(this).find(".category-name-wrapper").addClass("is-selected");
               //加载不同的html
               var type = $(this).data("type");
               $("#compview").load("/Design/Diag/" + type + "/Add.html", function () {
                   //绑定添加元素 
                   $(".domItem").click(function () {
                       parent.AddComponent(model);
                   });
               });
           });
           $(".category:first").click();
       })
   </script>
</asp:Content>