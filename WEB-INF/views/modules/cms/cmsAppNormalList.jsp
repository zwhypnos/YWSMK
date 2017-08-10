<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>信息管理</title>
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
		<li><a href="${ctx}/cms/cmsAppNormal/article?typeApp=${typeApp}">文章修改</a></li>
		<li class="active"><a href="${ctx}/cms/cmsAppNormal?typeApp=${typeApp}">信息列表</a></li>
		<shiro:hasPermission name="cms:cmsAppNormal:edit"><li><a href="${ctx}/cms/cmsAppNormal/form?typeApp=${typeApp}">信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsAppNormal" action="${ctx}/cms/cmsAppNormal?typeApp=${typeApp}" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>区域选择：</label>
				<form:select path="areaId" class="input-medium">
					<form:option value="" label="全部"/>
					<c:forEach items="${fnc:getAreas()}" var="area">
						<form:option value="${area.id }" label="${area.name }"/>
					</c:forEach>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>区域</th>
				<th>更新时间</th>
				<shiro:hasPermission name="cms:cmsAppNormal:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsAppNormal">
			<tr>
				<td><a href="${ctx}/cms/cmsAppNormal/form?id=${cmsAppNormal.id}">
					${cmsAppNormal.name}
				</a></td>
				<td>
					${cmsAreaMap[cmsAppNormal.areaId]}
				</td>
				<td>
					<fmt:formatDate value="${cmsAppNormal.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cms:cmsAppNormal:edit"><td>
    				<a href="${ctx}/cms/cmsAppNormal/form?id=${cmsAppNormal.id}">修改</a>
					<a href="${ctx}/cms/cmsAppNormal/delete?id=${cmsAppNormal.id}" onclick="return confirmx('确认要删除该信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>