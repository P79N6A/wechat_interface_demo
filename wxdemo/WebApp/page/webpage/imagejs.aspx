<%@ Page Title="js接口" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="imagejs.aspx.cs" Inherits="WebApp.page.webpage.imagejs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    <style type="text/css">
        .list-block {
            margin: 0px;
        }
    </style>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
        var wxJsApiParam = '<%=wxJsApiParam %>';
        var str = JSON.parse(wxJsApiParam);
        wx.config({
            debug: false,
            appId: str.appId,
            timestamp: str.timestamp,
            nonceStr: str.nonceStr,
            signature: str.signature,
            jsApiList: [
                  'chooseImage',
                  'previewImage',
                  'uploadImage',
                  'downloadImage',
                  'startRecord',
                  'stopRecord',
                  'onVoiceRecordEnd',
                  'playVoice',
                  'pauseVoice',
                  'stopVoice',
                  'onVoicePlayEnd',
                  'uploadVoice',
                  'downloadVoice',
                  'translateVoice',
                  'getNetworkType',
                  'openLocation',
                  'getLocation',
                  'hideOptionMenu',
                  'showOptionMenu',
                  'closeWindow',
                  'hideMenuItems',
                  'showMenuItems',
                  'hideAllNonBaseMenuItem',
                  'showAllNonBaseMenuItem',
            ]
        });

        function btn_image_select() {
            wx.chooseImage({
                count: 1, // 默认9
                sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
                sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
                success: function (res) {
                    var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
                }
            });
        }

        function btn_image_prev() {
            wx.previewImage({
                current: '', // 当前显示图片的http链接
                urls: [] // 需要预览的图片http链接列表
            });
        }

        function btn_image_upload() {
            wx.uploadImage({
                localId: '', // 需要上传的图片的本地ID，由chooseImage接口获得
                isShowProgressTips: 1, // 默认为1，显示进度提示
                success: function (res) {
                    var serverId = res.serverId; // 返回图片的服务器端ID
                }
            });
        }

        function btn_image_download() {
            wx.downloadImage({
                serverId: '', // 需要下载的图片的服务器端ID，由uploadImage接口获得
                isShowProgressTips: 1, // 默认为1，显示进度提示
                success: function (res) {
                    var localId = res.localId; // 返回图片下载后的本地ID
                }
            });
        }
        //开始录音接口
        var localId;
        function btn_sound_start() {
            localId = wx.startRecord();
            alert("录音中...");
        }
        //停止录音接口
        function btn_sound_stop() {
            wx.stopRecord({
                success: function (res) {
                    localId = res.localId;
                }
            });
            alert("录音已停止");
        }
        //监听录音自动停止接口
        function btn_sound_autostop() {
            wx.onVoiceRecordEnd({
                // 录音时间超过一分钟没有停止的时候会执行 complete 回调
                complete: function (res) {
                    localId = res.localId;
                }
            });

            alert("监听录音自动停止成功");
        }
        //播放语音接口
        function btn_sound_play() {
            wx.playVoice({
                localId: localId // 需要播放的音频的本地ID，由stopRecord接口获得
            });
        }
        //暂停播放接口
        function btn_sound_pause() {
            wx.pauseVoice({
                localId: localId // 需要暂停的音频的本地ID，由stopRecord接口获得
            });
        }
        //停止播放接口
        function btn_sound_stopplay() {
            wx.stopVoice({
                localId: localId // 需要停止的音频的本地ID，由stopRecord接口获得
            });
        }
        //监听语音播放完毕接口
        function btn_sound_autostopplay() {
            wx.onVoicePlayEnd({
                success: function (res) {
                    localId = res.localId; // 返回音频的本地ID
                }
            });
            alert("监听语音播放完毕成功");
        }
        //上传语音接口
        var serverId;
        function btn_sound_upload() {
            wx.uploadVoice({
                localId: localId, // 需要上传的音频的本地ID，由stopRecord接口获得
                isShowProgressTips: 1, // 默认为1，显示进度提示
                success: function (res) {
                    serverId = res.serverId; // 返回音频的服务器端ID
                }
            });
        }
        //下载语音接口
        function btn_sound_download() {
            wx.downloadVoice({
                serverId: serverId, // 需要下载的音频的服务器端ID，由uploadVoice接口获得
                isShowProgressTips: 1, // 默认为1，显示进度提示
                success: function (res) {
                    localId = res.localId; // 返回音频的本地ID
                }
            });
        }


        //识别音频并返回识别结果接口
        function btn_sound_result() {
            wx.translateVoice({
                localId: localId, // 需要识别的音频的本地Id，由录音相关接口获得
                isShowProgressTips: 1, // 默认为1，显示进度提示
                success: function (res) {
                    alert(res.translateResult); // 语音识别的结果
                }
            });
        }
        //获取网络状态接口
        function btn_network_status() {
            wx.getNetworkType({
                success: function (res) {
                    var networkType = res.networkType; // 返回网络类型2g，3g，4g，wifi
                    alert(networkType);
                }
            });
        }
        //使用微信内置地图查看位置接口
        function btn_location_look() {
            wx.openLocation({
                latitude: 0, // 纬度，浮点数，范围为90 ~ -90
                longitude: 0, // 经度，浮点数，范围为180 ~ -180。
                name: '中山市', // 位置名
                address: '中山市石岐区', // 地址详情说明
                scale: 1, // 地图缩放级别,整形值,范围从1~28。默认为最大
                infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
            });
        }
        //获取地理位置接口
        function btn_location_get() {
            wx.getLocation({
                type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                success: function (res) {
                    var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                    var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                    var speed = res.speed; // 速度，以米/每秒计
                    var accuracy = res.accuracy; // 位置精度
                }
            });
        }

        //界面操作
        function btn_theme_hide_nav() {
            wx.hideOptionMenu();
            alert("隐藏成功，点击有上次菜单查看。");
        }

        function btn_theme_show_nav() {
            wx.showOptionMenu();
            alert("显示成功，点击有上次菜单查看。");
        }

        function btn_theme_close_current() {
            wx.closeWindow();
        }

        //批量隐藏功能按钮接口
        function btn_theme_hide_function() {
            wx.hideMenuItems({
                menuList: [
                    "menuItem:share:appMessage",//朋友
                    "menuItem:share:timeline",//朋友圈
                    "menuItem:share:qq"//qq
                ] // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
            });
            alert("隐藏成功，已隐藏分享到朋友、朋友圈和qq。");
        }
        //批量显示功能按钮接口
        function btn_theme_show_function() {
            wx.showMenuItems({
                menuList: [
                     "menuItem:share:appMessage",//朋友
                    "menuItem:share:timeline",//朋友圈
                    "menuItem:share:qq"//qq
                ] // 要显示的菜单项，所有menu项见附录3
            });
            alert("显示成功，已显示分享到朋友、朋友圈和qq。");
        }
        //隐藏所有非基础按钮接口
        function btn_theme_hide_button() {
            wx.hideAllNonBaseMenuItem();
            // “基本类”按钮详见附录3
            alert("隐藏成功，点击有上次菜单查看。");
        }

        //显示所有功能按钮接口
        function btn_theme_show_button() {
            wx.showAllNonBaseMenuItem();
            alert("显示成功，点击有上次菜单查看。");
        }

        wx.error(function (res) {
            alert(res.errMsg);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class="content-block-title">图像接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_image_select()">拍照或从手机相册中选图接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_image_prev()">预览图片接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_image_upload()">上传图片接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_image_download()">下载图片接口</a></p>
    </div>

     <div class="content-block-title">音频接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_start()">开始录音接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_stop()">停止录音接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_autostop()">监听录音自动停止接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_play()">播放语音接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_pause()">暂停播放接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_stopplay()">停止播放接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_autostopplay()">监听语音播放完毕接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_upload()">上传语音接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_download()">下载语音接口</a></p>
    </div>

    <div class="content-block-title">智能接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_sound_result()">识别音频并返回识别结果接口</a></p>
    </div>


    <div class="content-block-title">设备信息</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_network_status()">获取网络状态接口</a></p>
    </div>

    <div class="content-block-title">地理位置</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_location_look()">使用微信内置地图查看位置接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_location_get()">获取地理位置接口</a></p>
    </div>

     <div class="content-block-title">界面操作</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_theme_hide_nav()">隐藏右上角菜单接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_theme_show_nav()">显示右上角菜单接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_theme_close_current()">关闭当前网页窗口接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_theme_hide_function()">批量隐藏功能按钮接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_theme_show_function()">批量显示功能按钮接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_theme_hide_button()">隐藏所有非基础按钮接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_theme_show_button()">显示所有功能按钮接口</a></p>
    </div>

   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
