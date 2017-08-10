<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>


<script type="text/javascript" src="${ctxStatic}/ywsmk/js/slider.js"></script>
<script type="text/javascript" src="${ctxStatic}/ywsmk/js/gg.js"></script>
<style type="text/css">
#lbLan{width:90%;height:149px;margin-right: auto;margin-left: auto;}
#lbLan ul li{width:14%;float:left;text-align: center;}
#lbLan ul li img{width:88px;margin-top:21px;}
#lbLan ul li img:hover{width:130px;cursor: pointer;margin-top:0;}

</style>
<script type="text/javascript">
$(function(){
	var browser=navigator.appName;
	var b_version=navigator.appVersion;
	var version=b_version.split(";");
	if(typeof(version[1])!="undefined"){
		var trim_Version=version[1].replace(/[ ]/g,"");
		if(browser=="Microsoft Internet Explorer"&&(trim_Version=="MSIE6.0"||trim_Version=="MSIE7.0"||trim_Version=="MSIE8.0"||trim_Version=="MSIE9.0")){
			$(".slides").html(setImgForLteIE9());
		}else{
			$(".slides").html(setImgForGtIE9ORNotIE());
		}
	}else{
		$(".slides").html(setImgForGtIE9ORNotIE());
	}
});

function setImgForLteIE9(){
	var slides_lis = '';
	$("#bannerCtrl li").each(function(){
		var id=$(this).attr("data-id");
		var categoryId=$(this).attr("data-categoryId");
		var href;
		if(id=="#"){
			href="#";
		}else{
			href="view-"+categoryId+"-"+id+"${urlSuffix}";
		}
		slides_lis += '<li><a title="" href="'+href+'"><img    alt="" style="background-image: url('+$(this).attr("data-href")+');background-repeat: no-repeat;background-size: cover;filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src=\''+$(this).attr("data-href")+'\',sizingMethod=\'scale\');"  src="${ctxStatic}/ywsmk/images/alpha.png"></a></li>';
	});
	return slides_lis;
}

function setImgForGtIE9ORNotIE(){
	var slides_lis = '';
	$("#bannerCtrl li").each(function(){
		var id=$(this).attr("data-id");
		var categoryId=$(this).attr("data-categoryId");
		var href;
		if(id=="#"){
			href="#";
		}else{
			href="view-"+categoryId+"-"+id+"${urlSuffix}";
		}
		slides_lis += '<li><a title="" target="_blank" href="'+href+'"><img  alt="" style="background: url('+$(this).attr("data-href")+') no-repeat center;background-size: 100% 100%;" src="${ctxStatic}/ywsmk/images/alpha.png"></a></li>';
	});
	return slides_lis;
}
</script>
</head>
<body>
<c:if test="${not empty  indexFloatingAd}">
<!--广告1-->
<div id="ad1" style="z-index:99999; left: 142.25063293323552px; width: 120px; position: absolute; top: 335.663236560367px; height: 120px; visibility: visible;"><a href="${indexFloatingAd.href }" target="_blank"><img src="${indexFloatingAd.image }" width="120" height="120" border="1"></a>
</div>
<script type="text/javascript">
<!-- 
var ad1=new AdMove("ad1"); 
ad1.Run(); 
--> 
</script>
</c:if>
<!--广告+登录-->
<div class="index_main">
 
  
  
  <div id="banner_tabs" class="flexslider">
	<ul class="slides">
	
	</ul>
	<ul class="flex-direction-nav">
		<li><a class="flex-prev" href="javascript:;">Previous</a></li>
		<li><a class="flex-next" href="javascript:;">Next</a></li>
	</ul>
	<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
		<li data-href="${ctxStatic}/ywsmk/images/1.jpg" data-id="#"><a>1</a></li>
		<li data-href="${ctxStatic}/ywsmk/images/2.jpg" data-id="#"><a>2</a></li>
		<li data-href="${ctxStatic}/ywsmk/images/3.jpg" data-id="#"><a>3</a></li>
		<%-- <li data-href="${ctxStatic}/ywsmk/images/4.jpg" data-id="#"><a>4</a></li>
		<li data-href="${ctxStatic}/ywsmk/images/5.jpg" data-id="#"><a>5</a></li> --%>
		<%-- <c:choose>
			<c:when test="${empty posid1List }">
				<li data-href="${ctxStatic}/ywsmk/images/1.jpg" data-id="#"><a>1</a></li>
			</c:when>
			<c:otherwise>
				<c:forEach items="${posid1List }" var="posid1" varStatus="s">
					<li data-href="${posid1.imageSrc }" data-categoryId="${posid1.category.id }" data-id="${posid1.id }"><a>${s.count }</a></li>
				</c:forEach>
			</c:otherwise>
		</c:choose> --%>
	</ol>
