<%@ Page Title="查询群发消息发送状态" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="massselectgroupsend.aspx.cs" Inherits="WebApp.page.dialogue.massselectgroupsend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">查询群发消息发送状态 <a href="mass.aspx">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">消息ID</div>
                            <div class="item-input">
                               <textarea id="txtmsgid" placeholder="发送出去的消息ID,只能删除图文消息和视频消息，其他类型的消息一经发送，无法删除"></textarea>
                            </div>
                        </div>
                    </div>
                </li>             
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_confirm_select()">确定查询</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script type="text/javascript">    
         function btn_confirm_select() {
             var msgid = $("#txtmsgid").val();
             if (msgid == "" || msgid == null) {
                 $.toast("消息ID不能为空");
                 return;
             }

             var pams = {
                 action: "massselectgroupsend",
                 msgid: msgid
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
