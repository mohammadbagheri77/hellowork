using DataBaseConnector;
using hellow_work.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hellow_work.Controllers
{ 
    public class maincontrollers
    {
        public string insertsToTUBUSER(string posted)
        {
            tblUserStruct obj = JsonConvert.DeserializeObject<tblUserStruct>(posted);
            PDBC db = new PDBC("honarjoo");
            db.Connect();
            return db.Script($"INSERT INTO tblUsers (id ,un ,email ,password ,destxt ) VALUES ({new Random().Next()},N'{obj.un}',N'{obj.email}',N'{obj.password}',N'{obj.destxt}' )");
        }
    }
}