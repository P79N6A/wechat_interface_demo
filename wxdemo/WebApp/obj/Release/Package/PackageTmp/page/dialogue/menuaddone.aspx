<%@ Page Title="添加一级菜单" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="menuaddone.aspx.cs" Inherits="WebApp.page.dialogue.menuaddone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">添加一级菜单 <a href="menulist.aspx">返回</a></div>
        <div class="list-block">
            <ul>
                <!-- Text inputs -->
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">菜单类型</div>
                            <div class="item-input">
                                <select id="txtmenutype">
                                    <option value="0" selected="selected">请选择菜单类型</option>
                                    <%foreach (var item in typelist)
                                      {%>
                                    <option value="<%=item.typeID %>"><%=item.typeName %></option>
                                    <%} %>
                                </select>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">菜单名称</div>
                            <div class="item-input">
                                <input type="text" value="" placeholder="最多四个汉子" id="txtmenuname" />
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">参数</div>
                            <div class="item-input">
                                <input type="text" value="" placeholder="请输入对应类型的参数" id="txtmenuparams" />
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="content-block">
            <div class="row" style="margin: 0 auto">
                <div><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btn_menu_addone()">确定添加</a></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function btn_menu_addone() {
            var menutype = $("#txtmenutype").val();
            if (menutype == "0") {
                $.toast("请选择类型");
                return;
            }
            var name = $("#txtmenuname").val();
            if (name == "" || name == null) {
                $.toast("菜单名称不能为空");
                return;
            }
            var params = $("#txtmenuparams").val();
           
            var pams = {
                action: "menuaddone",
                menutype: menutype,
                name: name,
                params: params,
            };

            $.ajax({
                type: 'post',
                url: "/handler/dialogueHandler.aspx",
                data: pams,
                dataType: 'json',
                success: function (data) {
                    if (data.status == 0) {
                        $.toast(data.msg);
                        window.location = "/page/dialogue/menulist.aspx";
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
