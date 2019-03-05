<%@ Page Title="素材管理" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="materialmanager.aspx.cs" Inherits="WebApp.page.dialogue.materialmanager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="content-block-title">素材管理</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/materialtemporaryadd.aspx'">新增临时素材</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/getmaterialtemporary.aspx'">获取临时素材</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/materialpermanentadd.aspx'">新增永久素材</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/materialotherpermanentadd.aspx'">新增其他类型永久素材</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/getmaterialpermanent.aspx'">获取永久素材</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/materialpermanentdelete.aspx'">删除永久素材</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/materialpermanentedit.aspx'">修改永久图文素材</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/getmaterialall.aspx'">获取素材总数</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/getallmateriallist.aspx'">获取素材列表</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
