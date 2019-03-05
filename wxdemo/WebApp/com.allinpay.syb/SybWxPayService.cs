using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace uniondemo.com.allinpay.syb
{
    public class SybWxPayService
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="trxamt">交易金额</param>
        /// <param name="reqsn">商户交易单号</param>
        /// <param name="paytype">交易方式</param>
        /// <param name="body">订单标题</param>
        /// <param name="remark">备注</param>
        /// <param name="acct">支付平台用户标识</param>
        /// <param name="authcode"></param>
        /// <param name="notify_url">回调地址</param>
        /// <param name="limit_pay">支付限制</param>
        /// <returns></returns>
        public Dictionary<String,String> pay(long trxamt,String reqsn,String paytype,String body,String remark,String acct,String authcode,String notify_url,String limit_pay){
		    Dictionary<String,String> paramDic = buildBasicParam();
		    paramDic.Add("trxamt", trxamt.ToString());
		    paramDic.Add("reqsn", reqsn);
		    paramDic.Add("paytype", paytype);
		    paramDic.Add("body", body);
		    paramDic.Add("remark", remark);
            paramDic.Add("acct", acct);
		    paramDic.Add("authcode", authcode);
		    paramDic.Add("notify_url", notify_url);
		    paramDic.Add("limit_pay", limit_pay);
		    paramDic.Add("sign", AppUtil.signParam(paramDic,AppConstants.APPKEY));
            return doRequest(paramDic,"/pay");
	    }

        public Dictionary<String,String> cancel(long trxamt,String reqsn,String oldtrxid,String oldreqsn){
		    Dictionary<String,String> paramDic = buildBasicParam();
		    paramDic.Add("trxamt", trxamt.ToString());
		    paramDic.Add("reqsn", reqsn);
		    paramDic.Add("oldtrxid", oldtrxid);
		    paramDic.Add("oldreqsn", oldreqsn);
		    paramDic.Add("sign", AppUtil.signParam(paramDic,AppConstants.APPKEY));
		    return doRequest(paramDic,"/cancel");
	    }

        public Dictionary<String,String> refund(long trxamt,String reqsn,String oldtrxid,String oldreqsn){
		    Dictionary<String,String> paramDic = buildBasicParam();
		    paramDic.Add("trxamt", trxamt.ToString());
		    paramDic.Add("reqsn", reqsn);
		    paramDic.Add("oldtrxid", oldtrxid);
		    paramDic.Add("oldreqsn", oldreqsn);
		    paramDic.Add("sign", AppUtil.signParam(paramDic,AppConstants.APPKEY));
		    return doRequest(paramDic,"/refund");
	    }

        public Dictionary<String,String> query(String reqsn,String trxid){
		    Dictionary<String,String> paramDic = buildBasicParam();
		    paramDic.Add("reqsn", reqsn);
		    paramDic.Add("trxid", trxid);
		    paramDic.Add("sign", AppUtil.signParam(paramDic,AppConstants.APPKEY));
            return doRequest(paramDic, "/query");
	    }


        private Dictionary<String, String> buildBasicParam(){
            Dictionary<String,String> paramDic = new Dictionary<String,String>();
		    paramDic.Add("cusid", AppConstants.CUSID);
		    paramDic.Add("appid", AppConstants.APPID);
		    paramDic.Add("version", AppConstants.APIVERSION);
            paramDic.Add("randomstr", DateTime.Now.ToFileTime().ToString());
            return paramDic;

        }

        private Dictionary<String, String> doRequest(Dictionary<String, String> param, String url)
        {
            String rsp = HttpUtil.CreatePostHttpResponse(AppConstants.API_URL + url, param, Encoding.UTF8);
            Dictionary<String, String> rspDic = (Dictionary<String, String>)JsonConvert.DeserializeObject(rsp, typeof(Dictionary<String, String>));
            if ("SUCCESS".Equals(rspDic["retcode"]))//验签
            {
                String signRsp = rspDic["sign"];
                rspDic.Remove("sign");
                String sign = AppUtil.signParam(rspDic, AppConstants.APPKEY);
                if (signRsp.Equals(sign))
                {
                    return rspDic;
                }
                else
                    throw new Exception("验签失败");

            }
            else
            {
                throw new Exception(rspDic["retmsg"]);
            }
        }
    }
}