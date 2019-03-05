using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Location
    {
        public int status { get; set; }
        public List<Result> result { get; set; } 
    }

    public class Result
    {
        public string x { get; set; }
        public string y { get; set; }
    }

}
