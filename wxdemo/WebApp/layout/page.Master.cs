using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.layout
{
    public partial class page : System.Web.UI.MasterPage
    {
        public string str1 = "", str2 = "", str3 = "", str4 = "", str5 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string str = Request.Url.AbsolutePath;
            switch (str)
            {
                case "/index.aspx":
                    str1 = "active";
                    break;
                case "/dialogue.aspx":
                    str2 = "active";
                    break;
                case "/webpage.aspx":
                    str3 = "active";
                    break;
                case "/function.aspx":
                    str4 = "active";
                    break;
                case "/member.aspx":
                    str5 = "active";
                    break;
                default:
                    str1 = "active";
                    break;
            }
        }
    }
}