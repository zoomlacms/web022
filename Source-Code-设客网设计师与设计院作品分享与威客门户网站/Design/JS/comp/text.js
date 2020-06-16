define(function (require, exports, module) {
    var _self = function () { }, _base = require("base"), $ = require('jquery');
    _base.utils.inherits(_self, _base.Control);
    _self.prototype.htmlTlp = '<div id="@id" ng-model="list.@id.dataMod.text" class="{{list.@id.config.css}}" style="{{list.@id.config.style}}">{{list.@id.dataMod.text}}</div>';
    //exports.getNewObj = function () { return _self; }
    module.exports = function () { return _self; }
});