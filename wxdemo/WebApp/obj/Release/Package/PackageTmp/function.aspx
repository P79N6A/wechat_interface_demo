<%@ Page Title="功能接口" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="function.aspx.cs" Inherits="WebApp.function" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
       <div class="content-block-title">智能接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='http://mp.weixin.qq.com/wiki/home/index.html'">语义理解接口</a></p>
    </div>


    <div class="content-block-title">设备功能</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='http://mp.weixin.qq.com/wiki/5/131b418c04b1f4fc1752f7652b14b235.html'">设备功能接口</a></p>
    </div>


    <div class="content-block-title">多客服</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/function/morecustomerservice.aspx'">获取客服聊天记录</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/function/customerservicemanager.aspx'">客服管理</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/function/customerservicemanager.aspx'">会话控制</a></p>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
