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
using WebApp.service;

namespace WebApp.page.webpage
{
    public partial class share : baseHandler
    {
        public string wxJsApiParam = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取access_token
            //string getaccesstoken = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + SiteConfig.Instance.AppID + "&secret=" + SiteConfig.Instance.AppSecret);

            //ConvertParams open = JsonConvert.DeserializeObject<ConvertParams>(getaccesstoken);

            //string jsapi = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + open.access_token + "&type=jsapi");

            //GetJsToken ticket = JsonConvert.DeserializeObject<GetJsToken>(jsapi);
            //拼接string
            //jsapi_ticket=sM4AOVdWfPE4DxkXGEs8VMCPGGVi4C3VM0P37wVUCFvkVAy_90u5h9nbSlYy3-Sl-HhTdfl2fzFy1AOcHKP7qg&noncestr=Wm3WZYTPz0wzccnW&timestamp=1414587457&url=http://mp.weixin.qq.com?params=value

            //string str = "jsapi_ticket=" + ticket.ticket + "&noncestr=" + GenerateNonceStr() + "&timestamp=" + GenerateTimeStamp() + "&url=" + Request.Url.ToString();
            //GetAccessToken token = new GetAccessToken();

            string signature = WxHelper.Getsignature(WxHelper.getNoncestr(), WxHelper.getTimestamp(), getAccessToken(),getTicket(), SiteConfig.Instance.AppID, SiteConfig.Instance.AppSecret);


            ConvertJSParams model = new ConvertJSParams();
            model.appId = SiteConfig.Instance.AppID;
            model.timestamp = WxHelper.getTimestamp();
            model.nonceStr = WxHelper.getNoncestr();
            model.signature = signature;
            model.ticket = getTicket();
            model.url = Request.Url.ToString();
            wxJsApiParam = JsonConvert.SerializeObject(model);
        }
    }
}