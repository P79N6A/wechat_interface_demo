<%@ Page Title="新增永久素材" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="materialpermanentadd.aspx.cs" Inherits="WebApp.page.dialogue.materialpermanentadd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">新增永久素材 <a href="materialmanager.aspx">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">标题</div>
                            <div class="item-input">
                                <input type="text" value="test" placeholder="请输入标题" id="txttitle" />
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">素材id</div>
                            <div class="item-input">
                                <textarea id="txtmediaid" style="height:150px;" placeholder="图文消息的封面图片素材id（必须是永久mediaID">frSce3EpO348YwfE2riMzqq3Zzx021tvU4Ck4qU4kLBPuzNBpEzv9ZC3ZZ-GIuxa</textarea>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">作者</div>
                            <div class="item-input">
                                <input type="text" value="ljx" placeholder="请输入作者" id="txtauthor" />
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">摘要</div>
                            <div class="item-input">
                                <textarea id="txtdigest" style="height:150px;" placeholder="图文消息的摘要，仅有单图文消息才有摘要，多图文此处为空">test1111</textarea>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">是否显示封面</div>
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
                                <textarea id="txtcontent" style="height:150px;" placeholder="图文消息的具体内容，支持HTML标签，必须少于2万字符，小于1M，且此处会去除JS">test2222</textarea>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">原文地址</div>
                            <div class="item-input">
                                <textarea id="txtsourceurl" style="height:150px;" placeholder="图文消息的原文地址，即点击“阅读原文”后的URL">http://pqpqpq.cn</textarea>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_material_add()">确定添加</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_material_add() {
            var title = $("#txttitle").val();
            if (title==""||title==null) {
                $.toast("标题不能为空");
                return;
            }
            var mediaid = $("#txtmediaid").val();
            if (mediaid == "" || mediaid == null) {
                $.toast("素材id不能为空");
                return;
            }

            var author = $("#txtauthor").val();
            if (author == "" || author == null) {
                $.toast("作者不能为空");
                return;
            }
            var digest = $("#txtdigest").val();

            var isshow = $("#txtisshow").val();

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
                action: "materialpermanentadd",
                title: title,
                mediaid: mediaid,
                author: author,
                digest: digest,
                isshow: isshow,
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
