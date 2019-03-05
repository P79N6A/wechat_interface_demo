using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Address
    {
        public int status { get; set; }
        public Detail result { get; set; }
    }

    public class Detail
    {
        public location location { get; set; }
        public string formatted_address { get; set; }
        public string business { get; set; }
        public detaillocation addressComponent { get; set; }
        public List<pois> pois { get; set; }
        public List<poiRegions> poiRegions { get; set; }
        public string sematic_description { get; set; }
        public string cityCode { get; set; }
    }

    public class location
    {
        public string lng { get; set; }

        public string lat { get; set; }
    }

    public class detaillocation
    {
        public string country { get; set; }
        public int country_code { get; set; }
        public string province { get; set; }
        public string city { get; set; }
        public string district { get; set; }
        public string adcode { get; set; }
        public string street { get; set; }
        public string street_number { get; set; }
        public string direction { get; set; }
        public string distance { get; set; }
    }

    public class pois
    {
        public string addr { get; set; }
        public string cp { get; set; }
        public string direction { get; set; }
        public string distance { get; set; }
        public string name { get; set; }
        public string poiType { get; set; }
        public point point { get; set; }
        public string tag { get; set; }
        public string tel { get; set; }
        public string uid { get; set; }
        public string zip { get; set; }

    }
    public class point
    {
        public string x { get; set; }
        public string y { get; set; }
    }

    public class poiRegions
    {

    }
}
