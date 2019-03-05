<%@ Page Title="预览接口" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="masspreview.aspx.cs" Inherits="WebApp.page.dialogue.masspreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">预览接口 <a href="mass.aspx">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">消息类型</div>
                            <div class="item-input">
                                <select id="txttype">
                                    <option value="mpnews">图文</option>
                                    <option value="text">文本</option>
                                    <option value="voice">语音</option>
                                    <option value="image">图片</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </li>
                <%--<li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">openid</div>
                            <div class="item-input">
                               <textarea id="txtopenid" placeholder="接收消息用户对应该公众号的openid，该字段也可以改为towxname，以实现对微信号的预览">opC7fv5Yg-9iyCkxCM7uSaf5jz-U</textarea>
                            </div>
                        </div>
                    </div>
                </li>--%>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">mediaid</div>
                            <div class="item-input">
                                <textarea id="txtmediaid" placeholder="用于群发的消息的media_id">AhiSrJDenRMbBhMGSbgVve9oD6M3aMwkIrwWeYmTRdAfZRYVeDXSXB2lfawyYt_P</textarea>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_confirm_send()">确定发送</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script type="text/javascript">    
         function btn_confirm_send() {
             var type = $("#txttype").val();

             //var openid = $("#txtopenid").val();
             //if (openid == "" || openid == null) {
             //    $.toast("openid不能为空");
             //    return;
             //}

             var mediaid = $("#txtmediaid").val();
             if (mediaid == "" || mediaid == null) {
                 $.toast("mediaid不能为空");
                 return;
             }

             var pams = {
                 action: "masspreview",
                 type: type,
                 //openid: openid,
                 mediaid: mediaid
             };

             $.ajax({
                 type: 'post',
                 url: "/handler/dialogueHandler.aspx",
                 data: pams,
                 dataType: 'json',
                 success: function (data) {
                     if (data.status == 0) {
                         alert(data.data);
                         //window.location = "usergroupmanager.aspx";
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
