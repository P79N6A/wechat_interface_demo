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
    public partial class menuedittwo : baseHandler
    {
        public List<wx_menu_type> typelist = new List<wx_menu_type>();
        public List<wx_menu> menulist = new List<wx_menu>();
        public wx_menu menumodel = new wx_menu();
        protected void Page_Load(object sender, EventArgs e)
        {
            typelist = db.wx_menu_type.Where(c => true).ToList();

            menulist = db.wx_menu.Where(c => c.pID == 0).ToList();

            int id;
            if (!int.TryParse(Request["id"], out id))
            {
                Response.Write("<script>window.history.go(-1)</script>");
            }

            menumodel = db.wx_menu.Where(c => c.ID == id).FirstOrDefault();
        }
    }
}