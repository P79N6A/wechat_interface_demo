<%@ Page Title="获取用户列表" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="getuserlist.aspx.cs" Inherits="WebApp.page.dialogue.getuserlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-block-title">获取用户列表 </div>
    <div class="list-block">
        <ul>
            <li class="item-content item-link">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">总用户：<span id="txttotalcount"></span></div>
                    <div class="item-after">已获取：<span id="txtgetcount"></span></div>
                </div>
            </li>
            <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">openid</div>
                            <div class="item-input">
                                <textarea id="txtopenid" style="min-height:180px;height:auto;"></textarea>
                            </div>
                        </div>
                    </div>
                </li>
        </ul>
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
                url: "/handler/dialogueHandler.aspx?action=getuserlist",
                data: {},
                dataType: 'json',
                success: function (data) {
                    
                    if (data.status == 0) {
                        var jsondata = $.parseJSON(data.data);
                        
                        $("#txttotalcount").text(jsondata.total);
                        $("#txtgetcount").text(jsondata.count);

                        var _html = JSON.stringify(jsondata.data.openid);
                      
                        $("#txtopenid").val(_html);
                    } else {
                        $.toast(data.data);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }
    </script>
</asp:Content>
