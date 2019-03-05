<%@ Page Title="分享" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="share.aspx.cs" Inherits="WebApp.page.webpage.share" %>

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
                  'checkJsApi',
                  'onMenuShareTimeline',
                  'onMenuShareAppMessage',
                  'onMenuShareQQ',
                  'onMenuShareWeibo',
                  'onMenuShareQZone'
            ]
        });
        var title = '捧起网';
        var link = 'http://pqpqpq.cn';
        var imgurl = 'http://pqpqpq.cn/favicon.ico';
        var desc = '捧起网，将每个人捧起到人生巅峰，秉承学术交流、资源共享的理念.';
        //var url = location.href.split('#')[0];
        function btn_save_share() {
            title = $("#txttitle").val();
            link = $("#txtlinkurl").val();
            imgurl = $("#txtimgurl").val();
            desc = $("#txtdescribe").val();


            //分享到朋友圈
            wx.onMenuShareTimeline({
                title: title, // 分享标题
                link: link, // 分享链接
                imgUrl: imgurl, // 分享图标
                success: function () {
                    // 用户确认分享后执行的回调函数
                    alert("分享成功");
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
            //分享到朋友
            wx.onMenuShareAppMessage({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgurl, // 分享图标
                type: '', // 分享类型,music、video或link，不填默认为link
                dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                success: function () {
                    // 用户确认分享后执行的回调函数
                    alert("分享成功");
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
            //分享到QQ
            wx.onMenuShareQQ({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgurl, // 分享图标
                success: function () {
                    // 用户确认分享后执行的回调函数
                    alert("分享成功");
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
            //分享到腾讯微博
            wx.onMenuShareWeibo({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgurl, // 分享图标
                success: function () {
                    // 用户确认分享后执行的回调函数
                    alert("分享成功");
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
            //分享到QQ空间
            wx.onMenuShareQZone({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgurl, // 分享图标
                success: function () {
                    // 用户确认分享后执行的回调函数
                    alert("分享成功");
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });

            alert("保存成功");
        }

        wx.error(function (res) {
            alert(res.errMsg);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="list-block">
        <ul>
            <!-- Text inputs -->
            <li>
                <div class="item-content">
                    <div class="item-media"><i class="icon icon-form-name"></i></div>
                    <div class="item-inner">
                        <div class="item-title label">标题</div>
                        <div class="item-input">
                            <input type="text" placeholder="请输入分享标题" id="txttitle" value="捧起网"/>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="item-content">
                    <div class="item-media"><i class="icon icon-form-email"></i></div>
                    <div class="item-inner">
                        <div class="item-title label">链接</div>
                        <div class="item-input">
                            <input type="email" placeholder="分享内容跳转地址" id="txtlinkurl" value="http://pqpqpq.cn" />
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="item-content">
                    <div class="item-media"><i class="icon icon-form-email"></i></div>
                    <div class="item-inner">
                        <div class="item-title label">logo</div>
                        <div class="item-input">
                            <input type="email" placeholder="分享logo地址" id="txtimgurl" value="http://pqpqpq.cn/favicon.ico" />
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="item-content">
                    <div class="item-media"><i class="icon icon-form-gender"></i></div>
                    <div class="item-inner">
                        <div class="item-title label">描述</div>
                        <div class="item-input">
                            <textarea placeholder="分享描述内容" id="txtdescribe">捧起网，将每个人捧起到人生巅峰，秉承学术交流、资源共享的理念.</textarea>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="card">
        <div class="card-header">使用说明</div>
        <div class="card-content">
            <div class="card-content-inner">本内容不记录数据，所以输入后请务必点击保存才能生效。</div>
        </div>
        <div class="card-footer">2016-11-23</div>
    </div>
    <div class="content-block">
        <div class="row" style="margin: 0 auto;">
            <div class="col"><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_save_share()">保存分享内容</a></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
