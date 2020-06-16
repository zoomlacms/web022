using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ZoomLa.Model;
using ZoomLa.BLL;
using System.Text;
using ZoomLa.Common;
namespace ZoomLa.WebSite.Manage.Template
{
    public partial class InsertLabel : CustomerPageAction
    {
        protected B_Label bll = new B_Label();
        private int m_Labeltype;
        protected void Page_Load(object sender, EventArgs e)
        {
            //ZoomLa.Common.function.AccessRulo();
            B_Admin badmin = new B_Admin();
            badmin.CheckIsLogin();
            this.ShowLabelAdd();
        }

        private void ShowLabelAdd()
        {
            string str = base.Request.QueryString["n"];
            if (!string.IsNullOrEmpty(str))
            {
                this.LabelName.Text = str;
                M_Label lblinfo = this.bll.GetLabelXML(str);
                if (lblinfo.LableType == 3)
                    this.m_Labeltype = 1;
                else
                    this.m_Labeltype = lblinfo.LableType;

                if (!lblinfo.IsNull)
                {
                    StringBuilder builder = new StringBuilder();
                    builder.Append("<table width='100%' cellpadding=\"2\" cellspacing=\"1\">");
                    int ptype = 0;
                    string aname = "";
                    string avalue = "";
                    string aintro = "";
                    if (lblinfo.Param != "")
                    {
                        string[] pa = lblinfo.Param.Split(new char[] { '|' });
                        for (int i = 0; i < pa.Length; i++)
                        {
                            ptype = DataConverter.CLng(pa[i].Split(new char[] { ',' })[2]);
                            if (ptype == 1)
                            {
                                aname = pa[i].Split(new char[] { ',' })[0];
                                avalue = pa[i].Split(new char[] { ',' })[1];
                                aintro = pa[i].Split(new char[] { ',' })[3];
                                builder.Append("<tr><td class=\"tdbgleft\" align=\"right\"><SPAN sid=\"" + aname + "\" stype=\"0\" title=\"" + aname + "\">" + aintro + "</SPAN>：</td><td align=\"left\">");
                                builder.Append("<input type=\"text\" id=\"" + aname + "\" value=\"" + avalue + "\"/></td></tr>");
                            }
                            if (ptype == 3)//单选
                            {
                                aname = pa[i].Split(new char[] { ',' })[0];
                                avalue = pa[i].Split(new char[] { ',' })[1];
                                aintro = pa[i].Split(new char[] { ',' })[3];
                                builder.Append("<tr><td class=\"tdbgleft\" align=\"right\"><SPAN sid=\"" + aname + "\" stype=\"0\" title=\"" + aname + "\">" + aintro + "</SPAN>：</td><td align=\"left\">");
                                builder.Append("<select id=\"" + aname + "\" style=\"width:156px;\">");
                                string[] item = avalue.Split('$');
                                foreach (string iten in item)
                                {
                                    builder.Append("<option value=\"" + iten + "\">" + iten + "</option>");
                                }
                                builder.Append("</select></td></tr>");

                            }
                            if (ptype == 4)//多选
                            {
                                aname = pa[i].Split(new char[] { ',' })[0];
                                avalue = pa[i].Split(new char[] { ',' })[1];
                                aintro = pa[i].Split(new char[] { ',' })[3];
                                builder.Append("<tr><td class=\"tdbgleft\" align=\"right\"><SPAN sid=\"" + aname + "\" stype=\"1\" title=\"" + aname + "\">" + aintro + "</SPAN>：</td><td align=\"left\">");
                                builder.Append("<input id=\"h" + aname + "\" type=\"hidden\" />");
                                builder.Append("<div id=\"d" + aname + "\" style=\"display:block;\">");
                                string[] items = avalue.Split('$');
                                foreach (string itens in items)
                                {
                                    builder.Append("<input type=\"checkbox\" name=\"c" + aname + "\" onclick=\"selectchecked(this)\" value=\"" + itens + "\" />" + itens + "</br>");
                                }
                                builder.Append("</div></td></tr>");
                            }
                        }

                        builder.Append("</table>");
                        this.labelbody.Text = builder.ToString();
                        this.labelintro.Text = lblinfo.Desc;
                    }
                }
            }
        }
        public int LabelType
        {
            get { return this.m_Labeltype; }
        }
    }
}