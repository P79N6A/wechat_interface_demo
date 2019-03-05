<%@ Page Title="批量移动用户分组" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="moveusergroup.aspx.cs" Inherits="WebApp.page.dialogue.moveusergroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">批量移动用户分组 <a href="usergroupmanager.aspx">返回</a></div>
        <div class="list-block">
            <ul>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">openid</div>
                            <div class="item-input">
                                <textarea id="txtopenidlist" style="height: 180px;"><%=openid %></textarea>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">用户组</div>
                            <div class="item-input">
                                <select id="txtusergroup">
                                </select>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">说明</div>
                            <div class="item-input">
                                多个用英文逗号隔开
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_moveusergroup()">确定移动</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        $(function () {
            loaddata();
        })

        function loaddata() {
            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx?action=selectallusergroup",
                data: {},
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        var jsondata = $.parseJSON(data.data);
                        var _html = '';
                        for (var i = 0; i < jsondata.length; i++) {
                            _html += '<option value="' + jsondata[i].id + '">' + jsondata[i].name + '</option>';
                        }
                        $("#txtusergroup").html(_html);
                    } else {
                        $.toast(data.data);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }



        function btn_moveusergroup() {
            var openidlist = $("#txtopenidlist").val();
            if (openidlist == "" || openidlist == null) {
                $.toast("openid不能为空");
                return;
            }

            var pams = {
                action: "moveusergroup",
                openidlist: openidlist,
                groupid: $("#txtusergroup").val()
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
