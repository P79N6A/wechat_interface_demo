<%@ Page Title="长连接转短链接" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="long2short.aspx.cs" Inherits="WebApp.page.dialogue.long2short" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">长连接转短链接</div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">链接地址</div>
                            <div class="item-input">
                                <textarea id="txtlinkurl" style="height:180px;">http://wap.koudaitong.com/v2/showcase/goods?alias=128wi9shh&spm=h56083&redirect_count=1</textarea>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">转换结果</div>
                            <div class="item-input">
                                <textarea  readonly="readonly" id="txtresult"  placeholder="转换地址，支持http://、https://、weixin://wxpay 格式的url"></textarea>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_long2short()">确定转换</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_long2short() {
            var link = $("#txtlinkurl").val();
            if (link == "" || link == null) {
                $.toast("链接地址不能为空");
                return;
            }
            
            var pams = {
                action: "long2short",
                link:link,
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $("#txtresult").val(data.data);
                    } else {
                        $.toast(data.msg);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }
    </script>
</asp:Content>
