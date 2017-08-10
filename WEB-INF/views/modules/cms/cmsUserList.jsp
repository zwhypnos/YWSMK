<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人用户管理</title>
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
		<li class="active"><a href="${ctx}/cms/cmsUser/">个人用户列表</a></li>
		<shiro:hasPermission name="cms:cmsUser:edit"><li><a href="${ctx}/cms/cmsUser/form">个人用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsUser" action="${ctx}/cms/cmsUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>手机号：</label>
				<form:input path="phone" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<%-- <li><label>市民卡号：</label>
				<form:input path="card" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li> --%>
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idcard" htmlEscape="false" maxlength="200" class="input-medium"/>
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
				<th>用户名</th>
				<th>姓名</th>
				<th>身份证号</th>
				<th>注册时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="cms:cmsUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsUser">
			<tr>
				<td><a href="${ctx}/cms/cmsUser/form?id=${cmsUser.id}">
					${cmsUser.phone}
				</a></td>
				<td>
					${cmsUser.username}
				</td>
				<td>
					${cmsUser.name}
				</td>
				<td>
					${cmsUser.idcard}
				</td>
				<td>
					<fmt:formatDate value="${cmsUser.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${cmsUser.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${cmsUser.remarks}
				</td>
				<shiro:hasPermission name="cms:cmsUser:edit"><td>
    				<a href="${ctx}/cms/cmsUser/form?id=${cmsUser.id}">修改</a>
					<a href="${ctx}/cms/cmsUser/delete?id=${cmsUser.id}" onclick="return confirmx('确认要删除该个人用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>