using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    /// <summary>
    /// 多客服聊天记录
    /// </summary>
    public class morecustomeronreceiveinfo
    {
        public List<receiveinfo> kf_online_list { get; set; }
    }

    public class receiveinfo
    {
        public string kf_account { get; set; }
        public int status { get; set; }
        public string kf_id { get; set; }
        public int auto_accept { get; set; }
        public int accepted_case { get; set; }
    }
}
