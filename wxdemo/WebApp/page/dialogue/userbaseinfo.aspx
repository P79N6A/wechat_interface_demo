<%@ Page Title="会员信息" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="userbaseinfo.aspx.cs" Inherits="WebApp.page.dialogue.userbaseinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
       <style type="text/css">
        .list-block {
            margin:0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content native-scroll" id="page-photo-browser">
        <div class="list-block">
            <ul>
                <!-- Text inputs -->
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">标识</div>
                            <div class="item-input">
                                <%=user.subscribe=="0"?"未关注，获取不到信息":"已关注" %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content" style="height:100px;">
                        <div class="item-inner">
                            <div class="item-title label">头像</div>
                            <div class="item-input">
                                <img src="<%=user.headimgurl %>" style="width: 80px; height: 80px; border-radius: 50%;" />
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">昵称</div>
                            <div class="item-input">
                                <%=user.nickname %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">openID</div>
                            <div class="item-input">
                               <%=user.openid %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">性别</div>
                            <div class="item-input">
                                <%=Enum.GetName(typeof(Utility.Enum_Sex),user.sex) %>
                            </div>
                        </div>
                    </div>
                </li>
                <!-- Date -->
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">省份</div>
                            <div class="item-input">
                                <%=user.province %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">城市</div>
                            <div class="item-input">
                                <%=user.city %>
                            </div>
                        </div>
                    </div>
                </li>
                <!-- Switch (Checkbox) -->
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">国家</div>
                            <div class="item-input">
                                <%=user.country %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">语言</div>
                            <div class="item-input">
                                <%=user.language %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">关注时间</div>
                            <div class="item-input">
                                <%=Utility.WxHelper.GetTime(user.subscribe_time).ToString("yyyy-MM-dd HH:mm:ss") %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">unionid</div>
                            <div class="item-input">
                                <%=user.unionid %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">remark</div>
                            <div class="item-input">
                                <%=user.remark %>
                            </div>
                        </div>
                    </div>
                </li>
                                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">groupid</div>
                            <div class="item-input">
                                <%=user.groupid %>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script type="text/javascript">
        function btn_updateuserremark() {
            var openid = $("#txtopenid").val();
            if (openid == "" || openid == null) {
                $.toast("openid不能为空");
                return;
            }

            var pams = {
                action: "getuserbaseinfo",
                openid: openid
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $.toast(data.msg);
                        //window.location = "usergroupmanager.aspx";
                    } else {
                        $.toast(data.msg);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }
    </script>
</asp:Content>
