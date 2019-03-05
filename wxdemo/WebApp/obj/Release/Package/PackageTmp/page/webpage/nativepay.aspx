<%@ Page Title="" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="nativepay.aspx.cs" Inherits="WebApp.page.webpage.nativepay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
       <div class="content-block-title">扫码支付方式</div>
    <div class="content-block">
        <p><a href="#" class="button" onclick="btn_native_pay('alipay')">支付宝扫码支付</a></p>
        <p><a href="#" class="button" onclick="btn_native_pay('wechat')">微信扫码支付</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_native_pay(type) {
            var pams = {
                action: "nativepay",
                type: type
            };

            $.ajax({
                type: 'post',
                url: "/handler/paywayHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (serverData) {
                    var data = $.parseJSON(serverData);
                    if (data.trxstatus == 0000) {
                        window.location = "/page/webpage/qrcode.aspx?data=" + encodeURIComponent(data.payinfo) + "&type=" + type;
                    } else {
                        alert(data.retmsg);
                    }
                },
                error: function (serverData) {
                    var data = JSON.stringify(serverData);
                    alert(data);
                }
            });
        }
    </script>
</asp:Content>
