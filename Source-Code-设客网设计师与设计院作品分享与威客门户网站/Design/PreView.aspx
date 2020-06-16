<%@ page language="C#" autoeventwireup="true" inherits="Design_PreView, App_Web_l1ynlgj5" enableviewstate="false" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><asp:Literal runat="server" ID="Title_T"></asp:Literal></title>
    <script src="/Design/JS/Plugs/covervid.js"></script>
    <asp:Literal runat="server" ID="Meta_Lit"></asp:Literal>
    <asp:Literal runat="server" ID="Resource_Lit"></asp:Literal>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div ng-app="app"><div id="mainBody" ng-controller="appController" class="container"></div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="/Design/JS/sea.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script>
        var scope;
        seajs.use(["page"], function (page) {
            var pageMod = <%=pageMod.page%>;
            page.title = pageMod.title;
            page.guid = pageMod.guid;
            page.bgconfig = pageMod.bgconfig;
            page.extendData=<%=extendData%>;
            page.compData = <%=compData%>;
            page.instance = $(document);
            page.init();
            for (var i = 0; i < page.compList.length; i++) {
                scope.addDom(page.compList[i]);
            }
        });
        var app = angular.module("app", [], function ($compileProvider) { }).controller("appController", function ($scope, $compile) {
            scope = $scope;
            $scope.list = {};
            $scope.addDom = function (compObj) {
                if ($scope.list[compObj.id]) {  return; }
                $scope.list[compObj.id] = compObj;
                var html = $(compObj.AnalyToHtml());
                html.attr("style",compObj.config.style);
                compObj.instance = $compile(angular.element(html))($scope);
                angular.element(document.getElementById("mainBody")).append(compObj.instance);
            }
        });
    </script>
</asp:Content>