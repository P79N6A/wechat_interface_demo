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
    public partial class menuaddone : baseHandler
    {
        public List<wx_menu_type> typelist = new List<wx_menu_type>();
        protected void Page_Load(object sender, EventArgs e)
        {
            typelist = db.wx_menu_type.Where(c => true).ToList();
        }
    }
}