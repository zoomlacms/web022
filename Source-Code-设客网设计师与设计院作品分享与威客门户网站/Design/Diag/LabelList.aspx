<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_LabelList, App_Web_2rwfiian" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/Design/JS/sea.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <link href="/Design/res/css/edit/common.css" rel="stylesheet" />
    <title>标签管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
   <div ng-app="app">
       <table class="table table-bordered table-striped" ng-controller="appController">
       <tr><td>序号</td><td>引用标签</td><td>操作</td></tr>
       <tbody ng-model="model.dataMod">
           <tr ng-repeat="item in compList|filter:myFilter">
               <td class="td_m">{{$index+1}}</td>
               <td>{{item.dataMod.name}}</td>
               <td>
                   <a href="javascript:;" title="删除标签" ng-click="remove(item);"><i class="glyphicon glyphicon-remove"></i></a>
               </td>
           </tr>
       </tbody>
   </table>
   </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        var editor = { id: "<%:Request.QueryString["ID"]%>", dom: null, model: null, scope: parent.editor.scope };
        angular.module("app", []).controller("appController", function ($scope, $compile) {
            $scope.compList = top.page.compList;
            $scope.myFilter = function (item) {
                return item.config.type == "label";
            };
            $scope.remove = function (item) {
                $scope.compList.forEach(function (v, i, _) {
                    if (v == item) {
                        _.splice(i, 1);
                        item.RemoveSelf();
                        return;
                    }
                });
            }//remove end;
        })
    </script>
</asp:Content>
