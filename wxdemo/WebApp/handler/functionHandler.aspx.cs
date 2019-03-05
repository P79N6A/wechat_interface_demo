using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using Model;
using WebApp.service;

namespace WebApp.handler
{
    public partial class functionHandler : baseHandler
    {
        public object result = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = Request["action"];
            try
            {
                switch (action)
                {
                    case "morecustomerservice": GetCustomerLog(); break;//获取多客服聊天记录
                    case "customerservicebaseinfo": GetCustomerBaseInfo(); break;//获取客服基本信息
                    case "customerservicereceiveinfo": GetCustomerReceiveInfo(); break;//获取在线客服接待信息
                    case "customerserviceadd": GetCustomerAdd(); break;//添加客服账号
                    case "customerserviceupdate": GetCustomerUpdate(); break;//设置客服账号
                    case "customerserviceuploadimg": GetCustomerUploadImg(); break;//上传客服头像
                    case "customerservicedelete": GetCustomerDelete(); break;//删除客服账号

                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                result = Return_Msg(Enum_ReturnStatus.失败, ex.Message, null);
            }

            Response.Write(result);
        }

        #region 获取多客服聊天记录
        public void GetCustomerLog()
        {
            DateTime stime;
            if (!DateTime.TryParse(Request["stime"], out stime))
            {
                throw new Exception("开始时间格式不正确");
            }
            DateTime etime;
            if (!DateTime.TryParse(Request["etime"], out etime))
            {
                throw new Exception("结束时间格式不正确");
            }

            int pageindex;
            if (!int.TryParse(Request["pageindex"], out pageindex))
            {
                throw new Exception("查询页格式不正确");
            }

            int pagesize;
            if (!int.TryParse(Request["pagesize"], out pagesize))
            {
                throw new Exception("页容量格式不正确");
            }

            // "endtime" : 987654321,
            //"pageindex" : 1,
            //"pagesize" : 10,
            //"starttime" : 123456789

            string pams = "&endtime=" + WxHelper.getTimestamp(etime) + "&pageindex=" + pageindex + "&pagesize=" + pagesize + "&starttime=" + stime;


            string post = RequestType.HttpPost("https://api.weixin.qq.com/customservice/msgrecord/getrecord?access_token=" + getAccessToken(), pams);

            //{
            //    "errcode": 0,
            //    "errmsg": "",
            //    "retcode": 0,
            //    "recordlist" : [
            //       {
            //          "openid" : "oDF3iY9WMaswOPWjCIp_f3Bnpljk",
            //          "opercode" : 2002,
            //          "text" : " 您好，客服test1为您服务。",
            //          "time" : 1400563710,
            //          "worker" : "test1"
            //       },
            //       {
            //          "openid" : "oDF3iY9WMaswOPWjCIp_f3Bnpljk",
            //          "opercode" : 2003,
            //          "text" : "你好，有什么事情？",
            //          "time" : 1400563731,
            //          "worker" : "test1"
            //       }
            //    ]
            // }

            morecustomerservice returndata =  JsonConvert.DeserializeObject<morecustomerservice>(post);

            if (returndata.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", returndata.recordlist);
            }
            else
            {
                throw new Exception("获取失败");
            }
        }
        #endregion

        #region 获取客服基本信息
        public void GetCustomerBaseInfo()
        {
            string data = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/customservice/getkflist?access_token=" + getAccessToken());
             //{
             //   "kf_list" : [
             //       {
             //           "kf_account" : "test1@test",
             //           "kf_headimgurl" : "http://mmbiz.qpic.cn/mmbiz/4whpV1VZl2iccsvYbHvnphkyGtnvjfUS8Ym0GSaLic0FD3vN0V8PILcibEGb2fPfEOmw/0",
             //           "kf_id" : "1001",
             //           "kf_nick" : "ntest1"
             //       },
             //       {
             //           "kf_account" : "test2@test",
             //           "kf_headimgurl" : "http://mmbiz.qpic.cn/mmbiz/4whpV1VZl2iccsvYbHvnphkyGtnvjfUS8Ym0GSaLic0FD3vN0V8PILcibEGb2fPfEOmw/0",
             //           "kf_id" : "1002",
             //           "kf_nick" : "ntest2"
             //       },
             //       {
             //           "kf_account" : "test3@test",
             //           "kf_headimgurl" : "http://mmbiz.qpic.cn/mmbiz/4whpV1VZl2iccsvYbHvnphkyGtnvjfUS8Ym0GSaLic0FD3vN0V8PILcibEGb2fPfEOmw/0",
             //           "kf_id" : "1003",
             //           "kf_nick" : "ntest3"
             //       }
             //   ]
             //   }

            morecustomerbaseinfo baseinfo = JsonConvert.DeserializeObject<morecustomerbaseinfo>(data);

            if (data!=null)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", baseinfo.kf_list);
            }
            else
            {
                throw new Exception("获取失败");
            }

        }
        #endregion

