using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class TemplateInfo
    {
        public string touser { get; set; }
        public string template_id { get; set; }
        public string topcolor { get; set; }
        public string url { get; set; }
        public TemplateData data { get; set; }
    }
    public class TemplateData
    {
        public Param User { get; set; }
        public Param Date { get; set; }
        public Param CardNumber { get; set; }
        public Param Type { get; set; }
        public Param Money { get; set; }
        public Param DeadTime { get; set; }
        public Param Left { get; set; }
    }

    public class Param
    {
        public string value { get; set; }
        public string color { get; set; }
    }
}
