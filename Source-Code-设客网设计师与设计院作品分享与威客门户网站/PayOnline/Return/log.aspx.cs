using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.Model;

public partial class test_log : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ZLLog.L(ZLEnum.Log.pay,"123123");
    }
}