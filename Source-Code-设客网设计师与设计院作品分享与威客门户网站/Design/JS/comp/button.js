define(function (require, exports, module) {
    var _self = function () { }, _base = require("base"), $ = require('jquery');
    _base.utils.inherits(_self, _base.Control);
    _self.prototype.htmlTlp = '<div id="@id" ng-model="list.@id" style="{{list.@id.config.style}}" class="{{list.@id.config.css}}"><div style="margin:20px;">';
    _self.prototype.htmlTlp += '<input type="button" class="btn btn-primary comp_btn" value="{{list.@id.dataMod.value}}">';
    _self.prototype.htmlTlp += '</div></div>';
    module.exports = function () { return _self; }
});