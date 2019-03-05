using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class morecustomerbaseinfo
    {
        public List<customlist> kf_list { get; set; }
    }

    public class customlist
    {
        public string kf_account { get; set; }
        public string kf_headimgurl { get; set; }
        public string kf_id { get; set; }
        public string kf_nick { get; set; }
    }
}