</div>
  
</div>
<script type="text/javascript">
$(function() {
	var bannerSlider = new Slider($('#banner_tabs'), {
		time: 5000,
		delay: 400,
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


<!--服务通道+新闻公告自写-->
<div class="ywloginboy" style="width:1229px;">


<!--服务通道-->
<%-- <iframe style="width:100%;height:160px" scrolling="no" frameborder="0" src="${ctx}/lbLan-${site.id }${urlSuffix}"></iframe> --%>
<div id="lbLan">
<ul>
<%-- <li>
<a href="${ctx}/branch-1${urlSuffix}">
<img src="${ctxStatic}/ywsmk/ywsmk_files/serve_pic_03.jpg" /><br>
<span>服务网点</span>
</a>
</li> --%>
<c:set var="categoryList" value="${fnc:getCategoryList(site.id,'6',-1,'')}" />
<c:forEach items="${categoryList}" var="tpl">
	<c:choose>
		<c:when test="${not empty tpl.href}">
			<c:choose>
				<c:when test="${fn:indexOf(tpl.href, '://') eq -1 && fn:indexOf(tpl.href, 'mailto:') eq -1}">
					<c:set var="url" value="${ctx}${tpl.href}"/></c:when><c:otherwise><c:set var="url" value="${tpl.href}"/></c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise><c:set var="url" value="${ctx}/list-${tpl.id}${urlSuffix}"/></c:otherwise>
	</c:choose>
	<c:if test="${tpl.name ne '咨询答疑' }">
	<li>
	<a href="${url}">
	<img src="${tpl.image}" alt="${tpl.name}"/><br>
	<span>${tpl.name}</span>
	</a>
	</li>
	</c:if>
</c:forEach>
<li>
	<a href="${ctx}/merActivity.html">
	<img src="${ctxStatic}/ywsmk/ywsmk_files/serve_pic_07.jpg" alt="商户活动"/><br>
	<span>商户活动</span>
	</a>
	</li>
</ul>
</div>

<div class="ywxwka" style="width:90%;">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><div class="ywxwkaHR"></div></td>
    
  </tr>
  <tr>
    <td width="50%">
    <div class="hrborderxw">
    <div class="hrtopxw">
    市民卡新闻<a href="${ctx }/list-11${urlSuffix}" style="float:right;color: #4fc0ea;font-weight: normal;">更多...</a>
    </div>
    
    <div class="hrxianxw">
      <div class="hrxianxw_xj"></div>
     </div>
     
    <div class="hrbodyxw">
    <ul>
      <c:set var="newsArticleList" value="${fnc:getArticleList(site.id,12,5,'')}" />
      <c:forEach items="${newsArticleList }" var="article">
        <li><a href="${article.url}"><div class="xwerjixiaobiaoti">${article.title }<div class="ywxwshijian"><c:if test="${not empty article.createDate }"><fmt:formatDate value="${article.createDate }" pattern="yyyy-MM-dd"/></c:if></div></div></a></li>
      </c:forEach>
      <c:if test="${not empty newsArticleList and fn:length(newsArticleList)<5 }">
        <c:forEach begin="1" end="${5-fn:length(newsArticleList) }">
          <li></li>
        </c:forEach>
      </c:if>
    </ul>
    </div>
    </div>
    </td>
    <td width="50%">
    <div class="hrborderxw">
    <div class="hrtopxw">
    市民卡公告<a href="${ctx }/list-12${urlSuffix}" style="float:right;color: #4fc0ea;font-weight: normal;">更多...</a>
    </div>
   <div class="hrxianxw">
      <div class="hrxianxw_xj"></div>
     </div>
    <div class="hrbodyxw">
    <ul>
    <c:set var="noticeArticleList" value="${fnc:getArticleList(site.id,11,5,'')}" />
    <c:forEach items="${noticeArticleList }" var="article">
      <li><a href="${article.url}"><div class="xwerjixiaobiaoti">${article.title }<div class="ywxwshijian"><c:if test="${not empty article.createDate }"><fmt:formatDate value="${article.createDate }" pattern="yyyy-MM-dd"/></c:if></div></div></a></li>
    </c:forEach>
    <c:if test="${not empty noticeArticleList and fn:length(noticeArticleList)<5 }">
      <c:forEach begin="1" end="${5-fn:length(noticeArticleList) }">
        <li></li>
      </c:forEach>
    </c:if>
    </ul>
    </div>
    </div></td>
  </tr>
</table>
</div>
</div>

</body>

</html>