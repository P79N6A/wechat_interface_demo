<%@ Page Title="当前位置信息" Language="C#" MasterPageFile="~/layout/page.Master" AutoEventWireup="true" CodeBehind="myaddressinfo.aspx.cs" Inherits="WebApp.page.dialogue.myaddressinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="content-block-title">当前位置信息</div>
    <div class="list-block">
        <ul>
            <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">经度</div>
                    <div class="item-after"><%=adderss.result.location.lat %></div>
                </div>
            </li>
            <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">纬度</div>
                    <div class="item-after"><%=adderss.result.location.lng %></div>
                </div>
            </li>
              <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">结构化地址</div>
                    <div class="item-after"><%=adderss.result.formatted_address %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">所在商圈</div>
                    <div class="item-after"><%=adderss.result.business %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">结果描述</div>
                    <div class="item-after"><%=adderss.result.sematic_description %></div>
                </div>
            </li>
        </ul>
    </div>

     <div class="content-block-title">详细信息</div>
    <div class="list-block">
        <ul>
            <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">国家</div>
                    <div class="item-after"><%=adderss.result.addressComponent.country %></div>
                </div>
            </li>
            <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">省名</div>
                    <div class="item-after"><%=adderss.result.addressComponent.province %></div>
                </div>
            </li>
              <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">城市名</div>
                    <div class="item-after"><%=adderss.result.addressComponent.city %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">区县名</div>
                    <div class="item-after"><%=adderss.result.addressComponent.district %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">街道名</div>
                    <div class="item-after"><%=adderss.result.addressComponent.street %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">街道门牌号</div>
                    <div class="item-after"><%=adderss.result.addressComponent.street_number %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">行政区划代码</div>
                    <div class="item-after"><%=adderss.result.addressComponent.adcode %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">国家代码</div>
                    <div class="item-after"><%=adderss.result.addressComponent.country_code %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">与坐标点的方向</div>
                    <div class="item-after"><%=adderss.result.addressComponent.direction %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">与坐标点的距离</div>
                    <div class="item-after"><%=adderss.result.addressComponent.distance %></div>
                </div>
            </li>
        </ul>
    </div>

     <div class="content-block-title">周边信息</div>
    <div class="list-block">
        <%foreach (var item in adderss.result.pois)
          { %>
             <ul>
            <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">地址信息</div>
                    <div class="item-after"><%=item.addr %></div>
                </div>
            </li>
            <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">数据来源</div>
                    <div class="item-after"><%=item.cp %></div>
                </div>
            </li>
              <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">与坐标点的方向</div>
                    <div class="item-after"><%=item.direction %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">离坐标点距离</div>
                    <div class="item-after"><%=item.distance %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">poi名称</div>
                    <div class="item-after"><%=item.name %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">poi类型</div>
                    <div class="item-after"><%=item.poiType %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">poi坐标{x,y}</div>
                    <div class="item-after">x:<%=item.point.x %> y:<%=item.point.y %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">电话</div>
                    <div class="item-after"><%=item.tel %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">poi唯一标识</div>
                    <div class="item-after"><%=item.uid %></div>
                </div>
            </li>
             <li class="item-content">
                <div class="item-media"><i class="icon icon-f7"></i></div>
                <div class="item-inner">
                    <div class="item-title">邮编</div>
                    <div class="item-after"><%=item.zip %></div>
                </div>
            </li>
        </ul>
          <%} %>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
