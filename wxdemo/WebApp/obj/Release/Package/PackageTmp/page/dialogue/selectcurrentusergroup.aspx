<%@ Page Title="查询当前用户组" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="selectcurrentusergroup.aspx.cs" Inherits="WebApp.page.dialogue.selectcurrentusergroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">查询当前用户组 <a href="usergroupmanager.aspx">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">openid</div>
                            <div class="item-input">
                                <textarea id="txtopenid" style="height:180px;"><%=openid %></textarea>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_selectcurrentusergroup()">确定查询</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_selectcurrentusergroup() {
            var openid = $("#txtopenid").val();
            if (openid == "" || openid == null) {
                $.toast("openid不能为空");
                return;
            }
            
            var pams = {
                action: "selectcurrentusergroup",
                openid: openid,
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $.toast("所在组id:"+data.data);
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