        #region 获取在线客服接待信息
        public void GetCustomerReceiveInfo()
        {
            string data = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/customservice/getonlinekflist?access_token=" + getAccessToken());

            //{
            //   "kf_online_list": [
            //       {
            //           "kf_account": "test1@test", 
            //           "status": 1, 
            //           "kf_id": "1001", 
            //           "auto_accept": 0, 
            //           "accepted_case": 1
            //       },
            //       {
            //           "kf_account": "test2@test", 
            //           "status": 1, 
            //           "kf_id": "1002", 
            //           "auto_accept": 0, 
            //           "accepted_case": 2
            //       }
            //   ]
            //}

            morecustomeronreceiveinfo receiveinfo = JsonConvert.DeserializeObject<morecustomeronreceiveinfo>(data);

            if (receiveinfo!=null)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", receiveinfo.kf_online_list);
            }
            else
            {
                throw new Exception("获取失败");
            }
        }
        #endregion

        #region 添加客服账号
        public void GetCustomerAdd()
        {
            // "kf_account" : "test1@test",
            //"nickname" : "客服1",
            //"password" : "96e79218965eb72c92a549dd5a330112"

            string pams = "&kf_account=test1@test&nickname=客服1&password=96e79218965eb72c92a549dd5a330112";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/customservice/kfaccount/add?access_token=" + getAccessToken(), pams);

            morecustomerserviceadd post = JsonConvert.DeserializeObject<morecustomerserviceadd>(data);

            if (post.errcode==0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", "添加成功");
            }
            else
            {
                throw new Exception("获取失败");
            }
        }
        #endregion

        #region 设置客服账号
        public void GetCustomerUpdate()
        {
            // "kf_account" : "test1@test",
            //"nickname" : "客服1",
            //"password" : "96e79218965eb72c92a549dd5a330112"

            string pams = "&kf_account=test1@test&nickname=客服1&password=96e79218965eb72c92a549dd5a330112";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/customservice/kfaccount/update?access_token=" + getAccessToken(), pams);

            morecustomerserviceadd post = JsonConvert.DeserializeObject<morecustomerserviceadd>(data);

            if (post.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", "设置成功");
            }
            else
            {
                throw new Exception("获取失败");
            }
        }
        #endregion

        #region 上传客服头像
        public void GetCustomerUploadImg()
        {
            // "kf_account" : "test1@test",
            //"nickname" : "客服1",
            //"password" : "96e79218965eb72c92a549dd5a330112"

            string data = RequestType.HttpPost("http://api.weixin.qq.com/customservice/kfaccount/uploadheadimg?access_token=" + getAccessToken() + "&kf_account=test1@test", "");

            morecustomerserviceadd post = JsonConvert.DeserializeObject<morecustomerserviceadd>(data);

            if (post.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", "设置成功");
            }
            else
            {
                throw new Exception("获取失败");
            }
        }
        #endregion

        #region 删除客服账号
        public void GetCustomerDelete()
        {
            // "kf_account" : "test1@test",
            //"nickname" : "客服1",
            //"password" : "96e79218965eb72c92a549dd5a330112"

            //string pams = "&kf_account=test1@test&nickname=客服1&password=96e79218965eb72c92a549dd5a330112";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/customservice/kfaccount/del?access_token=" + getAccessToken() + "&kf_account=test1@test", "");

            morecustomerserviceadd post = JsonConvert.DeserializeObject<morecustomerserviceadd>(data);

            if (post.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", "设置成功");
            }
            else
            {
                throw new Exception("获取失败");
            }
        }
        #endregion
    }
}