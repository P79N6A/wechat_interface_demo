<%@ Page Title="获取客服聊天记录" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="morecustomerservice.aspx.cs" Inherits="WebApp.page.function.morecustomerservice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
     <style type="text/css">
        .list-block {
            margin: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="list-block">
        <ul>
            <!-- Text inputs -->
            <li>
                <div class="item-content">
                    <div class="item-media"><i class="icon icon-form-name"></i></div>
                    <div class="item-inner">
                        <div class="item-title label">开始时间</div>
                        <div class="item-input">
                            <input type="date" placeholder="开始时间" id="txtstime" />
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="item-content">
                    <div class="item-media"><i class="icon icon-form-email"></i></div>
                    <div class="item-inner">
                        <div class="item-title label">结束时间</div>
                        <div class="item-input">
                            <input type="date" placeholder="结束时间" id="txtetime"/>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="item-content">
                    <div class="item-media"><i class="icon icon-form-email"></i></div>
                    <div class="item-inner">
                        <div class="item-title label">第几页</div>
                        <div class="item-input">
                            <input type="text" placeholder="查询第几页" id="txtpageindex"/>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="item-content">
                    <div class="item-media"><i class="icon icon-form-email"></i></div>
                    <div class="item-inner">
                        <div class="item-title label">页容量</div>
                        <div class="item-input">
                            <input type="text" placeholder="每页显示几条" id="txtpagesize" value=""/>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
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
        
        function btn_function_service() {
            var stime = $("#txtstime").val();
            if (stime==""||stime==null) {
                $.toast("开始时间不能为空");
                return;
            }
            var etime = $("#txtetime").val();
            if (etime == "" || etime == null) {
                $.toast("结束时间不能为空");
                return;
            }
            var pageindex = $("#txtpageindex").val();
            if (pageindex == "" || pageindex == null) {
                $.toast("查询第几页不能为空");
                return;
            }
            var pagesize = $("#txtpagesize").val();
            if (pagesize == "" || pagesize == null) {
                $.toast("页容量不能为空");
                return;
            }

            var pams = {
                action: "morecustomerservice",
                stime: stime,
                etime: etime,
                pageindex: pageindex,
                pagesize: pagesize
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
