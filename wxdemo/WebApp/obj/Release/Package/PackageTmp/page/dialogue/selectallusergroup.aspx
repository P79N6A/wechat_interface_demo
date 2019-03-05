<%@ Page Title="所有用户分组" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="selectallusergroup.aspx.cs" Inherits="WebApp.page.dialogue.selectallusergroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-block-title">所有用户分组 <a href="usergroupmanager.aspx">返回</a></div>
    <div class="list-block">
        <ul>
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
                url: "/handler/dialogueHandler.aspx?action=selectallusergroup",
                data: {},
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        var jsondata = $.parseJSON(data.data);
                        var _html = '';
                        for (var i = 0; i < jsondata.length; i++) {
                            _html += '<li class="item-content item-link" onclick="btn_manager(' + jsondata[i].id + ',\'' + jsondata[i].name + '\')">' +
                                            '<div class="item-media"><i class="icon icon-f7"></i></div>' +
                                            '<div class="item-inner">' +
                                                '<div class="item-title">id:' + jsondata[i].id + '&nbsp;&nbsp;组名:' + jsondata[i].name + '&nbsp;&nbsp;用户数:' + jsondata[i].count + '</div>' +
                                                '<div class="item-after">操作</div>' +
                                            '</div>' +
                                        '</li>';
                        }
                        $(".list-block ul").html(_html);
                    } else {
                        $.toast(data.data);
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        }


        function btn_manager(id, name) {

            var buttons1 = [
       {
           text: '请选择',
           label: true
       },
       {
           text: '编辑',
           onClick: function () {
               window.location = "updateusergroup.aspx?id=" + id + "&name=" + name;
           }
       },
       {
           text: '删除',
           bold: true,
           color: 'danger',
           onClick: function () {
               if (confirm("确定删除吗？")) {
                   var pams = {
                       action: "deleteusergroup",
                       id: id
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
