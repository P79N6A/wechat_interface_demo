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
    public partial class getallmateriallistdetail : baseHandler
    {
        public material material = new material();
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request["type"];
            int offset;
            if (!int.TryParse(Request["offset"], out offset))
            {
                throw new Exception("偏移位置参数不正确");
            }

            int count;
            if (!int.TryParse(Request["count"], out count))
            {
                throw new Exception("获取数量参数不正确");
            }

            string pams = "{\"type\":\"" + type + "\",\"offset\":" + offset + ",\"count\":" + count + "}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=" + getAccessToken(), pams);
            material = JsonConvert.DeserializeObject<material>(data);
        }
    }
}