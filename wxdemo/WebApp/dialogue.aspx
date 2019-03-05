<%@ Page Title="对话接口" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="dialogue.aspx.cs" Inherits="WebApp.dialogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-block-title">基础支持</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_getaccesstoken()">获取access_token</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_getwxserverip()">获取微信服务器IP地址</a></p>
    </div>


    <div class="content-block-title">接受消息</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_validmessage()">验证消息真实性</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_receivemessage()">接收普通消息</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="alert('请前往公众号自定义菜单测试')">接收事件推送</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="alert('请前往公众号发送语音测试')">接收语音识别结果</a></p>
    </div>


    <div class="content-block-title">发送消息</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="alert('请前往公众号发送消息测试')">自动回复</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/customersend.aspx'">客服接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/mass.aspx'">群发接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/templatemessage.aspx'">模板消息（业务通知）</a></p>
    </div>


    <div class="content-block-title">用户管理</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/usergroupmanager.aspx'">用户分组管理</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/updateuserremark.aspx'">设置用户备注名</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/getuserbaseinfo.aspx'">获取用户基本信息</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/getuserlist.aspx'">获取用户列表</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/myaddressinfo.aspx?x=<%=x %>&y=<%=y %>'">获取用户地理位置</a></p>
    </div>


    <div class="content-block-title">推广支持</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/createqrcode.aspx'">生成带参数二维码</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/long2short.aspx'">长链接转短链接接口</a></p>
    </div>


    <div class="content-block-title">界面丰富</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/menu.aspx'">自定义菜单</a></p>
    </div>

    <div class="content-block-title">素材管理</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/materialmanager.aspx'">素材管理接口</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        //获取access_token
        function btn_getaccesstoken() {
            $.post("/handler/dialogueHandler.aspx", { action: "getaccesstoken" }, function (serverData) {
                var jsondata = $.parseJSON(serverData);
                if (jsondata.status == 0) {
                    alert(jsondata.data);
                } else {
                    alert(jsondata.msg);
                }
            });
        }
        //获取微信服务器ip
        function btn_getwxserverip() {
            $.post("/handler/dialogueHandler.aspx", { action: "getwxserverip" }, function (serverData) {
                var jsondata = $.parseJSON(serverData);
                if (jsondata.status == 0) {
                    alert(jsondata.data);
                } else {
                    alert(jsondata.msg);
                }
            });
        }

        //验证消息真实性
        function btn_validmessage() {
            alert("需要公众号发起请求才能测试");
        }

        //接收普通消息
        function btn_receivemessage() {
            alert("请在微信公众号操作");
        }

        //素材管理
        function materialmanager() {
            $.post("/handler/dialogueHandler.aspx", { action: "materialmanager" }, function (serverData) {
                var jsondata = $.parseJSON(serverData);
                if (jsondata.status == 0) {
                    alert(jsondata.data);
                } else {
                    alert(jsondata.msg);
                }
            });
        }
    </script>
</asp:Content>
