using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;

namespace WebApp.service
{
    public class SiteConfig
    {
        #region 实现该类的单例
        private static SiteConfig _instance = new SiteConfig();
        private SiteConfig()
        {
            //公用方法
        }
        public static SiteConfig Instance
        {
            get
            {
                return _instance;
            }
        }
        #endregion

        public string AppID = "wxc2bcd38162148136";
        public string AppSecret = "9e0f9ca6f2a75993f1a25e6e4584d53d";

    }
}