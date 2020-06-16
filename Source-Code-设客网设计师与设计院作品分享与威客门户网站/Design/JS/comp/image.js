define(function (require, exports, module) {
    var _self = function () { }, _base = require("base"), $ = require('jquery');
    _base.utils.inherits(_self, _base.Control);
    _self.prototype.htmlTlp = '<div ng-model="list.@id" id="@id" class="onlydrag" style="{{list.@id.config.style}}">';
    _self.prototype.htmlTlp += '<img class="onlyresize imgcomp" style="{{list.@id.config.imgstyle}}" src="{{list.@id.dataMod.src}}"/>';
    _self.prototype.htmlTlp += '</div>';

    //exports.getNewObj = function () { return _self; }
    module.exports = function () { return _self; }
});