<%@ Page Title="上传图文消息" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="massuploadimgtexturl.aspx.cs" Inherits="WebApp.page.dialogue.massuploadimgtexturl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form action="/handler/dialogueHandler.aspx?action=massuploadimgtexturl" method="post" enctype="multipart/form-data" name="media">
        <div style="text-align:center;">
             <br />
        <input type="file" name="media" />
        <br />
        <br />
        <input type="submit"  value="提交" class="button" />
        </div>
       
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
