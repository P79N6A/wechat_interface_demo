<%@ Page Title="" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="qrcode.aspx.cs" Inherits="WebApp.page.webpage.qrcode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
      <div class="content-block">请在<%=Request["type"]=="wechat"?"微信":"支付宝" %>扫描二维码完成支付</div>
    <div class="card demo-card-header-pic">
        <div valign="bottom" class="card-header color-white no-border no-padding">
            <img class='card-cover' src="/page/webpage/makeqrcode.aspx?data=<%=Request["data"] %>" alt="">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script type="text/javascript">

         //function showUnreadNews() {
         //    $(function () {
         //        $.ajax({
         //            type: 'post',
         //            url: "/notify.aspx",
         //            data: {},
         //            dataType: 'json',
         //            success: function (serverData) {
         //                //通过异步查询数据库状态从而确定是否支付完成
         //                //if (serverData.status == 0) {
         //                //    window.location = "/callback.aspx";
         //                //} else {
         //                //}
         //                //console.log(serverData.status);
         //            },
         //            error: function (serverData) {
         //                console.log(serverData);
         //            }
         //        });
         //    })
         //}


         //setInterval('showUnreadNews()', 2000);
    </script>
</asp:Content>
