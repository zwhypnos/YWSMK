<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>浮动广告管理</title>
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
		
		function toswitch(id,isshow){
			$.ajax({
				type: "post",
				url: "${ctx}/cms/cmsFloatingAd/toswitch",
				data:{
					id : id,
					isshow : isshow == "0"?"1":"0"
				},
				dataType:"json",
				success:function(data){
					if(data.resultCode==0){
						alert((isshow == "0"?"开启":"关闭")+"成功");
						$("#isshow_"+id).html(isshow == "0"?"开启":"关闭");
						$("#isshow_btn_"+id).html(isshow == "0"?"关闭":"开启");
						$("#isshow_btn_"+id).attr("href","javascript:toswitch('"+id+"','"+(isshow == "0"?"1":"0")+"')");
					}else{
						alert("操作失败");
					}
				},
				error:function(XMLHttpRequest, textStatus, errorThrown){
			          alert("请求失败");
			       }
			})
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/cmsFloatingAd/">浮动广告列表</a></li>
		<shiro:hasPermission name="cms:cmsFloatingAd:edit"><li><a href="${ctx}/cms/cmsFloatingAd/form">浮动广告添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsFloatingAd" action="${ctx}/cms/cmsFloatingAd/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="title" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>位置：</label>
				<form:select path="position" class="input-medium">
					<form:option value="" label=""/>
					<form:option value="首页" label="首页"/>
					<form:option value="商户" label="商户"/>
				</form:select>
			</li>
			<li><label>展示状态：</label>
				<form:select path="isshow" class="input-medium">
					<form:option value="" label=""/>
					<form:option value="0" label="关闭"/>
					<form:option value="1" label="开启"/>
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
				<th>位置</th>
				<th>展示状态</th>
				<th>更新时间</th>
				<shiro:hasPermission name="cms:cmsFloatingAd:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsFloatingAd">
			<tr>
				<td><a href="${ctx}/cms/cmsFloatingAd/form?id=${cmsFloatingAd.id}">
					${cmsFloatingAd.title}
				</a></td>
				<td>
					${cmsFloatingAd.position}
				</td>
				<td id="isshow_${cmsFloatingAd.id }">
					${cmsFloatingAd.isshow eq '0'?'关闭':'开启'}
				</td>
				<td>
					<fmt:formatDate value="${cmsFloatingAd.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="cms:cmsFloatingAd:edit"><td>
					<a id="isshow_btn_${cmsFloatingAd.id}" href="javascript:toswitch('${cmsFloatingAd.id}','${cmsFloatingAd.isshow }')">${cmsFloatingAd.isshow eq '0'?'开启':'关闭'}</a>
    				<a href="${ctx}/cms/cmsFloatingAd/form?id=${cmsFloatingAd.id}">修改</a>
					<a href="${ctx}/cms/cmsFloatingAd/delete?id=${cmsFloatingAd.id}" onclick="return confirmx('确认要删除该浮动广告吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>