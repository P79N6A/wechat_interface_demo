using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Newtonsoft.Json;
using Utility;
using WebApp.handler;

namespace WebApp.page.dialogue
{
    public partial class myaddressinfo : baseHandler
    {
        public Address adderss = new Address();
        protected void Page_Load(object sender, EventArgs e)
        {
            string x = Request["x"];
            string y = Request["y"];

            string address = RequestType.HttpGet("http://api.map.baidu.com/geocoder/v2/?location=" + x + "," + y + "&output=json&pois=1&ak=EuF8VnvpoIxvLKdmyQOuMPSpbE9ErZe4");
            adderss = JsonConvert.DeserializeObject<Address>(address);
        }
    }
}