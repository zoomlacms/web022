define(function (require, exports, module) {
    var _self = function () { }, _base = require("base"), $ = require('jquery');
    _base.utils.inherits(_self, _base.Control);
   // _self.prototype.htmlTlp = '<div id="@id" ng-model="list.@id.dataMod.text" class="{{list.@id.config.css}}" style="{{list.@id.config.style}}">{{list.@id.dataMod.text}}</div>';
    _self.prototype.htmlTlp = '<div id="@id" class="candrag"><nav class="navbar navbar-default">'
    + '<div class="container-fluid"><div class="navbar-header">'
    + '<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"></button>'
    + '<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-th"></span></a></div>'
    + '<ul class="nav navbar-nav" ng-model="list.@id.dataMod">'
    + '<li ng-repeat="item in list.@id.dataMod.items|orderBy:\'orderid\'" class="{{item.css}}"><a href="{{item.href}}">{{item.name}}</a></li>'
    + '</ul></div></nav></div>';
    module.exports = function () { return _self; }
});