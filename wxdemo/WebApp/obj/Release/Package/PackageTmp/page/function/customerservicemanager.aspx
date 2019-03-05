<%@ Page Title="客服管理" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="customerservicemanager.aspx.cs" Inherits="WebApp.page.function.customerservicemanager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
     <style type="text/css">
        .list-block {
            margin: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content-block-title">客服管理</div>
    <div class="content-block">
        <p><a href="javascript:void(0)" class="button" onclick="btn_function_customer_baseinfo()">获取客服基本信息</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_function_customer_receiveinfo()">获取在线客服接待信息</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_function_customer_add()">添加客服账号</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_function_customer_update()">设置客服信息</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_function_customer_uploadimg()">上传客服头像</a></p>
        <p><a href="javascript:void(0)" class="button" onclick="btn_function_customer_delete()">删除客服账号</a></p>
    </div>
    <div class="card">
        <div class="card-header">使用说明</div>
        <div class="card-content">
            <div class="card-content-inner">本接口需要认证服务号才能使用，所以测试号暂时无法测试。</div>
        </div>
        <div class="card-footer">2016-11-23</div>
    </div>
    <div class="content-block">
        <div class="row" style="margin: 0 auto;">
            <div class="col"><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_function_service()">开始查询</a></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        //获取客服基本信息
        function btn_function_customer_baseinfo() {
            var pams = {
                action: "customerservicebaseinfo"
            };

            $.ajax({
                type: 'post',
                url: "/handler/functionHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    alert(data.data);
                },
                error: function (data) {
                    alert(data);
                }
            });
        }

        //获取在线客服接待信息
        function btn_function_customer_receiveinfo() {
            var pams = {
                action: "customerservicereceiveinfo"
            };

            $.ajax({
                type: 'post',
                url: "/handler/functionHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    alert(data.data);
                },
                error: function (data) {
                    alert(data);
                }
            });
        }

        //添加客服账号
        function btn_function_customer_add() {
            var pams = {
                action: "customerserviceadd"
            };

            $.ajax({
                type: 'post',
                url: "/handler/functionHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    alert(data.data);
                },
                error: function (data) {
                    alert(data);
                }
            });
        }

        //设置客服账号
        function btn_function_customer_update() {
            var pams = {
                action: "customerserviceupdate"
            };

            $.ajax({
                type: 'post',
                url: "/handler/functionHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    alert(data.data);
                },
                error: function (data) {
                    alert(data);
                }
            });
        }

        //上传客服图片customerservicedelete
        function btn_function_customer_uploadimg() {
            var pams = {
                action: "customerserviceuploadimg"
            };

            $.ajax({
                type: 'post',
                url: "/handler/functionHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    alert(data.data);
                },
                error: function (data) {
                    alert(data);
                }
            });
        }

        //删除客服账号
        function btn_function_customer_delete() {
            var pams = {
                action: "customerservicedelete"
            };

            $.ajax({
                type: 'post',
                url: "/handler/functionHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    alert(data.data);
                },
                error: function (data) {
                    alert(data);
                }
            });
        }
    </script>
</asp:Content>
