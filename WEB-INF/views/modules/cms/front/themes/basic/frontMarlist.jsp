<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>
<title>义乌市民卡服务平台</title>
<script type="text/javascript" src="${ctxStatic}/ywsmk/js/gg.js"></script>
<style type="text/css">
.index_main {
width: 80%;
height: 200px;
margin-top: 0px;
margin-right: auto;
margin-bottom: 10px;
margin-left: auto;
}
.flexslider {
margin: 0px auto 20px;
position: relative;
width: 100%;
height: 200px;
overflow: hidden;
zoom: 1;
min-width: 100%;
max-width: 100%;
}
.flexslider .slides a img {
width: 100%;
height: 200px;
display: block;
}
</style>
</head>
<body>
<c:if test="${not empty  merFloatingAd}">
<!--广告1-->
<div id="ad1" style="z-index:99999; left: 142.25063293323552px; width: 120px; position: absolute; top: 335.663236560367px; height: 120px; visibility: visible;"><a href="${merFloatingAd.href }" target="_blank"><img src="${merFloatingAd.image }" width="120" height="120" border="1"></a>
</div>
<script type="text/javascript">
<!-- 
var ad1=new AdMove("ad1"); 
ad1.Run(); 
--> 
</script>
</c:if>

<!--广告+登录-->
<div class="guanggao_boxx" style="width:1229px;">
<c:if test="${empty topList }">
<div class="guanggao_minboxx">
<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" /> 
</div>
</c:if>
<c:if test="${not empty topList }">
<div class="index_main">
  <div id="banner_tabs" class="flexslider">
	<ul class="slides">
	<c:forEach items="${topList }" var="top" >
    	<li>
			<a title="" href="${ctx }/merActivityInfo-${top.id}${urlSuffix}">
				<img    alt="" style=" background-size:100% 100%;" src="${top.poster}" onerror="${ctxStatic}/ywsmk/images/6.png" >
			</a>
		</li>
	</c:forEach>
	</ul>
	<ul class="flex-direction-nav">
		<li><a class="flex-prev" href="javascript:;">Previous</a></li>
		<li><a class="flex-next" href="javascript:;">Next</a></li>
	</ul>
	<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
	<c:forEach items="${topList }" var="top" varStatus="s">
		<li><a>${s.index+1 }</a></li>
	</c:forEach>
	</ol>
</div>
</div>
</c:if>
</div>
<script type="text/javascript">
$(function() {
	var bannerSlider = new Slider($('#banner_tabs'), {
		time: 5000,
		delay: 300,
		event: 'hover',
		auto: true,
		mode: 'fade',
		controller: $('#bannerCtrl'),
		activeControllerCls: 'active'
	});
	$('#banner_tabs .flex-prev').click(function() {
		bannerSlider.prev()
	});
	$('#banner_tabs .flex-next').click(function() {
		bannerSlider.next()
	});
})
</script>
<!--广告+登录-->

