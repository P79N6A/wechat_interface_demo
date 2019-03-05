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
    public class morecustomerservice
    {
        public int errcode { get; set; }
        public string errmsg { get; set; }
        public int retcode { get; set; }
        public List<record> recordlist { get; set; }
    }

    public class record
    {
        public string openid { get; set; }
        public int opercode { get; set; }
        public string text { get; set; }
        public int time { get; set; }
        public string worker { get; set; }
    }
}
