<%@ Page Title="获取永久素材" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="getmaterialpermanent.aspx.cs" Inherits="WebApp.page.dialogue.getmaterialpermanent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">获取永久素材 <a href="javascript:void(0);" onclick="window.location='materialmanager.aspx'">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">media_id</div>
                            <div class="item-input">
                                <textarea id="txtmediaid" style="height: 180px;"></textarea>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_confirm_get()">确定获取</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_confirm_get() {
            var mediaid = $("#txtmediaid").val();
            if (mediaid == "" || mediaid == null) {
                $.toast("mediaid不能为空");
                return;
            }

            window.location = "getmaterialpermanentlist.aspx?mediaid=" + mediaid;
        }
    </script>
</asp:Content>
