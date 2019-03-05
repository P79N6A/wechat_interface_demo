using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.handler;

namespace WebApp.page.dialogue
{
    public partial class masssendresult : baseHandler
    {
        public string result = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(msgresult))
            {
                Response.Write("<script>alert('还没有群发过消息');window.location='/page/dialogue/mass.aspx'</script>");           
            }
            else
            {
                result = msgresult;
            }
        }
    }
}