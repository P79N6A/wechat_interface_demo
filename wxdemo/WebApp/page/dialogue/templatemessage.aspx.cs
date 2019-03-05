using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using WebApp.handler;

namespace WebApp.page.dialogue
{
    public partial class templatemessage : baseHandler
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usermodel"] == null)
            {
                Response.Redirect("/member.aspx?redirecturl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
            }
            else
            {
                UserInfo user = Session["usermodel"] as UserInfo;

                SendTemplateMessage(user.openid);
                Response.Write("<script>alert('发送成功');window.history.go(-1);</script>");
            }
        }
    }
}