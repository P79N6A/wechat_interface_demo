<%@ Page Title="接口介绍" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content-block">接口是用asp.net 4.0 + EF 开发，除了有一些不能测试外，基本上都可以。</div>
     <div class="content-block-title">为了更好的体验，请扫二维码关注测试公众号</div>
  <div class="card demo-card-header-pic">
    <div valign="bottom" class="card-header color-white no-border no-padding">
      <img class='card-cover' src="" alt="" id="txtqrcodeurl">
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx?action=createqrcode",
                data: {},
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $("#txtqrcodeurl").attr("src", data.data);
                    } else {
                        //$.toast(data.data);
                        alert(data.data);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        })
    </script>
</asp:Content>
