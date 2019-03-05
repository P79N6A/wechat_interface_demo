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

namespace WebApp
{
    public partial class member : baseHandler
    {
        public UserInfo user = new UserInfo();
        public string result = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usermodel"] == null)
            {
                string action = Request["state"];
                string code = Request["code"];
                string redirecturl = HttpUtility.UrlDecode(Request["redirecturl"]);
                if (!string.IsNullOrEmpty(code))
                {
                    if (action == "userinfo")
                    {

                        string str = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + SiteConfig.Instance.AppID + "&secret=" + SiteConfig.Instance.AppSecret + "&code=" + code + "&grant_type=authorization_code";

                        string param = RequestType.HttpPost(str, "");

                        ConvertParams returnparam = JsonConvert.DeserializeObject<ConvertParams>(param);

                        string str1 = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=" + SiteConfig.Instance.AppID + "&grant_type=refresh_token&refresh_token=" + returnparam.refresh_token;

                        string param1 = RequestType.HttpPost(str1, "");

                        ConvertParams returnparam1 = JsonConvert.DeserializeObject<ConvertParams>(param1);

                        string str2 = "https://api.weixin.qq.com/sns/userinfo?access_token=" + returnparam1.access_token + "&openid=" + returnparam1.openid + "&lang=zh_CN";

                        string param2 = RequestType.HttpPost(str2, "");

                        UserInfo userinfo = JsonConvert.DeserializeObject<UserInfo>(param2);

                        user = userinfo;

                        Session["usermodel"] = userinfo;

                        if (!string.IsNullOrEmpty(redirecturl))
                        {
                            Response.Redirect(redirecturl);
                        }

                    }
                }
                else
                {

                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + SiteConfig.Instance.AppID + "&redirect_uri=" + HttpUtility.UrlEncode(Request.Url.ToString()) + "&response_type=code&scope=snsapi_userinfo&state=userinfo&redirecturl=" + redirecturl + "#wechat_redirect");
                }
            }
            else
            {
                user = Session["usermodel"] as UserInfo;
            }
        }
    }
}