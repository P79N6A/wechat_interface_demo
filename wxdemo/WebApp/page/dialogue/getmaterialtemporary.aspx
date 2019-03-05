<%@ Page Title="获取临时素材" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="getmaterialtemporary.aspx.cs" Inherits="WebApp.page.dialogue.getmaterialtemporary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">获取临时素材 <a href="javascript:void(0)" onclick="window.location='materialmanager.aspx'">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">media_id</div>
                            <div class="item-input">
                                <textarea id="txtlinkurl" style="height: 180px;">frSce3EpO348YwfE2riMzqq3Zzx021tvU4Ck4qU4kLBPuzNBpEzv9ZC3ZZ-GIuxa</textarea>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_long2short()">确定获取</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_long2short() {
            var link = $("#txtlinkurl").val();
            if (link == "" || link == null) {
                $.toast("媒体文件ID不能为空");
                return;
            }

            window.location = "https://api.weixin.qq.com/cgi-bin/media/get?access_token=<%=getAccessToken() %>&media_id=" + link;
        }
    </script>
</asp:Content>
