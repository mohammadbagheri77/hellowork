using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hellow_work.Controllers
{
    public partial class maincontrollers1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        [ScriptMethod]
        public static string submituser(string Posted)
        {
            if (HttpContext.Current.Session["CaptchaVerify"] != null)
            {
                maincontrollers mc = new maincontrollers();
                string res = mc.insertsToTUBUSER(Posted);
                if (HttpContext.Current.Session["CaptchaVerify"].ToString() == mc.sessionCaptcha)
                {
                    HttpContext.Current.Session["CaptchaVerify"] = Guid.NewGuid();
                    return (res);
                }
            }
            return "0";
        }
    }
}