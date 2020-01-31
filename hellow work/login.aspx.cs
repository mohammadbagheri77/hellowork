using DataBaseConnector;
using hellow_work.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hellow_work
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["loginform"].ToString() == captcha.Text)
            {
            string str = "";
            bool is_ok = false;
            int j = 0;
            PDBC db = new PDBC("honarjoo");
            db.Connect();
            using (DataTable dt = db.Select("SELECT [id],[name],[us],[pass] FROM [dbo].[login]"))
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    while (j == i)
                    {
                        if (dt.Rows[j].ItemArray[2].ToString() == inputun.Text && dt.Rows[j].ItemArray[3].ToString() == inputPass.Text)
                        {
                            str = dt.Rows[j].ItemArray[1].ToString();
                            is_ok = true;
                            break;
                        }
                        j++;
                        db.DC();
                    }
                }
                if (is_ok == true)
                {
                        user_login login = new user_login()
                        {
                            name= str,
                            islogin= true
                        };

                    Session["Uesrinfo"] = login;
                    Response.Redirect("show.aspx");
                }
                else
                {
                    
                }
            }

            }
        }
    }
}