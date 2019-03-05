using Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.service;
using Utility;

namespace WebApp.handler
{
    public partial class baseHandler : System.Web.UI.Page
    {
        public qds117733100_dbEntities db = new qds117733100_dbEntities();

        public static string Latitude { get; set; }
        public static string Longitude { get; set; }
        public static string y { get; set; }
        public static string x { get; set; }

        public static string msgresult { get; set; }

        public string Return_Msg(Enum_ReturnStatus status, string msg, object data)
        {
            return JsonConvert.SerializeObject(new { status = status, msg = msg, data = data });
        }

        public string getAccessToken()
        {
            var model = db.wx_settings.Where(c => c.ID == 1).FirstOrDefault();
            return model.access_token;
        }

        public string getTicket()
        {
            var model = db.wx_settings.Where(c => c.ID == 1).FirstOrDefault();
            return model.jsapi_ticket;
        }

        public UserInfo getUserInfo()
        {
            if (Session["usermodel"] == null)
            {
                Response.Redirect("/member.aspx?redirecturl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
                return null;
            }
            else
            {
                UserInfo user = Session["usermodel"] as UserInfo;
                return user;
            }
        }
        /// <summary>
        /// 模板消息
        /// </summary>
        /// <param name="openid"></param>
        public void SendTemplateMessage(string openid)
        {
            TemplateInfo temp = new TemplateInfo();
            temp.template_id = "jp5-DHV2SfxMYNHpf9pRWlrKe8eHtv_j1nJOBiEKR8k";
            temp.touser = openid;
            temp.url = "http://ljx.pqpqpq.cn";

            temp.topcolor = "#FF0000";

            Param p = new Param();
            p.value = "黄先生";
            p.color = "#173177";

            p.value = DateTime.Now.ToString();
            p.color = "#173177";

            p.value = "0426";
            p.color = "#173177";

            p.value = "消费";
            p.color = "#173177";

            p.value = "人民币260.00元";
            p.color = "#173177";

            p.value = "06月07日19时24分";
            p.color = "#173177";

            p.value = "06月07日19时24分";
            p.color = "#173177";

            string data = JsonConvert.SerializeObject(temp);
            var json = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" + getAccessToken(), data);
        }

        public void Log(string msg)
        {
            wx_log log = new wx_log();
            log.msg = msg;
            log.addTime = DateTime.Now;
            db.wx_log.Add(log);
            db.SaveChanges();
        }
    }

    public enum Enum_ReturnStatus
    {
        成功 = 0,
        失败
    }
}