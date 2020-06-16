<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_Gallery_edit, App_Web_gdmikdwf" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script src="/JS/Plugs/angular.min.js"></script>
    <link href="/Design/res/css/edit/common.css" rel="stylesheet" />
    <title>幻灯片组件</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div ng-app="app">
   <table class="table table-bordered table-striped" ng-controller="appController">
       <tr><td>序号</td><td>名称</td><td>图片链接</td><td>操作</td></tr>
       <tbody ng-model="model.dataMod">
           <tr ng-repeat="item in model.dataMod.items">
               <td>{{$index+1}}</td>
               <td><input type="text" class="form-control text_80"  ng-model="item.name"/></td>
               <td><input type="text" class="form-control text_200" ng-model="item.img"/></td>
               <td><a href="javascript:;" ng-click="remove(item);"><i class="glyphicon glyphicon-remove"></i></a></td>
           </tr>
       </tbody>
       <tr>
           <td colspan="4">
               <input type="button" value="更新修改" class="btn btn-primary" onclick="NotifyUpdate();" />
               <input type="button" value="新增一行" class="btn btn-primary" ng-click="add();" /></td>
       </tr>
   </table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        var editor = { id: "<%:Request.QueryString["ID"]%>", dom: null, model: null, scope: parent.editor.scope };
        angular.module("app", []).controller("appController", function ($scope, $compile) {
            editor.model = top.page.compList.GetByID(editor.id);
            editor.dom = editor.model.instance;
            $scope.model = editor.model;
            $scope.remove = function (item) {
                $scope.model.dataMod.items.forEach(function (v, i, _) {
                    if (v == item) {
                        _.splice(i, 1);
                        editor.scope.$digest();
                        return;
                    }
                });
            }//remove end;
            $scope.add = function () {
                editor.model.dataMod.items.push({ orderid: 0, name: "名称", href: "#" });
            }
        })
        function NotifyUpdate() {
            editor.scope.$digest();
        }
    </script>
</asp:Content>