using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hellow_work.Models
{
    public class tblUserStruct
    {
        [JsonProperty("un")]
        public string un { set; get; }

        [JsonProperty("email")]
        public string email { set; get; }

        [JsonProperty("password")]
        public string password { set; get; }

        [JsonProperty("destxt")]
        public string destxt { set; get; }
      
    }
}