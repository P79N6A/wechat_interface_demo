using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Newtonsoft.Json;
using Utility;
using WebApp.handler;

namespace WebApp.page.dialogue
{
    public partial class getmaterialall : baseHandler
    {
        public materialcount matmodel = new materialcount();
        protected void Page_Load(object sender, EventArgs e)
        {
            string data = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/material/get_materialcount?access_token="+getAccessToken());
            Log(data);
            materialcount str = JsonConvert.DeserializeObject<materialcount>(data);

            if (str.errcode==0)
            {
                matmodel = str;
            }
            else
            {
                Log(data);
            }
        }
    }
}