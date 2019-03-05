 using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using WebApp.service;
using Model;
using System.Text;
using System.IO;
using System.Net;

namespace WebApp.handler
{
    public partial class dialogueHandler : baseHandler
    {
        public object result = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = Request["action"];
            try
            {
                switch (action)
                {
                    case "getaccesstoken": GetAccessToken(); break;//获取access_token
                    case "getwxserverip": GetWxServerIP(); break;//获取微信服务器ip
                    case "materialmanager": GetMaterialManager(); break;//获取微信服务器ip
                    case "menuaddone": MenuAddOne(); break;//添加一级菜单
                    case "menuaddtwo": MenuAddTwo(); break;//添加二级菜单
                    case "menueditone": MenuEditOne(); break;//编辑一级菜单
                    case "menuedittwo": MenuEditTwo(); break;//编辑二级菜单
                    case "menudelete": MenuDelete(); break;//删除菜单
                    case "menuupdate": MenuUpdate(); break;//同步公众号菜单
                    case "createqrcode": CreateQRCode(); break;//生成二维码
                    case "long2short": Long2Short(); break;//长连接转短链接
                    case "customersend": CustomerSend(); break;//客服发送消息
                    case "createusergroup": CreateUserGroup(); break;//创建用户分组
                    case "selectallusergroup": SelectAllUserGroup(); break;//查询所有用户组
                    case "selectcurrentusergroup": SelectCurrentUserGroup(); break;//查询当前用户所在组
                    case "movecurrentusergroup": MoveCurrentUserGroup(); break;//移动用户分组
                    case "moveusergroup": MoveUserGroup(); break;//批量移动用户分组
                    case "updateusergroup": UpdateUserGroup(); break;//修改用户组名
                    case "deleteusergroup": DeleteUserGroup(); break;//删除用户组

                    case "updateuserremark": UpdateUserRemark(); break;//设置用户备注名
                    case "getuserbaseinfo": GetUserBaseInfo(); break;//获取用户基本信息
                    case "getuserlist": GetUserList(); break;//获取用户列表

                    case "massuploadimgtexturl": MassUploadImgTextUrl(); break;//上传图文消息内的图片获取URL
                    case "massuploadimgtext": MassUploadImgText(); break;//上传图文素材
                    case "massgroupsend": MassGroupSend(); break;//根据分组发送图文消息
                    case "massopenidsend": MassOpenIDSend(); break;//根据openid发送图文消息
                    case "massgroupsenddelete": MassGroupSendDelete(); break;//删除群发
                    case "masspreview": MassPreview(); break;//预览接口
                    case "massselectgroupsend": MassSelectGroupSend(); break;//查询群发消息发送状态

                    case "materialtemporaryadd": MaterialTemporaryAdd(); break;//新增临时素材
                    case "materialpermanentadd": MaterialPermanentAdd(); break;//新增永久素材
                    case "materialotherpermanentadd": MaterialOtherPermanentAdd(); break;//新增其他类型永久素材
                    case "materialpermanentdelete": MaterialPermanentDelete(); break;//删除永久素材
                    case "materialpermanentedit": MaterialPermanentEdit(); break;//编辑永久图文素材

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

        #region 获取access_token
        public void GetAccessToken()
        {
            result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", getAccessToken());
        }
        #endregion

        #region 获取微信服务器ip
        public void GetWxServerIP()
        {
            string str = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/getcallbackip?access_token=" + getAccessToken());

            result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", str);
        }
        #endregion

        #region 素材管理
        public void GetMaterialManager()
        {
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/media/upload?access_token=" + getAccessToken() + "&type=TYPE", "");
        }
        #endregion

        #region 添加一级菜单
        public void MenuAddOne()
        {
            int typeid = Convert.ToInt32(Request["menutype"]);
            if (typeid == 0)
            {
                throw new Exception("请选择菜单类型");
            }
            string name = Request["name"];
            if (string.IsNullOrEmpty(name))
            {
                throw new Exception("菜单名称不能为空");
            }
            if (name.Trim().Length > 4)
            {
                throw new Exception("菜单名称不能超过四个汉子");
            }
            string param = Request["params"];

            //if (string.IsNullOrEmpty(param))
            //{
            //    throw new Exception("菜单参数不能为空");
            //}

            //查询菜单个数
            var menucount = db.wx_menu.Where(c => c.pID == 0).Count();
            if (menucount >= 3)
            {
                throw new Exception("一级菜单不能超过3个");
            }

            wx_menu menu = new wx_menu();
            menu.name = name;
            menu.remark = param;
            menu.typeID = typeid;
            menu.pID = 0;
            menu.addTime = DateTime.Now;
            db.wx_menu.Add(menu);
            db.SaveChanges();

            result = Return_Msg(Enum_ReturnStatus.成功, "添加成功", null);
        }
        #endregion

        #region 添加二级菜单
        public void MenuAddTwo()
        {
            int menuid = Convert.ToInt32(Request["menu"]);
            if (menuid == 0)
            {
                throw new Exception("请选择一级菜单");
            }
            int typeid = Convert.ToInt32(Request["menutype"]);
            if (typeid == 0)
            {
                throw new Exception("请选择菜单类型");
            }
            string name = Request["name"];
            if (string.IsNullOrEmpty(name))
            {
                throw new Exception("菜单名称不能为空");
            }
            if (name.Trim().Length > 7)
            {
                throw new Exception("菜单名称不能超过七个汉子");
            }
            string param = Request["params"];

            if (string.IsNullOrEmpty(param))
            {
                throw new Exception("菜单参数不能为空");
            }

            //查询菜单个数
            var menucount = db.wx_menu.Where(c => c.pID == 0).Count();
            if (menucount >= 5)
            {
                throw new Exception("二级菜单不能超过5个");
            }

            wx_menu menu = new wx_menu();
            menu.name = name;
            menu.remark = param;
            menu.typeID = typeid;
            menu.pID = menuid;
            menu.addTime = DateTime.Now;
            db.wx_menu.Add(menu);
            db.SaveChanges();

            result = Return_Msg(Enum_ReturnStatus.成功, "添加成功", null);
        }
        #endregion

        #region 编辑一级菜单
        public void MenuEditOne()
        {
            int id;
            if (!int.TryParse(Request["id"], out id))
            {
                throw new Exception("参数错误");
            }
            var menu = db.wx_menu.Where(c => c.ID == id).FirstOrDefault();
            if (menu == null)
            {
                throw new Exception("该菜单不存在或已被删除");
            }

            int typeid = Convert.ToInt32(Request["menutype"]);
            if (typeid == 0)
            {
                throw new Exception("请选择菜单类型");
            }
            string name = Request["name"];
            if (string.IsNullOrEmpty(name))
            {
                throw new Exception("菜单名称不能为空");
            }
            if (name.Trim().Length > 4)
            {
                throw new Exception("菜单名称不能超过四个汉子");
            }
            string param = Request["params"];

            //if (string.IsNullOrEmpty(param))
            //{
            //    throw new Exception("菜单参数不能为空");
            //}

            //查询菜单个数
            var menucount = db.wx_menu.Where(c => c.pID == 0 && c.ID != menu.ID).Count();
            if (menucount >= 3)
            {
                throw new Exception("一级菜单不能超过3个");
            }

            menu.name = name;
            menu.remark = param;
            menu.typeID = typeid;
            menu.updateTime = DateTime.Now;
            db.SaveChanges();

            result = Return_Msg(Enum_ReturnStatus.成功, "编辑成功", null);
        }
        #endregion

        #region 编辑二级菜单
        public void MenuEditTwo()
        {
            int id;
            if (!int.TryParse(Request["id"], out id))
            {
                throw new Exception("参数错误");
            }
            var menu = db.wx_menu.Where(c => c.ID == id).FirstOrDefault();
            if (menu == null)
            {
                throw new Exception("该菜单不存在或已被删除");
            }

            int menuid = Convert.ToInt32(Request["menu"]);
            if (menuid == 0)
            {
                throw new Exception("请选择一级菜单");
            }
            int typeid = Convert.ToInt32(Request["menutype"]);
            if (typeid == 0)
            {
                throw new Exception("请选择菜单类型");
            }
            string name = Request["name"];
            if (string.IsNullOrEmpty(name))
            {
                throw new Exception("菜单名称不能为空");
            }
            if (name.Trim().Length > 7)
            {
                throw new Exception("菜单名称不能超过七个汉子");
            }
            string param = Request["params"];

            if (string.IsNullOrEmpty(param))
            {
                throw new Exception("菜单参数不能为空");
            }

            //查询菜单个数
            var menucount = db.wx_menu.Where(c => c.pID == 0 && c.ID != menu.ID).Count();
            if (menucount >= 5)
            {
                throw new Exception("二级菜单不能超过5个");
            }

            menu.name = name;
            menu.remark = param;
            menu.typeID = typeid;
            menu.pID = menuid;
            menu.updateTime = DateTime.Now;
            db.SaveChanges();

            result = Return_Msg(Enum_ReturnStatus.成功, "编辑成功", null);
        }
        #endregion

        #region 删除菜单
        public void MenuDelete()
        {
            int id;
            if (!int.TryParse(Request["id"], out id))
            {
                throw new Exception("参数错误");
            }

            int pid;
            if (!int.TryParse(Request["pid"], out pid))
            {
                throw new Exception("参数错误");
            }

            var model = db.wx_menu.Where(c => c.ID == id).FirstOrDefault();
            if (model == null)
            {
                throw new Exception("该菜单不存在或已被删除");
            }

            if (pid == 0)//一级菜单
            {
                var count = db.wx_menu.Where(c => c.pID == id).Count();
                if (count > 0)
                {
                    throw new Exception("请先删除该菜单下的二级菜单");
                }
            }

            //开始删除
            db.Entry<wx_menu>(model).State = System.Data.EntityState.Deleted;
            db.SaveChanges();

            result = Return_Msg(Enum_ReturnStatus.成功, "删除成功", null);

        }
        #endregion


        #region 更新公众号菜单
        public void MenuUpdate()
        {
            List<vyw_wx_menu_type> menulist = new List<vyw_wx_menu_type>();
            var list = db.vyw_wx_menu_type.Where(c => c.pID == 0).ToList();
            StringBuilder sb = new StringBuilder();
            if (list.Count > 0)
            {
                int i = 0;
                sb.Append("{\"button\":[");
                foreach (var item in list)
                {
                    string strtype1 = item.typeID == 1 ? "key" : "url";
                    i++;
                    var count = db.vyw_wx_menu_type.Where(c => c.pID == item.ID).Count();
                    if (count > 0)
                    {
                        sb.Append("{");
                        sb.Append("\"name\":\"" + item.name + "\",\"sub_button\":[");
                        var newlist = db.vyw_wx_menu_type.Where(c => c.pID == item.ID).ToList();
                        int j = 0;
                        foreach (var newitem in newlist)
                        {
                            string strtype = newitem.typeID == 1 ? "key" : "url";

                            j++;
                            sb.Append("{");
                            sb.Append("\"type\":\"" + newitem.typeValue + "\",\"name\":\"" + newitem.name + "\",\"" + strtype + "\":\"" + newitem.remark + "\"");
                            sb.Append("}");
                            if (newlist.Count != j)
                            {
                                sb.Append(",");
                            }
                        }
                        sb.Append("]}");
                    }
                    else
                    {
                        sb.Append("{");
                        sb.Append("\"type\":\"" + item.typeValue + "\", \"name\":\"" + item.name + "\", \"" + strtype1 + "\":\"" + item.remark + "\"");
                        sb.Append("}");
                    }
                    if (list.Count != i)
                    {
                        sb.Append(",");
                    }

                }
                sb.Append("]}");
            }

            string str = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + getAccessToken(), sb.ToString());

            morecustomerserviceadd model = JsonConvert.DeserializeObject<morecustomerserviceadd>(str);
            if (model.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "同步成功", null);
            }
            else
            {
                result = Return_Msg(Enum_ReturnStatus.失败, "同步失败", model.errmsg);
            }
        }
        #endregion

