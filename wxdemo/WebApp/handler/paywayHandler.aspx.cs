using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using Model;
using WebApp.service;
using uniondemo.com.allinpay.syb;
using Aop.Api.Request;
using Aop.Api;
using Aop.Api.Response;

namespace WebApp.handler
{
    public partial class paywayHandler : baseHandler
    {
        public string result = "";
        public string notifyUrl = "http://ljx.pqpqpq.cn/page/webpage/notify.aspx";
        SybWxPayService sybService = new SybWxPayService();
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = Request["action"];
            string type = "";
            try
            {
                switch (action)
                {
                    case "nativepay":
                        type = Request["type"] == "wechat" ? "W01" : "A01";
                        NativePay(type);
                        break;
                }
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            Response.Write(JsonConvert.SerializeObject(result));
            Response.End();
        }

        #region 扫码支付
        public void NativePay(string type)
        {
            try
            {
                Dictionary<String, String> rsp = sybService.pay(1, DateTime.Now.ToFileTime().ToString(), type, "商品内容", "备注", "", "", notifyUrl, "");
                printRsp(rsp);
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
        }
        #endregion

        private void printRsp(Dictionary<String, String> rspDic)
        {
            //支付宝扫码 appid-----00000003; cusid-----990440148166000; payinfo-----https://qr.alipay.com/bax01106yz27w1vswuku2004; reqsn-----131336103913437500; retcode-----SUCCESS; key-----a0ea3fa20dbd7bb4d5abf1d59d63bae8; trxid-----331273538; trxstatus-----0000;
            string rsp = "{";
            int i = 0;
            foreach (var item in rspDic)
            {
                i++;
                rsp += "\"" + item.Key + "\":\"" + item.Value + "\"";
                if (rspDic.Count != i)
                {
                    rsp += ",";
                }

            }
            rsp += "}";
            this.result = rsp;
        }

    }
    public class ReturnParams
    {
        /// <summary>
        /// 平台分配的APPID
        /// </summary>
        public string appid { get; set; }
        /// <summary>
        /// 平台分配的商户号
        /// </summary>
        public string cusid { get; set; }
        /// <summary>
        /// 扫码支付则返回二维码字符串，开发者自行转化为二维码
        /// </summary>
        public string payinfo { get; set; }
        /// <summary>
        /// 商户的交易订单号
        /// </summary>
        public string reqsn { get; set; }
        /// <summary>
        /// 返回码
        /// </summary>
        public string retcode { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string key { get; set; }
        /// <summary>
        /// 收银宝平台的交易流水号
        /// </summary>
        public string trxid { get; set; }
        /// <summary>
        /// 交易的状态,对于刷卡支付，该状态表示实际的支付结果，其他为下单状态
        /// </summary>
        public string trxstatus { get; set; }
    }
}