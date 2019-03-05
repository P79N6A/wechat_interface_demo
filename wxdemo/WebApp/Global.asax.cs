using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Threading;
using Utility;
using WebApp.service;

namespace WebApp
{
    public class Global : System.Web.HttpApplication
    {
        public qds117733100_dbEntities db1 = new qds117733100_dbEntities();
        protected void Application_Start(object sender, EventArgs e)
        {
            Thread th = new Thread(start_thread);
            th.IsBackground = true;
            th.Start();
        }

        protected void start_thread()
        {
            while (true)
            {
                try
                {
                    ConvertParams data = WxHelper.GetAccessToken(SiteConfig.Instance.AppID, SiteConfig.Instance.AppSecret);

                    if (data != null)
                    {
                        var model = db1.wx_settings.Where(c => c.ID == 1).FirstOrDefault();
                        string ticketzj = WxHelper.Getjsapi_ticket(data.access_token);
                        model.access_token = data.access_token;
                        model.jsapi_ticket = ticketzj;
                        model.updateTime = DateTime.Now;
                        db1.SaveChanges();
                        // 休眠7000秒    
                        Thread.Sleep((data.expires_in - 200) * 1000);    
                    }
                    else
                    {
                        // 如果access_token为null，60秒后再获取    
                        Thread.Sleep(60 * 1000);    
                    }
                }
                catch (Exception)
                {
                    Thread.Sleep(60 * 1000);
                }
               

                
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}