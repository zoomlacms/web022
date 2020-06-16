using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL.Helper;
using ZoomLa.Common;
using ZoomLa.SQLDAL;

public partial class test_bar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Comp_Click(object sender, EventArgs e)
    {
        DataTable dt = SqlHelper.ExecuteTable("SELECT ID,MsgContent FROM ZL_Guest_Bar");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr = dt.Rows[i];
            dr["MsgContent"] = StrHelper.CompressString(dr["MsgContent"].ToString());
            SqlParameter[] sp = new SqlParameter[] { new SqlParameter("msg", dr["MsgContent"].ToString()) };
            string sql = "UPDATE ZL_Guest_Bar SET MsgContent=@msg WHERE ID=" + dr["ID"];
            SqlHelper.ExecuteSql(sql,sp);
        }
        function.WriteErrMsg("操作完成");
    }
}