<%@ Page Title="群发接口" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="mass.aspx.cs" Inherits="WebApp.page.dialogue.mass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <div class="content-block-title">群发接口</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/massuploadimgtexturl.aspx'">上传图文消息内的图片获取URL</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/massuploadimgtext.aspx'">上传图文消息素材</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/massgroupsend.aspx'">根据分组进行群发</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/massopenidsend.aspx'">根据OpenID列表群发</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/massgroupsenddelete.aspx'">删除群发</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/masspreview.aspx'">预览接口</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/massselectgroupsend.aspx'">查询群发消息发送状态</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/masssendresult.aspx'">事件推送群发结果</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
