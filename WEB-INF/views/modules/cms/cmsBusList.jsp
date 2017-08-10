<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公交线路管理</title>
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
		<li><a href="${ctx}/cms/cmsAppNormal/article?typeApp=gjc">文章修改</a></li>
		<li class="active"><a href="${ctx}/cms/cmsBus/">公交线路列表</a></li>
		<shiro:hasPermission name="cms:cmsBus:edit"><li><a href="${ctx}/cms/cmsBus/form">公交线路添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsBus" action="${ctx}/cms/cmsBus/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>线路名称：</label>
				<form:input path="loadName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>起点：</label>
				<form:input path="startSite" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>终点：</label>
				<form:input path="endSite" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>线路名称</th>
				<th>起点</th>
				<th>终点</th>
				<th>更新时间</th>
				<shiro:hasPermission name="cms:cmsBus:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsBus">
			<tr>
				<td><a href="${ctx}/cms/cmsBus/form?id=${cmsBus.id}">
					${cmsBus.loadName}
				</a></td>
				<td>
					${cmsBus.startSite}
				</td>
				<td>
					${cmsBus.endSite}
				</td>
				<td>
					<fmt:formatDate value="${cmsBus.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cms:cmsBus:edit"><td>
    				<a href="${ctx}/cms/cmsBus/form?id=${cmsBus.id}">修改</a>
					<a href="${ctx}/cms/cmsBus/delete?id=${cmsBus.id}" onclick="return confirmx('确认要删除该公交线路吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>