using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.IO;
using System.Web;
using DALLayer;

namespace DALLayer
{
    public class TaskManagement
    {
        #region Variable

        static dbDataContext db;
        public DALLayer.Task _objTask;

        #endregion
        #region Methods

        public TaskManagement()
        {
            db = new dbDataContext();
            _objTask = new Task();
        }

        public string Add()
        {
            try
            {

                db.Tasks.InsertOnSubmit(_objTask);
                db.SubmitChanges();

                return _objTask.ID.ToString();
            }
            catch (Exception ex)
            {
                //
            }
            return string.Empty;
        }

        public Task LoadById(string id)
        {
            try
            {
                if (!string.IsNullOrEmpty(id))
                {
                    _objTask = db.Tasks.FirstOrDefault(lb => lb.ID == new Guid(id));
                    return _objTask;
                }
                return null;
            }
            catch (Exception ex)
            {
                //
            }
            return null;
        }

        public DataTable Load()
        {
            try
            {

                var query = (from F in db.Tasks
                             select new { F.ID, F.Title, F.Notes, F.Date, F.Status}).Distinct();
                int c = 0;
                return query.ToDataTable("ID", "DESC");
            }
            catch (Exception ex)
            {
            //
            }
            return null;
        }
        #endregion
    }
}
