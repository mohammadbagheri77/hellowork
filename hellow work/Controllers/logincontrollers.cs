using DataBaseConnector;
using hellow_work.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace hellow_work.Controllers
{
    public class logincontrollers
    {
       
        public string sessionCaptcha = "";
        public string insertsToTUBUSER(string posted)
        {
            user_login obj = JsonConvert.DeserializeObject<user_login>(posted);

            sessionCaptcha = obj.captcha;

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
                        if (dt.Rows[j].ItemArray[2].ToString() == obj.us && dt.Rows[j].ItemArray[3].ToString() == obj.pass)
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
                    return str;
                }
                else
                {
                    return "-1";
                }
            }

         }
    }
}