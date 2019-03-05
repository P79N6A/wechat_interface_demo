using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Newtonsoft.Json;
using uniondemo.com.allinpay.syb;

namespace WebApp.page.webpage
{
    public partial class notify : System.Web.UI.Page
    {
        public string result = "";
        Model.qds117733100_dbEntities db = new Model.qds117733100_dbEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<String, String> reqParams = new Dictionary<String, String>();
            /**
             * 此处注意,因为通联收银宝以后可能增加字段,所以,这里一定要动态遍历获取所有的请求参数
             * 
             * */

            try
            {
                for (int i = 0; i < Request.Form.Count; i++)
                {
                    reqParams.Add(Request.Form.Keys[i], Request.Form[i].ToString());
                }

                string trxstatus = reqParams["trxstatus"];
                if (trxstatus == "0000")
                {
                    if (!reqParams.ContainsKey("sign"))//如果不包含sign,则不进行处理
                    {
                        Response.Write("error");
                        return;
                    }
                    if (AppUtil.validSign(reqParams, AppConstants.APPKEY))//验签成功
                    {
                        AddLog("--------入口：success-----");
                        //验签成功后,进行业务处理,处理完毕返回成功
                        Response.Write("success");
                    }
                    else
                    {
                        Response.Write("error");
                    }
                }
            }
            catch (Exception ex)
            {
                AddLog("--------错误信息：" + ex.Message + "-----");
            }



        }
        public string ReturnMsg(int status, string msg)
        {
            return JsonConvert.SerializeObject(new { status = status, msg = msg });
        }

        public void AddLog(string msg)
        {
            wx_log log = new wx_log();
            log.msg = msg;
            log.addTime = DateTime.Now;
            db.wx_log.Add(log);
            db.SaveChanges();
        }
    }
}