<%@ Page Title="获取素材总数" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="getmaterialpermanentlist.aspx.cs" Inherits="WebApp.page.dialogue.getmaterialpermanentlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">获取素材总数 <a href="javascript:void(0);" onclick="window.location='materialmanager.aspx'">返回</a></div>
        <div class="list-block">
            <ul>
                <%if (matlist!=null)
                  {
                       foreach (var matmodel in matlist.news_item)
                  {%>
                        <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">标题</div>
                            <div class="item-input">
                               <%=matmodel.title %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">素材id</div>
                            <div class="item-input">
                                <%=matmodel.thumb_media_id %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">是否显示封面</div>
                            <div class="item-input">
                                <%=matmodel.show_cover_pic %>
                            </div>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">作者</div>
                            <div class="item-input">
                                <%=matmodel.author %>
                            </div>
                        </div>
                    </div>
                </li>
                  <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">摘要</div>
                            <div class="item-input">
                                <%=matmodel.digest %>
                            </div>
                        </div>
                    </div>
                </li>
                  <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">具体内容</div>
                            <div class="item-input">
                                <%=matmodel.content %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">图文页的URL</div>
                            <div class="item-input">
                                <%=matmodel.url %>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">原文地址</div>
                            <div class="item-input">
                                <%=matmodel.content_source_url %>
                            </div>
                        </div>
                    </div>
                </li>
                  <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">描述</div>
                            <div class="item-input">
                                <%=matmodel.description %>
                            </div>
                        </div>
                    </div>
                </li>
                  <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">下载地址</div>
                            <div class="item-input">
                                <%=matmodel.down_url %>
                            </div>
                        </div>
                    </div>
                </li>
                  <%}
                  }
                  else
                  {%>
                       <li>
                    <div class="item-content">
                        <div class="item-inner">
                            <div class="item-title label">获取失败原因</div>
                            <div class="item-input">
                                <textarea readonly="readonly" style="height:150px;"><%=msg %></textarea> 
                            </div>
                        </div>
                    </div>
                </li>
                  <%} %>                 
            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

</asp:Content>
