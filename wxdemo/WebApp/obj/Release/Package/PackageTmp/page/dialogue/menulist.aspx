<%@ Page Title="自定义菜单列表" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="menulist.aspx.cs" Inherits="WebApp.page.dialogue.menulist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-block-title">自定义菜单列表 <a href="menu.aspx">返回</a></div>
    <div class="list-block">
        <ul>
            <%foreach (var item in GetList())
              {%>
            <li class="item-content item-link" onclick="btn_manager('<%=item.ID %>','<%=item.pID %>')">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title"><%=item.name %></div>
                    <div class="item-after">操作</div>
                </div>
            </li>
            <%} %>

            <%-- <li class="item-content item-link">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">型号</div>
                    <div class="item-after">极致超薄型</div>
                </div>
            </li>--%>
        </ul>
    </div>

    <div class="content-block">
        <div class="row" style="margin: 0 auto">
            <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_menu_update()">同步公众号菜单</a></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script type="text/javascript">
        function btn_menu_update() {
            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx?action=menuupdate",
                data: {},
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $.toast(data.msg);
                        window.location.reload();
                    } else {
                        $.toast(data.data);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }


        function btn_manager(id, pid) {

            var buttons1 = [
       {
           text: '请选择',
           label: true
       },
       {
           text: '编辑',
           onClick: function () {
               if (parseInt(pid) == 0) {
                   window.location = "/page/dialogue/menueditone.aspx?id=" + id;
               } else {
                   window.location = "/page/dialogue/menuedittwo.aspx?id=" + id;
               }
           }
       },
       {
           text: '删除',
           bold: true,
           color: 'danger',
           onClick: function () {
               if (confirm("确定删除吗？")) {
                   var pams = {
                       action: "menudelete",
                       id: id,
                       pid: pid
                   };

                   $.ajax({
                       type: 'post',
                       url: "/handler/dialogueHandler.aspx",
                       data: pams,
                       dataType: 'json',
                       success: function (data) {
                           if (data.status == 0) {
                               $.toast(data.msg);
                               window.location.reload();
                           } else {
                               $.toast(data.msg);
                           }
                       },
                       error: function (data) {
                           alert(data);
                       }
                   });
               }
           }
       }
            ];
            var buttons2 = [
              {
                  text: '取消',
                  bg: 'danger'
              }
            ];
            var groups = [buttons1, buttons2];
            $.actions(groups);
        }
    </script>

</asp:Content>
