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
    public partial class menulist : baseHandler
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public List<wx_menu> GetList()
        {
            List<wx_menu> menulist = new List<wx_menu>();
            var list = db.wx_menu.Where(c => c.pID == 0).ToList();
            if (list.Count > 0)
            {
                foreach (var item in list)
                {
                    menulist.Add(item);
                    var newlist = db.wx_menu.Where(c => c.pID == item.ID).ToList();
                    foreach (var newitem in newlist)
                    {
                        newitem.name = "&nbsp;&nbsp;" + newitem.name;
                        menulist.Add(newitem);
                    }
                }
            }

            return menulist;
        }
    }
}