using hellow_work.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hellow_work
{
    public partial class show : System.Web.UI.Page
    {
        public user_login obj;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                obj = (user_login)Session["Uesrinfo"];
            }
            catch
            {
                obj = new user_login();
            }
            if (obj == null)
            {
                obj = new user_login();
            }
            if (!obj.islogin)
                Response.Redirect(".");
        }
    }
}