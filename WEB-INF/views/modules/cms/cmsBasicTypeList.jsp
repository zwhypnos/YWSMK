<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>基本类型管理</title>
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
		
		function updateSort() {
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/cmsBasicType/updateSort");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/cmsBasicType/">基本类型列表</a></li>
		<shiro:hasPermission name="cms:cmsBasicType:edit"><li><a href="${ctx}/cms/cmsBasicType/form">基本类型添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsBasicType" action="${ctx}/cms/cmsBasicType/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>类型名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>归属模块：</label>
				<form:select path="belong" class="input-medium">
					<form:option value="" label="全部"/>
					<form:option value="branch" label="服务类型"/>
					<form:option value="branch_category" label="服务机构"/>
					<form:option value="merchant" label="商户类型"/>
					<form:option value="card" label="卡种"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>类型名称</th>
				<th>归属模块</th>
				<th>更新时间</th>
				<th>排序</th>
				<shiro:hasPermission name="cms:cmsBasicType:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsBasicType">
			<tr>
				<td><a href="${ctx}/cms/cmsBasicType/form?id=${cmsBasicType.id}">
					${cmsBasicType.name}
				</a></td>
				<td>
					<c:if test="${cmsBasicType.belong eq 'branch'}">服务类型</c:if>
					<c:if test="${cmsBasicType.belong eq 'branch_category'}">服务机构</c:if>
					<c:if test="${cmsBasicType.belong eq 'merchant'}">商户类型</c:if>
				</td>
				<td>
					<fmt:formatDate value="${cmsBasicType.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td style="text-align:center;">
					<shiro:hasPermission name="cms:cmsBasicType:edit">
						<input type="hidden" name="ids" value="${cmsBasicType.id}"/>
						<input name="sorts" type="text" value="${cmsBasicType.sort}" style="width:50px;margin:0;padding:0;text-align:center;">
					</shiro:hasPermission><shiro:lacksPermission name="cms:cmsBasicType:edit">
						${cmsBasicType.sort}
					</shiro:lacksPermission>
				</td>
				<shiro:hasPermission name="cms:cmsBasicType:edit"><td>
    				<a href="${ctx}/cms/cmsBasicType/form?id=${cmsBasicType.id}">修改</a>
					<a href="${ctx}/cms/cmsBasicType/delete?id=${cmsBasicType.id}" onclick="return confirmx('确认要删除该基本类型吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<shiro:hasPermission name="cms:cmsBasicType:edit"><div class="form-actions pagination-left">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
		</div></shiro:hasPermission>
	</form>
	<div class="pagination">${page}</div>
</body>
</html>