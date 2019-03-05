using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.handler;

namespace WebApp.page.dialogue
{
    public partial class masspreview : baseHandler
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usermodel"] == null)
            {
                Response.Redirect("/member.aspx?redirecturl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
            }
        }
    }
}