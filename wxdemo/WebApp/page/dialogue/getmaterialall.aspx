<%@ Page Title="获取素材总数" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="getmaterialall.aspx.cs" Inherits="WebApp.page.dialogue.getmaterialall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">获取素材总数 <a href="javascript:void(0);" onclick="window.location='materialmanager.aspx'">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">语音总数量</div>
                            <div class="item-input">
                               <%=matmodel.voice_count %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">视频总数量</div>
                            <div class="item-input">
                                <%=matmodel.video_count %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">图片总数量</div>
                            <div class="item-input">
                                <%=matmodel.image_count %>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">图文总数量</div>
                            <div class="item-input">
                                <%=matmodel.news_count %>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

</asp:Content>
