var DateHelper = {};
//转化秒为时间,返回模型
DateHelper.SecondToTime = function (time) {
    var model = { day: 0, hour: 0, minute: 0, second: 0 };
    model.isHasTime = function () {
        return (model.day > 0 || model.hour > 0 || model.minute > 0 || model.second > 0);
    }
    if (!time || null == time || "" == time) return model;
    model.day = parseInt(time / (60 * 60 * 24));
    if (model.day > 0) { time = time - ((60 * 60 * 24) * model.day); }
    model.hour = parseInt(time / (60 * 60));
    if (model.hour > 0) { time = time - ((60 * 60) * model.hour); }
    model.minute = parseInt(time / 60);
    if (model.minute > 0) { time = time - (60 * model.minute); }
    model.second = time;
    return model;
}