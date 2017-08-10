<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户管理</title>
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
		<li class="active"><a href="${ctx}/cms/cmsMerchant/">商户列表</a></li>
		<shiro:hasPermission name="cms:cmsMerchant:edit"><li><a href="${ctx}/cms/cmsMerchant/form">商户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsMerchant" action="${ctx}/cms/cmsMerchant/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>商户名称：</label>
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
				<th>商户编号</th>
				<th>商户名称</th>
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
				<td><a href="${ctx}/cms/cmsMerchant/form?id=${cmsMerchant.id}">
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
    				<a href="${ctx}/cms/cmsMerchant/form?id=${cmsMerchant.id}">修改</a>
					<a href="${ctx}/cms/cmsMerchant/delete?id=${cmsMerchant.id}" onclick="return confirmx('删除商户会将所拥有的子商户一起删除，确认要删除该商户吗？', this.href)">删除</a>
					<%-- <a href="${ctx}/cms/cmsMerchant/top?id=${cmsMerchant.id}">置顶</a> --%>
					<%-- <c:choose>
						<c:when test="${cmsMerchant.hidden eq 0 }">
							<a href="${ctx}/cms/cmsMerchant/hidden?id=${cmsMerchant.id}">隐藏</a>
						</c:when>
						<c:when test="${cmsMerchant.hidden eq 1 }">
							<a href="${ctx}/cms/cmsMerchant/show?id=${cmsMerchant.id}">展示</a>
						</c:when>
					</c:choose> --%>
					<a style="cursor: pointer;" onclick="window.open('${ctx}/cms/cmsMerchant/sublist?fId=${cmsMerchant.id}','newwindow','height=520,width=1100,top=70,left=172,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')">网点维护</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>