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
    public partial class getmaterialpermanentlist : baseHandler
    {
        public content matlist = new content();
        public string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string mediaid = Request["mediaid"];
                Log(mediaid);
                string pams = "{\"media_id\":\"" + mediaid + "\"}";
                string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=" + getAccessToken(), pams);
                content str = JsonConvert.DeserializeObject<content>(data);

                if (str.errcode == 0)
                {
                    matlist = str;
                }
                else
                {
                    matlist = null;
                    msg = data;
                    //Log(data);
                }
            }
            catch (Exception)
            {

                throw new Exception("参数错误");
            }

            
        }
    }
}