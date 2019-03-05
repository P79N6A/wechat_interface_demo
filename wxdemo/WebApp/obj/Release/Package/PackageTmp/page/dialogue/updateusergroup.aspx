<%@ Page Title="修改分组名" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="updateusergroup.aspx.cs" Inherits="WebApp.page.dialogue.updateusergroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">修改分组名 <a href="usergroupmanager.aspx">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">组名</div>
                            <div class="item-input">
                                <input type="text" value="<%=Request["name"] %>" id="txtgroupname"/>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_selectcurrentusergroup()">确定修改</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_selectcurrentusergroup() {
            var name = $("#txtgroupname").val();
            if (name == "" || name == null) {
                $.toast("分组名不能为空");
                return;
            }
            
            var pams = {
                action: "updateusergroup",
                name: name,
                id: '<%=Request["id"] %>',
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $.toast("修改成功");
                        window.location = "selectallusergroup.aspx";
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
