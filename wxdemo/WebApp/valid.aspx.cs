using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Model;
using Newtonsoft.Json;
using Utility;
using WebApp.handler;
using WebApp.service;

namespace WebApp
{
    public partial class valid : baseHandler
    {
        const string Token = "ljxwxapp";//你的token

        #region 以下代码只用于第一次验证  验证完后请注释
        protected void Page_Load(object sender, EventArgs e)
        {
            #region 验证时打开
            //string postStr = "";
            //if (Request.HttpMethod.ToLower() == "post")
            //{
            //    System.IO.Stream s = System.Web.HttpContext.Current.Request.InputStream;
            //    byte[] b = new byte[s.Length];
            //    s.Read(b, 0, (int)s.Length);
            //    postStr = System.Text.Encoding.UTF8.GetString(b);
            //    if (!string.IsNullOrEmpty(postStr))
            //    {
            //        Response.End();
            //    }
            //    //WriteLog("postStr:" + postStr);
            //}
            //else
            //{
            //    Valid();
            //} 
            #endregion

            #region 正常时打开
            if (!IsPostBack)
            {
                if (Request.HttpMethod == "POST")
                {
                    string weixin = PostInput();//获取xml数据
                    if (!string.IsNullOrEmpty(weixin))
                    {
                        ResponseMsg(weixin);//调用消息适配器
                    }
                }
            }
            #endregion
        }
        #endregion

        #region 以下是正常使用时的pageload  请在验证时将其注释  并保证在正常使用时可用
        /// <summary>
        /// 以下是正常使用时的pageload  请在验证时将其注释  并保证在正常使用时可用
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}
        #endregion

