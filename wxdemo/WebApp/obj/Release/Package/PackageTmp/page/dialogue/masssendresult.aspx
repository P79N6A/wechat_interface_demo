<%@ Page Title="事件推送群发结果" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="masssendresult.aspx.cs" Inherits="WebApp.page.dialogue.masssendresult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">事件推送群发结果</div>
        <div class="list-block">
            <div class="content-padded">
                <p><%=result %></p>
            </div>
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
