<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>服务网点管理</title>
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
	    	$("#listForm").attr("action", "${ctx}/cms/cmsBranch/updateSort");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/cmsBranch/">服务网点列表</a></li>
		<shiro:hasPermission name="cms:cmsBranch:edit"><li><a href="${ctx}/cms/cmsBranch/form">服务网点添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsBranch" action="${ctx}/cms/cmsBranch/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="innerSerach" name="innerSerach" type="hidden" value="true"/>
		<ul class="ul-form">
			<li><label>区域选择：</label>
				<form:select path="areaId" class="input-medium">
					<form:option value="" label="全部"/>
					<c:forEach items="${fnc:getAreas()}" var="area">
						<form:option value="${area.id }" label="${area.name }"/>
					</c:forEach>
				</form:select>
			</li>
			<li><label>机构类别：</label>
				<form:select path="orgCategoryId" class="input-medium">
					<form:option value="" label="全部"/>
					<c:forEach items="${fnc:getCmsTypes('branch_category')}" var="cmsType">
						<form:option value="${cmsType.id }" label="${cmsType.name }"/>
					</c:forEach>
				</form:select>
			</li>
			<li><label>网点名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
			<li><label>卡种：</label>
				<c:forEach items="${fnc:getCmsTypes('card')}" var="cmsType">
				<span><input name="cardType" type="checkbox" value="${cmsType.id }" ${fn:contains(cmsBranch.cardType,cmsType.id) ? 'checked':'' }><label>${cmsType.name }</label></span>
				</c:forEach>
			</li>
			<li><label>服务信息：</label>
				<c:forEach items="${fnc:getCmsTypes('branch')}" var="cmsType">
				<span><input name="serviceInfo" type="checkbox" value="${cmsType.id }" ${fn:contains(cmsBranch.serviceInfo,cmsType.id) ? 'checked':'' }><label>${cmsType.name }</label></span>
				</c:forEach>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="width:15%">网点名称</th>
				<th style="width:10%">区域</th>
				<th style="width:10%">卡种</th>
				<th style="width:30%">服务信息</th>
				<th style="width:10%">机构类别</th>
				<th style="width:10%">更新时间</th>
				<th style="width:5%">排序</th>
				<shiro:hasPermission name="cms:cmsBranch:edit"><th style="width:10%">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsBranch">
			<tr>
				<td><a href="${ctx}/cms/cmsBranch/form?id=${cmsBranch.id}">
					${cmsBranch.name}
					
				</a></td>
				<td>
					${cmsAreaMap[cmsBranch.areaId]}
				</td>
				<td>
					<c:if test="${not empty cmsBranch.cardType }">
						<c:set var="cardTypes" value="${fn:split(cmsBranch.cardType,',') }" />
						<c:forEach items="${cardTypes }" var="cardTypeItem" varStatus="s">
							${cmsBasicTypeMap2[cardTypeItem]}<c:if test="${not s.last}">,</c:if>
						</c:forEach>
					</c:if>
				</td>
				<td>
					<c:if test="${not empty cmsBranch.serviceInfo }">
						<c:set var="serviceInfos" value="${fn:split(cmsBranch.serviceInfo,',') }" />
						<c:forEach items="${serviceInfos }" var="serviceInfoItem" varStatus="s">
							${cmsBasicTypeMap3[serviceInfoItem]}<c:if test="${not s.last}">,</c:if>
						</c:forEach>
					</c:if>
				</td>
				<td>
					${cmsBasicTypeMap[cmsBranch.orgCategoryId]}
				</td>
				<td>
					<fmt:formatDate value="${cmsBranch.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td style="text-align:center;">
					<shiro:hasPermission name="cms:cmsBranch:edit">
						<input type="hidden" name="ids" value="${cmsBranch.id}"/>
						<input name="weights" type="text" value="${cmsBranch.weight}" style="width:50px;margin:0;padding:0;text-align:center;">
					</shiro:hasPermission><shiro:lacksPermission name="cms:cmsBranch:edit">
						${cmsBranch.weight}
					</shiro:lacksPermission>
				</td>
				<shiro:hasPermission name="cms:cmsBranch:edit"><td>
    				<a href="${ctx}/cms/cmsBranch/form?id=${cmsBranch.id}">修改</a>
					<a href="${ctx}/cms/cmsBranch/delete?id=${cmsBranch.id}" onclick="return confirmx('确认要删除该服务网点吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</form>
	<shiro:hasPermission name="cms:cmsBranch:edit"><div class="form-actions pagination-left">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
		</div></shiro:hasPermission>
	</form>
	<div class="pagination">${page}</div>
</body>
</html>