        #region 验证微信签名 保持默认即可
        /// <summary>
        /// 验证微信签名
        /// </summary>
        /// * 将token、timestamp、nonce三个参数进行字典序排序
        /// * 将三个参数字符串拼接成一个字符串进行sha1加密
        /// * 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信。
        /// <returns></returns>
        private bool CheckSignature()
        {
            string signature = Request.QueryString["signature"];
            string timestamp = Request.QueryString["timestamp"];
            string nonce = Request.QueryString["nonce"];
            string[] ArrTmp = { Token, timestamp, nonce };
            Array.Sort(ArrTmp);     //字典排序
            string tmpStr = string.Join("", ArrTmp);
            tmpStr = FormsAuthentication.HashPasswordForStoringInConfigFile(tmpStr, "SHA1");
            tmpStr = tmpStr.ToLower();
            if (tmpStr == signature)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void Valid()
        {
            string echoStr = Request.QueryString["echoStr"];
            if (CheckSignature())
            {
                if (!string.IsNullOrEmpty(echoStr))
                {
                    Response.Write(echoStr);
                    Response.End();
                }
            }
        }
        #endregion

        #region 获取post请求数据
        /// <summary>
        /// 获取post请求数据
        /// </summary>
        /// <returns></returns>
        private string PostInput()
        {
            Stream s = System.Web.HttpContext.Current.Request.InputStream;
            byte[] b = new byte[s.Length];
            s.Read(b, 0, (int)s.Length);
            return Encoding.UTF8.GetString(b);
        }
        #endregion

        #region 消息类型适配器
        private void ResponseMsg(string weixin)// 服务器响应微信请求
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(weixin);//读取xml字符串
            XmlElement root = doc.DocumentElement;
            ExmlMsg xmlMsg = ExmlMsg.GetExmlMsg(root);
            if (!string.IsNullOrEmpty(xmlMsg.EventName) && xmlMsg.EventName.ToLower() == "location")
            {
                Latitude = xmlMsg.Latitude;
                Longitude = xmlMsg.Longitude;
                string myxy = RequestType.HttpGet("http://api.map.baidu.com/geoconv/v1/?coords=" + Longitude + "," + Latitude + "&from=1&to=5&ak=EuF8VnvpoIxvLKdmyQOuMPSpbE9ErZe4");
                Location locadata = JsonConvert.DeserializeObject<Location>(myxy);
                x = locadata.result[0].y;
                y = locadata.result[0].x;
            }

            //string messageType = MsgType.InnerText;
            string messageType = xmlMsg.MsgType;//获取收到的消息类型。文本(text)，图片(image)，语音等。
            try
            {
                switch (messageType)
                {
                    //当消息为文本时
                    case "text":
                        textCase(xmlMsg);
                        break;
                    //当消息为事件时
                    case "event":
                        if (!string.IsNullOrEmpty(xmlMsg.EventName))
                        {
                            string resxml = "";
                            int nowtime = ConvertDateTimeInt(DateTime.Now);
                            switch (xmlMsg.EventName.Trim())
                            {
                                case "subscribe":
                                    //刚关注时的时间，用于欢迎词  
                                    string title = "欢迎关注微信demo\n";
                                    resxml = "<xml><ToUserName><![CDATA[" + xmlMsg.FromUserName + "]]></ToUserName><FromUserName><![CDATA[" + xmlMsg.ToUserName + "]]></FromUserName><CreateTime>" + nowtime + "</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[" + title + "]]></Title><Description><![CDATA[微信接口测试demo]]></Description><PicUrl><![CDATA[]]></PicUrl><Url><![CDATA[http://ljx.pqpqpq.cn]]></Url></item></Articles></xml>";
                                    break;
                                case "CLICK":
                                    resxml = GetContent(xmlMsg.EventKey, xmlMsg);
                                    break;
                                case "MASSSENDJOBFINISH":
                                    StringBuilder sb = new StringBuilder();
                                    sb.Append("公众号的微信号:" + xmlMsg.ToUserName + "<br/>");
                                    sb.Append("公众号群发助手的微信号:" + xmlMsg.FromUserName + "<br/>");
                                    sb.Append("创建时间的时间戳:" + Utility.WxHelper.GetTime(xmlMsg.CreateTime).ToString("yyyy-MM-dd HH:mm:ss") + "<br/>");
                                    sb.Append("消息类型:" + xmlMsg.MsgType + "<br/>");
                                    sb.Append("事件信息:" + xmlMsg.EventName + "<br/>");
                                    sb.Append("群发的消息ID:" + xmlMsg.MsgID + "<br/>");
                                    sb.Append("群发的结构:" + xmlMsg.Status + "<br/>");
                                    sb.Append("group_id下粉丝数:" + xmlMsg.TotalCount + "<br/>");
                                    sb.Append("准备发送的粉丝数:" + xmlMsg.FilterCount + "<br/>");
                                    sb.Append("发送成功的粉丝数:" + xmlMsg.SentCount + "<br/>");
                                    sb.Append("发送失败的粉丝数:" + xmlMsg.ErrorCount + "<br/>");
                                    msgresult = sb.ToString();
                                    break;
                                default:
                                    break;
                            }

                            Response.Write(resxml);
                        }
                        break;
                    case "image":
                        textOtherCase(xmlMsg, "图片");
                        break;
                    case "voice":
                        textOtherCase(xmlMsg, "声音,识别结果：" + xmlMsg.Recognition);
                        break;
                    case "shortvideo":
                        textOtherCase(xmlMsg, "视频");
                        break;
                    case "location":
                        textOtherCase(xmlMsg, "位置");
                        break;
                    case "link":
                        textOtherCase(xmlMsg, "链接");
                        break;
                    default:
                        break;
                }
                Response.End();
            }
            catch (Exception)
            {

            }
        }
        #endregion

