<%@ Page Title="自定义菜单管理" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="WebApp.page.dialogue.menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content-block-title">自定义菜单管理</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/menuaddone.aspx'">添加一级菜单</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/menuaddtwo.aspx'">添加二级菜单</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/menulist.aspx'">菜单列表</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
