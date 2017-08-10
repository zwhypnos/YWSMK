<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=700a3a77911579d840eb050a1fcdc54d&plugin=AMap.AdvancedInfoWindow"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript">
$(function () {
if($("#AMapLng").val()!=''&&$("#AMapLat").val()!=''){
	var map = new AMap.Map('map', {
	    resizeEnable: true,
	    center: [120.075058,29.306841],
		zoom: 15
	});

	var infowindow;
	var infoWindowContent = '<div class="info-title">${merchant.name }</div><div class="info-content">' +
							'联系地址：${merchant.contactAddress }<br/>' +
							'联系方式：${merchant.contactWay }<br/>' +
							'</div>';
	 
	map.plugin('AMap.AdvancedInfoWindow', function () {
	  infowindow = new AMap.AdvancedInfoWindow({
		panel: "panel",
	    content: infoWindowContent,
	    offset: new AMap.Pixel(0, -30)
	  });
	  infowindow.open(map, [$("#AMapLng").val(), $("#AMapLat").val()]);
	  
	});

	var marker = new AMap.Marker({
	    position: new AMap.LngLat($("#AMapLng").val(),$("#AMapLat").val())
	});
	marker.setMap(map); 
	map.setZoomAndCenter(15, marker.getPosition());
}else{
	$("#map").css("display","none");
}
});
</script>
<meta name="decorator" content="cms_ywsmk_index"/>
<title>义乌市民卡服务平台</title>
<style type="text/css">
    .info-title {
        color: white;
        font-size: 14px;
        background-color:blue;
        line-height: 26px;
        padding: 0px 0 0 6px;
        font-weight: lighter;
        letter-spacing: 1px
    }
    .info-content {
        font: 12px Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial;
        padding: 4px;
        color: #666666;
        line-height: 23px;
    }
    .info-content img {
        float: left;
        margin: 3px;
    }
</style>
</head>
<body>
<!--市民卡服务-->
<div class="ywloginboy">
<div class="guanggao_minboxx" style="width:1026px;">
<div class="Main_page">
  <!--商户查询-->
  <div class="Search_company" style="width:781px;margin-right:4px;">
    <!--标题 -->
    <div class="Foxpro_title01">
      <div class="Foxpro_title01_txt01" style="border-bottom:3px solid #0A6DB7;">
        <div class="Foxpro_title01_txt02" style="background:url(${ctxStatic}/ywsmk/images/list_title01.gif) no-repeat bottom center;">签约商户</div>
      </div>
    </div>
    <!--标题 -->
    <!--结果-->
    <div class="Search_result00112">
      <div class="company_box00112">
        <div class="company_pic01"><img src="<c:if test="${empty merchant.image }">${ctxStatic }/ywsmk/images/yw_mar_log.png</c:if><c:if test="${not empty merchant.image }">${merchant.image }</c:if>" style="width:95px;height:95px;"></div>
        <div class="company_txt01">
          <div class="company_txt01_name">
            <span class="ellipsis eps550" title="${merchant.name }">
              ${merchant.name }
              <a href="#CorpMap" title="地图定位"><img style="width:25px;margin-bottom: -5px;" src="${ctxStatic}/ywsmk/images/location.png"></a>
            </span>
          </div>
          <div class="company_txt01_main">
            <span class="ellipsis eps550" title="${merchant.contactAddress }">联系地址：${merchant.contactAddress }</span>
            <span class="ellipsis eps550" title="${merchant.contactWay }">联系方式：${merchant.contactWay }</span>
          </div>
        </div>
        <div style="clear:both;"></div>
      </div>
      <div style="clear:both;"></div>
    </div>
    <!--结果-->

    <!--商户介绍 -->
    <div class="result_title" style="border-bottom:3px solid #D0E0D5;">
      <div class="result_title01" style=" border-bottom:3px solid #0A6DB7;">商户简介</div>
    </div>
    <div class="Search_result00112" style="text-align:left" id="profiles" htmlEscape="true">
    ${merchant.profiles }
    </div>
    <!--商户介绍 -->

    <!--商户地址 -->
    <div class="result_title" style=" border-bottom:3px solid #D0E0D5;">
      <div class="result_title01" style=" border-bottom:2px solid #0A6DB7;" id="CorpMap">商户地址</div>
    </div>
    <div class="Search_result01">
      <input type="hidden" id="AMapLng" value="${fn:split(merchant.mapCoordinates,',')[0]}">
      <input type="hidden" id="AMapLat" value="${fn:split(merchant.mapCoordinates,',')[1]}">
      <div id="map" style="width: 720px; height: 410px; overflow: hidden; position: relative; z-index: 0; color: rgb(0, 0, 0); text-align: left; background-color: rgb(243, 241, 236);"></div>
    </div>
    <!--商户地址 -->
  </div>
  <!--商户查询-->
	<!--商户活动-->
	<div class="company_act">
	<!--标题-->
	<div class="hot_title"> 
	  <div class="hot_title_txt">商户活动</div>
	</div>
	<!--标题-->
	
	<!--活动-->
	<div class="company_act_main">
	  <ul>
	  <c:forEach items="${rightList }" var="right">
	   <li>
	     <div class="company_act_inf">
	       <div class="company_act_inf01">
	         <span class="ellipsis eps190" title="${right.name }">${right.name }</span>
	         <fmt:formatDate value="${right.startDate}" pattern="yyyy.MM.dd"/>~<fmt:formatDate value="${right.endDate}" pattern="yyyy.MM.dd"/>
	       </div>
	     </div>
	     <div class="company_act_pic"><a href="${ctx }/merActivityInfo-${right.id}${urlSuffix}" target="_blank"><img src="${right.poster }" onerror="" style="width:190px;height:215px;"></a></div>
	   </li>
	  </c:forEach>
	 </ul>
	 <div class="company_act_more"><input type="button" class="inf_btn" value="查看全部活动" onclick="javascript:window.open('${ctx }/merActivity${urlSuffix}');"></div>
	 <div style="clear:both;"></div>
	</div>
	<!--活动-->
	</div>
	<!--商户活动-->
  
  <div style="clear:both;"></div>
</div>



</div>
</div>
<!--市民卡服务-->
</body>
</html>