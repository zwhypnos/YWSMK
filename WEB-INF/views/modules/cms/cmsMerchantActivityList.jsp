<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户活动管理</title>
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
		<li class="active"><a href="${ctx}/cms/cmsMerchantActivity/">商户活动列表</a></li>
		<%-- <shiro:hasPermission name="cms:cmsMerchantActivity:edit"><li><a href="${ctx}/cms/cmsMerchantActivity/form">商户活动添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsMerchantActivity" action="${ctx}/cms/cmsMerchantActivity/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>活动名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>商家名称：</label>
				<form:input path="merchantName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<%-- <li><label>审核状态：</label>
				<form:select path="auditState" class="input-medium">
					<form:option value="" label="全部"/>
					<form:option value="0" label="未审核"/>
					<form:option value="1" label="通过"/>
					<form:option value="2" label="未通过"/>
				</form:select>
			</li>
			<li><label>审核时间：</label>
				<input name="beginAuditDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${cmsMerchantActivity.beginAuditDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endAuditDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${cmsMerchantActivity.endAuditDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>活动名称</th>
				<th>活动时间</th>
				<th>商家名称</th>
				<th>审核状态</th>
				<!-- <th>审核时间</th> -->
				<shiro:hasPermission name="cms:cmsMerchantActivity:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsMerchantActivity">
			<tr>
				<td><a href="${ctx}/cms/cmsMerchantActivity/form?id=${cmsMerchantActivity.id}">
					${cmsMerchantActivity.name}
				</a></td>
				<td>
					<fmt:formatDate value="${cmsMerchantActivity.startDate}" pattern="yyyy-MM-dd"/> 至 <fmt:formatDate value="${cmsMerchantActivity.endDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${cmsMerchantActivity.merchantName}
				</td>
				<td>
					<c:if test="${cmsMerchantActivity.auditState eq '0'}">未审核</c:if>
					<c:if test="${cmsMerchantActivity.auditState eq '1'}">通过</c:if>
					<c:if test="${cmsMerchantActivity.auditState eq '2'}">未通过</c:if>
				</td>
				<%-- <td>
					<fmt:formatDate value="${cmsMerchantActivity.auditDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td> --%>
				<shiro:hasPermission name="cms:cmsMerchantActivity:edit"><td>
					<a href="${ctx}/cms/cmsMerchantActivity/form?id=${cmsMerchantActivity.id}"><c:if test="${cmsMerchantActivity.auditState eq '0' }">审核</c:if><c:if test="${cmsMerchantActivity.auditState ne '0' }">查看</c:if></a>
    				
					<a href="${ctx}/cms/cmsMerchantActivity/delete?id=${cmsMerchantActivity.id}" onclick="return confirmx('确认要删除该商户活动吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>