<%@ Page Title="获取素材列表详细" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="getallmateriallistdetail.aspx.cs" Inherits="WebApp.page.dialogue.getallmateriallistdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content native-scroll" id="page-photo-browser">
        <div class="content-block-title">获取素材列表详细 <a href="javascript:void(0);" onclick="window.location='getallmateriallist.aspx'">返回</a></div>

        <div class="list-block">
            <ul>
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">素材总数</div>
                        <div class="item-after"><%=material.total_count %></div>
                    </div>
                </li>
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">获取总数</div>
                        <div class="item-after"><%=material.item_count %></div>
                    </div>
                </li>
            </ul>

            <%if (material.item!=null)
              {
                  foreach (var item in material.item)
                  {%>
            <ul>
                 <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">素材ID</div>
                        <div class="item-after"><%=item.media_id%></div>
                    </div>
                </li>
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">更新时间</div>
                        <div class="item-after"><%=item.update_time%></div>
                    </div>
                </li>
                <%if (Request["type"] == "news")
                  {
                      foreach (var item1 in item.content.news_item)
                      {%>
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">标题</div>
                        <div class="item-after"><%=item1.title%></div>
                    </div>
                </li>
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">素材id</div>
                        <div class="item-after"><%=item1.thumb_media_id%></div>
                    </div>
                </li>
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">是否显示封面</div>
                        <div class="item-after"><%=item1.show_cover_pic%></div>
                    </div>
                </li>
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">作者</div>
                        <div class="item-after"><%=item1.author%></div>
                    </div>
                </li>
                 <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">摘要</div>
                        <div class="item-after"><%=item1.digest%></div>
                    </div>
                </li>
                 <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">具体内容</div>
                        <div class="item-after"><%=item1.content%></div>
                    </div>
                </li>
                 <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">图文页的URL</div>
                        <div class="item-after"><%=item1.url%></div>
                    </div>
                </li>
                 <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">原文地址</div>
                        <div class="item-after"><%=item1.content_source_url%></div>
                    </div>
                </li>                
                <%}
                  }
                  else
                  { %>
               
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">文件名称</div>
                        <div class="item-after"><%=item.name%></div>
                    </div>
                </li>
                <li class="item-content">
                    <div class="item-media"><i class="icon icon-f7"></i></div>
                    <div class="item-inner">
                        <div class="item-title">图片的URL</div>
                        <div class="item-after"><%=item.url%></div>
                    </div>
                </li>
                <%} %>
            </ul>
            <%}
              } %>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
