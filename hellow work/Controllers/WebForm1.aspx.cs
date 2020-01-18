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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        [ScriptMethod]
        public static string submituser(string Posted)
        {
            maincontrollers mc = new maincontrollers();
            return (mc.insertsToTUBUSER(Posted));
        }
    }
}