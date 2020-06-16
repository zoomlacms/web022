define(function (require, exports, module) {
    var _self = function () { }, _base = require("base"), $ = require('jquery');
    var Base64 = require("base64");
    _base.utils.inherits(_self, _base.Control);
    _self.prototype.Init = function (model) {
        this.htmlTlp = Base64.utf8to16(Base64.base64decode(model.htmlTlp));
        this.htmlTlp = '<div id="@id" class="@css" style="@style">' + this.htmlTlp + '</div>';
        this._init(model);
    }
    _self.prototype.PreSave = function (page) {
        this._presave();
        page.labelArr += this.dataMod.label + "|";
        return { "dataMod": this.dataMod, "config": this.config };
    }
    _self.prototype.Render = function () {
        this.htmlTlp = Base64.utf8to16(Base64.base64decode(this.config.htmlTlp));
        this.instance.html(this.htmlTlp);
    }
    _self.prototype.diagParam = { autoOpen: true, height:650,width:1100 };
    module.exports = function () { return _self; }
});