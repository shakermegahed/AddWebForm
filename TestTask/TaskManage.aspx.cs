using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTask
{
    public partial class TaskManage : System.Web.UI.Page
    {
        #region Variables
        DALLayer.TaskManagement _TaskManagement;
        #endregion
        #region Property
        public string ID
        {
            set { ViewState["ID"] = value; }
            get { return ViewState["ID"] == null ? string.Empty : ViewState["ID"].ToString(); }
        }
        #endregion
        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                ID = Request.QueryString["ID"].ToString();
            }
            if (!IsPostBack)
            {

                alertSuccess.Visible = false;
                alertFaild.Visible = false;
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        } 
        protected void btnSaveNew_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("/TaskManage.aspx");

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/TaskList.aspx");
        }

        #endregion
        #region Methods

        void Save()
        {
            try
            {
                _TaskManagement = new DALLayer.TaskManagement();

                #region Manage Item
                string FileName = string.Empty;
                _TaskManagement._objTask.ID = Guid.NewGuid();
                _TaskManagement._objTask.Title = txtTitle.Value;
                _TaskManagement._objTask.Date = DateTime.Parse(txtDate.Value);
                _TaskManagement._objTask.Notes = edContent.Value;
                _TaskManagement._objTask.Status= int.Parse(ddlStatus.SelectedValue);

                ID = _TaskManagement.Add();

                if (!string.IsNullOrEmpty(ID))
                {
                    alertSuccess.Visible = true;
                    btnSubmit.Enabled = false;
                }
                else
                {
                    alertFaild.Visible = true;
                }

                #endregion
            }
            catch (Exception ex)
            {
                //
            }
        }
   
        #endregion
    }
}