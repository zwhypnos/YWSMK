<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>区域管理</title>
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
		<li class="active"><a href="${ctx}/cms/cmsArea/">区域列表</a></li>
		<shiro:hasPermission name="cms:cmsArea:edit"><li><a href="${ctx}/cms/cmsArea/form">区域添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsArea" action="${ctx}/cms/cmsArea/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>区域名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>区域名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="cms:cmsArea:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsArea">
			<tr>
				<td><a href="${ctx}/cms/cmsArea/form?id=${cmsArea.id}">
					${cmsArea.name}
				</a></td>
				<td>
					<fmt:formatDate value="${cmsArea.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${cmsArea.remarks}
				</td>
				<shiro:hasPermission name="cms:cmsArea:edit"><td>
    				<a href="${ctx}/cms/cmsArea/form?id=${cmsArea.id}">修改</a>
					<a href="${ctx}/cms/cmsArea/delete?id=${cmsArea.id}" onclick="return confirmx('确认要删除该区域吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>