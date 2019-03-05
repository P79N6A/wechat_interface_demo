<%@ Page Title="修改永久图文素材" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="materialpermanentedit.aspx.cs" Inherits="WebApp.page.dialogue.materialpermanentedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">修改永久图文素材 <a href="javascript:void(0);" onclick="window.location='materialmanager.aspx'">返回</a></div>
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
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">index</div>
                            <div class="item-input">
                                <textarea id="txtindex" style="height: 180px;" placeholder="要更新的文章在图文消息中的位置（多图文消息时，此字段才有意义），第一篇为0"></textarea>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">标题</div>
                            <div class="item-input">
                                <input type="text" id="txttitle" value="test"  placeholder="标题" />
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">素材id</div>
                            <div class="item-input">
                                <textarea id="txtthumb_media_id" style="height: 180px;" placeholder="图文消息的封面图片素材id（必须是永久mediaID）"></textarea>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">作者</div>
                            <div class="item-input">
                                <input type="text" id="txtauthor" value="testauthor" placeholder="作者" />
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">摘要</div>
                            <div class="item-input">
                                <textarea id="txtdigest" style="height: 180px;" placeholder="图文消息的摘要，仅有单图文消息才有摘要，多图文此处为空"></textarea>
                            </div>
                        </div>
                    </div>
                </li>
                  <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">显示封面</div>
                            <div class="item-input">
                                <select id="txtisshow">
                                    <option value="1">显示</option>
                                    <option value="0">不显示</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">具体内容</div>
                            <div class="item-input">
                                <textarea id="txtcontent" style="height: 180px;" placeholder="图文消息的具体内容，支持HTML标签，必须少于2万字符，小于1M，且此处会去除JS"></textarea>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">原文地址</div>
                            <div class="item-input">
                                <textarea id="txtsourceurl" style="height: 180px;" placeholder="图文消息的原文地址，即点击“阅读原文”后的URL"></textarea>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_confirm_get()">确定编辑</a></div>
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

            var index = $("#txtindex").val();

            var title = $("#txttitle").val();
            if (title == "" || title == null) {
                $.toast("标题不能为空");
                return;
            }
            var thumb_media_id = $("#txtthumb_media_id").val();
            if (thumb_media_id == "" || thumb_media_id == null) {
                $.toast("素材id不能为空");
                return;
            }
            var author = $("#txtauthor").val();
            if (author == "" || author == null) {
                $.toast("作者不能为空");
                return;
            }

            var digest = $("#txtdigest").val();
            if (digest == "" || digest == null) {
                $.toast("摘要不能为空");
                return;
            }
            var ishow = $("#txtisshow").val();

            var content = $("#txtcontent").val();
            if (content == "" || content == null) {
                $.toast("具体内容不能为空");
                return;
            }
            var sourceurl = $("#txtsourceurl").val();
            if (sourceurl == "" || sourceurl == null) {
                $.toast("原文地址不能为空");
                return;
            }

            var pams = {
                action: "materialpermanentedit",
                mediaid: mediaid,
                index: index,
                title: title,
                thumb_media_id: thumb_media_id,
                author: author,
                digest: digest,
                ishow: ishow,
                content: content,
                sourceurl: sourceurl
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $.toast(data.msg);
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
