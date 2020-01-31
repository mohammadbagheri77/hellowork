using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hellow_work.Models
{
    public class user_login
    {
        [JsonProperty("us")]
        public string us { set; get; }

        [JsonProperty("name")]
        public string name { set; get; }

        [JsonProperty("pass")]
        public string pass { set; get; }

        [JsonProperty("captcha")]
        public string captcha { get; set; }

        public bool islogin = false;

    }


}