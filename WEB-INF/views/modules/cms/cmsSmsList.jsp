<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>短信记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/cmsSms/">短信记录列表</a></li>
		<shiro:hasPermission name="cms:cmsSms:edit"><li><a href="${ctx}/cms/cmsSms/form">短信记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsSms" action="${ctx}/cms/cmsSms/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>手机号：</label>
				<form:input path="mobile" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>IP：</label>
				<form:input path="ip" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>发送时间：</label>
				<input name="beginSendTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${cmsSms.beginSendTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endSendTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${cmsSms.endSendTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>手机号</th>
				<th>IP</th>
				<th>发送时间</th>
				<shiro:hasPermission name="cms:cmsSms:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsSms">
			<tr>
				<td><a href="${ctx}/cms/cmsSms/form?id=${cmsSms.id}">
					${cmsSms.mobile}
				</a></td>
				<td>
					${cmsSms.ip}
				</td>
				<td>
					<fmt:formatDate value="${cmsSms.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cms:cmsSms:edit"><td>
    				<a href="${ctx}/cms/cmsSms/form?id=${cmsSms.id}">修改</a>
					<a href="${ctx}/cms/cmsSms/delete?id=${cmsSms.id}" onclick="return confirmx('确认要删除该短信记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>