using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace Utility
{
    public class ExmlMsg
    {
        /// <summary>
        /// 本公众账号
        /// </summary>
        public string ToUserName { get; set; }
        /// <summary>
        /// 用户账号
        /// </summary>
        public string FromUserName { get; set; }
        /// <summary>
        /// 发送时间戳
        /// </summary>
        public string CreateTime { get; set; }
        /// <summary>
        /// 发送的文本内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 消息的类型
        /// </summary>
        public string MsgType { get; set; }
        /// <summary>
        /// 事件名称
        /// </summary>
        public string EventName { get; set; }
        /// <summary>
        /// 自定义菜单推送
        /// </summary>
        public string EventKey { get; set; }
        /// <summary>
        /// 语音识别
        /// </summary>
        public string Recognition { get; set; }

        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Precision { get; set; }

        /// <summary>
        /// 群发推送
        /// </summary>
        public string MsgID { get; set; }
        public string Status { get; set; }
        public string TotalCount { get; set; }
        public string FilterCount { get; set; }
        public string SentCount { get; set; }
        public string ErrorCount { get; set; }

        public static ExmlMsg GetExmlMsg(XmlElement root)
        {
            ExmlMsg xmlMsg = new ExmlMsg()
            {
                FromUserName = root.SelectSingleNode("FromUserName").InnerText,
                ToUserName = root.SelectSingleNode("ToUserName").InnerText,
                CreateTime = root.SelectSingleNode("CreateTime").InnerText,
                MsgType = root.SelectSingleNode("MsgType").InnerText,
            };
            if (xmlMsg.MsgType.Trim().ToLower() == "text")
            {
                xmlMsg.Content = root.SelectSingleNode("Content").InnerText;
            }
            else if (xmlMsg.MsgType.Trim().ToLower() == "event")
            {
                xmlMsg.EventName = root.SelectSingleNode("Event").InnerText;

                if (root.SelectSingleNode("EventKey") != null)
                {
                    xmlMsg.EventKey = root.SelectSingleNode("EventKey").InnerText;
                }

                if (xmlMsg.EventName.ToLower() == "location")
                {
                    xmlMsg.Latitude = root.SelectSingleNode("Latitude").InnerText;
                    xmlMsg.Longitude = root.SelectSingleNode("Longitude").InnerText;
                    xmlMsg.Precision = root.SelectSingleNode("Precision").InnerText;
                }

                if (xmlMsg.EventName.ToLower() == "masssendjobfinish")
                {
                    xmlMsg.MsgID = root.SelectSingleNode("MsgID").InnerText;
                    xmlMsg.Status = root.SelectSingleNode("Status").InnerText;
                    xmlMsg.TotalCount = root.SelectSingleNode("TotalCount").InnerText;
                    xmlMsg.FilterCount = root.SelectSingleNode("FilterCount").InnerText;
                    xmlMsg.SentCount = root.SelectSingleNode("SentCount").InnerText;
                    xmlMsg.ErrorCount = root.SelectSingleNode("ErrorCount").InnerText;
                }
            }
            else if (xmlMsg.MsgType.Trim().ToLower() == "voice")
            {
                xmlMsg.Recognition = root.SelectSingleNode("Recognition").InnerText;
            }
            return xmlMsg;
        }
    }
}
