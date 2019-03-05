using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using WebApp.handler;
using WebApp.service;

namespace WebApp.page.dialogue
{
    public partial class userbaseinfo : baseHandler
    {
        public UserInfo user = new UserInfo();
        public string result = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = Request["action"];
            if (action=="getuserbaseinfo")
            {
                 string data = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + getAccessToken() +"&openid="+Request["openid"]+"&lang=zh_CN");

                 UserInfo userinfo = JsonConvert.DeserializeObject<UserInfo>(data);

                 if (userinfo!=null)
                 {
                     user = userinfo;
                 }
            }
        }
    }
}