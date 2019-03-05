<%@ Page Title="网页接口" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="webpage.aspx.cs" Inherits="WebApp.webpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content-block-title">网页帐号</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/member.aspx'">网页授权获取用户基本信息</a></p>
    </div>


    <div class="content-block-title">基础接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/webpage/supportjs.aspx'">判断当前客户端版本是否支持指定JS接口</a></p>
    </div>


    <div class="content-block-title">分享接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/webpage/share.aspx'">获取按钮点击状态及自定义分享内容接口</a></p>
    </div>



    <div class="content-block-title">图像、音频等接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/webpage/imagejs.aspx'">图像、音频等接口</a></p>
    </div>

     <div class="content-block-title">第三方支付</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/webpage/wechatpay.aspx'">微信支付</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/webpage/nativepay.aspx'">扫码支付</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