        private string GetContent(string key, ExmlMsg xmlMsg)
        {
            string resxml = "";
            int nowtime = ConvertDateTimeInt(DateTime.Now);
            switch (key)
            {
                case "gameinfo":
                    resxml = "<xml><ToUserName><![CDATA[" + xmlMsg.FromUserName + "]]></ToUserName><FromUserName><![CDATA[" + xmlMsg.ToUserName + "]]></FromUserName><CreateTime>" + nowtime + "</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[消息推送]]></Title><Description><![CDATA[微信接口测试demo]]></Description><PicUrl><![CDATA[]]></PicUrl><Url><![CDATA[http://ljx.pqpqpq.cn]]></Url></item></Articles></xml>";
                    break;
                case "createqrcode":
                    //获取图片ticket
                    string pams = "{\"expire_seconds\": 2592000, \"action_name\": \"QR_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": 123}}}";
                    string qrcode = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + getAccessToken(), pams);
                    GetJsToken js = JsonConvert.DeserializeObject<GetJsToken>(qrcode);
                    //获取url

                    resxml = "<xml><ToUserName><![CDATA[" + xmlMsg.FromUserName + "]]></ToUserName><FromUserName><![CDATA[" + xmlMsg.ToUserName + "]]></FromUserName><CreateTime>" + nowtime + "</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[生成二维码]]></Title><Description><![CDATA[微信接口测试demo]]></Description><PicUrl><![CDATA[https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + HttpUtility.UrlEncode(js.ticket) + "]]></PicUrl><Url><![CDATA[http://ljx.pqpqpq.cn]]></Url></item></Articles></xml>";
                    break;
                case "mylocation":


                    string addinfo = "";
                    string address = RequestType.HttpGet("http://api.map.baidu.com/geocoder/v2/?location=" + x + "," + y + "&output=json&pois=1&ak=EuF8VnvpoIxvLKdmyQOuMPSpbE9ErZe4");
                    Address add = JsonConvert.DeserializeObject<Address>(address);
                    if (add.status == 0)
                    {
                        addinfo = add.result.formatted_address;
                    }

                    resxml = "<xml><ToUserName><![CDATA[" + xmlMsg.FromUserName + "]]></ToUserName><FromUserName><![CDATA[" + xmlMsg.ToUserName + "]]></FromUserName><CreateTime>" + nowtime + "</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[获取我的位置信息]]></Title><Description><![CDATA[您当前所在位置:" + addinfo + "]]></Description><PicUrl><![CDATA[]]></PicUrl><Url><![CDATA[http://ljx.pqpqpq.cn/page/dialogue/myaddressinfo.aspx?x=" + x + "&y=" + y + "]]></Url></item></Articles></xml>";
                    break;
                default:
                    break;
            }


            return resxml;
        }

        private string getText(ExmlMsg xmlMsg)
        {
            //string con = xmlMsg.Content.Trim();

            System.Text.StringBuilder retsb = new StringBuilder(200);
            retsb.Append("您好，\n");
            retsb.Append("您说：" + xmlMsg.Content + "\n");
            retsb.Append("您的OPEANID：" + xmlMsg.FromUserName);
            return retsb.ToString();
        }

        #region 操作文本消息 + void textCase(XmlElement root)
        private void textCase(ExmlMsg xmlMsg)
        {
            int nowtime = ConvertDateTimeInt(DateTime.Now);
            string msg = "";
            msg = getText(xmlMsg);
            string resxml = "<xml><ToUserName><![CDATA[" + xmlMsg.FromUserName + "]]></ToUserName><FromUserName><![CDATA[" + xmlMsg.ToUserName + "]]></FromUserName><CreateTime>" + nowtime + "</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[" + msg + "]]></Content><FuncFlag>0</FuncFlag></xml>";
            Response.Write(resxml);
            //TextBox1.Text = "用户：" + msg;
        }

        private void textOtherCase(ExmlMsg xmlMsg, string type)
        {
            int nowtime = ConvertDateTimeInt(DateTime.Now);
            string resxml = "<xml><ToUserName><![CDATA[" + xmlMsg.FromUserName + "]]></ToUserName><FromUserName><![CDATA[" + xmlMsg.ToUserName + "]]></FromUserName><CreateTime>" + nowtime + "</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[这是:" + type + "]]></Content><FuncFlag>0</FuncFlag></xml>";
            Response.Write(resxml);
            //TextBox1.Text = "用户：" + msg;
        }
        #endregion

        #region 将datetime.now 转换为 int类型的秒
        /// <summary>
        /// datetime转换为unixtime
        /// </summary>
        /// <param name="time"></param>
        /// <returns></returns>
        private int ConvertDateTimeInt(System.DateTime time)
        {
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1));
            return (int)(time - startTime).TotalSeconds;
        }
        private int converDateTimeInt(System.DateTime time)
        {
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1));
            return (int)(time - startTime).TotalSeconds;
        }

        /// <summary>
        /// unix时间转换为datetime
        /// </summary>
        /// <param name="timeStamp"></param>
        /// <returns></returns>
        private DateTime UnixTimeToTime(string timeStamp)
        {
            DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
            long lTime = long.Parse(timeStamp + "0000000");
            TimeSpan toNow = new TimeSpan(lTime);
            return dtStart.Add(toNow);
        }
        #endregion
    }
}