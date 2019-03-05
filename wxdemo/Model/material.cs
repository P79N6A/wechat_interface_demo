using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class material
    {
        public int total_count { get; set; }
        public int item_count { get; set; }
        public List<item> item { get; set; }

    }

    public class item
    {
        public string media_id { get; set; }
        public content content { get; set; }
        public string name { get; set; }
        public string url { get; set; }
        public string update_time { get; set; }

    }

    public class content
    {
        public List<news_item> news_item { get; set; }
        public string errmsg { get; set; }
        public int errcode { get; set; }
    }

    public class news_item
    {
        public string title { get; set; }
        public string thumb_media_id { get; set; }
        public int show_cover_pic { get; set; }
        public string author { get; set; }
        public string digest { get; set; }
        public string content { get; set; }
        public string content_source_url { get; set; }
        public string url { get; set; }

        public string description { get; set; }
        public string down_url { get; set; }

       


    }
}
