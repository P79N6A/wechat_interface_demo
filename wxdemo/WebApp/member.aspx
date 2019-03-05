<%@ Page Title="会员信息" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="WebApp.member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
       <style type="text/css">
        .list-block {
            margin:0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="content native-scroll" id="page-photo-browser">
        <div class="list-block">
            <ul>
                <!-- Text inputs -->
                <li>
                    <div class="item-content" style="height:100px;">
                        <div class="item-inner">
                            <div class="item-title label">头像</div>
                            <div class="item-input">
                                <img src="<%=user.headimgurl %>" style="width: 80px; height: 80px; border-radius: 50%;" />
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">昵称</div>
                            <div class="item-input">
                                <%=user.nickname %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">openID</div>
                            <div class="item-input">
                               <%=user.openid %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">性别</div>
                            <div class="item-input">
                                <%=Enum.GetName(typeof(Utility.Enum_Sex),user.sex) %>
                            </div>
                        </div>
                    </div>
                </li>
                <!-- Date -->
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">省份</div>
                            <div class="item-input">
                                <%=user.province %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">城市</div>
                            <div class="item-input">
                                <%=user.city %>
                            </div>
                        </div>
                    </div>
                </li>
                <!-- Switch (Checkbox) -->
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">国家</div>
                            <div class="item-input">
                                <%=user.country %>
                            </div>
                        </div>
                    </div>
                </li>
               <%-- <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">注册时间</div>
                            <div class="item-input">
                                <%=Convert.ToDateTime(user.addTime).ToString("yyyy-MM-dd HH:mm:ss") %>
                            </div>
                        </div>
                    </div>
                </li>--%>
            </ul>
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
