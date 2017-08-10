<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title /></title>
	
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="icon" type="image/x-icon" />
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="bookmark"> 
	<script type="text/javascript" src="${ctxStatic}/ywsmk/ywsmk_files/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/ywsmk/ywsmk_files/jquery.cookie.js"></script>
	<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/index.css" rel="stylesheet" type="text/css" />
	<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/css.css" rel="stylesheet" type="text/css" />
	<link title="default" href="${ctxStatic}/ywsmk/ywsmk_files/theme_default.css" rel="stylesheet" type="text/css" disabled="disabled"/>
	<link title="deepblue" href="${ctxStatic}/ywsmk/ywsmk_files/theme_deepblue.css" rel="stylesheet" type="text/css" disabled="disabled" />
	<link title="lightblue" href="${ctxStatic}/ywsmk/ywsmk_files/theme_lightblue.css" rel="stylesheet" type="text/css" disabled="disabled" />
	<link title="brown" href="${ctxStatic}/ywsmk/ywsmk_files/theme_brown.css" rel="stylesheet" type="text/css" disabled="disabled" />
	<%-- <link title="red" href="${ctxStatic}/ywsmk/ywsmk_files/theme_red.css" rel="stylesheet" type="text/css" disabled="disabled" /> --%>
	<link title="white" href="${ctxStatic}/ywsmk/ywsmk_files/theme_white.css" rel="stylesheet" type="text/css" disabled="disabled" />
	
	<style type="text/css">
	/*顶部内容*/
	.logo_h{ height:88px;}
	.top_r .topcontent{  height:31px; margin:0 auto;}
	.top_r .top_righta{  float:right; line-height:31px; height:31px; text-align:right; color:#1a0eb5;}
	.top_righta a.tc{  text-align: left; text-indent:33px; display:block; float:right; color:#1a0eb5;}
	.top_righta a.tc:hover{ color:#3bc164; text-decoration: underline;}
	
	.bgtop1{background:url(${ctxStatic}/ywsmk/images/fafgg.png) no-repeat;background-position: 0 -86px; }
	.bgtop2{background:url(${ctxStatic}/ywsmk/images/fafgg.png) no-repeat;background-position: 0 -43px; float:right; text-align: left;}
	#singlename{overflow: hidden;text-overflow:ellipsis;white-space: nowrap;max-width: 120px;display: block;text-indent: 33px;float: left;}
	#merchantname{overflow: hidden;text-overflow:ellipsis;white-space: nowrap;max-width: 174px;display: block;text-indent: 33px;float: left;}
	.bgtop2 a:hover{ color:#3bc164; text-decoration: underline;} 
	</style>
	<script type="text/javascript">
	$(function(){
		var cookie_style = $.cookie("mystyle"); 
		if(cookie_style==null){ 
		    $("link[title='white']").removeAttr("disabled"); 
		}else{ 
		    $("link[title='"+cookie_style+"']").removeAttr("disabled");  
		    $("link[title!='"+cookie_style+"'][title!='normal']").attr("disabled","disabled"); 
		}
	});
	</script>
	<sitemesh:head/>
</head>
<body>
	<%-- 公共头部 --%>
	<jsp:include page="header.jsp" />
	
	<%-- 公共导航栏 --%>
	<jsp:include page="nav.jsp" />
	
	<sitemesh:body />
	
	<%-- 公共右侧栏 --%>
	<jsp:include page="right.jsp" />
	
	<%-- 公共底部 --%>
	<jsp:include page="footer.jsp" />
</body>
</html>