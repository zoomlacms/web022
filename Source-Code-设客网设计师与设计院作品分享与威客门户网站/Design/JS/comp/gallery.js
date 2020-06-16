define(function (require, exports, module) {
    var _self = function () { }, _base = require("base"), $ = require('jquery');
    _base.utils.inherits(_self, _base.Control);
    //_self.prototype.htmlTlp = '<div id="@id" ng-model="list.@id.dataMod.text" class="{{list.@id.config.css}}" style="{{list.@id.config.style}}">{{list.@id.dataMod.text}}</div>';
    _self.prototype.htmlTlp = '<div id="@id" class="candrag" ng-model="list.@id.dataMod" style="{{list.@id.config.style}}">'
   + '<div id="@id_gallery" class="carousel slide" data-ride="carousel" data-interval="5000"><ol class="carousel-indicators">'
   + '<li ng-repeat="item in list.@id.dataMod.items" data-target="#@id_gallery" data-slide-to="{{$index}}" class="{{item.css}}"></li>'
   + '</ol>'
   + '<div class="carousel-inner">'
   + '<div ng-repeat="item in list.@id.dataMod.items" class="item {{item.css}}">'
   + '<img src="{{item.img}}">'
   + '<div class="carousel-caption">{{item.name}}</div>'
   + '</div>'//item end;
   + '</div>'
   + '<a class="carousel-control left" href="#@id_gallery" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" style="font-size:3em;"></span></a>'
   + '<a class="carousel-control right" href="#@id_gallery" data-slide="next"><span class="glyphicon glyphicon-chevron-right" style="font-size:3em;"></span></a></div></div>';
    module.exports = function () { return _self; }
});