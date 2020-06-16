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
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Model;
using System.Collections.Generic;
using System.Xml;
using ZoomLa.Components;
using ZoomLa.SQLDAL;
using System.IO;
using ZoomLa.Model.Content;
using ZoomLa.BLL.Content;

public partial class Manage_I_Content_LabelSql : CustomerPageAction
{
    private B_Label bll = new B_Label();
    private B_FunLabel bfun = new B_FunLabel();
    private string m_LabelName;
    private object dbConnectionString;
    private object dbConnectionString2;

    private string txt_DbTableDownList;
    private string txt_DbTableDownList2;
    private string txt_DatabaseList;
    private string txt_DatabaseList2;

    protected M_Label labelInfo = new M_Label();
    protected string ConnectionString = ConfigurationManager.ConnectionStrings["Connection String"].ConnectionString;
    protected string PlugConnectionString = ConfigurationManager.ConnectionStrings["Plug Connection String"].ConnectionString;
    protected string dataname = "";
    protected string dataname2 = "";
    protected string T1 = "";
    protected string T2 = "";

    //{ "LocalSQL", "External SQL", "MySQL", "Oracle", "Access", "XML","Excel" };
    //外部库
    Hashtable tablelist = new Hashtable();
    TempLabel tLabel = new TempLabel();//专用于修改时临时储信息，只用于修改外部库，不干涉系统数据库的修改
    M_DataSource dsModel = new M_DataSource();
    B_DataSource dsBll = new B_DataSource();
    DataTable dsTable = new DataTable();
    string textTable = "TableName", valueTable = "Table_Name";//默认设置SQL,不同的数据库名字不同,在末设置以后看情况改为顶端规范化
    string textField = "fieldname", valueField = "fieldname"; //默认设置SQL

    protected void Page_Load(object sender, EventArgs e)
    {
        Call.HideBread(Master);
        B_Admin badmin = new B_Admin();                                            
        #region 初始化值
        dbConnectionString = ConnectionString;
        dbConnectionString2 = PlugConnectionString;
        string[] connect1 = ConnectionString.Split(new string[] { "Initial Catalog=" }, StringSplitOptions.RemoveEmptyEntries);
        string[] plubconnect1 = PlugConnectionString.Split(new string[] { "Initial Catalog=" }, StringSplitOptions.RemoveEmptyEntries);

        string[] connect = connect1[1].Split(new string[] { ";User ID=" }, StringSplitOptions.RemoveEmptyEntries);
        string[] plubconnect = plubconnect1[1].Split(new string[] { ";User ID=" }, StringSplitOptions.RemoveEmptyEntries);

        this.dataname = connect[0];//主表库名
        this.dataname2 = plubconnect[0];//从表库名 

        tablelist.Add(this.dataname, ConnectionString);

        if (RBLType.SelectedValue == "4")
        {
            RequiredFieldValidator3.Enabled = true;
            RequiredFieldValidator3.Visible = true;
        }
        else
        {
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator3.Visible = false;
        }
        if (string.IsNullOrEmpty(this.Request.QueryString["LabelName"]))
        {
            LabelName.Text = "添加新标签";
        }
        else
        {
            this.m_LabelName = this.Request.QueryString["LabelName"];
        }

        if (!this.Page.IsPostBack)
        {
            if (!B_ARoleAuth.Check(ZLEnum.Auth.label, "LabelEdit"))
            {
                function.WriteErrMsg("没有权限进行此项操作");
            }

            //库名Zoomla6x:kingdee ,this.ConnectionString+":"+this.PlugConnectionString
            dsTable = dsBll.Sel(); ViewState["dsTable"] = dsTable;
            this.DatabaseList.Items.Add(new ListItem("系统主数据库", dataname));//必须置首，后面方法依此判断否为外部库
            this.DatabaseList.Items.Add(new ListItem("从数据库", dataname2));

            this.DatabaseList2.Items.Add(new ListItem("系统主数据库", dataname));
            this.DatabaseList2.Items.Add(new ListItem("从数据库", dataname2));
            for (int i = 0; i < dsTable.Rows.Count; i++)
            {
                this.DatabaseList.Items.Add(new ListItem(dsTable.Rows[i]["DSName"] as string + "[外部源]", dsTable.Rows[i]["ID"].ToString()));
                this.DatabaseList2.Items.Add(new ListItem( dsTable.Rows[i]["DSName"] as string + "[外部源]", dsTable.Rows[i]["ID"].ToString()));
            }
            this.DatabaseList.Items.Add(new ListItem(("+添加新数据库源"), "addNewDataBase"));

            #region 标签分类
            this.CustomLabel_DP.DataSource = this.bll.GetLabelCateListXML();
            this.CustomLabel_DP.DataTextField = "Name";
            this.CustomLabel_DP.DataValueField = "Name";
            this.CustomLabel_DP.DataBind();
            this.CustomLabel_DP.Items.Insert(0, new ListItem("选择标签类型", ""));

            this.DropLabelType.DataSource = this.bll.GetLabelCateListXML();
            this.DropLabelType.DataTextField = "Name";
            this.DropLabelType.DataValueField = "Name";
            this.DropLabelType.DataBind();
            #endregion

            lblSys.Text = this.bfun.GetSysLabel();//系统标签
            lblFun.Text = this.bfun.GetFunLabel();//扩展函数
                    
            if (!string.IsNullOrEmpty(this.m_LabelName))//修改
            {
                labelInfo = this.bll.GetLabelXML(this.m_LabelName);
                this.HdnlabelID.Value = labelInfo.LabelID.ToString();

                this.TxtLabelName.Text = labelInfo.LableName;//标签名称
                ViewState["Label"] = labelInfo.LableName;
                this.TxtLabelType.Text = labelInfo.LabelCate;//标签分类
                LabelName.Text = "当前标签：" + labelInfo.LableName + "";

                if (!string.IsNullOrEmpty(labelInfo.DataSourceType))
                {
                    tLabel.ConnectType = labelInfo.DataSourceType;
                }
                dsModel = dsBll.SelReturnModel(DataConvert.CLng(labelInfo.DataSourceType));
                this.TxtLabelIntro.Text = labelInfo.Desc;//说明
                this.HdnParam.Value = labelInfo.Param;//参数
                RptParam_Bind(labelInfo.Param);//写入参数

                string LabelTable = labelInfo.LabelTable;
                LabelTable = LabelTable.Replace("{table1}.dbo.", dataname + ".dbo.");
                LabelTable = LabelTable.Replace("{table2}.dbo.", dataname2 + ".dbo.");
                this.TxtSqlTable.Text = LabelTable;//表名

                string LabelField = labelInfo.LabelField;
                LabelField = LabelField.Replace("{table1}.dbo.", dataname + ".dbo.");
                LabelField = LabelField.Replace("{table2}.dbo.", dataname2 + ".dbo.");
                this.TxtSqlField.Text = LabelField;//字段

                string LabelWhere = labelInfo.LabelWhere;
                LabelWhere = LabelWhere.Replace("{table1}.dbo.", dataname + ".dbo.");
                LabelWhere = LabelWhere.Replace("{table2}.dbo.", dataname2 + ".dbo.");
                this.TxtSqlWhere.Text = LabelWhere;//条件

                string LabelOrder = labelInfo.LabelOrder;
                LabelOrder = LabelOrder.Replace("{table1}.dbo.", dataname + ".dbo.");
                LabelOrder = LabelOrder.Replace("{table2}.dbo.", dataname2 + ".dbo.");
                this.TxtOrder.Text = LabelOrder;//排序

                this.textContent.Text = labelInfo.Content;//标签内容
                this.TextBox1.Text = labelInfo.LabelCount;//查询数量
                this.RBLType.SelectedValue = labelInfo.LableType.ToString();//标签类型
                //存储过程     
                ProceName_Text.Text = labelInfo.ProceName;
                ProceParam_Text.Text = labelInfo.ProceParam;
                schema_Text.Text = labelInfo.ConnectString;
                #region 存在多个库
                string labeltable = labelInfo.LabelTable;
                string table2 = "";
                string labelfriest = "";

                if (labeltable.IndexOf(" ") > -1)
                {
                    string[] labelarr = labeltable.Split(new string[] { " " }, StringSplitOptions.None);
                    if (labelarr.Length > 0)
                    {
                        labelfriest = labelarr[0];//不存在圆点

                        if (labelfriest.IndexOf(".") == -1)
                        {
                            //labelfriest = dataname + ".dbo." + labelfriest;
                        }

                        if (labeltable.IndexOf(" join ") > -1)
                        {
                            string[] labeljoin = labeltable.Split(new string[] { "join" }, StringSplitOptions.None);
                            if (labeljoin[1].IndexOf(" on ") > -1)
                            {
                                string[] joinlabel = labeljoin[1].Split(new string[] { " on " }, StringSplitOptions.None);
                                table2 = joinlabel[0];//不存在圆点
                                if (table2.IndexOf(".") == -1)
                                {
                                    // table2 = dataname + ".dbo." + table2.Trim();
                                    table2 = table2.Trim();
                                }
                            }
                        }

                        #region 默认选择库
                        //if (labelfriest.IndexOf("{table1}") > -1)//如果选择了多个则是此判断，单个则是下方
                        //{
                        //    DatabaseList.SelectedIndex = 0;
                        //}
                        //if (table2.IndexOf("{table1}") > -1)
                        //{
                        //    DatabaseList2.SelectedIndex = 0;
                        //}
                               
                        DatabaseList.SelectedValue = labelInfo.DataSourceType;
                        DatabaseList2.SelectedValue = labelInfo.DataSourceType;
                        #endregion

                        labelfriest = labelfriest.Replace("{table1}.dbo.", dataname + ".dbo.");
                        table2 = table2.Replace("{table1}.dbo.", dataname + ".dbo.").Trim();

                    }
                }
                else
                {
                    if (labeltable != "")
                    {
                        if (labeltable.IndexOf(".") == -1)
                        {
                            //labeltable = dataname + ".dbo." + labeltable;//这里为其加上Zoomla.6x，如果是一些外部库如Excel则不需要加,这里加不加无所谓了
                        }
                        DatabaseList.SelectedValue = labelInfo.DataSourceType;
                        DatabaseList2.SelectedValue = labelInfo.DataSourceType;
                        labelfriest = labeltable.Replace("{table1}.dbo.", dataname + ".dbo.");
                    }
                }
                //Zoomla6x.dbo.ZL_User:Zoomla6x.dbo.ZL_User 
                tLabel.T1 = labelfriest;//选中的两个表,存入tLabel
                tLabel.T2 = table2;
                ViewState["tLabel"] = tLabel;
                T1 = labelfriest;
                T2 = table2;
                changedbtabledownlist(dsModel);
                #endregion
            }
            else
            {
                changedbtabledownlist(dsModel);
                this.HdnlabelID.Value = "0";
            }

            if (this.Modelvalue.Text == "")
            {
                this.Modelvalue.Text = "0";
            }

            #region 读取判断函数
            if (this.m_LabelName != null && this.m_LabelName != "")
            {
                labelInfo = this.bll.GetLabelXML(this.m_LabelName);
                if (labelInfo.IsOpen == 1)
                {
                    this.boolmodel.Checked = true;
                }
                this.addroot.SelectedValue = labelInfo.addroot;
                this.falsecontent.Text = labelInfo.FalseContent;
                this.Modeltypeinfo.Text = labelInfo.Modeltypeinfo;
                this.Modelvalue.Text = labelInfo.Modelvalue;
                this.setroot.SelectedValue = labelInfo.setroot;
                this.Valueroot.Text = labelInfo.Valueroot;
            }
            #endregion
            //处理表的选中值，本地数据库作下额外处理，使ZL_User与Zlommla6x.dbo.ZL_User同样的效果
            if (!isExternal())
            {
                if (this.T1.IndexOf(".dbo.") < 0) { this.T1 = dataname + ".dbo."+this.T1; }
                if (this.T2.IndexOf(".dbo.") < 0) { this.T2 = dataname + ".dbo."+this.T2; }
            }
                  
            if (this.T1 != "")
            {
                this.DbTableDownList.SelectedValue = this.T1;
            }

            if (this.T2 != "")
            {
                this.DbTableDownList2.SelectedValue = this.T2;
            }

            #region 读取主字段
            if (this.DbTableDownList.SelectedIndex != 0)
            {

                DataTable tabledlist = new DataTable();
                tabledlist = GetTableOrField(dsModel, this.DbTableDownList.SelectedValue, 2);
                tabledlist.DefaultView.Sort = textField + " ASC";
                this.DbFieldDownList.DataSource = tabledlist;
                this.DbFieldDownList.DataTextField = textField;
                this.DbFieldDownList.DataValueField = valueField;
                this.DbFieldDownList.DataBind();
                this.DbFieldDownList.Items.Insert(0, new ListItem("*", "*"));
                if (!isExternal())
                {
                    for (int i = 0; i < this.DbFieldDownList.Items.Count; i++)
                    {
                        DbFieldDownList.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList.SelectedValue, this.DbFieldDownList.Items[i].Text);
                    }
                }
                if (this.DbTableDownList.SelectedIndex != 0)
                {
                    DataTable t1 = null;

                    t1 = GetTableOrField(dsModel, this.DbTableDownList.SelectedValue, 2);
                    this.DbFieldList.DataSource = t1;
                    t1.DefaultView.Sort = textField + " ASC";
                    this.DbFieldList.DataTextField = textField;
                    this.DbFieldList.DataValueField = valueField;
                    this.DbFieldList.DataBind();
                    if (!isExternal())
                    {
                        for (int i = 0; i < DbFieldList.Items.Count; i++)
                        {
                            DbFieldList.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList.SelectedValue, DbFieldList.Items[i].Text);
                        }
                    }
                    this.tj.Visible = true;

                    if (m_LabelName != "")
                    {
                        labelInfo = this.bll.GetLabelXML(this.m_LabelName);
                        string labtletable = labelInfo.LabelTable;

                        if (labtletable.IndexOf("left join") > -1)
                        {
                            Dbtj.SelectedIndex = 0;
                        }

                        if (labtletable.IndexOf("Inner join") > -1)
                        {
                            Dbtj.SelectedIndex = 1;
                        }

                        if (labtletable.IndexOf("outer join") > -1)
                        {
                            Dbtj.SelectedIndex = 2;
                        }

                        if (labtletable.IndexOf("right join") > -1)
                        {
                            Dbtj.SelectedIndex = 3;
                        }

                        if (labtletable != "")
                        {
                            if (labtletable.IndexOf(" on ") > -1)
                            {
                                string[] labelarr = labtletable.Split(new string[] { " on " }, StringSplitOptions.None);
                                string la1 = labelarr[1];
                                if (la1.IndexOf("=") > -1)
                                {
                                    string[] listars = la1.Split(new string[] { "=" }, StringSplitOptions.None);
                                    string a1 = listars[0];
                                    string a2 = listars[1].Trim();
                                    if (a1.IndexOf(".") > -1)
                                    {
                                        string[] b1 = a1.Split(new string[] { "." }, StringSplitOptions.None);
                                        string c1 = b1[b1.Length - 1].ToString();
                                        try
                                        {
                                            DbFieldList.SelectedValue = c1;
                                        }
                                        catch { }
                                    }

                                    if (a2.IndexOf(".") > -1)
                                    {
                                        string[] b2 = a2.Split(new string[] { "." }, StringSplitOptions.None);
                                        string c2 = b2[b2.Length - 1].ToString();
                                        try
                                        {
                                            DbFieldList2.SelectedValue = c2;
                                        }
                                        catch { }
                                    }
                                }
                            }
                        }

                    }
                }
                else
                {
                    this.tj.Visible = false;
                }
            }
            else
            {
                this.DbFieldDownList.Items.Clear();
                this.tj.Visible = false;
            }
            #endregion

