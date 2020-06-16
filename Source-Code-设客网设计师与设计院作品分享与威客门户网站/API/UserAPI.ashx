<%@ WebHandler Language="C#" Class="UserAPI" %>
/*
 *用户API,检测是否登录等
 */
using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.Model;
using ZoomLa.Components;


public class UserAPI : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        //反射对性能消耗过重,替换为switch
        string result = "";
        string method = context.Request.Form["method"];
        M_Net_User model = new M_Net_User();
        M_Net_User rmod = new M_Net_User();
        try
        {
            model = JsonHelper.JsonDeserialize<M_Net_User>(context.Request["Model"]);
            if (string.IsNullOrEmpty(model.token) || !model.token.Equals(StationGroup.Token)) return;//无权限
            switch (model.source)
            {
                case "ZL_UserBaseField":
                    rmod = B_UserBaseFieldDeal(method, model);
                    break;
                default:
                    //B_Site_Log.Insert("UserApi", model.str+":"+model.uid);
                    rmod = B_UserDeal(method, model);
                    break;
            }
            if (rmod != null)
                result = JsonHelper.JsonSerializer(rmod);
        }
        catch (Exception ex) { }//model.source + ":" +
        context.Response.Clear();
        context.Response.Write(result); context.Response.Flush(); context.Response.End();
    }
    public M_Net_User B_UserBaseFieldDeal(string method, M_Net_User model)
    {
        B_UserBaseField ubBll  = new B_UserBaseField();
        M_Net_User rmod = new M_Net_User();
        switch (method)
        {
            case"GetInsert":
                rmod.str = ubBll.GetInsert(rmod.fieldmodel).ToString();
                break;
            case "GetDelete":
                rmod.flag = ubBll.GetDelete(rmod.uid);
                break;
            case "getUserBaseFieldByFieldName":
                rmod.fieldmodel = ubBll.getUserBaseFieldByFieldName(rmod.str);
                break;
            case "GetUpdate":
                rmod.flag = ubBll.GetUpdate(rmod.fieldmodel);
                break;
            case "GetSelect":
                rmod.fieldmodel = ubBll.GetSelect(rmod.uid);
                break;
            case "SelByFieldName":
                rmod.dt = ubBll.SelByFieldName(rmod.str);
                break;
            case "GetPreID":
                rmod.str = ubBll.GetPreID(rmod.uid).ToString();
                break;
            case "GetMaxID":
                rmod.str = ubBll.GetMaxID().ToString();
                break;
            case "Select_All":
                rmod.dt = ubBll.Select_All();
                break;
            case "SelAll":
                rmod.dt = ubBll.SelAll();
                break;
            case "GetHtml":
                rmod.str = ubBll.GetHtml();
                break;
            case "GetUpdateHtml":
                rmod.str = ubBll.GetUpdateHtml(model.uid);
                break;
            case "GetHtmlUser":
                rmod.str = ubBll.GetHtmlUser();
                break;
        }
        return rmod;
    }
    public M_Net_User B_UserDeal(string method, M_Net_User model)
    {
        B_User buser = new B_User();
        M_Net_User rmod = new M_Net_User();
        switch (method)
        {
            case "Adds":
                rmod.str = buser.AddModel(model.mu).ToString();
                break;
            case"AddBase":
                rmod.flag = buser.AddBase(model.basemu);
                break;
            case "UpdateBase":
                rmod.flag = buser.UpdateBase(model.basemu);
                break;
            case "IsExit":
                rmod.flag = buser.IsExit(model.uid);
                break;
            case "GetNames":
                rmod.dt = buser.GetNames(model.uname);
                rmod.dt.TableName = "UserDT";
                break;
            case "GetLoginUser":
                rmod.mu = buser.GetLoginUser(model.uname, model.upwd);
                break;
            case "GetSelect":
                rmod.mu = buser.GetSelect(model.uid);
                break;
            case "SelectByParentIDAndSalts":
                rmod.dt = buser.SelectByParentIDAndSalts(model.uid);
                break;
            case "SelPage":
                int itemCount=0;
                //rmod.dt = buser.SelPage(model.uid, model.gid, out itemCount, model.uname, model.upwd);
                rmod.uid = itemCount;
                break;
            case "GetUserByGroupss":
                rmod.dt = buser.GetUserByGroupss(model.str);
                break;
            case "GetUserByGroupI":
                rmod.dt = buser.GetUserByGroupI(model.gid);
                break;
            case "DelUserById":
                rmod.flag = buser.DelUserById(model.uid);
                break;
            case "DelUserByName":
                rmod.flag = buser.DelUserByName(model.uname);
                break;
            case "IsExitcard":
                rmod.flag = buser.IsExitcard(model.str);
                break;
            case "IsExistMail":
                rmod.flag = buser.IsExistMail(model.uemail);
                break;
            case "SeachByID":
                rmod.mu = buser.SeachByID(model.uid);
                break;
            case "GetUserByUserID":
                rmod.mu = buser.GetUserByUserID(model.uid);
                break;
            case "GetUserByName":
                rmod.mu = buser.GetUserByName(model.uname);
                break;
            case "GetUserByWorkNum":
                rmod.mu = buser.GetUserByWorkNum(model.str);
                break;
            case "GetSelectByEmail":
                rmod.mu = buser.GetSelectByEmail(model.uemail, model.upwd);
                break;
            case "GetSelectByRemark":
                rmod.mu = buser.GetSelectByRemark(model.str);
                break;
            case "LoginUser":
                rmod.mu = buser.LoginUser(model.uname, model.upwd);
                break;
            case "AuthenticateUser":
                rmod.mu = buser.AuthenticateUser(model.uname, model.upwd);
                break;
            case "AuthenticateEmail":
                rmod.mu = buser.AuthenticateEmail(model.uemail, model.upwd);
                break;
            case "AuthenticateWorkNum":
                rmod.mu = buser.AuthenticateWorkNum(model.str, model.upwd);
                break;
            case "AuthenticateID":
                rmod.mu = buser.AuthenticateID(model.uid, model.upwd);
                break;
            case "SelectUserShortMessage":
                rmod.dt = buser.SelectUserShortMessage(model.uid.ToString());
                break;
            case "FoundUser":
                rmod.flag = buser.FoundUser(model.uid);
                break;
            case "GetFriendByUserName":
                rmod.dt = buser.GetFriendByUserName(model.uname);
                break;
            case "GetUserBaseByuserid":
                rmod.dt = buser.GetUserBaseByuserid(model.uid.ToString());
                break;
            case "GetUserBaseByuserid_2":
                rmod.basemu = buser.GetUserBaseByuserid(model.uid);
                break;
            case "GetUserFriendByuserid":
                rmod.dt = buser.GetUserFriendByuserid(model.uid.ToString());
                break;
            case "GetUserBaseByProvince":
                rmod.dt = buser.GetUserBaseByProvince(model.str);
                break;
            case "GetUserMobile":
                rmod.dt = buser.GetUserMobile(model.uid, model.gid);
                break;
            case "GetUserModeInfo":
                rmod.dt = buser.GetUserModeInfo(model.str, model.uid, model.gid);
                break;
            case "IsExitResume":
                rmod.flag = buser.IsExitResume(model.uid, model.gid);
                break;
            case "IsExitExaminee":
                rmod.flag = buser.IsExitExaminee(model.uid, model.gid);
                break;
            case "IsExistUName":
                rmod.flag = buser.IsExistUName(model.uname);
                break;
            case "GetResumeList":
                break;
            case "GetExamineeList":
                rmod.dt = buser.GetExamineeList(model.uid);
                break;
            case "IsExistReadResume":
                rmod.flag = buser.IsExistReadResume(model.uid, model.gid);
                break;
            case "GetuserTb":
                rmod.dt = buser.GetuserTb(model.uid);
                break;
            case "GetUserIDByUserName":
                rmod.mu = buser.GetUserIDByUserName(model.uname);
                break;
            case "GetIdsByUserName":
                rmod.str = buser.GetIdsByUserName(model.uname);
                break;
            case "GetUserName":
                rmod.dt = buser.GetUserName(model.uname);
                break;
            case "GetName":
                rmod.dt = buser.GetName(model.uname);
                break;
            case "GetUserInfo_Cerificate":
                rmod.dt = buser.GetUserInfo_Cerificate(model.gid, model.str, model.uname);
                break;
            case "GetUserByPageId":
                rmod.mu = buser.GetUserByPageId(model.gid);
                break;
            case "GetuserTbUserBase":
                rmod.dt = buser.GetuserTbUserBase(model.uname);
                break;
            case "Seleroom":
                rmod.dt = buser.Seleroom(model.gid);
                break;
            case "SelectUserByIds":
                rmod.dt = buser.SelectUserByIds(model.uid.ToString());
                break;
            case "GetuserT":
                rmod.dt = buser.GetuserT(model.uemail);
                break;
            case "GetByWhere":
                rmod.dt = buser.GetByWhere(model.str);
                break;
            case "GetUserList":
                rmod.dt = buser.GetUserList(model.uid, model.gid, model.str, model.uemail);
                break;
            case "SeleAppbool":
                rmod.mu = buser.SeleAppbool(model.uid.ToString());
                break;
            case "IsExistByOpenID":
                rmod.flag = buser.IsExistByOpenID(model.uid.ToString());
                break;
            case "GetUserBaseIDByUserID":
                rmod.str = buser.GetUserBaseIDByUserID(model.uid);
                break;
            case "GetIDCard":
                rmod.dt = buser.GetIDCard(model.uid.ToString());
                break;
            case "GetUserByUserName":
                rmod.dt = buser.GetUserByUserName(model.uname);
                break;
            case "GetUserNameByIDS":
                rmod.str = buser.GetUserNameByIDS(model.uid.ToString());
                break;
            case "GetUserIDByWorkNum":
                rmod.str = buser.GetUserIDByWorkNum(model.uname);
                break;
            case "CheckWorkNumIsOnly":
                rmod.flag = buser.CheckWorkNumIsOnly(model.str, model.uid);
                break;
            case "SearchByInfo":
                rmod.dt = buser.SearchByInfo(model.str);
                break;
            case "GetAllFriend":
                rmod.dt = buser.GetAllFriend();
                break;
            case "DelModelInfoAllo":
                rmod.flag = buser.DelModelInfoAllo(model.uname, model.str);
                break;
            case "UpDateUser":
                rmod.flag = buser.UpDateUser(model.mu);
                break;
            case "Audit":
                rmod.flag = buser.Audit(model.str, model.uid, model.gid);
                break;
            case "UpUserTrueFroE":
                rmod.flag = buser.UpUserTrueFroE(model.uid);
                break;
            case "AuthenticateUsers":
                rmod.mu = buser.AuthenticateUsers(model.uname, model.upwd, model.flag);
                break;
            case "UpdateUserFile":
                rmod.flag = buser.UpdateUserFile(model.uid, model.dt);
                break;
            case "GetVideoUserByuserid":
                rmod.mu = buser.GetVideoUserByuserid(model.uid);
                break;
            case "AddUserModel":
                rmod.flag = buser.AddUserModel(model.dt, model.uname);
                break;
            case "UpdateModelInfo":
                rmod.flag = buser.UpdateModelInfo(model.dt, model.uname, model.uid);
                break;
            case "DelModelInfo":
                rmod.flag = buser.DelModelInfo(model.uname, model.uid);
                break;
            case "DelModelInfoAll":
                rmod.flag = buser.DelModelInfoAll(model.uname);
                break;
            case "DelModelInfo2":
                rmod.flag = buser.DelModelInfo2(model.uname, model.uid, model.gid);
                break;
            case "DelResumePost":
                rmod.flag = buser.DelResumePost(model.uid);
                break;
            case "DelExamineePost":
                rmod.flag = buser.DelExamineePost(model.uid);
                break;
            case "AddReadResume":
                rmod.flag = buser.AddReadResume(model.uid, model.gid);
                break;
            case "UpdateUserHouse":
                rmod.flag = buser.UpdateUserHouse(model.uid, model.gid);
                break;
            case "UpdateUserConfirm":
                rmod.flag = buser.UpdateUserConfirm(model.uid, model.gid);
                break;
            case "SelUserIDByOA":
                rmod.str = buser.SelUserIDByOA(model.uname);
                break;
            case "GetUserByState":
                rmod.dt = buser.GetUserByState();
                break;
            case "UpdateUserExp":
                rmod.flag = buser.UpdateUserExp(int.Parse(model.str), model.uid, model.gid);
                break;
            case "UpdateUserPoint":
                rmod.flag = buser.UpdateUserPoint(double.Parse(model.str), model.uid);
                break;
            case "UpdateRebatesBalance":
                rmod.flag = buser.UpdateRebatesBalance(model.uid, double.Parse(model.str));
                break;
            case "UpdateGroupId":
                rmod.flag = buser.UpdateGroupId(model.uid, model.gid);
                break;
            case "UpdatePageId":
                rmod.flag = buser.UpdatePageId(model.uid, model.gid);
                break;
            case "UpdateUserPurse":
                rmod.flag = buser.UpdateUserPurse(model.uid, double.Parse(model.str));
                break;
            case "UpdateUserSilverCoin":
                rmod.flag = buser.UpdateUserSilverCoin(model.uid, double.Parse(model.str));
                break;
            case "UpdatePunch":
                rmod.flag = buser.UpdatePunch(model.uid, model.gid);
                break;
            case "UpdateUserDummyPurse":
                rmod.flag = buser.UpdateUserDummyPurse(model.uid, double.Parse(model.str));
                break;
            case "GetFriendID":
                rmod.dt = buser.GetFriendID();
                break;
            case "Upadateroomid":
                rmod.flag = buser.Upadateroomid(model.uid, model.gid);
                break;
            case "UpdateIsCloud":
                rmod.flag = buser.UpdateIsCloud(model.uid, model.gid);
                break;
            case "Insert":
                rmod.flag = buser.AddModel(model.mu)>0;
                break;
            case "UpByWhere":
                rmod.flag = buser.UpByWhere(model.uname, model.upwd, model.str);
                break;
            case "Sel":
                rmod.dt = buser.Sel();
                break;
            case "SelAll":
                rmod.dt = buser.SelAll();
                break;
            case "SelByUserID":
                rmod.dt = buser.SelByUserID(model.uid);
                break;
            case "GetUserNameByNames":
                rmod.str = buser.GetUserNameByNames(model.uname, model.dt);
                break;
            case "ReturnMoney":
                rmod.flag = buser.ReturnMoney(model.gid, model.uid, model.str, int.Parse(model.token));
                break;
            case "BatAudit":
                rmod.flag = buser.BatAudit(model.str,model.uid);
                break;
            case "GetUserByGroup":
                rmod.dt = buser.GetUserByGroup(model.uid).ToTable();
                break;
            case "GetUserByGroups":
                rmod.dt = buser.GetUserByGroups(model.str).ToTable();
                break;
            case "SelectByParentIDAndSalt":
                rmod.dt = buser.SelectByParentIDAndSalt(model.uid).ToTable();
                break;
            case "GetUserNameListTotal":
                rmod.token = buser.GetUserNameListTotal(model.str).ToString();
                break;
            case "UserModeInfoID":
                rmod.token = buser.UserModeInfoID(model.uname, model.uid).ToString();
                break;
            case "GetUserMobileCount":
                rmod.token = buser.GetUserMobileCount().ToString();
                break;
            case "GetSelectID":
                rmod.token = buser.GetSelectID(model.uid).ToString();
                break;
            case "GetUserAllUserID":
                rmod.token = buser.GetUserAllUserID(model.uname).ToString();
                break;
            case "ModeleState":
                rmod.token = buser.ModeleState(model.uname, model.uid).ToString();
                break;
            case "UpdateTime":
                rmod.flag = buser.UpdateTime(model.uid, DateTime.Parse(model.str));
                break;
            case "SelAllByTime":
                rmod.dt = buser.SelAllByTime(DateTime.Parse(model.str), DateTime.Parse(model.uemail));
                break;
            case "GetUserAllbyTime":
                rmod.dt = buser.GetUserAllbyTime(model.uid, DateTime.Parse(model.str), DateTime.Parse(model.uemail));
                break;
            case "UpdateCerificateApproveInfo":
                rmod.flag = buser.UpdateCerificateApproveInfo(model.uid, model.gid, model.str, model.token, model.uemail, DateTime.Parse(model.uname));
                break;
            case "GetRegisterIP":
                rmod.flag = buser.GetRegisterIP(model.str, DateTime.Parse(model.uname), DateTime.Parse(model.upwd));
                break;
            case "UpdateUserState":
                rmod.flag = buser.UpdateUserState(model.uid, model.gid, DateTime.Parse(model.str));
                break;
            case "InsertModel":
                buser.InsertModel(model.dt, model.str);
                break;
        }
        return rmod;
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}