<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>

<!-- <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/> -->
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
    
    .page_fwwdcx{ width:320px; height:40px; float:left; padding:30px 0 10px 10px; text-align:center; font-size: 12px;}
	.result_list li{width:350px;}
	.work_inf {width: 295px;}
	.page_cur{color: #69C;background-color: #F5F5F5;margin: 3px;font-size: 16px;padding: 5px;}
	.page_cleck{color: #fff;background-color: #69C;margin: 3px;font-size: 16px;padding: 5px;}
	.page_cur:hover, .page_cur:active{color: #fff;background-color: #69C;margin: 3px;font-size: 16px;padding: 5px;}
</style>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=700a3a77911579d840eb050a1fcdc54d&plugin=AMap.AdvancedInfoWindow"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<!-- 卡片 --> 
<link title="normal" href="${ctxStatic}/ywsmk/SpryAssets/SpryAsset.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
  $(function(){
	  var height=800;
	  var sum_li_height=0;
	  $("#listbody>li").each(function(){
		  sum_li_height+=$(this).height();
		  sum_li_height+=21;
	  });
	  if(sum_li_height>height){
		  height=sum_li_height;
	  }else{
		  $(".result_list").css({"height":height});
	  }
	  $("#map").css({"left":$(".guanggao_minboxx").width()*0.37,"top":"0px","margin-top":"0px","position":"absolute","height":height}); 
  });
</script>
</head>
<body>



<!--图片广告-->
<div class="guanggao_boxx">
<div class="guanggao_minboxx">
<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" /> 
</div>
</div>
<!--图片广告-->

<!--新闻公告-->
           <div class="ywloginboy">
<div class="guanggao_minboxx">

<div class="Main_page">
<!--标题-->
<div class="Foxpro_title01">
  <div class="Foxpro_title01_txt01">
    <div class="Foxpro_title01_txt02">停车场查询</div>
  </div>
</div>
<!--标题-->
<!--搜索条件-->
<div class="NetSearch">
  <div class="SearchTxt">
    <table width="990" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td width="120">停车场名称：</td>
        <td width="195"><input id="KeyWords" type="text" class="text" placeholder="请输入关键字" value="${cmsParkingLot.name }"></td>
        <td width="675"><input id="btnSearch" type="button" class="btn" value="搜 索" onclick="javascrip:keySearch();"></td>
      </tr>
    </tbody></table>
  </div>
  <div class="navigation">
    <div class="prop-list">
      <!-- 所属区域 -->
      <div class="prop-item">
        <dl>
          <dt title="所属区域">所属区域：</dt>
          <dd id="listRegion">
            <a id="cRegionEmpty" href="javascript:void(0);" cvalue="" class="<c:if test="${empty cmsParkingLot or empty cmsParkingLot.areaId }">selected</c:if>">不限</a>
			<c:forEach items="${fnc:getAreas() }" var="area">
				<a href="javascript:void(0);" cvalue="${area.id }" class="<c:if test="${cmsParkingLot.areaId eq area.id }">selected</c:if>">${area.name }</a>
			</c:forEach>
          </dd>
        </dl>
      </div>
      <!-- 结算类型 -->
      <div class="prop-item">
        <dl class="prop-item-bottom">
          <dt title="结算类型">结算类型：</dt>
          <dd id="listTypeCard">
            <a id="cTypeCardEmpty" href="javascript:void(0);" cvalue="" class="<c:if test="${empty cmsParkingLot or empty cmsParkingLot.typeCard }">selected</c:if>">不限</a>
			<a href="javascript:void(0);" cvalue="车牌识别" class="<c:if test="${fn:contains(cmsParkingLot.typeCard,'车牌识别') }">selected</c:if>">车牌识别</a>
			<a href="javascript:void(0);" cvalue="刷卡" class="<c:if test="${fn:contains(cmsParkingLot.typeCard,'刷卡') }">selected</c:if>">刷卡</a>
          </dd>
        </dl>
      </div>
    </div>
  </div>
  <div style="clear:both;"></div>
</div>
<!--搜索条件-->
<!--结果标题-->
<div class="result_title">
  <div class="result_title01">搜索结果</div>
  <div class="result_crumbs">共有 <span id="recordcnt">${page.count }</span> 条搜索结果</div>
</div>
<!--结果标题-->
<!--搜索结果 -->
<div class="Search_result" style="position: relative;">
  <!--结果列表 -->
  <div class="result_list">
	<ul id="listbody">
		<c:if test="${not empty page and not empty page.list }">
			<c:forEach items="${page.list }" var="parkingLot">
				<li onclick="gotoMarker('${parkingLot.id}')" data-id="${parkingLot.id }" data-name="${parkingLot.name }" data-typeCard="${parkingLot.typeCard }" data-contactAddress="${parkingLot.contactAddress }" data-lng="${fn:substringBefore(parkingLot.mapCoordinates,',') }" data-lat="${fn:substringAfter(parkingLot.mapCoordinates,',') }" data-chargeStandard="${parkingLot.chargeStandard }">
					<div class="work_banner"><img src="${ctxStatic }/ywsmk/images/tcc.png" width="38" height="38">
					</div>
					<div class="work_inf">
						<div class="name">${parkingLot.name}&nbsp;&nbsp;<img src="${ctxStatic}/ywsmk/images/location.png" width="15" height="15"></div>
						<div class="mag">类型：${parkingLot.typeCard}<br>地址：${parkingLot.contactAddress}<br>收费标准：${parkingLot.chargeStandard }</div>
					</div>
				</li>
			</c:forEach>
		</c:if>
	</ul>
	<div class="page_fwwdcx"> 
	<c:if test="${not empty page and not empty page.list }">
		<!-- <a href="javascript:void(0);" onclick="ASearch(1)">首页</a> -->
		<a href="javascript:void(0);" onclick="ASearch(${page.firstPage?1:(page.pageNo-1)})" class="page_cur">&lt;</a>
		<c:set var="pageLength" value="6" />
		<c:set var="leftPageLength" value="${pageLength/2 }" />
		<c:set var="rightPageLength" value="${pageLength-leftPageLength }" />
		<c:set var="firstPageNo" value="${page.pageNo-leftPageLength<1?1:page.pageNo-leftPageLength }" />
		<c:set var="lastPageNo" value="${(page.pageNo+rightPageLength)>page.last?page.last:(page.pageNo+rightPageLength) }" />
		<c:if test="${firstPageNo gt 1 }">
			<a href="javascript:void(0);" onclick="ASearch(1)" class="page_cur">1..</a>
		</c:if>
		<c:forEach begin="${firstPageNo }" end="${lastPageNo }" step="1" varStatus="s">
			<c:set var="currForEachPageNo" value="${s.current }" />
			<a href="javascript:void(0);" onclick="ASearch(${currForEachPageNo})" class="<c:if test="${page.pageNo ne currForEachPageNo }">page-cur</c:if><c:if test="${page.pageNo eq currForEachPageNo }">page_cleck</c:if>">${currForEachPageNo }</a>
		</c:forEach>
		<c:if test="${lastPageNo lt page.totalPage }">
			<a href="javascript:void(0);" onclick="ASearch(${page.totalPage })" class="page_cur">..${page.totalPage }</a>
		</c:if>
		<a href="javascript:void(0);" onclick="ASearch(${page.lastPage?page.totalPage:(page.pageNo+1)})" class="page_cur">&gt;</a>
		<!-- <a href="javascript:void(0);" onclick="ASearch(${page.totalPage})">尾页</a> -->
		<br /><br />
		共 ${page.count } 条 当前第 ${page.pageNo } / ${page.totalPage }页 
	</c:if>
  </div>
  <!--结果列表 -->
  <!--地图显示 -->
  <div class="result_map" id="map"></div>

  <!--地图显示 -->
</div>

<div style="clear:both;"></div>
</div>
<!--搜索结果 -->

</div>
</div>
			<!--新闻公告-->
<script type="text/javascript">
	$(function(){
		$("#listRegion a").on("click",function(){
			$(this).addClass("selected").siblings().removeClass("selected");
			keySearch();
		});
		
		$("#listTypeCard a").on("click",function(){
			if($(this).attr("cvalue")==""){
				$(this).addClass("selected").siblings().removeClass("selected");
			}else{
				if($("#listTypeCard a:eq(0)").hasClass("selected")){
					$("#listTypeCard a:eq(0)").removeClass("selected");
					$(this).addClass("selected");
				}else{
					if($("#listTypeCard a.selected").size()>1){
						if($(this).hasClass("selected")){
							$(this).removeClass("selected");
						}else{
							$(this).addClass("selected");
						}
					}else{
						$(this).addClass("selected");
					}
				}
				
			}
			keySearch();
		});
	});
	
	function keySearch(pageNo){
		var name=$("#KeyWords").val();
		var areaId=$("#listRegion a.selected").attr("cvalue");
		var typeCard=[];
		for(var i=0;i<$("#listTypeCard a.selected").size();i++){
			typeCard[i]=$("#listTypeCard a.selected").eq(i).attr("cvalue");
		}
		typeCard=typeCard.toString();
		var url="${ctx}/parkingLot.html?name="+name;
		if(areaId!=null&&areaId!=""){
			url=url+"&areaId="+areaId;
		}
		if(typeCard!=null&&typeCard!=""){
			url=url+"&typeCard="+typeCard;
		}
		if(pageNo!=null&&pageNo!=""){
			url=url+"&pageNo="+pageNo;
		}
		window.location.href=url;
	}
	
	function ASearch(pageNo){
		keySearch(pageNo);
	}
	
	var map = new AMap.Map('map', {
        resizeEnable: true,
        center: [120.075058,29.306841],
		zoom: 14
    });
	
	var markers=[];
	function addMarkerAndAdvancedInfoWindow(id,lnglat,name,typeCard,contactAddress,chargeStandard){
		var marker = new AMap.Marker({
			position: lnglat,
			map:map
		});
		AMap.event.addListener(marker, 'click', function() {
			if(marker.stationId){
				var infowindow = new AMap.AdvancedInfoWindow({
					content: createContent(name,typeCard,contactAddress,chargeStandard),
					offset: new AMap.Pixel(0, -30)
				});
				marker.infowindow=infowindow;
			}
			marker.infowindow.open(map,marker.getPosition());
		});
		marker.stationId=id;
		markers[id]=marker;
	}
	
	function createContent(name,typeCard,contactAddress,chargeStandard){
		var content='<div class="info-title">'+name+'</div><div class="info-content">' +
            //'<img src="http://webapi.amap.com/images/amap.jpg">' +
            '类型:'+typeCard+'<br/>' +
			'地址:'+contactAddress+'<br/>' +
			'收费标准:'+chargeStandard+'<br/>' +
            '</div>';
		return content;
	}
	
	$("#listbody li").each(function(){
		var id=$(this).attr("data-id");
		var name=$(this).attr("data-name");
		var typeCard=$(this).attr("data-typeCard");
		var contactAddress=$(this).attr("data-contactAddress");
		var lng=Number($(this).attr("data-lng"));
		var lat=Number($(this).attr("data-lat"));
		var chargeStandard=$(this).attr("data-chargeStandard");
		addMarkerAndAdvancedInfoWindow(id,[lng,lat],name,typeCard,contactAddress,chargeStandard);
	});
	
	function gotoMarker(id){
		AMap.event.trigger(markers[id],"click");
		map.setZoomAndCenter(14, markers[id].getPosition());
	}
	
	gotoMarker($("#listbody li:eq(0)").attr("data-id"));
</script>
</body>

</html>