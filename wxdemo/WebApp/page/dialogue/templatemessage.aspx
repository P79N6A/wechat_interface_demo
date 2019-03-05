<%@ Page Title="模板消息" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="templatemessage.aspx.cs" Inherits="WebApp.page.dialogue.templatemessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <div class="content-block-title">模板消息</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="alert('测试号没有权限')">设置所属行业</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="alert('测试号没有权限')">获得模板ID</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="alert('测试号没有权限')">发送模板消息</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="alert('测试号没有权限')">事件推送</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