        #region 生成二维码
        public void CreateQRCode()
        {
            string pams = "{\"expire_seconds\": 2592000, \"action_name\": \"QR_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": 123}}}";
            string qrcode = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + getAccessToken(), pams);
            GetJsToken js = JsonConvert.DeserializeObject<GetJsToken>(qrcode);
            if (js.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + HttpUtility.UrlEncode(js.ticket));
            }
            else
            {
                result = Return_Msg(Enum_ReturnStatus.失败, "获取失败", js.errmsg);
            }
        }
        #endregion

        #region 长链接转短链接
        public void Long2Short()
        {
            string pams = "{\"action\":\"long2short\",\"long_url\":\"" + Request["link"] + "\"}";
            string qrcode = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/shorturl?access_token=" + getAccessToken(), pams);
            GetJsToken js = JsonConvert.DeserializeObject<GetJsToken>(qrcode);
            if (js.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", js.short_url);
            }
            else
            {
                result = Return_Msg(Enum_ReturnStatus.失败, "获取失败", js.errmsg);
            }
        }
        #endregion

        #region 客服发送消息
        public void CustomerSend()
        {
            UserInfo user = Session["usermodel"] as UserInfo;

            string text = Request["text"];
            string pams = "{\"touser\":\"" + user.openid + "\",\"msgtype\":\"text\",\"text\":{\"content\":\"" + text + "\"}}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=" + getAccessToken(), pams);

            morecustomerserviceadd str = JsonConvert.DeserializeObject<morecustomerserviceadd>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "发送成功", null);
            }
            else
            {
                result = Return_Msg(Enum_ReturnStatus.失败, "发送失败", str.errmsg);
            }
        }
        #endregion

        #region 创建用户分组
        public void CreateUserGroup()
        {
            string pams = "{\"group\":{\"name\":\"test\"}}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/groups/create?access_token=" + getAccessToken(), pams);

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "创建成功", str.group.id);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 查询所有用户组
        public void SelectAllUserGroup()
        {
            string data = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/groups/get?access_token=" + getAccessToken());

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "创建成功", JsonConvert.SerializeObject(str.groups));
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 查询当前用户所在组
        public void SelectCurrentUserGroup()
        {
            string pams = "{\"openid\":\"" + Request["openid"] + "\"}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/groups/getid?access_token=" + getAccessToken(), pams);

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "查询成功", str.groupid);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 移动用户分组
        public void MoveCurrentUserGroup()
        {
            string pams = "{\"openid\":\"" + Request["openid"] + "\",\"to_groupid\":" + Request["groupid"] + "}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=" + getAccessToken(), pams);

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "移动用户成功", null);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 批量移动用户分组
        public void MoveUserGroup()
        {
            string pams = "{\"openid_list\":[" + Request["openidlist"] + "],\"to_groupid\":" + Request["groupid"] + "}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/groups/members/batchupdate?access_token=" + getAccessToken(), pams);

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "批量移动用户成功", null);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 修改用户组名
        public void UpdateUserGroup()
        {
            string pams = "{\"group\":{\"id\":" + Request["id"] + ",\"name\":\"" + Request["name"] + "\"}}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/groups/update?access_token=" + getAccessToken(), pams);

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "修改成功", null);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 删除用户组
        public void DeleteUserGroup()
        {
            string pams = "{\"group\":{\"id\":" + Request["id"] + "}}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/groups/delete?access_token=" + getAccessToken(), pams);

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "删除成功", null);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 设置用户备注名
        public void UpdateUserRemark()
        {
            string pams = "{\"openid\":\"" + Request["openid"] + "\",\"remark\":\"" + Request["remark"] + "\"}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/user/info/updateremark?access_token=" + getAccessToken(), pams);

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "修改成功", null);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 获取用户基本信息
        public void GetUserBaseInfo()
        {
            string data = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + getAccessToken() + "&openid=" + Request["openid"] + "&lang=zh_CN");

            UserGroup str = JsonConvert.DeserializeObject<UserGroup>(data);
            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "修改成功", null);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 获取用户列表
        public void GetUserList()
        {
            string data = RequestType.HttpGet("https://api.weixin.qq.com/cgi-bin/user/get?access_token=" + getAccessToken() + "&next_openid=");

            UserList str = JsonConvert.DeserializeObject<UserList>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "获取成功", JsonConvert.SerializeObject(str));
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 上传图文消息内的图片获取URL
        public void MassUploadImgTextUrl()
        {
            WebClient wxUpload = new WebClient();
            string uploadPath = "/uploads/";
            string folder = Server.MapPath(uploadPath);
            //自动创建目录
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }
            HttpPostedFile file = Request.Files.Get(0);
            if (Request.Files.Get(0).ContentLength <= 0)
            {
                Response.Write("<script>alert('上传失败,请选择图片。');window.history.go(-1);</script>");
            }

            string filename = folder + file.FileName;
            file.SaveAs(filename);
            //API所需的媒体信息
            wxUpload.Headers.Add("Content-Type", file.ContentType);
            wxUpload.Headers.Add("filename", file.FileName);
            wxUpload.Headers.Add("filelength", file.ContentLength.ToString());
            byte[] result1 =
                wxUpload.UploadFile(
                    new Uri(string.Format(
                        "https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token={0}&type={1}",
                        getAccessToken(),
                        "image")), filename);
            string resultjson = Encoding.UTF8.GetString(result1); //在这里获取json数据，获得图片URL

            Media str = JsonConvert.DeserializeObject<Media>(resultjson);

            //result = Return_Msg(Enum_ReturnStatus.成功, "上传成功", str.url);

            //Log(str.url);
            if (str.errcode == 0)
            {
                Response.Write("<script>alert('上传成功');window.location='/page/dialogue/mass.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('上传失败：" + str.errmsg + "');window.location='/page/dialogue/mass.aspx';</script>");
            }
        }
        #endregion

        #region 上传图文素材
        public void MassUploadImgText()
        {
            string title = Request["title"];
            if (string.IsNullOrEmpty(title))
            {
                throw new Exception("标题不能为空");
            }
            string mediaid = Request["mediaid"];
            if (string.IsNullOrEmpty(mediaid))
            {
                throw new Exception("素材id不能为空");
            }
            string author = Request["author"];
            if (string.IsNullOrEmpty(author))
            {
                throw new Exception("作者不能为空");

            }

            string digest = Request["digest"];


            int isshow = Convert.ToInt32(Request["isshow"]);

            string content = Request["content"];
            if (string.IsNullOrEmpty(content))
            {
                throw new Exception("具体内容不能为空");
            }
            string sourceurl = Request["sourceurl"];
            if (string.IsNullOrEmpty(sourceurl))
            {
                throw new Exception("原文地址不能为空");
            }
            articles item = new articles();
            item.title = title;
            item.author = author;
            item.thumb_media_id = mediaid;
            item.digest = digest;
            item.show_cover_pic = isshow;
            item.content = content;
            item.content_source_url = sourceurl;

            string pams = "{\"articles\": [" + JsonConvert.SerializeObject(item) + "]}";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/media/uploadnews?access_token=" + getAccessToken(), pams);

            UploadJsonResult str = JsonConvert.DeserializeObject<UploadJsonResult>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "上传成功", data);
            }
            else
            {
                throw new Exception("上传失败:" + str.errmsg);
            }

        }
        #endregion

        #region 根据分组发送图文消息
        public void MassGroupSend()
        {
            string type = Request["type"];
            string usergroup = Request["usergroup"];
            string mediaid = Request["mediaid"];

            string typepams = "media_id";
            if (type == "text")
            {
                typepams = "content";
            }

            string pams = "{\"filter\":{\"is_to_all\":false,\"group_id\":\"" + usergroup + "\"},\"" + type + "\":{\"" + typepams + "\":\"" + mediaid + "\"},\"msgtype\":\"" + type + "\"}";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/message/mass/sendall?access_token=" + getAccessToken(), pams);

            baseReturn str = JsonConvert.DeserializeObject<baseReturn>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "发送成功", str.errmsg);
            }
            else
            {
                //Log(data);
                throw new Exception(data);
            }

        }
        #endregion

        #region 根据openid发送图文消息
        public void MassOpenIDSend()
        {
            string type = Request["type"];
            string openid = Request["openid"];
            string mediaid = Request["mediaid"];

            string openidlist = "";
            if (openid.IndexOf(',')>0)
            {
                string[] arr = openid.Split(',');
                for (int i = 0; i < arr.Length; i++)
                {
                    openidlist += "\"" + arr[i] + "\"";
                    if (i!=arr.Length-1)
                    {
                        openidlist += ",";
                    }
                }
            }
            else
            {
                throw new Exception("openid需要两个以上");
            }

            string typepams = "media_id";
            if (type == "text")
            {
                typepams = "content";
            }

            string pams = "{\"touser\":[" + openidlist + "],\"" + type + "\":{\"" + typepams + "\":\"" + mediaid + "\"},\"msgtype\":\"" + type + "\"}";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=" + getAccessToken(), pams);

            baseReturn str = JsonConvert.DeserializeObject<baseReturn>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "发送成功", data);
            }
            else
            {
               // Log(data);
                throw new Exception(data);
            }

        }
        #endregion

        #region 删除群发
        public void MassGroupSendDelete()
        {
            string magid = Request["magid"];

            string pams = "{\"msg_id\":" + magid + "}";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/message/mass/delete?access_token=" + getAccessToken(), pams);

            baseReturn str = JsonConvert.DeserializeObject<baseReturn>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "删除成功", str.errmsg);
            }
            else
            {
                //Log(data);
                throw new Exception(data);
            }

        }
        #endregion

        #region 预览接口
        public void MassPreview()
        {
            UserInfo user = Session["usermodel"] as UserInfo;

            string type = Request["type"];
            string openid = user.openid;
            string mediaid = Request["mediaid"];

            string typepams = "media_id";
            if (type == "text")
            {
                typepams = "content";
            }

            string pams = "{\"touser\":\"" + openid + "\",\"" + type + "\":{\"" + typepams + "\":\"" + mediaid + "\"},\"msgtype\":\"" + type + "\"}";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/message/mass/preview?access_token=" + getAccessToken(), pams);

            baseReturn str = JsonConvert.DeserializeObject<baseReturn>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "预览成功", data);
            }
            else
            {
                //Log(data);
                throw new Exception(data);
            }

        }
        #endregion

        #region 查询群发消息发送状态
        public void MassSelectGroupSend()
        {
            string magid = Request["magid"];

            string pams = "{\"msg_id\":" + magid + "}";

            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/message/mass/get?access_token=" + getAccessToken(), pams);

            baseReturn str = JsonConvert.DeserializeObject<baseReturn>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "查询成功", str.errmsg);
            }
            else
            {
                //Log(data);
                throw new Exception(data);
            }

        }
        #endregion

        #region 素材管理

        #region 新增临时素材
        public void MaterialTemporaryAdd()
        {
            string type = Request["type"];

            WebClient wxUpload = new WebClient();
            string uploadPath = "~/uploads/";
            string folder = Server.MapPath(uploadPath);
            //自动创建目录
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }
            HttpPostedFile file = Request.Files.Get(0);
            string filename = folder + file.FileName;
            file.SaveAs(filename);
            //API所需的媒体信息
            wxUpload.Headers.Add("Content-Type", file.ContentType);
            wxUpload.Headers.Add("filename", file.FileName);
            wxUpload.Headers.Add("filelength", file.ContentLength.ToString());
            byte[] result1 =
                wxUpload.UploadFile(
                    new Uri(string.Format(
                        "https://api.weixin.qq.com/cgi-bin/media/upload?access_token={0}&type={1}",
                        getAccessToken(),
                        type)), filename);
            string resultjson = Encoding.UTF8.GetString(result1); //在这里获取json数据，获得图片URL

            UploadJsonResult str = JsonConvert.DeserializeObject<UploadJsonResult>(resultjson);
            if (str.errcode == 0)
            {
                Response.Write("<script>alert('新增成功');window.location='materialmanager.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('新增失败：" + str.errmsg + "');window.location='materialmanager.aspx';</script>");
            }
        }
        #endregion

        #region 新增永久素材
        public void MaterialPermanentAdd()
        {

            string title = Request["title"];
            if (string.IsNullOrEmpty(title))
            {
                throw new Exception("标题不能为空");
            }
            string mediaid = Request["mediaid"];
            if (string.IsNullOrEmpty(mediaid))
            {
                throw new Exception("素材id不能为空");
            }
            string author = Request["author"];
            if (string.IsNullOrEmpty(author))
            {
                throw new Exception("作者不能为空");

            }

            string digest = Request["digest"];


            int isshow = Convert.ToInt32(Request["isshow"]);

            string content = Request["content"];
            if (string.IsNullOrEmpty(content))
            {
                throw new Exception("具体内容不能为空");
            }
            string sourceurl = Request["sourceurl"];
            if (string.IsNullOrEmpty(sourceurl))
            {
                throw new Exception("原文地址不能为空");
            }
            articles item = new articles();
            item.title = title;
            item.author = author;
            item.thumb_media_id = mediaid;
            item.digest = digest;
            item.show_cover_pic = isshow;
            item.content = content;
            item.content_source_url = sourceurl;

            string pams = "{\"articles\": [" + JsonConvert.SerializeObject(item) + "]}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=" + getAccessToken(), pams);

            UploadJsonResult str = JsonConvert.DeserializeObject<UploadJsonResult>(data);

            if (str.errcode==0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功,"添加成功",str.media_id);
            }
            else
            {
                throw new Exception(data);
            }
        }
        #endregion

        #region 新增其他类型永久素材
        public void MaterialOtherPermanentAdd()
        {
            string type = Request["type"];
            WebClient wxUpload = new WebClient();
            string uploadPath = "/uploads/";
            string folder = Server.MapPath(uploadPath);
            //自动创建目录
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }
            HttpPostedFile file = Request.Files.Get(0);
            string filename = folder + file.FileName;
            file.SaveAs(filename);
            //API所需的媒体信息
            wxUpload.Headers.Add("Content-Type", file.ContentType);
            wxUpload.Headers.Add("filename", file.FileName);
            wxUpload.Headers.Add("filelength", file.ContentLength.ToString());
            string videopams = "";
            if (type == "video")
            {
                videopams = "{\"title\":\"test\",\"introduction\":\"testcontent\"}";
                wxUpload.Headers.Add("description", videopams);
            }

            byte[] result1 =
                wxUpload.UploadFile(
                    new Uri(string.Format(
                        "https://api.weixin.qq.com/cgi-bin/material/add_material?access_token={0}&type={1}",
                        getAccessToken(), "image")), filename);
            string resultjson = Encoding.UTF8.GetString(result1); //在这里获取json数据，获得图片URL

            UploadJsonResult str = JsonConvert.DeserializeObject<UploadJsonResult>(resultjson);

            if (str.errcode == 0)
            {
                Response.Write("<script>alert('新增成功');window.location='materialmanager.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('新增失败：" + resultjson + "');window.location='materialmanager.aspx';</script>");
            }
        }
        #endregion

        #region 删除永久素材
        public void MaterialPermanentDelete()
        {
            string mediaid = Request["mediaid"];
            string pams = "{\"media_id\":\"" + mediaid + "\"}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/material/del_material?access_token=" + getAccessToken(), pams);

            baseReturn str = JsonConvert.DeserializeObject<baseReturn>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "删除成功", null);
            }
            else
            {
                throw new Exception(str.errmsg);
            }
        }
        #endregion

        #region 编辑永久图文素材
        public void MaterialPermanentEdit()
        {
            string mediaid = Request["mediaid"];
            string index = Request["index"];
            string title = Request["title"];
            string thumb_media_id = Request["thumb_media_id"];
            string author = Request["author"];
            string digest = Request["digest"];
            int isshow = Convert.ToInt32(Request["ishow"]);
            string content = Request["content"];
            string sourceurl = Request["sourceurl"];

            articles item = new articles();
            item.title = title;
            item.author = author;
            item.thumb_media_id = mediaid;
            item.digest = digest;
            item.show_cover_pic = isshow;
            item.content = content;
            item.content_source_url = sourceurl;


            string pams = "{\"media_id\":\"" + mediaid + "\",\"index\":" + index + ", \"articles\": " + JsonConvert.SerializeObject(item) + "}";
            string data = RequestType.HttpPost("https://api.weixin.qq.com/cgi-bin/material/update_news?access_token=" + getAccessToken(), pams);

            baseReturn str = JsonConvert.DeserializeObject<baseReturn>(data);

            if (str.errcode == 0)
            {
                result = Return_Msg(Enum_ReturnStatus.成功, "删除成功", null);
            }
            else
            {
                throw new Exception(data);
            }
        }
        #endregion
        #endregion
    }
}