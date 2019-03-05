using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class UserList
    {
        public int total { get; set; }
        public int count { get; set; }
        public Data data { get; set; }
        public int errcode { get; set; }
        public string errmsg { get; set; }
    }

    public class Data
    {
        public string [] openid { get; set; }
        public string next_openid { get; set; }
    }
}