<!--新闻公告-->
           <div class="guanggao_boxx" style="width:1229px;">
				<div class="guanggao_minboxx">
			<div class="Main_page">
				<!--商户查询-->
				<div class="Search_company" style="width:737px;margin-right:4px;">
					<!--标题 -->
					<div class="Foxpro_title01">
						<div class="Foxpro_title01_txt01">
							<div class="Foxpro_title01_txt02" style="background:url( images/list_title01.gif) no-repeat bottom center;">联盟商户</div>
						</div>
                        <div class="mix">当前位置：<a href="${ctx }">首页</a>&nbsp;〉&nbsp;<a href="${ctx }/marlist-48789f612cd24e5093f32be5295666c4.html">签约商户查询</a></div>
					</div>
					<!--标题 -->
					<!--查询条件-->
					<div class="NetSearch">
						<div class="SearchTxt">
							<table border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td width="130">商户名称或地址：</td>
										<td width="195"><input id="KeyWords" type="text" class="text" placeholder="请输入关键字" value="${cmsMerchant.name }"></td>
										<td width="415"><input id="btnSearch" type="button" class="btn"  value="搜 索" onclick="javascrip:keySearch();"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="navigation01">
							<div class="prop-list01">
								<!-- 服务类型 -->
								<div class="prop-item01">
									<dl class="prop-item-bottom">
										<dt title="服务类型"><span>服务类型：</span></dt>
										<dd id="listService">
											<a id="cServiceEmpty" href="javascript:void(0);" cvalue="" class="<c:if test="${empty cmsMerchant or empty cmsMerchant.typeId }">selected</c:if>">不限</a>
											<c:forEach items="${fnc:getCmsTypes('merchant') }" var="cmsType">
												<a href="javascript:void(0);" cvalue="${cmsType.id }" class="<c:if test="${cmsMerchant.typeId eq cmsType.id }">selected</c:if>">${cmsType.name }</a>
											</c:forEach>
										</dd>
									</dl>
								</div>
								<!-- 服务类型 -->
								<!-- 所属区域 -->
								<div class="prop-item01">
									<dl>
										<dt title="所属区域">所属区域：</dt>
										<dd id="listRegion">
											<a id="cRegionEmpty" href="javascript:void(0);" cvalue="" class="<c:if test="${empty cmsMerchant or empty cmsMerchant.areaId }">selected</c:if>">不限</a>
											<c:forEach items="${fnc:getAreas() }" var="area">
												<a href="javascript:void(0);" cvalue="${area.id }" class="<c:if test="${cmsMerchant.areaId eq area.id }">selected</c:if>">${area.name }</a>
											</c:forEach>
										</dd>
									</dl>
								</div>
								<!-- 所属区域 -->
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					<!--查询条件-->

					<!--结果标题 -->
					<div class="result_title" style=" border-bottom:2px solid #D0E0D5;">
						<div class="result_title01" style=" border-bottom:2px solid #0A6DB7;">搜索结果</div>
						<div class="result_crumbs">共有 <span id="recordcnt">${page.count }</span> 条搜索结果</div>
					</div>
					<!--结果标题 -->

					<!--结果-->
					<div class="Search_result">
						<div class="result_list01">
							<ul id="listbody" >
								<c:if test="${not empty page and not empty page.list }">
									<c:forEach items="${page.list }" var="merchant" varStatus="s">
										<li onclick="window.open('${ctx }/marInfo-${merchant.id }${urlSuffix}')" style="cursor: pointer;<c:if test="${s.index%2==0 }">margin-right:10px;</c:if>">
											<div class="company_box">
												<div class="company_pic">
													<img src="<c:if test="${empty merchant.image }">${ctxStatic }/ywsmk/images/yw_mar_log.png</c:if><c:if test="${not empty merchant.image }">${merchant.image }</c:if>" width="95" height="95">
												</div>
												<div class="company_txt">
													<div class="company_txt_name">
														<span class="ellipsis " title="${merchant.name }">           
															<a >${merchant.name }</a>            
		        											<a title="地图定位" ><img style="width:20px;" src="${ctxStatic}/ywsmk/images/location.png"></a>       
														</span>
													</div>
													<div class="company_txt_main">
														<span class="ellipsis " title="${merchant.contactAddress }">地址：${merchant.contactAddress }</span>
														<span class="ellipsis " title="${merchant.contactWay }">电话：${merchant.contactWay }</span>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:if>
							</ul>
							<div class="page" style="padding-left: 0px;">总共 ${page.count } 条记录 当前第 ${page.pageNo } / ${page.totalPage }页
								<c:if test="${not empty page and not empty page.list }">
									<a href="javascript:void(0);" onclick="ASearch(1)">首页</a>
									<a href="javascript:void(0);" onclick="ASearch(${page.firstPage?1:(page.pageNo-1)})">上一页</a>
									<c:forEach begin="${page.first }" end="${page.last }" step="1" varStatus="s">
										<c:set var="currForEachPageNo" value="${s.current }" />
										<a href="javascript:void(0);" onclick="ASearch(${currForEachPageNo})" class="<c:if test="${page.pageNo eq currForEachPageNo }">page-cur</c:if>">${currForEachPageNo }</a>
									</c:forEach>
									<a href="javascript:void(0);" onclick="ASearch(${page.lastPage?page.totalPage:(page.pageNo+1)})">下一页</a>
									<a href="javascript:void(0);" onclick="ASearch(${page.totalPage})">尾页</a>
								</c:if>
							</div>

						</div>
						<div style="clear:both;"></div>
					</div>
					<!--结果-->
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
            </div></div>
			<!--新闻公告-->
			<script type="text/javascript">
				$(function(){
					$("#listService a").on("click",function(){
						$(this).addClass("selected").siblings().removeClass("selected");
						keySearch();
					});
					
					$("#listRegion a").on("click",function(){
						$(this).addClass("selected").siblings().removeClass("selected");
						keySearch();
					});
					
					$("#KeyWords").on("keypress",function(event){
						if(event.keyCode==13){
							keySearch();
						}
						return true;
					});
				});
				
				function keySearch(pageNo){
					var name=$("#KeyWords").val();
					var areaId=$("#listRegion a.selected").attr("cvalue");
					var typeId=$("#listService a.selected").attr("cvalue");
					var url="${ctx}${category.href}?name="+name;
					if(areaId!=null&&areaId!=""){
						url=url+"&areaId="+areaId;
					}
					if(typeId!=null&&typeId!=""){
						url=url+"&typeId="+typeId;
					}
					if(pageNo!=null&&pageNo!=""){
						url=url+"&pageNo="+pageNo;
					}
					window.location.href=url;
				}
				
				function ASearch(pageNo){
					keySearch(pageNo);
				}
			</script>
</body>
</html>