using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Utility
{
    public class GetJsToken
    {
        public int errcode{get;set;}
        public string errmsg{get;set;}
        public string ticket{get;set;}
        public int expires_in{get;set;}

        public string expire_seconds { get; set; }
        public string url { get; set; }

        public string short_url { get; set; }
    }
}