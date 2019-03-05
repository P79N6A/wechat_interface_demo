<%@ Page Title="修改用户备注名" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="updateuserremark.aspx.cs" Inherits="WebApp.page.dialogue.updateuserremark" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">修改用户备注名</div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">openid</div>
                            <div class="item-input">
                                <textarea id="txtopenid" style="height: 180px;"><%=openid %></textarea>
                            </div>
                        </div>
                    </div>
                </li>              
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">备注名</div>
                            <div class="item-input">
                                <input type="text" value="" id="txtremark" placeholder="请输入备注名" />
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_updateuserremark()">确定修改</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">      
        function btn_updateuserremark() {
            var openid = $("#txtopenid").val();
            if (openid == "" || openid == null) {
                $.toast("openid不能为空");
                return;
            }
            var remark = $("#txtremark").val();
            if (remark == "" || remark == null) {
                $.toast("备注名不能为空");
                return;
            }
            var pams = {
                action: "updateuserremark",
                openid: openid,
                remark: remark
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $.toast(data.msg);
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
