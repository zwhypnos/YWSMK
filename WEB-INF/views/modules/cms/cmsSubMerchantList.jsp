<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>网点维护</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="icon" type="image/x-icon" />
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="${ctxStatic}/ywsmk/favicon.ico" rel="bookmark">
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
		<li class="active"><a href="${ctx}/cms/cmsMerchant/sublist?fId=${fId}">网点列表</a></li>
		<shiro:hasPermission name="cms:cmsMerchant:edit"><li><a href="${ctx}/cms/cmsMerchant/subform?fId=${fId}">网点添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsMerchant" action="${ctx}/cms/cmsMerchant/sublist" method="post" class="breadcrumb form-search">
		<input id="fId" name="fId" type="hidden" value="${fId}"/>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>网点名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>区域编号：</label>
				<form:select path="areaId" class="input-medium">
					<form:option value="" label="全部"/>
					<c:forEach items="${fnc:getAreas()}" var="area">
						<form:option value="${area.id }" label="${area.name }"/>
					</c:forEach>
				</form:select>
			</li>
			<li><label>类型编号：</label>
				<form:select path="typeId" class="input-medium">
					<form:option value="" label="全部"/>
					<c:forEach items="${fnc:getCmsTypes('merchant')}" var="cmsType">
						<form:option value="${cmsType.id }" label="${cmsType.name }"/>
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
				<th>网点编号</th>
				<th>网点名称</th>
				<th>区域</th>
				<th>类型</th>
				<th>更新时间</th>
				<shiro:hasPermission name="cms:cmsMerchant:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsMerchant">
			<tr>
				<td>
					${cmsMerchant.merchantId}
				</td>
				<td><a href="${ctx}/cms/cmsMerchant/subform?id=${cmsMerchant.id}">
					${cmsMerchant.name}
				</a></td>
				<td>
					${cmsAreaMap[cmsMerchant.areaId]}
				</td>
				<td>
					${cmsBasicTypeMap[cmsMerchant.typeId]}
				</td>
				<td>
					<fmt:formatDate value="${cmsMerchant.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cms:cmsMerchant:edit"><td>
    				<a href="${ctx}/cms/cmsMerchant/subform?id=${cmsMerchant.id}">修改</a>
					<a href="${ctx}/cms/cmsMerchant/delete?id=${cmsMerchant.id}" onclick="return confirmx('确认要删除该网点吗？', this.href)">删除</a>
					<a href="${ctx}/cms/cmsMerchant/top?id=${cmsMerchant.id}">置顶</a>
					<c:choose>
						<c:when test="${cmsMerchant.hidden eq 0 }">
							<a href="${ctx}/cms/cmsMerchant/hidden?id=${cmsMerchant.id}">隐藏</a>
						</c:when>
						<c:when test="${cmsMerchant.hidden eq 1 }">
							<a href="${ctx}/cms/cmsMerchant/show?id=${cmsMerchant.id}">展示</a>
						</c:when>
					</c:choose>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>