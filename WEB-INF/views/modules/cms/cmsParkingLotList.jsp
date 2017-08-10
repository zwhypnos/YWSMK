<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>停车场管理</title>
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
		<li><a href="${ctx}/cms/cmsAppNormal/article?typeApp=tcc">文章修改</a></li>
		<li class="active"><a href="${ctx}/cms/cmsParkingLot/">停车场列表</a></li>
		<shiro:hasPermission name="cms:cmsParkingLot:edit"><li><a href="${ctx}/cms/cmsParkingLot/form">停车场添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsParkingLot" action="${ctx}/cms/cmsParkingLot/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>停车场名称：</label>
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
				<th>停车场名称</th>
				<th>所在区域</th>
				<th>付费类型</th>
				<th>更新时间</th>
				<shiro:hasPermission name="cms:cmsParkingLot:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsParkingLot">
			<tr>
				<td><a href="${ctx}/cms/cmsParkingLot/form?id=${cmsParkingLot.id}">
					${cmsParkingLot.name}</a>
				</td>
				<td>
					${cmsAreaMap[cmsParkingLot.areaId]}
				</td>
				<td>
					${cmsParkingLot.typeCard}
				</td>
				<td>
					<fmt:formatDate value="${cmsParkingLot.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cms:cmsParkingLot:edit"><td>
    				<a href="${ctx}/cms/cmsParkingLot/form?id=${cmsParkingLot.id}">修改</a>
					<a href="${ctx}/cms/cmsParkingLot/delete?id=${cmsParkingLot.id}" onclick="return confirmx('确认要删除该停车场吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>