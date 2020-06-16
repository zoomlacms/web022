//多价格处理逻辑,需引用Array,Regex
var MultiPrice = {
    trTlp: "",
    config: { hid: "ChildPro_Hid", body: "child_tb", num: 1 },
    GetModel: function () { return { code: "", Proname: "", LinPrice: "", ShiPrice: "" }; },
    Init: function () {
        var ref = this;
        ref.trTlp = $("#" + ref.config.body).html();
        var val = $("#" + ref.config.hid).val();
        if (val && val != "") {
            var list = JSON.parse(val);
            ref.AddTrByData(list);
        }
        else { ref.AddTrByNum(ref.config.num); }
        $($("#" + ref.config.body + " .delchild")[0]).remove();
    },
    BindEvent: function () {
        var ref = this;
        $(".addchild").unbind("click");
        $(".delchild").unbind("click");
        $(".addchild").click(function () {
            ref.AddTrByNum(1, "append");
        });
        $(".delchild").click(function () {
            $(this).closest(".childtr").remove();
        });
    },
    PreSubmit: function () {
        //提交前的处理
        var ref = this;
        var $trs = $(".childtr");
        var list = [];
        for (var i = 0; i < $trs.length; i++) {
            var model = ref.GetModel();
            var $tr = $($trs[i]);
            model.code = $tr.find("[name=C_code_hid]").val();
            model.Proname = $tr.find("[name=C_Proname_T]").val();
            model.LinPrice = $tr.find("[name=C_LinPrice_T]").val();
            model.ShiPrice = $tr.find("[name=C_ShiPrice_T]").val();
            if (model.code == "") { model.code = GetRanPass(6); }
            if (ZL_Regex.isNum(model.LinPrice, model.ShiPrice) && !ZL_Regex.isEmpty(model.Proname)) {
                list.push(model);
            }
        }//for end;
        if (list.length > 0) { $("#" + ref.config.hid).val(JSON.stringify(list)); }
        return true;
    },
    //--------以上为必须有,后期增加继承属性
    AddTrByNum: function (num, method) {
        //创建指定个数的行
        var ref = this;
        if (!num || num < 1) { num = 1; }
        var list = [];
        for (var i = 0; i < num; i++) {
            list.push(ref.GetModel());
        }
        ref.AddTrByData(list, method);
    },
    AddTrByData: function (list, method) {
        //根据数据先清除再填充,这样模板可以直接写在Html中
        var ref = this;
        var html = JsonHelper.FillData(ref.trTlp, list);
        if (method == "append") {
            $("#" + ref.config.body).append(html)
        }
        else { $("#" + ref.config.body).html(html) }
        ref.BindEvent();
    }
};
//---------------------------
$(function () {
    MultiPrice.Init();
})