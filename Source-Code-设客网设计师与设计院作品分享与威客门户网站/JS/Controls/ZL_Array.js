/*提供对Array的原型扩展*/
//去除重复值
Array.prototype.unique = function () {
    var data = this || [];
    var a = {}; //声明一个对象，javascript的对象可以当哈希表用
    for (var i = 0; i < data.length; i++) {
        a[data[i]] = true;  //设置标记，把数组的值当下标，这样就可以去掉重复的值
    }
    data.length = 0;

    for (var i in a) { //遍历对象，把已标记的还原成数组
        this[data.length] = i;
    }
    return data;
}
Array.prototype.addAll = function ($array) {
    if ($array == null || $array.length == 0)
        return;
    for (var $i = 0; $i < $array.length; $i++)
        this.push($array[$i]);
}
//是否包含指定值
Array.prototype.contains = function ($value) {
    for (var $i = 0; $i < this.length; $i++) {
        var $element = this[$i];
        if ($element == $value)
            return true;
    }
    return false;
}
Array.prototype.GetByID = function (id, name) {
    if (!name || name == "") { name = "id"; }
    for (var i = 0; i < this.length; i++) {
        if (this[i][name] == id) { return this[i]; }
    }
    return null;
}
Array.prototype.RemoveByID = function (id) {
    for (var i = 0; i < this.length; i++) {
        if (this[i].id == id) { this.splice(i,1); break; }
    }
}
/*
*添加前进行重复检测,如指定的主键项不存在,也不允许添加
*示例:list.pushNoDup({ p_id: 1, p_title: "test" }, "p_id");
*/
Array.prototype.pushNoDup = function (model, name) {
    if (!name) { name = "id"; }
    var isAdd = true;
    for (var i = 0; i < this.length; i++) {
        var me = this[i];
        if (me[name] == model[name]) { isAdd = false; break; }
    }
    if (isAdd) { this.push(model); }
}
Array.prototype.GetIDS = function (name) {
    //返回数组的ids,默认返回id
    var ids = ""; if (!name) { name = "id";}
    for (var i = 0; i < this.length; i++) {
        ids += this[i][name] + ",";
    }
    if (ids && ids.length > 0) { ids = ids.substring(0, ids.length - 1); }
    return ids;
}
var JsonHelper = {
    FillData: function (stlp, list) {
        //用于单传一个json模型
        if (!(list instanceof Array)) { var arr = []; arr.push(list); list = arr; }
        var result = "";
        for (var i = 0; i < list.length; i++) {
            var model = list[i];
            result += function (mod) {
                var tlp = stlp;
                for (var key in mod) {
                    tlp = tlp.Replace("@" + key, mod[key]);
                }
                tlp = tlp.Replace("@_model", JSON.stringify(model));//将整个模型作为参数传入
                var $item = $(tlp);
                var $fun = $item.find("fun");//需要以JS解析的
                $fun.each(function () {
                    var html = $(this).html();
                    $(this).html(eval(html));
                })
                return $item.toHTML();
            }(model);
        }//for end;
        return result;
    }//FillData end;
};
jQuery.fn.extend({
    toHTML: function () {
        var obj = this;
        var html = "";
        for (var i = 0; i < obj.length; i++) {
            html += obj[i].outerHTML;
        }
        return html;
    }
});
String.prototype.Replace = function (str1, str2) {
    var rs = this.replace(new RegExp(str1, "gm"), str2);
    return rs;
}