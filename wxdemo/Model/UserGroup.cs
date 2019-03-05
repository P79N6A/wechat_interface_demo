using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class UserGroup
    {
        public creategroup group { get; set; }
        public List<allusergroup> groups { get; set; }
        public int errcode { get; set; }
        public int groupid { get; set; }
        public string errmsg { get; set; }
    }

    public class creategroup
    {
        public int id { get; set; }
        public string name { get; set; }
        
    }

    public class allusergroup
    {
        public int id { get; set; }
        public string name { get; set; }
        public int count { get; set; }
    }
}