            #region 读取从字段
            if (this.DbTableDownList2.SelectedIndex != 0)
            {
                DataTable tt2 = null;
                tt2 = GetTableOrField(dsModel, this.DbTableDownList2.SelectedValue, 2);//获取字段
                tt2.DefaultView.Sort = textField + " ASC";
                this.DbFieldDownList2.DataSource = tt2;
                this.DbFieldDownList2.DataTextField = textField;
                this.DbFieldDownList2.DataValueField = valueField;
                this.DbFieldDownList2.DataBind();
                if (!isExternal())
                {
                    for (int i = 0; i < DbFieldDownList2.Items.Count; i++)
                    {
                        DbFieldDownList2.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList2.SelectedValue, DbFieldDownList2.Items[i].Text);
                    }
                }
                this.DbFieldDownList2.Items.Insert(0, new ListItem("*", "*"));
                //BindOrder(this.DbTableDownList2.SelectedValue,getExternalConnStr());
                if (this.DbTableDownList2.SelectedIndex != 0)
                {
                    tt2 = GetTableOrField(dsModel, this.DbTableDownList2.SelectedValue, 2);//获取字段
                    if (tt2 != null && tt2.Rows.Count > 0)
                        tt2.DefaultView.Sort = textField + " ASC";
                    this.DbFieldList2.DataSource = tt2;
                    this.DbFieldList2.DataTextField = textField;
                    this.DbFieldList2.DataValueField = valueField;
                    this.DbFieldList2.DataBind();//2
                    if (!isExternal())
                    {
                        for (int ii = 0; ii < DbFieldList2.Items.Count; ii++)
                        {
                            DbFieldDownList2.Items[ii].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList2.SelectedValue, DbFieldList2.Items[ii].Text);
                        }
                    }
                    this.tj.Visible = true;
                }
                else
                {
                    this.tj.Visible = false;
                }
            }
            else
            {
                this.DbFieldDownList2.Items.Clear();
                this.tj.Visible = false;
            }
            #endregion

            #region 字段条件
            if (this.m_LabelName != null && this.m_LabelName != "")
            {
                labelInfo = this.bll.GetLabelXML(this.m_LabelName);

                if (labelInfo.LabelWhere.IndexOf("{table") > -1)
                {
                    if (labelInfo.LabelWhere.IndexOf("{table1}.") > -1)
                    {
                        this.DDLFTable.SelectedIndex = 0;
                        DataTable t1 = null;
                        t1 = GetTableOrField(dsModel, this.DbTableDownList.SelectedValue, 2);//获取字段
                        this.DDLTjField.DataSource = t1;
                        t1.DefaultView.Sort = textField + " ASC";
                        this.DDLTjField.DataTextField = textField;
                        this.DDLTjField.DataValueField = valueField;
                        this.DDLTjField.DataBind();
                        //for (int i = 0; i < DbFieldList.Items.Count; i++)
                        //{
                        //    DDLTjField.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList.SelectedValue, DbFieldList.Items[i].Text);
                        //}
                    }

                    if (labelInfo.LabelWhere.IndexOf("{table2}.") > -1)
                    {
                        this.DDLFTable.SelectedIndex = 1;
                        DataTable t1 = null;
                        t1 = GetTableOrField(dsModel, this.DbTableDownList2.SelectedValue, 2);//获取字段

                        this.DDLTjField.DataSource = t1;
                        t1.DefaultView.Sort = textField + " ASC";
                        this.DDLTjField.DataTextField = textField;
                        this.DDLTjField.DataValueField = valueField;
                        this.DDLTjField.DataBind();

                        //for (int i = 0; i < DDLFTable.Items.Count; i++)
                        //{
                        //    DDLTjField.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList2.SelectedValue, DDLFTable.Items[i].Text);
                        //}
                    }
                }
                else
                {
                    DataTable t1 = null;
                    t1 = GetTableOrField(dsModel, this.DbTableDownList.SelectedValue, 2);//获取字段
                    this.DDLTjField.DataSource = t1;
                    t1.DefaultView.Sort = textField + " ASC";
                    this.DDLTjField.DataTextField = textField;
                    this.DDLTjField.DataValueField = valueField;
                    this.DDLTjField.DataBind();
                    this.TxtSqlWhere.Text = labelInfo.LabelWhere;
                    this.DDLFTable.SelectedIndex = 0;
                }
            }
            #endregion
            if (labelInfo.LabelField != "")
            {
                SetLabelColumn(labelInfo.LabelField);//置入标签
            }
            Call.SetBreadCrumb(Master, "<li><a href='" + CustomerPageAction.customPath2 + "Main.aspx'>工作台</a></li><li><a href='" + CustomerPageAction.customPath2 + "Config/SiteInfo.aspx'>系统设置</a></li><li><a href=\"LabelManage.aspx\">标签管理</a></li><li class=\"active\"><a href=\"labelSql.aspx\">" + LabelName.Text + "</a>   <a href=\"../Config/CreateTable.aspx\" id=\"a1\" style=\"color: #1e860b;\">添加新表</a><a href=\"labelSqlOne.aspx?LabelName=" + Request.QueryString["LabelName"] + "\" style=\"color: #1e860b;\">一步式标签编辑器</a></li>" + Call.GetHelp(25));
            BindOrder(this.DbTableDownList.SelectedValue, getExternalConnStr());
        }//PostBackEnd;
        #region 字段注释
        if (!isExternal())
        {
            for (int i = 0; i < DbFieldDownList.Items.Count; i++)
            {
                DbFieldDownList.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList.SelectedValue, DbFieldDownList.Items[i].Text);
            }

            for (int i = 0; i < DbFieldDownList2.Items.Count; i++)
            {
                DbFieldDownList2.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList2.SelectedValue, DbFieldDownList2.Items[i].Text);
            }
        }
        #endregion


        #region 使用判断函数
        if (boolmodel.Checked == true)
        {
            this.isbool.Visible = true;
            this.Label8.Visible = true;
            this.s1.Visible = true;
            this.s2.Visible = true;

            switch (Modeltypeinfo.SelectedValue)
            {
                case "计数判断":
                    this.addroot.Visible = true;
                    this.Valueroot.Visible = false;
                    this.setroot.Visible = true;
                    this.Modelvalue.Visible = true;
                    this.Label3.Visible = true;
                    if (this.addroot.SelectedValue == "循环计算")
                    {
                        this.Label3.Text = "计数器达到条件将自动清零,仅限包含<font color=blue>循环标签</font>有效";
                    }
                    else if (this.addroot.SelectedValue == "一直累加,仅限包含<font color=blue>循环标签</font>有效")
                    {
                        this.Label3.Text = "计数器一直累加";
                    }
                    break;
                case "用户登录判断":
                    this.addroot.Visible = false;
                    this.Valueroot.Visible = false;
                    this.setroot.Visible = false;
                    this.Modelvalue.Visible = false;
                    this.Label3.Text = "判断用户是否登录";
                    break;
                case "参数判断":
                    this.addroot.Visible = false;
                    this.Valueroot.Visible = true;
                    this.setroot.Visible = true;
                    this.Modelvalue.Visible = true;
                    this.Label3.Text = "判断参数是否满足条件";
                    break;
            }
        }
        else
        {
            this.Label8.Visible = false;
            this.s1.Visible = false;
            this.s2.Visible = false;
            this.isbool.Visible = false;
        }
        #endregion

        //----第三步时调用,给从表主表，从库主库的选择
        txt_DbTableDownList = DbTableDownList.SelectedValue;//主表
        txt_DbTableDownList2 = DbTableDownList2.SelectedValue;//从表
        txt_DatabaseList = DatabaseList.SelectedValue;//主库名
        txt_DatabaseList2 = DatabaseList2.SelectedValue;//从库名
        #endregion
    }

    // 绑定数据表下拉控件
    private void changedbtabledownlist(M_DataSource dsModel)
    {
        ListItem item = new ListItem();//址引用，必须不同，否则会认为一个下拉表，同时选择多个值.
        item.Text = "选择一个数据表";
        item.Value = "";
        ListItem item1 = new ListItem();
        item1.Text = "选择一个数据表";
        item1.Value = "";
        //---------只能同时选一个数据库，下拉菜单中数据相同
        DataTable listtable = GetTableOrField(dsModel, "", 1);
        this.DropLabelType.Items.Insert(0, new ListItem("选择标签分类", ""));
        if (listtable != null && listtable.Rows.Count > 0)
            listtable.DefaultView.Sort = textTable + " ASC";
        this.DbTableDownList.DataSource = listtable.DefaultView;
        this.DbTableDownList.DataTextField = textTable;
        this.DbTableDownList.DataValueField = valueTable;
        this.DbTableDownList.DataBind();
        this.DbTableDownList.Items.Insert(0, item);
        BindOptiontitle(listtable, DbTableDownList);//绑定注释

        this.DbTableDownList2.DataSource = listtable;
        this.DbTableDownList2.DataTextField = textTable;
        this.DbTableDownList2.DataValueField = valueTable;
        this.DbTableDownList2.DataBind();
        this.DbTableDownList2.Items.Insert(0, item1);
        BindOptiontitle(listtable, DbTableDownList2);
    }
    // 绑定表名注释
    private void BindOptiontitle(DataTable listtable, DropDownList DbTableDownListslist)
    {
        for (int i = 0; i < DbTableDownListslist.Items.Count; i++)
        {
            string itemtitle = "";
            string itemtitlestr = DbTableDownListslist.Items[i].Text;

            if (itemtitlestr.IndexOf("ZL_AddRessList") >= 0)
            {
                itemtitle = "广告";
            }
            else if (itemtitlestr.IndexOf("ZL_Advertisement") >= 0)
            {
                itemtitle = "广告内容表";
            }
            else if (itemtitlestr.IndexOf("ZL_AdZone") >= 0)
            {
                itemtitle = "广告版位表";
            }
            else if (itemtitlestr.IndexOf("ZL_Answer") >= 0)
            {
                itemtitle = "问卷调查表";
            }
            else if (itemtitlestr.IndexOf("ZL_Answer_Recode") >= 0)
            {
                itemtitle = "问卷回答表";
            }
            else if (itemtitlestr.IndexOf("ZL_Author") >= 0)
            {
                itemtitle = "说明：作者表，存储作者信息";
            }
            else if (itemtitlestr.IndexOf("ZL_Bbscate") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Bbstips") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_BindPro") >= 0)
            {
                itemtitle = "绑定商品销售表";
            }
            else if (itemtitlestr.IndexOf("ZL_CallNote") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Card") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Cart") >= 0)
            {
                itemtitle = "购物车";
            }
            else if (itemtitlestr.IndexOf("ZL_CartPro") >= 0)
            {
                itemtitle = "购物车详细列表";
            }
            else if (itemtitlestr.IndexOf("ZL_ClassRoom") >= 0)
            {
                itemtitle = "班级";
            }
            else if (itemtitlestr.IndexOf("ZL_ClientRequire") >= 0)
            {
                itemtitle = "说明：客户需求表";
            }
            else if (itemtitlestr.IndexOf("ZL_Comment") >= 0)
            {
                itemtitle = "说明：评论 信息表发表的评论";
            }
            else if (itemtitlestr.IndexOf("ZL_Commodities") >= 0)
            {
                itemtitle = "商品表";
            }
            else if (itemtitlestr.IndexOf("ZL_CommonModel") >= 0)
            {
                itemtitle = "内容表";
            }
            else if (itemtitlestr.IndexOf("ZL_CompanyResume") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ContentHis") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Correct") >= 0)
            {
                itemtitle = "说明：纠错反馈信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_Datadic") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Datadiccategory") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Delivier") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_DownServer") >= 0)
            {
                itemtitle = "说明：镜像服务器表";
            }
            else if (itemtitlestr.IndexOf("ZL_Examinee") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Favorite") >= 0)
            {
                itemtitle = "收藏夹";
            }
            else if (itemtitlestr.IndexOf("ZL_Grade") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_GradeCate") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Group") >= 0)
            {
                itemtitle = "用户组";
            }
            else if (itemtitlestr.IndexOf("ZL_GroupFieldPermissions") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_GroupModel") >= 0)
            {
                itemtitle = "会员模型";
            }
            else if (itemtitlestr.IndexOf("ZL_Guestbook") >= 0)
            {
                itemtitle = "留言本";
            }
            else if (itemtitlestr.IndexOf("ZL_Guestcate") >= 0)
            {
                itemtitle = "留言类别";
            }
            else if (itemtitlestr.IndexOf("ZL_Interlocution") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_JSTemplate") >= 0)
            {
                itemtitle = "说明：广告模板脚本表";
            }
            else if (itemtitlestr.IndexOf("ZL_Keywords") >= 0)
            {
                itemtitle = "说明：关键字表";
            }
            else if (itemtitlestr.IndexOf("ZL_Label") >= 0)
            {
                itemtitle = "标签表";
            }
            else if (itemtitlestr.IndexOf("ZL_Log") >= 0)
            {
                itemtitle = "日志表";
            }
            else if (itemtitlestr.IndexOf("ZL_MailIdiograph") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_MailInfo") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_MailManage") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Manager") >= 0)
            {
                itemtitle = "管理员表";
            }
            else if (itemtitlestr.IndexOf("ZL_Manufacturers") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Message") >= 0)
            {
                itemtitle = "说明：短消息表 存储短消息";
            }
            else if (itemtitlestr.IndexOf("ZL_Model") >= 0)
            {
                itemtitle = "模型信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_ModelField") >= 0)
            {
                itemtitle = "模型字段表";
            }
            else if (itemtitlestr.IndexOf("ZL_Node") >= 0)
            {
                itemtitle = "节点表";
            }
            else if (itemtitlestr.IndexOf("ZL_Node_ModelTemplate") >= 0)
            {
                itemtitle = "说明：关键字表";
            }
            else if (itemtitlestr.IndexOf("ZL_Online") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Orderinfo") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_PageStyle") >= 0)
            {
                itemtitle = "黄页注册样式表";
            }
            else if (itemtitlestr.IndexOf("ZL_PageTemplate") >= 0)
            {
                itemtitle = "黄页栏目样式表";
            }
            else if (itemtitlestr.IndexOf("ZL_Payment") >= 0)
            {
                itemtitle = "支付信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_PayPlat") >= 0)
            {
                itemtitle = "支付接口表";
            }
            else if (itemtitlestr.IndexOf("ZL_Permission") >= 0)
            {
                itemtitle = "用户权限表";
            }
            else if (itemtitlestr.IndexOf("ZL_PointTrans") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Present") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Project") >= 0)
            {
                itemtitle = "说明：需求项目表";
            }
            else if (itemtitlestr.IndexOf("ZL_ProjectAffairs") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ProjectCategory") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ProjectDiscuss") >= 0)
            {
                itemtitle = "说明：项目执行讨论表";
            }
            else if (itemtitlestr.IndexOf("ZL_ProjectField") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ProjectWork") >= 0)
            {
                itemtitle = "说明：项目节点表";
            }
            else if (itemtitlestr.IndexOf("ZL_Promotions") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Pub") >= 0)
            {
                itemtitle = "互动信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_Question") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ReadResume") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Result") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Role") >= 0)
            {
                itemtitle = "管理员角色";
            }
            else if (itemtitlestr.IndexOf("ZL_RolePermissions") >= 0)
            {
                itemtitle = "管理员角色权限";
            }
            else if (itemtitlestr.IndexOf("ZL_RoomActive") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_RoomActiveJoin") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_RoomMessage") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_RoomNotify") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_RoomUpFile") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Scheme") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_SchemeInfo") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_School") >= 0)
            {
                itemtitle = "学校";
            }
            else if (itemtitlestr.IndexOf("ZL_ShopBrand") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ShopCommentary") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ShopCompete") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Shopconfig") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ShopGrade") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ShopLable") >= 0)
            {
                itemtitle = "店铺标签";
            }
            else if (itemtitlestr.IndexOf("ZL_ShopNodeinfo") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Shopsearch") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_Active") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_ActiveJoin") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_ActivePic") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_ActiveType") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_BlogStyleTable") >= 0)
            {
                itemtitle = "说明：SNS模板设置表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_blogTable") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_BookTable") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_CarConfig") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_Carlist") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_CarLog") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_ChatLog") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_CollectTable") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_CommendCommentOn") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_CommentAll") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_FileShare") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_GatherStrain") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_GroupPicCateg") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_GSHuatee") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_GSReverCricicism") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_GSRoom") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_GSType") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_HomeCollocate") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_HomeHeadCollocate") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_Log") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_LogCriticism") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_LotMessage") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_LotNote") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_Memo") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_Messageboard") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_MyCar") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_MyPose") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_PicCateg") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_PicCritique") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_PicTure") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_ProductTable") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_ProductTypetable") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_ReplayLog") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_Report") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_SystemBannerTable") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_SystemLog") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_User_R_GS") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_User_R_Module") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_UserLog") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_UserLogType") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_UserMoreinfo") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Sns_UserShopProduct") >= 0)
            {
                itemtitle = "SNS信息类表";
            }
            else if (itemtitlestr.IndexOf("ZL_Source") >= 0)
            {
                itemtitle = "说明：来源表";
            }
            else if (itemtitlestr.IndexOf("ZL_SpecCate") >= 0)
            {
                itemtitle = "说明：专题类别表 存储专题类别信息";
            }
            else if (itemtitlestr.IndexOf("ZL_Special") >= 0)
            {
                itemtitle = "说明：专题表";
            }
            else if (itemtitlestr.IndexOf("ZL_SpecInfo") >= 0)
            {
                itemtitle = "说明：专题信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_Stock") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_StoreStyleTable") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Student") >= 0)
            {
                itemtitle = "学生信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_Subscribe") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_Survey") >= 0)
            {
                itemtitle = "问卷调查表";
            }
            else if (itemtitlestr.IndexOf("ZL_Trademark") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_URLRewriter") >= 0)
            {
                itemtitle = "URL转发重写表";
            }
            else if (itemtitlestr.IndexOf("ZL_User") >= 0)
            {
                itemtitle = "会员信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_UserAlipayTable") >= 0)
            {
                itemtitle = "支付宝信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_UserBase") >= 0)
            {
                itemtitle = "会员扩展信息表";
            }
            else if (itemtitlestr.IndexOf("ZL_UserCart") >= 0)
            {
                itemtitle = "购物车表";
            }
            else if (itemtitlestr.IndexOf("ZL_UserCartPro") >= 0)
            {
                itemtitle = "购物车商品表";
            }
            else if (itemtitlestr.IndexOf("ZL_UserExpDomP") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_UserExpHis") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_UserFriendGroup") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_UserFriendTable") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_UserOrderinfo") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_UserShop") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_UserStock") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_UserStoreTable") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_UserStoreTypeTable") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_ValidityPeriod") >= 0)
            {
                itemtitle = "";
            }
            else if (itemtitlestr.IndexOf("ZL_WorkRole") >= 0)
            {
                itemtitle = "说明：项目执行角色表";
            }
            else if (itemtitlestr.IndexOf("ZL_Zone_Advertisement") >= 0)
            {
                itemtitle = "说明：广告版位表";
            }
            else if (itemtitlestr.IndexOf("ZL_C_") >= 0)
            {
                itemtitle = "内容模型";
            }
            else if (itemtitlestr.IndexOf("ZL_P_") >= 0)
            {
                itemtitle = "商品模型";
            }
            else if (itemtitlestr.IndexOf("ZL_Page_") >= 0)
            {
                itemtitle = "黄页模型";
            }
            else if (itemtitlestr.IndexOf("ZL_U_") >= 0)
            {
                itemtitle = "会员模型";
            }
            else if (itemtitlestr.IndexOf("ZL_Pub_") >= 0)
            {
                itemtitle = "互动模型";
            }
            else if (itemtitlestr.IndexOf("ZL_S_") >= 0)
            {
                itemtitle = "店铺商品模型";
            }
            else if (itemtitlestr.IndexOf("ZL_Store_") >= 0)
            {
                itemtitle = "店铺申请模型";
            }
            if (itemtitle == "")
            {
                itemtitle = "未知";
            }

            DbTableDownListslist.Items[i].Attributes["title"] = itemtitle;
            itemtitle = "";
        }
    }
    // 主表更换事件
    protected void TableDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DatabaseList.SelectedValue == "addNewDataBase")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "w", "location='DSManage.aspx';", true);
            return;
        }
        dsModel = dsBll.SelReturnModel(DataConvert.CLng(DatabaseList.SelectedValue));//以第一张表选定的值为准
        if (dsModel!=null&&dsModel.IsXml)
        {
            DatabaseList2.Enabled = false;
            DbTableDownList2.Enabled = false;
        }
        else 
        {
            DatabaseList2.Enabled = true;
            DbTableDownList2.Enabled = true;
        }

        DbFieldDownList.Items.Clear();//清除字段列表
        DbFieldDownList2.Items.Clear();
        ListItem item = new ListItem();
            
        string connStr = getExternalConnStr();//获取连接字符串
        //判断类型，调用不同连接获取表信息
        DataTable tableList = GetTableOrField(dsModel, "", 1);
         
        try
        {
            if (tableList != null && tableList.Rows.Count > 0)
                tableList.DefaultView.Sort = textTable+" ASC ";

            this.DbTableDownList.DataSource = tableList.DefaultView;
            this.DbTableDownList.DataTextField = textTable;
            this.DbTableDownList.DataValueField = valueTable;
            this.DbTableDownList.DataBind();
            item.Text = "选择一个数据表";
            this.DbTableDownList.Items.Insert(0, item);
            //从表绑定数据
            this.DatabaseList2.SelectedItem.Text = this.DatabaseList.SelectedItem.Text;
            this.DbTableDownList2.DataSource = tableList.DefaultView;
            this.DbTableDownList2.DataTextField = textTable;
            this.DbTableDownList2.DataValueField = valueTable;
            this.DbTableDownList2.DataBind();
            this.DbTableDownList2.Items.Insert(0, item);
        }
        catch
        {
            DbTableDownList.Items.Clear();
            item.Text = "无法正常连接";
            this.DbTableDownList.Items.Insert(0, item);
        }
    }//数据库选择
    // 主表选择事件
    protected void DBTableDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string connStr =getExternalConnStr();
        dsModel = dsBll.SelReturnModel(DataConvert.CLng(DatabaseList.SelectedValue));
        //try
        //{
            if (this.DbTableDownList.SelectedIndex != 0)
            {
                DataTable fieldList = GetTableOrField(dsModel, this.DbTableDownList.SelectedValue, 2);
                fieldList.DefaultView.Sort = textField + " ASC";
                this.DbFieldDownList.DataSource = fieldList;
                this.DbFieldDownList.DataTextField = textField;
                this.DbFieldDownList.DataValueField = valueField;
                this.DbFieldDownList.DataBind();
                this.DbFieldDownList.Items.Insert(0, new ListItem("*", "*"));
                //test.dbo.ZL_Author:::Address ,表名，字段名
                if (!isExternal())
                {
                    for (int i = 0; i < this.DbFieldDownList.Items.Count; i++)
                    {
                        DbFieldDownList.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList.SelectedValue, this.DbFieldDownList.Items[i].Text);
                    }
                }
                this.TxtSqlTable.Text = this.DbTableDownList.SelectedValue;
                BindTj(connStr);
                BindOrder(this.DbTableDownList.SelectedValue,connStr);
            if (this.DbTableDownList2.SelectedIndex != 0)
            {
                DataTable t1 = new DataTable(),t2=new DataTable();
                t1 = GetTableOrField(dsModel, this.DbTableDownList.SelectedValue,2);
                this.DbFieldList.DataSource = t1;
                t1.DefaultView.Sort = textField + " ASC";
                this.DbFieldList.DataTextField = textField;
                this.DbFieldList.DataValueField = valueField;
                this.DbFieldList.DataBind();
                if (!isExternal())
                {
                    for (int i = 0; i < DbFieldList.Items.Count; i++)
                    {
                        DbFieldList.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList.SelectedValue, DbFieldList.Items[i].Text);
                    }
                }
                t2 = GetTableOrField(dsModel, this.DbTableDownList2.SelectedValue, 2);
                this.DbFieldList2.DataSource = t2;
                t2.DefaultView.Sort = textField + " ASC";
                this.DbFieldList2.DataTextField = textField;
                this.DbFieldList2.DataValueField = valueField;
                this.DbFieldList2.DataBind();
                if (!isExternal())
                {
                    for (int i = 0; i < DbFieldList2.Items.Count; i++)
                    {
                        DbFieldList2.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList2.SelectedValue, DbFieldList2.Items[i].Text);
                    }
                }
                this.tj.Visible = true;

                TableJoin1();
                if (m_LabelName != "")
                {
                    labelInfo = this.bll.GetLabelXML(this.m_LabelName);
                    string labtletable = labelInfo.LabelTable;

                    if (labtletable.IndexOf("left join") > -1)
                    {
                        Dbtj.SelectedIndex = 0;
                    }

                    if (labtletable.IndexOf("Inner join") > -1)
                    {
                        Dbtj.SelectedIndex = 1;
                    }

                    if (labtletable.IndexOf("outer join") > -1)
                    {
                        Dbtj.SelectedIndex = 2;
                    }

                    if (labtletable.IndexOf("right join") > -1)
                    {
                        Dbtj.SelectedIndex = 3;
                    }

                    if (labtletable != "")
                    {
                        if (labtletable.IndexOf(" on ") > -1)
                        {
                            string[] labelarr = labtletable.Split(new string[] { " on " }, StringSplitOptions.None);
                            string la1 = labelarr[1];
                            if (la1.IndexOf("=") > -1)
                            {
                                string[] listars = la1.Split(new string[] { "=" }, StringSplitOptions.None);
                                string a1 = listars[0];
                                string a2 = listars[1].Trim();
                                if (a1.IndexOf(".") > -1)
                                {
                                    string[] b1 = a1.Split(new string[] { "." }, StringSplitOptions.None);
                                    string c1 = b1[b1.Length - 1].ToString();
                                    try
                                    {
                                        DbFieldList.SelectedValue = c1;
                                    }
                                    catch { }
                                }

                                if (a2.IndexOf(".") > -1)
                                {
                                    string[] b2 = a2.Split(new string[] { "." }, StringSplitOptions.None);
                                    string c2 = b2[b2.Length - 1].ToString();
                                    try
                                    {
                                        DbFieldList2.SelectedValue = c2;
                                    }
                                    catch { }
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                this.tj.Visible = false;
            }
            }
            else
            {
                this.DbFieldDownList.Items.Clear();
                if (this.DbTableDownList2.SelectedIndex != 0)
                {
                    this.TxtSqlTable.Text = this.DbTableDownList2.SelectedValue;
                }
                else
                {
                    this.TxtSqlTable.Text = "";
                }
                this.tj.Visible = false;
            }
        //}
        //catch(Exception ex) { function.WriteErrMsg(ex.Message+":::"+connStr); }
    }
    // 从表选择事件,刷新重新绑定1表2表
    protected void DBTableDownList2_SelectedIndexChanged(object sender, EventArgs e)//从表选择
    {
        string connStr = getExternalConnStr();
        dsModel = dsBll.SelReturnModel(DataConvert.CLng(DatabaseList.SelectedValue));
        if (this.DbTableDownList2.SelectedIndex != 0)
        {
            //test.dbo.ZL_ComponentPlatform 
            DataTable fieldList = GetTableOrField(dsModel, this.DbTableDownList2.SelectedValue, 2);//必须执行
            fieldList.DefaultView.Sort = textField+" ASC";
            this.DbFieldDownList2.DataSource = fieldList;
            this.DbFieldDownList2.DataTextField = textField;
            this.DbFieldDownList2.DataValueField = valueField;
            this.DbFieldDownList2.DataBind();

            if (!isExternal()) //如果是外部库，则不注释
            {
                //给字段Title提示
                for (int i = 0; i < DbFieldDownList2.Items.Count; i++)
                {
                    DbFieldDownList2.Items[i].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList2.SelectedValue, DbFieldDownList2.Items[i].Text);
                }
            }
            this.DbFieldDownList2.Items.Insert(0, new ListItem("*", "*"));
            BindTj(connStr);
            //BindOrder(this.DbTableDownList2.SelectedValue,connStr);

            if (this.DbTableDownList.SelectedIndex != 0)
            {
                //DataTable ttt1 = this.bll.GetTableField(this.DbTableDownList.SelectedValue, connStr);
                DataTable ttt1 = GetTableOrField(dsModel, this.DbTableDownList.SelectedValue, 2);
                ttt1.DefaultView.Sort = textField+" ASC";
                this.DbFieldList.DataSource = ttt1;
                this.DbFieldList.DataTextField = textField;
                this.DbFieldList.DataValueField = valueField;
                this.DbFieldList.DataBind();
                if (!isExternal()) //如果是外部库，则不注释
                {
                    for (int ii = 0; ii < DbFieldList.Items.Count; ii++)
                    {
                        DbFieldList.Items[ii].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList.SelectedValue, DbFieldList.Items[ii].Text);
                    }
                }
                // DataTable ttt2 = this.bll.GetTableField(this.DbTableDownList2.SelectedValue, connStr);
                DataTable ttt2 = GetTableOrField(dsModel, this.DbTableDownList2.SelectedValue, 2);
                ttt2.DefaultView.Sort = textField + " ASC";
                this.DbFieldList2.DataSource = ttt2;
                this.DbFieldList2.DataTextField = textField;
                this.DbFieldList2.DataValueField = valueField;
                this.DbFieldList2.DataBind();
                if (!isExternal()) //如果是外部库，则不注释
                {
                    for (int ii = 0; ii < DbFieldList2.Items.Count; ii++)
                    {
                        DbFieldDownList2.Items[ii].Attributes["title"] = bll.GetTablecolumn(this.DbTableDownList2.SelectedValue, DbFieldList2.Items[ii].Text);
                    }
                }
                this.tj.Visible = true;
                TableJoin1();
            }
            else
            {
                this.tj.Visible = false;
                this.TxtSqlTable.Text = this.DbTableDownList2.SelectedValue;
            }
        }
        else
        {
            this.DbFieldDownList2.Items.Clear();
            if (this.DbTableDownList.SelectedIndex != 0)
            {
                this.TxtSqlTable.Text = this.DbTableDownList.SelectedValue;
            }
            else
            {
                this.TxtSqlTable.Text = "";
            }
            this.tj.Visible = false;
        }
    }  
    // 添加参数
    protected void BtnAddParam_Click(object sender, EventArgs e)
    {
        if (this.TxtParamName.Text.ToLower() == "id")
        {
            //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('" + this.TxtParamName.Text + "为保留参数，不能添加此参数，请输入其他参数!');", true);
            function.WriteErrMsg(this.TxtParamName.Text + "为保留参数，不能添加此参数，请输入其他参数!");
        }
        else
        {
            string Param = this.HdnParam.Value;
            string strParam = this.TxtParamName.Text + "," + this.TxtParamValue.Text + "," + this.DDLParamType.SelectedValue + "," + this.TxtParamDesc.Text;
            if (!string.IsNullOrEmpty(this.HdnTempParam.Value))
            {
                Param = Param.Replace(this.HdnTempParam.Value, strParam);
            }
            else
            {
                if (!string.IsNullOrEmpty(Param))
                {
                    Param = Param + "|" + strParam;
                }
                else
                {
                    Param = strParam;
                }
            }
            this.HdnParam.Value = Param;
            this.HdnTempParam.Value = "";
            this.TxtParamName.Text = "";
            this.TxtParamValue.Text = "";
            this.DDLParamType.SelectedValue = "1";
            this.TxtParamDesc.Text = "";
            RptParam_Bind(Param);
            BtnAddParam.Text = "添加";
        }
    }
    // 写入参数
    private void RptParam_Bind(string Param)
    {
        DataTable paramTb = new DataTable("labelparam");
        DataColumn myDataColumn;
        DataRow myDataRow;
        this.attlist.Text = "";
        this.attlist1.Text = "";
        myDataColumn = new DataColumn();
        myDataColumn.DataType = System.Type.GetType("System.String");
        myDataColumn.ColumnName = "ParamName";
        paramTb.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = System.Type.GetType("System.String");
        myDataColumn.ColumnName = "ParamValue";
        paramTb.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = System.Type.GetType("System.String");
        myDataColumn.ColumnName = "ParamType";
        paramTb.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = System.Type.GetType("System.String");
        myDataColumn.ColumnName = "ParamDesc";
        paramTb.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = System.Type.GetType("System.String");
        myDataColumn.ColumnName = "Param";
        paramTb.Columns.Add(myDataColumn);
        if (!string.IsNullOrEmpty(Param))
        {
            string[] arrParam = Param.Split('|');
            for (int i = 0; i < arrParam.Length; i++)
            {
                myDataRow = paramTb.NewRow();
                myDataRow["ParamName"] = arrParam[i].Split(',')[0];
                myDataRow["ParamValue"] = arrParam[i].Split(',')[1];
                myDataRow["ParamType"] = arrParam[i].Split(',')[2];
                myDataRow["ParamDesc"] = arrParam[i].Split(',')[3];
                myDataRow["Param"] = arrParam[i];
                paramTb.Rows.Add(myDataRow);
                this.attlist.Text = this.attlist.Text + "<div class='spanfixdiv1' draggable='true' ondragstart='pdrag(event);'  code=\"" + "@" + arrParam[i].Split(',')[0] + "\">" + "@" + arrParam[i].Split(',')[0] + "</div>";
                this.attlist1.Text = this.attlist1.Text + "<div class='spanfixdiv1' draggable='true' ondragstart='pdrag(event);' code=\"" + "@" + arrParam[i].Split(',')[0] + "\">" + "@" + arrParam[i].Split(',')[0] + "</div>";
            }
        }
        this.repParam.DataSource = paramTb;
        this.repParam.DataBind();

    }
    // repeater 操作
    protected void repParam_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            BtnAddParam.Text = "修改";
            this.HdnTempParam.Value = e.CommandArgument.ToString();
            this.TxtParamName.Text = this.HdnTempParam.Value.Split(',')[0];
            this.TxtParamValue.Text = this.HdnTempParam.Value.Split(',')[1];
            this.DDLParamType.SelectedValue = this.HdnTempParam.Value.Split(',')[2];
            this.TxtParamDesc.Text = this.HdnTempParam.Value.Split(',')[3];
        }
        if (e.CommandName == "Del")
        {
            string sParam = e.CommandArgument.ToString();
            string ParamValue = this.HdnParam.Value;
            if (ParamValue == sParam)
            {
                ParamValue = "";
            }
            else
            {
                if (ParamValue.IndexOf(sParam) > 0)
                    ParamValue = ParamValue.Replace("|" + sParam, "");
                else
                    ParamValue = ParamValue.Replace(sParam + "|", "");
            }
            this.HdnParam.Value = ParamValue;
            RptParam_Bind(ParamValue);
        }
    }
    // 保存标签
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (this.TxtSqlTable.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('查询表不能为空!');", true);
        }
        else
        {
            if (this.Page.IsValid)
            {
                M_Label LabelInfo = new M_Label();
                LabelInfo.LabelID = DataConverter.CLng(this.HdnlabelID.Value);
                LabelInfo.LableName = this.TxtLabelName.Text;
                M_Label Info = this.bll.GetLabelXML(this.m_LabelName);
                if (Info.LableName.ToString() != this.TxtLabelName.Text)
                {
                    this.bll.CheckLabelXML(this.TxtLabelName.Text);
                }
                LabelInfo.LableType = DataConverter.CLng(this.RBLType.SelectedValue);
                LabelInfo.LabelCate = this.TxtLabelType.Text;
                LabelInfo.Desc = this.TxtLabelIntro.Text;
                LabelInfo.Param = this.HdnParam.Value;

                string TxtSqlTable = this.TxtSqlTable.Text;
                TxtSqlTable = TxtSqlTable.Replace(this.dataname + ".dbo.", "{table1}.dbo.");
                TxtSqlTable = TxtSqlTable.Replace(this.dataname2 + ".dbo.", "{table2}.dbo.");
                LabelInfo.LabelTable = TxtSqlTable;

                string TxtSqlField = this.TxtSqlField.Text.Trim();
                TxtSqlField = TxtSqlField.Replace(this.dataname + ".dbo.", "{table1}.dbo.");
                TxtSqlField = TxtSqlField.Replace(this.dataname2 + ".dbo.", "{table2}.dbo.");
                LabelInfo.LabelField = string.IsNullOrEmpty(TxtSqlField)?"*":TxtSqlField;

                string LabelWhere = this.TxtSqlWhere.Text;
                LabelWhere = LabelWhere.Replace(this.dataname + ".dbo.", "{table1}.dbo.");
                LabelWhere = LabelWhere.Replace(this.dataname2 + ".dbo.", "{table2}.dbo.");
                LabelInfo.LabelWhere = LabelWhere;

                string LabelOrder = this.TxtOrder.Text;
                LabelOrder = LabelOrder.Replace(this.dataname + ".dbo.", "{table1}.dbo.");
                LabelOrder = LabelOrder.Replace(this.dataname2 + ".dbo.", "{table2}.dbo.");
                LabelInfo.LabelOrder = LabelOrder;//

                LabelInfo.Content = this.textContent.Text;

                if (string.IsNullOrEmpty(this.TextBox1.Text))
                {
                    LabelInfo.LabelCount = "0";
                }
                else
                {
                    LabelInfo.LabelCount = this.TextBox1.Text;
                }

                if (LabelInfo.LabelID > 0)
                {
                    int Rlabelid = LabelInfo.LabelID;
                    if (Rlabelid > 0)
                    {
                        LabelInfo.LabelID = Rlabelid;
                        LabelInfo.Modeltypeinfo = this.Modeltypeinfo.Text;
                        LabelInfo.Modelvalue = this.Modelvalue.Text;
                        LabelInfo.setroot = this.setroot.SelectedValue;
                        if (this.Valueroot.Text == "这里放入标签")
                        {
                            LabelInfo.Valueroot = "";
                        }
                        else
                        {
                            LabelInfo.Valueroot = this.Valueroot.Text;
                        }
                        LabelInfo.FalseContent = this.falsecontent.Text;
                        LabelInfo.addroot = this.addroot.SelectedValue;
                        LabelInfo.IsOpen = this.boolmodel.Checked ? 1 : 0;
                    }
                    //外部库连接信息(改为修改ID),重要大小写,有labelinfo和LabelInfo
                    DropDownList dr = (DropDownList)WizardStep2.FindControl("DatabaseList");
                    LabelInfo.DataSourceType = dr.SelectedValue;//所属数据源ID,本地是0不处理
                    LabelInfo.ProceName = ProceName_Text.Text;
                    LabelInfo.ProceParam = ProceParam_Text.Text;
                    LabelInfo.ConnectString = schema_Text.Text;
                    this.bll.UpdateLabelXML(LabelInfo);
                    function.WriteMsgTime("修改成功", "LabelManage.aspx");
                }
                else
                {
                    LabelInfo.LabelNodeID = 0;
                    LabelInfo.Modeltypeinfo = this.Modeltypeinfo.Text;
                    LabelInfo.Modelvalue = this.Modelvalue.Text;
                    LabelInfo.setroot = this.setroot.SelectedValue;
                    LabelInfo.Valueroot = this.Valueroot.Text;
                    LabelInfo.IsOpen = this.boolmodel.Checked ? 1 : 0;
                    LabelInfo.FalseContent = this.falsecontent.Text;
                    LabelInfo.addroot = this.addroot.SelectedValue;
                    LabelInfo.ProceName = ProceName_Text.Text;
                    LabelInfo.ProceParam = ProceParam_Text.Text;
                    LabelInfo.ConnectString = schema_Text.Text;
                    DropDownList dr = (DropDownList)WizardStep2.FindControl("DatabaseList");
                    LabelInfo.DataSourceType = dr.SelectedValue;//所属数据源ID,本地是0不处理
                    this.bll.AddLabelXML(LabelInfo);
                    function.WriteMsgTime("添加成功", "LabelManage.aspx");
                }
            }
        }
    }
    // 主从表连接
    protected void TableJoin(object sender, EventArgs e)
    {
        TableJoin1();
    }
    // 生成语句
    private void TableJoin1()
    {
        string Table1 = this.DbTableDownList.SelectedValue;
        string Table2 = this.DbTableDownList2.SelectedValue;
        string Field1 = this.DbFieldList.SelectedValue;
        string Field2 = this.DbFieldList2.SelectedValue;
        string joinStr = Table1 + "." + Field1 + "=" + Table2 + "." + Field2;
        string TableStr = this.DbTableDownList.SelectedValue + " " + this.Dbtj.SelectedValue + " " + this.DbTableDownList2.SelectedValue;
        TableStr = TableStr + " on " + joinStr;
        this.TxtSqlTable.Text = TableStr;
    }
    // 查询条件绑定字段
    protected void BindTableField(object sender, EventArgs e)
    {
        string DataName = "";
        string connStr = getExternalConnStr();
        DropDownList datalist = (DropDownList)WizardStep2.FindControl("DatabaseList");
        DropDownList datalist2 = (DropDownList)WizardStep2.FindControl("DatabaseList2");

        DropDownList tabledownlist = (DropDownList)WizardStep2.FindControl("DbTableDownList");
        DropDownList tabledownlist2 = (DropDownList)WizardStep2.FindControl("DbTableDownList2");

        if (DDLFTable.SelectedIndex == 0)//主表
        {
            if (this.DbTableDownList.SelectedIndex != 0)//数据库下拉菜单
            {
                DataName = datalist.SelectedValue;
            }
        }
        else
        {
            if (tabledownlist2.SelectedIndex != 0)
            {
                DataName = datalist2.SelectedValue;
            }
        }
        this.BindTj(connStr);
    }
    // 绑定查询条件
    private void BindTj(string connStr)
    {
        string TableName = "";
        DataTable ddd1 = new DataTable();
        dsModel = dsBll.SelReturnModel(DataConvert.CLng(DatabaseList.SelectedValue));
        if (this.DDLFTable.SelectedIndex == 0)
        {
            if (this.DbTableDownList.SelectedIndex != 0)
            {
                TableName = txt_DbTableDownList;
            }
        }
        else
        {
            if (this.DbTableDownList2.SelectedIndex != 0)
            {
                TableName = txt_DbTableDownList2;
            }
        }
        if (!string.IsNullOrEmpty(TableName))
        {
            this.DDLTjField.Items.Clear();
            //ddd1 = this.bll.GetTableField(TableName,connStr);//Old Disuse
            ddd1 = GetTableOrField(dsModel,TableName,2);
            ddd1.DefaultView.Sort = textField+" ASC";
            this.DDLTjField.DataSource = ddd1;
            this.DDLTjField.DataTextField = textField;
            this.DDLTjField.DataValueField = valueField;
            this.DDLTjField.DataBind();
            if (!isExternal())
            {
                for (int ii = 0; ii < DDLTjField.Items.Count; ii++)
                {
                    DDLTjField.Items[ii].Attributes["title"] = bll.GetTablecolumn(TableName, DDLTjField.Items[ii].Text);
                }
            }
        }
    }
    // 字段排序绑定字段==
    protected void BindOrderField(object sender, EventArgs e)
    {
        DropDownList tableDownList = (DropDownList)WizardStep2.FindControl("DbTableDownList");
        DropDownList tableDownList2 = (DropDownList)WizardStep2.FindControl("DbTableDownList2");
        if (tLabel.isExternal())//修改时才触发
        {
            if (DDLOrderTable.SelectedIndex == 0)//选了主表
                BindOrder(tLabel.T1, tLabel.ConnectString);
            else
            {
                BindOrder(tLabel.T2, tLabel.ConnectString);
            }
        }
        else
        {
            if (DDLOrderTable.SelectedIndex == 0)//选了主表
                this.BindOrder(tableDownList.SelectedValue, getExternalConnStr());
            else
                this.BindOrder(tableDownList2.SelectedValue, getExternalConnStr());
        }
    }
    private void BindOrder()//第三步，排序下拉（DisUse）
    {
        string TableName = "";
        /////////////////////////////////////////////////////
        if (this.DDLOrderTable.SelectedIndex == 0)//主从表的下拉
        {
            if (this.DbTableDownList.SelectedIndex != 0)
            {
                TableName = this.DbTableDownList.SelectedValue;
            }
        }
        else
        {
               
            if (this.DbTableDownList2.SelectedIndex != 0)
            {
                TableName = this.DbTableDownList2.SelectedValue;
            }
        }
    }
    private void BindOrder(string tableName,string connStr)
    {
            
        string[] tmpname;
        string truetablename = "";
        DataTable t1 = new DataTable();
        dsModel = dsBll.SelReturnModel(DataConvert.CLng(DatabaseList.SelectedValue));
        if (tableName.IndexOf(".dbo.") > -1)
        {
            tmpname = tableName.Split(new string[] { ".dbo." }, StringSplitOptions.RemoveEmptyEntries);
            truetablename = tmpname[1];
        }
        else
        {
            if (tableName.IndexOf('.') > -1)
            {
                string[] temptablename = tableName.Split(new string[] { "." }, StringSplitOptions.RemoveEmptyEntries);
                truetablename = temptablename[1];
            }
            else
            {
                truetablename = tableName;
            }
        }
        if (!string.IsNullOrEmpty(truetablename))
        {
                
            this.DDLOrderField.Items.Clear();
            //DataTable t1 = this.bll.GetTableField(this.DbTableDownList.SelectedValue, connStr);
            //t1 = this.bll.GetTableField(tableName, connStr);
            t1 = GetTableOrField(dsModel, tableName, 2);
            t1.DefaultView.Sort = textField + " ASC";
            this.DDLOrderField.DataSource = t1;
            this.DDLOrderField.DataTextField = textField;
            this.DDLOrderField.DataValueField = valueField;
            this.DDLOrderField.DataBind();
        }
    }
    // 添加查询条件
    protected void Button1_Click(object sender, EventArgs e)
    {
        string StrJion = " " + this.DDLJointj.SelectedValue + " ";
        string StrTable = "";
        bool addtable = false;
        if (this.DDLFTable.SelectedIndex == 0)
        {
            StrTable = this.DbTableDownList.SelectedValue;
        }
        else
        {
            StrTable = this.DbTableDownList2.SelectedValue;
        }

        if (this.DbTableDownList.SelectedIndex != 0 && this.DbTableDownList2.SelectedIndex != 0)
            addtable = true;
        if (!string.IsNullOrEmpty(this.DDLTjField.SelectedValue))
        {
            string StrField = this.DDLTjField.SelectedValue;
            if (!string.IsNullOrEmpty(this.TxtTjValue.Text))
            {
                string StrTj = "";
                if (addtable)
                    StrTj = StrTable + "." + StrField;
                else
                    StrTj = StrField;
                switch (this.DDLtj.SelectedIndex)
                {
                    case 0:
                        StrTj = StrTj + "=" + this.TxtTjValue.Text;
                        break;
                    case 1:
                        StrTj = StrTj + ">" + this.TxtTjValue.Text;
                        break;
                    case 2:
                        StrTj = StrTj + "<" + this.TxtTjValue.Text;
                        break;
                    case 3:
                        StrTj = StrTj + ">=" + this.TxtTjValue.Text;
                        break;
                    case 4:
                        StrTj = StrTj + "<=" + this.TxtTjValue.Text;
                        break;
                    case 5:
                        StrTj = StrTj + "<>" + this.TxtTjValue.Text;
                        break;
                    case 6:
                        StrTj = StrTj + " in (" + this.TxtTjValue.Text + ")";
                        break;
                    case 7:
                        StrTj = StrTj + " like '%" + this.TxtTjValue.Text + "%'";
                        break;
                    case 8:
                        StrTj = StrTj + " not in (" + this.TxtTjValue.Text + ")";
                        break;
                }
                if (!string.IsNullOrEmpty(this.TxtSqlWhere.Text))
                {
                    this.TxtSqlWhere.Text = this.TxtSqlWhere.Text + StrJion + StrTj;
                }
                else
                {
                    this.TxtSqlWhere.Text = StrTj;
                }
            }
        }
    }
    // 添加字段排序
    protected void Button2_Click(object sender, EventArgs e)
    {
        string StrTable = "";
        bool addtable = false;
        if (this.DDLOrderTable.SelectedIndex == 0)
        {
            StrTable = this.DbTableDownList.SelectedValue;
        }
        else
        {
            StrTable = this.DbTableDownList2.SelectedValue;
        }
        if (this.DbTableDownList.SelectedIndex != 0 && this.DbTableDownList2.SelectedIndex != 0)
            addtable = true;
        if (!string.IsNullOrEmpty(this.DDLOrderField.SelectedValue))
        {
            string StrField = this.DDLOrderField.SelectedValue;
            string StrOrder = "";
            if (addtable)
            {
                StrOrder = StrTable + "." + StrField + " " + this.DDLOrder.SelectedValue;
            }
            else
            {
                StrOrder = StrField + " " + this.DDLOrder.SelectedValue;
            }
            if (!string.IsNullOrEmpty(this.TxtOrder.Text))
            {
                this.TxtOrder.Text = this.TxtOrder.Text + "," + StrOrder;
            }
            else
            {
                this.TxtOrder.Text = StrOrder;
            }
        }
    }
    // 设定查询字段
    protected void Button3_Click(object sender, EventArgs e)//设定查询字段
    {
        string FieldStr = "";
        string connStr = getExternalConnStr();
        dsModel = dsBll.SelReturnModel(DataConvert.CLng(DatabaseList.SelectedValue));

        if (this.DbTableDownList.SelectedIndex != 0 && this.DbTableDownList2.SelectedIndex != 0)
        {
            foreach (ListItem n in this.DbFieldDownList.Items)
            {
                if (n.Selected)
                {
                    if (!string.IsNullOrEmpty(FieldStr))
                        FieldStr = FieldStr + "," + this.DbTableDownList.SelectedValue + "." + n.Value;
                    else
                        FieldStr = this.DbTableDownList.SelectedValue + "." + n.Value;
                }
            }
            foreach (ListItem n1 in this.DbFieldDownList2.Items)
            {
                if (n1.Selected)
                {
                    if (!string.IsNullOrEmpty(FieldStr))
                        FieldStr = FieldStr + "," + this.DbTableDownList2.SelectedValue + "." + n1.Value;
                    else
                        FieldStr = this.DbTableDownList2.SelectedValue + "." + n1.Value;
                }
            }
        }
        else
        {
            if (this.DbTableDownList.SelectedIndex != 0)
            {
                foreach (ListItem n in this.DbFieldDownList.Items)
                {
                    if (n.Selected)
                    {
                        if (!string.IsNullOrEmpty(FieldStr))
                            FieldStr = FieldStr + "," + n.Value;
                        else
                            FieldStr = n.Value;
                    }
                }
            }
            if (this.DbTableDownList2.SelectedIndex != 0)
            {
                foreach (ListItem n1 in this.DbFieldDownList2.Items)
                {
                    if (n1.Selected)
                    {
                        if (!string.IsNullOrEmpty(FieldStr))
                            FieldStr = FieldStr + "," + n1.Value;
                        else
                            FieldStr = n1.Value;
                    }
                }
            }
        }
        if (string.IsNullOrEmpty(FieldStr))
        {
            if (this.DbTableDownList.SelectedIndex != 0 && this.DbTableDownList2.SelectedIndex != 0)
            {
                FieldStr = this.DbTableDownList.SelectedValue + ".*," + this.DbTableDownList2.SelectedValue + ".*";
                this.TxtSqlField.Text = FieldStr;
            }
            else
            {
                this.TxtSqlField.Text = "*";
                string tablename = "";
                if (this.DbTableDownList.SelectedIndex != 0)
                {
                    tablename = this.DbTableDownList.SelectedValue;
                }
                else
                {
                    tablename = this.DbTableDownList2.SelectedValue;
                }
                DataTable dt = GetTableOrField(dsModel,tablename,2);

                foreach (DataRow dr in dt.Rows)
                {
                    if (string.IsNullOrEmpty(FieldStr))
                        FieldStr = FieldStr + dr[textField].ToString();
                    else
                        FieldStr = FieldStr + "," + dr[textField].ToString();
                }
            }
        }
        else
        {
            this.TxtSqlField.Text = FieldStr;
        }
        SetLabelColumn(FieldStr);//传入所选字段
    }
    // 置入标签
    private void SetLabelColumn(string sField)
    {
            string connStr = getExternalConnStr();
            string exDataName = "";//数据库名
            dsModel = GetCurrentModel();
            if (!isExternal())
            {
                exDataName = this.dataname;//Zoomla6x
            }
            else
            {
                if (sField.Contains(".dbo"))
                    exDataName = sField.Substring(0, sField.IndexOf(".dbo"));
            }
            sField = sField.Replace("{table1}.dbo.", exDataName + ".dbo.");//Zoomla6x:::kingdee ::sField:test.dbo.AA_Test.*,test.dbo.ZL_Adbuy.* 
            string[] arrField = sField.Split(',');

            string result = "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code=\"{Repeate}{/Repeate}\">循环函数</div>";
            result = result + "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code=\"{ZL:jsq}\">计数器</div>";
            for (int i = 0; i < arrField.Length; i++)
            {
                if (arrField[i].IndexOf('.') > 0)
                {
                    if (arrField[i].Split('.').Length < 4)
                    {
                        if (arrField[i].Split('.')[1] == "*")
                        {
                            //两边框为空点设置字段，进这
                            DataTable dt = GetTableOrField(dsModel, arrField[i].Split('.')[0],2);
                            foreach (DataRow dr in dt.Rows)
                            {
                                result = result + "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code='{Field=\"" + dr[valueField].ToString() + "\"/}' title=''>{Field=\"" + dr[valueField].ToString() + "\"/}</div>";
                            }
                        }
                        else
                        {
                            result = result + "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code='{Field=\"" + arrField[i].Split('.')[1] + "\"/}' title=''>{Field=\"" + arrField[i].Split('.')[1] + "\"/}</div>";
                        }
                    }
                    else
                    {
                        if (arrField[i].Split('.')[3] == "*")
                        {
                            //表名，连接字符串
                            //DataTable dt = this.bll.GetTableField(arrField[i].Split('.')[2], connStr);
                            DataTable dt = GetTableOrField(dsModel, arrField[i].Split('.')[2], 2);
                            foreach (DataRow dr in dt.Rows)
                            {
                                string vv1 = arrField[i];
                                if (vv1.IndexOf("*") > -1)
                                {
                                    vv1 = vv1.Replace(".*", "");
                                }
                                result = result + "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code='{Field=\"" + dr[valueField].ToString() + "\"/}' title=''>{Field=\"" + dr[valueField].ToString() + "\"/}</div>";

                            }
                        }
                        else
                        {
                            result = result + "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code='{Field=\"" + arrField[i].Split('.')[3] + "\"/}'>{Field=\"" + arrField[i].Split('.')[3] + "\"/}</div>";
                        }
                    }
                }
                else
                {
                    IList<string> Filedlist = new List<string>();
                    if (arrField[i] == "*")
                    {
                        string tablename = "";
                        string linkstr = this.TxtSqlTable.Text;

                        string hdst = "";
                        if (linkstr.IndexOf(".") > -1)
                        {
                            string[] linkarr = linkstr.Split(new string[] { "." }, StringSplitOptions.None);
                            tablename = linkarr[linkarr.Length - 1];
                            hdst = linkarr[0];
                        }
                        //Here
                        DataTable dt = GetTableOrField(dsModel, tablename, 2);
                        foreach (DataRow dr in dt.Rows)
                        {
                            if (Filedlist.IndexOf(dr[valueField].ToString()) == -1)
                            {
                                Filedlist.Add(dr[valueField].ToString());
                                if (tablelist[hdst] != null)
                                {
                                    result = result + "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code='{Field=\"" + dr[valueField].ToString() + "\"/}' title=''>{Field=\"" + dr[valueField].ToString() + "\"/}</div>";
                                }
                                else
                                {
                                    result = result + "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code='{Field=\"" + dr[valueField].ToString() + "\"/}' title=''>{Field=\"" + dr[valueField].ToString() + "\"/}</div>";
                                }

                            }
                        }
                    }
                    else
                    {
                        if (Filedlist.IndexOf(arrField[i]) == -1)
                        {
                            Filedlist.Add(arrField[i]);
                            result = result + "<div class=\"list-group-item spanfixdiv\" outtype=\"0\" onclick=\"cit()\" code='{Field=\"" + arrField[i] + "\"/}'>{Field=\"" + arrField[i] + "\"/}</div>";
                        }
                    }
                }
            }
            Field_div.InnerHtml = result;
    }
    // 置入参数类型
    public string GetParamType(string value)
    {
        string re = "";
        switch (value)
        {
            case "1":
                re="普通参数";
                break;
            case "2":
                re = "页面参数";
                break;
            case "3":
                re = "单选参数";
                break;
            case "4":
                re = "多选参数";
                break;
        }
        return re;
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (this.HdnlabelID.Value == "0")
        {
            string lblname = args.Value.Trim();

            if (string.IsNullOrEmpty(lblname) || this.bll.IsExistXML(lblname))
                args.IsValid = false;
            else
                args.IsValid = true;
        }
        else
        {
            args.IsValid = true;
        }
    }
    // 下拉选择步骤执行
    protected void Wizard1_FinishButtonClick()
    {
        if (WizardStep1.Visible == true)
        {


            if (RBLType.SelectedValue == "4")
            {
                RequiredFieldValidator3.Enabled = true;
                RequiredFieldValidator3.Visible = true;
            }
            else
            {
                RequiredFieldValidator3.Enabled = false;
                RequiredFieldValidator3.Visible = false;
            }

            if (string.IsNullOrEmpty(this.Request.QueryString["LabelnName"]))
            {
                this.m_LabelName = "";
            }
            else
            {
                this.m_LabelName = this.Request.QueryString["LabelnName"];
            }

            if (this.m_LabelName !="")
            {
                labelInfo = this.bll.GetLabelXML(this.m_LabelName);

                string LabelTable = labelInfo.LabelTable;
                LabelTable = LabelTable.Replace("{table1}.dbo.", this.dataname + ".dbo.");
                LabelTable = LabelTable.Replace("{table2}.dbo.", this.dataname2 + ".dbo.");
                this.TxtSqlTable.Text = LabelTable;

                string LabelField = labelInfo.LabelField;
                LabelField = LabelField.Replace("{table1}.dbo.", this.dataname + ".dbo.");
                LabelField = LabelField.Replace("{table2}.dbo.", this.dataname2 + ".dbo.");
                this.TxtSqlField.Text = LabelField;


                string LabelWhere = labelInfo.LabelWhere;
                LabelWhere = LabelWhere.Replace("{table1}.dbo.", this.dataname + ".dbo.");
                LabelWhere = LabelWhere.Replace("{table2}.dbo.", this.dataname2 + ".dbo.");
                this.TxtSqlWhere.Text = LabelWhere;

                string LabelOrder = labelInfo.LabelOrder;
                LabelOrder = LabelOrder.Replace("{table1}.dbo.", this.dataname + ".dbo.");
                LabelOrder = LabelOrder.Replace("{table2}.dbo.", this.dataname2 + ".dbo.");
                this.TxtOrder.Text = LabelOrder;

                //this.textContent.Text = FileSystemObject.ReadFile(this.FilePath);

                this.textContent.Text = labelInfo.Content;
                this.TextBox1.Text = labelInfo.LabelCount;
                this.RBLType.SelectedValue = labelInfo.LableType.ToString();

                if (labelInfo.LabelField != "")
                {
                    SetLabelColumn(labelInfo.LabelField);
                }

                string labeltable = labelInfo.LabelTable;
                string table2 = "";
                string labelfriest = "";
                if (labeltable.IndexOf(" ") > -1)
                {
                    string[] labelarr = labeltable.Split(new string[] { " " }, StringSplitOptions.None);
                    if (labelarr.Length > 0)
                    {
                        labelfriest = labelarr[0];//不存在点

                        if (labelfriest.IndexOf(".") == -1)
                        {
                            labelfriest = dataname + ".dbo." + labelfriest;
                        }

                        if (labeltable.IndexOf(" join ") > -1)
                        {
                            string[] labeljoin = labeltable.Split(new string[] { "join" }, StringSplitOptions.None);
                            if (labeljoin[1].IndexOf(" on ") > -1)
                            {
                                string[] joinlabel = labeljoin[1].Split(new string[] { " on " }, StringSplitOptions.None);
                                table2 = joinlabel[0];//不存在点
                                if (table2.IndexOf(".") == -1)
                                {
                                    table2 = dataname + ".dbo." + table2.Trim();
                                }
                            }
                        }
                        if (labelfriest.IndexOf("{table1}") > -1)
                        {
                            DatabaseList.SelectedIndex = 0;
                        }

                        if (labelfriest.IndexOf("{table2}") > -1)
                        {
                            DatabaseList.SelectedIndex = 1;
                        }

                        if (table2.IndexOf("{table1}") > -1)
                        {
                            DatabaseList2.SelectedIndex = 0;
                        }

                        if (table2.IndexOf("{table2}") > -1)
                        {
                            DatabaseList2.SelectedIndex = 1;
                        }

                        changedbtabledownlist(dsModel);

                        labelfriest = labelfriest.Replace("{table1}.dbo.", this.dataname + ".dbo.");
                        labelfriest = labelfriest.Replace("{table2}.dbo.", this.dataname2 + ".dbo.");

                        table2 = table2.Replace("{table1}.dbo.", dataname + ".dbo.").Trim();
                        table2 = table2.Replace("{table2}.dbo.", dataname2 + ".dbo.").Trim();
                        //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "script2", "selectvalue('" + labelfriest + "','" + table2 + "');", true);
                        function.Script(this, "selectvalue('" + labelfriest + "','" + table2 + "');");
                    }
                }
                else
                {
                    if (labeltable != "")
                    {
                        if (labeltable.IndexOf(".") == -1)
                        {
                            labeltable = dataname + ".dbo." + labeltable;
                        }

                        if (labeltable.IndexOf("{table1}") > -1)
                        {
                            DatabaseList.SelectedIndex = 0;
                        }
                        if (labeltable.IndexOf("{table2}") > -1)
                        {
                            DatabaseList.SelectedIndex = 1;
                        }

                        changedbtabledownlist(dsModel);

                        labeltable = labeltable.Replace("{table1}.dbo.", dataname + ".dbo.");
                        labeltable = labeltable.Replace("{table2}.dbo.", dataname2 + ".dbo.");

                        //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "script2", "selectvalue('" + labeltable + "','');", true);
                        function.Script(this,"selectvalue('" + labeltable + "','');");
                    }
                }
            }
            else
            {
                changedbtabledownlist(dsModel);
                this.HdnlabelID.Value = "0";
            }

            if (this.Modelvalue.Text == "")
            {
                this.Modelvalue.Text = "0";
            }


            if (m_LabelName !="")
            {
                labelInfo = this.bll.GetLabelXML(this.m_LabelName);

                if (labelInfo.LabelID > 0)
                {
                    this.addroot.SelectedValue = labelInfo.addroot;
                    this.falsecontent.Text = labelInfo.FalseContent;
                    this.Modeltypeinfo.Text = labelInfo.Modeltypeinfo;
                    this.Modelvalue.Text = labelInfo.Modelvalue;
                    this.setroot.SelectedValue = labelInfo.setroot;
                    this.Valueroot.Text = labelInfo.Valueroot;
                }
            }

            if (boolmodel.Checked == true)
            {
                this.isbool.Visible = true;
                //this.RequiredFieldValidator2.Enabled = true;
                this.Label8.Visible = true;
                this.s1.Visible = true;
                this.s2.Visible = true;

                switch (Modeltypeinfo.SelectedValue)
                {
                    case "计数判断":
                        this.addroot.Visible = true;
                        this.Valueroot.Visible = false;
                        this.setroot.Visible = true;
                        this.Modelvalue.Visible = true;
                        this.Label3.Visible = true;
                        if (this.addroot.SelectedValue == "循环计算")
                        {
                            this.Label3.Text = "计数器达到条件将自动清零,仅限包含<font color=blue>循环标签</font>有效";
                        }
                        else if (this.addroot.SelectedValue == "一直累加,仅限包含<font color=blue>循环标签</font>有效")
                        {
                            this.Label3.Text = "计数器一直累加";
                        }
                        //this.RequiredFieldValidator2.Enabled = true;
                        break;
                    case "用户登录判断":
                        this.addroot.Visible = false;
                        this.Valueroot.Visible = false;
                        this.setroot.Visible = false;
                        this.Modelvalue.Visible = false;
                        //this.RequiredFieldValidator2.Enabled = false;
                        this.Label3.Text = "判断用户是否登录";
                        break;
                    case "参数判断":
                        this.addroot.Visible = false;
                        this.Valueroot.Visible = true;
                        this.setroot.Visible = true;
                        this.Modelvalue.Visible = true;
                        this.Label3.Text = "判断参数是否满足条件";
                        //this.RequiredFieldValidator2.Enabled = true;
                        break;
                }
            }
            else
            {
                this.Label8.Visible = false;
                this.s1.Visible = false;
                this.s2.Visible = false;
                this.isbool.Visible = false;
            }
        }
    }
    // 第一步下拉列表事件
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = DataConverter.CLng(DropDownList1.SelectedValue);
        this.DropDownList1.SelectedIndex = index - 1;
        this.DropDownList2.SelectedIndex = index - 1;
        this.DropDownList3.SelectedIndex = index - 1;
        this.DropDownList4.SelectedIndex = index - 1;
        WizardStepBase step = Wizard1.WizardSteps[index - 1];
        //if ((index - 1) == 1) { Wizard1_FinishButtonClick(); }
        Wizard1.MoveTo(step);
    }
    // 第二步下拉列表事件
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = DataConverter.CLng(DropDownList2.SelectedValue);
        this.DropDownList1.SelectedIndex = index - 1;
        this.DropDownList2.SelectedIndex = index - 1;
        this.DropDownList3.SelectedIndex = index - 1;
        this.DropDownList4.SelectedIndex = index - 1;
        WizardStepBase step = Wizard1.WizardSteps[index - 1];
        //if ((index - 1) == 1) { Wizard1_FinishButtonClick(); }
        Wizard1.MoveTo(step);
    }
    // 第三步下拉列表事件
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = DataConverter.CLng(DropDownList3.SelectedValue);
        this.DropDownList1.SelectedIndex = index - 1;
        this.DropDownList2.SelectedIndex = index - 1;
        this.DropDownList3.SelectedIndex = index - 1;
        this.DropDownList4.SelectedIndex = index - 1;
        //if ((index - 1) == 1) { Wizard1_FinishButtonClick(); }
        WizardStepBase step = Wizard1.WizardSteps[index - 1];
        Wizard1.MoveTo(step);
    }
    // 第四步下拉列表事件
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = DataConverter.CLng(DropDownList4.SelectedValue);
        this.DropDownList1.SelectedIndex = index - 1;
        this.DropDownList2.SelectedIndex = index - 1;
        this.DropDownList3.SelectedIndex = index - 1;
        this.DropDownList4.SelectedIndex = index - 1;
        WizardStepBase step = Wizard1.WizardSteps[index - 1];
        //if ((index - 1) == 1) { Wizard1_FinishButtonClick(); }
        Wizard1.MoveTo(step);
    }
    // 下一步事件
    protected void StartNextButton_Click(object sender, EventArgs e)
    {
        if (Wizard1.ActiveStepIndex == 3)
        {
            WizardStepBase step = Wizard1.WizardSteps[2];
            //if ((index - 1) == 1) { Wizard1_FinishButtonClick(); }
            Wizard1.MoveTo(step);
        }
        else
        {
            this.DropDownList1.SelectedIndex = Wizard1.ActiveStepIndex + 1;
            this.DropDownList2.SelectedIndex = Wizard1.ActiveStepIndex + 1;
            this.DropDownList3.SelectedIndex = Wizard1.ActiveStepIndex + 1;
            this.DropDownList4.SelectedIndex = Wizard1.ActiveStepIndex + 1;
        }
           
        //if ((Wizard1.ActiveStepIndex + 1) == 1) { Wizard1_FinishButtonClick(); }
    }
    // 上一步事件
    protected void PreviousButtonStep3_Click(object sender, EventArgs e)
    {
        this.DropDownList1.SelectedIndex = Wizard1.ActiveStepIndex - 1;
        this.DropDownList2.SelectedIndex = Wizard1.ActiveStepIndex - 1;
        this.DropDownList3.SelectedIndex = Wizard1.ActiveStepIndex - 1;
        this.DropDownList4.SelectedIndex = Wizard1.ActiveStepIndex - 1;
        //if ((Wizard1.ActiveStepIndex - 1) == 1) { Wizard1_FinishButtonClick(); }
    }
    //绑定字段显示,表名，标签类，字段列表对象
    public void bindField(string tableName, TempLabel label,ListBox fieldList) 
    {  
        DataTable tabledlist = this.bll.GetTableField(tableName, label.ConnectString);
        tabledlist.DefaultView.Sort = "fieldname asc";
        fieldList.DataSource = tabledlist;
        fieldList.DataTextField = "fieldname";
        fieldList.DataValueField = "fieldname";
        fieldList.DataBind();
        fieldList.Items.Insert(0, new ListItem("*", "*"));  
    }
    //--------------新增
    // 获取连接字符串,本地与外部均在此获取
    protected string getExternalConnStr()
    {
        try
        {
            string id = DatabaseList.SelectedValue;
            dsTable = ViewState["dsTable"] == null ? dsBll.Sel() : ViewState["dsTable"] as DataTable;
            return dsTable.Select("ID='" + DatabaseList.SelectedValue + "'")[0][dsTable.Columns.IndexOf("ConnectionString")] as string;
        }
        catch
        { 
            string result="";
            if (DatabaseList.SelectedIndex == 0)
                result = this.ConnectionString;
            else
                result = this.PlugConnectionString;
            return result;
                
        }
    }
    //是否外部数据来源
    protected bool isExternal() 
    {
        return DatabaseList.SelectedIndex > 1;//0与1均为本地库
    }
    // 判断数据源类型，返回表或字段的信息,1获取表,2获取字段
    protected DataTable GetTableOrField(M_DataSource dsModel,string tableName,int step) 
    {
        DataTable dt = new DataTable();
            

        if (!isExternal()) //如果是本地数据库的话
        {
            if (step == 1) 
            {
                dt = this.bll.GetTableName(getExternalConnStr());
            }
            else
            {
                dt= this.bll.GetTableField(tableName, getExternalConnStr());
            }
            return dt;
        }
        //外部数据库处理
        switch (M_DataSource.DataSourceType[DataConvert.CLng(dsModel.Type)])
        {
            case "Excel":
                if (step == 1)
                {
                    dt = OleDB.SelectTables(dsModel.ConnectionString);//获取表列表
                    textTable = "Table_Name";
                }
                else 
                {
                    dt = OleDB.SelectColumns(dsModel.ConnectionString,tableName);
                    textField = "Column_Name";
                    valueField = "Column_Name";
                }
                return dt;
            case "XML":
                if (step == 1)
                {
                    DataSet ds = new DataSet();
                    ds.ReadXml(Server.MapPath(dsModel.ConnectionString));
                    dt.Columns.Add(new DataColumn("Table_Name", typeof(string)));
                    for (int i = 0; i < 1; i++)//只用一张主表即可，其他的已都汇入主表
                    {
                        DataRow dr = dt.NewRow();
                        dr["Table_Name"] = ds.Tables[i].TableName;
                        dt.Rows.Add(dr);
                    }
                    textTable = "Table_Name";
                }
                else
                {
                    dt = dsModel.GetXmlColumns(Server.MapPath(dsModel.ConnectionString));
                    dt.DefaultView.Sort = "Column_Name ASC";
                    dt = dt.DefaultView.ToTable();
                    textField = "Column_Name";
                    valueField = "Column_Name";
                }
                return dt;
            default:
                if (step == 1)
                {
                    dt = SqlHelper.GetSchemaTable(getExternalConnStr(), schema_Text.Text);
                }
                else//获取字段列表
                {
                    dt = SqlHelper.GetTableColumn2(this.DbTableDownList.SelectedValue, getExternalConnStr());
                }
                return dt;
        }
    }
    // 根据下拉框的值，获取对应ID的模型
    protected M_DataSource GetCurrentModel() 
    {
        return dsBll.SelReturnModel(DataConvert.CLng(DatabaseList.SelectedValue));
    }
    protected void UseLable_Click(object sender, EventArgs e)
    {
        if(ViewState["Label"]!=null)
            Response.Redirect("LabelCallTab.aspx?labelName=" + ViewState["Label"]);
    }
}
//只用于该处，第一次运行时加载，记录，表1,表2，类型，连接字符串，修改时调用
[Serializable]
public class TempLabel 
{
    private string _t1,_t2,_connectType,_connectString;
    /// <summary>
    /// 全名如Zoomla6x.dbo.ZL_User 
    /// </summary>
    public string T1 { get { return this._t1; } set { this._t1 = value; } }
    public string T2 { get { return this._t2; } set { this._t2 = value; } }
    /// <summary>
    /// 全名如dbo.Zoomla6x
    /// </summary>
    public string ConnectType { get { return this._connectType; } set { this._connectType = value; } }
    public string ConnectString { get { return this._connectString; } set { this._connectString = value; } }
    /// <summary>
    /// 是否为外部库，是为true
    /// </summary>
    public bool isExternal() 
    {
        return (!string.IsNullOrEmpty(ConnectType)||!string.IsNullOrEmpty(ConnectString));
    }
    /// <summary>
    /// 绑定表的字段
    /// </summary>
}