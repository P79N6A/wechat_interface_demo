<%@ Page Title="获取素材列表" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="getallmateriallist.aspx.cs" Inherits="WebApp.page.dialogue.getallmateriallist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">获取素材列表 <a href="javascript:void(0);" onclick="window.location='materialmanager.aspx'">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">类型</div>
                            <div class="item-input">
                                <select id="txttype">
                                    <option value="">请选择类型</option>
                                    <option value="image">图片</option>
                                    <option value="video">视频</option>
                                    <option value="voice">语音</option>
                                    <option value="news">图文</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">偏移位置</div>
                            <div class="item-input">
                                <input type="text" value="0" placeholder="0表示从第一个素材 返回" id="txtlocation" />
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">获取数量</div>
                            <div class="item-input">
                                <input type="text" value="1" placeholder="取值在1到20之间" id="txtcount" />
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_getmaterlist()">确定获取</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_getmaterlist() {
            var type = $("#txttype").val();
            if (type == "" || type == null) {
                $.toast("请选择类型");
                return;
            }
            var location = $("#txtlocation").val();
            if (location == "" || location == null) {
                $.toast("偏移值不能为空");
                return;
            }

            var count = $("#txtcount").val();
            if (count == "" || count == null) {
                $.toast("获取数量不能为空");
                return;
            }

            window.location = "getallmateriallistdetail.aspx?type=" + type + "&offset=" + location + "&count=" + count;
        }
    </script>
</asp:Content>
