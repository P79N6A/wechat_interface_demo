<%@ Page Title="用户分组管理" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="usergroupmanager.aspx.cs" Inherits="WebApp.page.dialogue.usergroupmanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="content-block-title">用户分组管理</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_create_usergroup()">创建分组</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/selectallusergroup.aspx'">查询所有分组</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/selectcurrentusergroup.aspx'">查询用户所在分组</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/selectallusergroup.aspx'">修改分组名</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/movecurrentusergroup.aspx'">移动用户分组</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/moveusergroup.aspx'">批量移动用户分组</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="window.location='/page/dialogue/selectallusergroup.aspx'">删除分组</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script type="text/javascript">

        function btn_create_usergroup() {
            var pams = {
                action: "createusergroup"
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                       $.toast(data.msg + "|id:" + data.data);
                       // alert(data.data);
                    } else {
                        $.toast(data.msg);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }

        function btn_select_allgroup() {
            var pams = {
                action: "selectallusergroup"
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        //$.toast(data.msg + "|id:" + data.data);
                         alert(data.data);
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
