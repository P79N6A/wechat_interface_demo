using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    //{
    //     "button":[
    //     {	
    //          "type":"click",
    //          "name":"今日歌曲",
    //          "key":"V1001_TODAY_MUSIC"
    //      },
    //      {
    //           "name":"菜单",
    //           "sub_button":[
    //           {	
    //               "type":"view",
    //               "name":"搜索",
    //               "url":"http://www.soso.com/"
    //            },
    //            {
    //               "type":"view",
    //               "name":"视频",
    //               "url":"http://v.qq.com/"
    //            },
    //            {
    //               "type":"click",
    //               "name":"赞一下我们",
    //               "key":"V1001_GOOD"
    //            }]
    //       }]
    // }

    public class MenuInfo
    {
        public List<MenuList> button { get; set; }
    }

    public class MenuList
    {
        public string type { get; set; }
        public string name { get; set; }
        public string key { get; set; }
        public List<MenuTwo> sub_button { get; set; }
    }

    public class MenuTwo
    {
        public string type { get; set; }
        public string name { get; set; }
        public string url { get; set; }
        public string key { get; set; }
    }
}
