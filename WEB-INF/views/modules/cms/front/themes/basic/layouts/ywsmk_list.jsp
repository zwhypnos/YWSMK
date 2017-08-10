<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<head>
	<title><sitemesh:title /></title>
	<sitemesh:head/>
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="icon" type="image/x-icon" />
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="bookmark"> 
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