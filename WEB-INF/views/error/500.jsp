<%
response.setStatus(500);

// 获取异常类
Throwable ex = Exceptions.getThrowable(request);
if (ex != null){
	LoggerFactory.getLogger("500.jsp").error(ex.getMessage(), ex);
}

// 编译错误信息
StringBuilder sb = new StringBuilder("系统内部错误.");

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	out.print(sb);
}

// 输出异常信息页面
else {
%>
<%@page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>
<%@page import="com.thinkgem.jeesite.common.web.Servlets"%>
<%@page import="com.thinkgem.jeesite.common.utils.Exceptions"%>
<%@page import="com.thinkgem.jeesite.common.utils.StringUtils"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>500 - 系统内部错误</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>系统内部错误.</h1></div>
		<div class="errorMessage">
			系统内部错误. <br/> <br/>
			<a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a> &nbsp;
		</div>
		<script>try{top.$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>
</html>
<%
} out = pageContext.pushBody();
%>