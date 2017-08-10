<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<title></title>

<!-- Load modernizr or html5shiv -->
<script src="${ctxStatic}/ywsmk/lb_dange/lib/modernizr/modernizr-custom.js"></script>
<!--<script src="../lib/html5shiv/html5shiv.js"></script>-->

<!-- Load jQuery -->
<script src="${ctxStatic}/ywsmk/lb_dange/lib/jquery/jquery.js"></script>

<!-- Load miSlider -->
<link href="${ctxStatic}/ywsmk/lb_dange/css/mislider.css" rel="stylesheet">
<link href="${ctxStatic}/ywsmk/lb_dange/css/mislider-skin-cameo.css" rel="stylesheet">
<script src="${ctxStatic}/ywsmk/lb_dange/js/mislider.js"></script>
<script>
	jQuery(function ($) {
		var slider = $('.mis-stage').miSlider({
			//  The height of the stage in px. Options: false or positive integer. false = height is calculated using maximum slide heights. Default: false
			stageHeight: 380,
			//  Number of slides visible at one time. Options: false or positive integer. false = Fit as many as possible.  Default: 1
			slidesOnStage: false,
			//  The location of the current slide on the stage. Options: 'left', 'right', 'center'. Defualt: 'left'
			slidePosition: 'center',
			//  The slide to start on. Options: 'beg', 'mid', 'end' or slide number starting at 1 - '1','2','3', etc. Defualt: 'beg'
			slideStart: 'mid',
			//  The relative percentage scaling factor of the current slide - other slides are scaled down. Options: positive number 100 or higher. 100 = No scaling. Defualt: 100
			slideScaling: 150,
			//  The vertical offset of the slide center as a percentage of slide height. Options:  positive or negative number. Neg value = up. Pos value = down. 0 = No offset. Default: 0
			offsetV: -5,
			//  Center slide contents vertically - Boolean. Default: false
			centerV: true,
			//  Opacity of the prev and next button navigation when not transitioning. Options: Number between 0 and 1. 0 (transparent) - 1 (opaque). Default: .5
			navButtonsOpacity: 1
		});
	});
</script>
<!-- Apply other styles
<link href='http://fonts.useso.com/css?family=Roboto+Condensed:400|Roboto:500' rel='stylesheet'> -->
<link href="${ctxStatic}/ywsmk/lb_dange/css/styles.css" rel="stylesheet">

</head>
<body>
<div id="wrapper">
<figure>
<div class="mis-stage" style="height: 250px;">
	<!-- The element to select and apply miSlider to - the class is optional -->
	<ol class="mis-slider">
		<!-- The slider element - the class is optional -->
		<li class="mis-slide">
			<a href="${ctx}/branch-1${urlSuffix}" class="mis-container" target="_parent">
				<figure>
					<img src="${ctxStatic}/ywsmk/ywsmk_files/serve_pic_03.jpg" alt="Hidden Pond">
					<figcaption>服务网点</figcaption>
				</figure>
			</a>
		</li>
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
			<li class="mis-slide">
				<a href="${url}" class="mis-container" target="_parent">
					<figure>
						<img src="${tpl.image}" alt="${tpl.name}">
						<figcaption>${tpl.name}</figcaption>
					</figure>
				</a>
			</li>
		</c:forEach>
		
	</ol>
</div>
</div>

</body>
</html>