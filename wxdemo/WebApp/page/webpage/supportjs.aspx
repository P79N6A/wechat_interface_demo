<%@ Page Title="检查是否支持js接口" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="supportjs.aspx.cs" Inherits="WebApp.page.webpage.supportjs" %>

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

        function btn_js_support() {
            //检查微信版本
            wx.checkJsApi({
                jsApiList: [
                    'checkJsApi',
                      'onMenuShareTimeline',
                      'onMenuShareAppMessage',
                      'onMenuShareQQ',
                      'onMenuShareWeibo',
                      'onMenuShareQZone'
                ], // 需要检测的JS接口列表，所有JS接口列表见附录2,
                success: function (res) {
                    // 以键值对的形式返回，可用的api值true，不可用为false
                    // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
                    alert(res.errMsg + JSON.stringify(res.checkResult));
                }
            });
        }

        wx.error(function (res) {
            alert(res.errMsg);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-block-title">判断当前客户端版本是否支持指定JS接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_js_support()">开始判断</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
