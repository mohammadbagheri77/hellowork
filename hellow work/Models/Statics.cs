﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hellow_work.Models
{
    public class Statics
    {
        public static string AppendServername(string url)
        {
            return "https://" + HttpContext.Current.Request.Url.Authority + "/" + url;
        } 
    }
}