<%@ Page Title="生成带参数二维码" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="createqrcode.aspx.cs" Inherits="WebApp.page.dialogue.createqrcode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-block-title">生成带参数二维码</div>
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
                        $("#txtqrcodeurl").attr("src",data.data);
                    } else {
                        $.toast(data.data);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        })
    </script>

</asp:Content>
