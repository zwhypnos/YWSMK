<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信支付订单管理</title>
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
	<style type="text/css">
		.form-search .ul-form li label{
			width: auto;
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wxpay/wxRechargeOrder/">微信支付订单列表</a></li>
		<shiro:hasPermission name="wxpay:wxRechargeOrder:edit"><li><a href="${ctx}/wxpay/wxRechargeOrder/form">微信支付订单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="wxRechargeOrder" action="${ctx}/wxpay/wxRechargeOrder/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="innerSerach" name="innerSerach" type="hidden" value="true"/>
		<ul class="ul-form">
			<li class="btns"><label>卡号：</label><form:input path="citizenCardNo" htmlEscape="false" maxlength="64" class="input-small"/></li>
			<li class="btns">
				<label>状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label="全部"/>
					<form:option value="SUCCESS" label="微信支付成功,市民卡充值成功,对账成功"/>
					<form:option value="CLOSE" label="订单关闭"/>
					<form:option value="PAYING" label="支付中"/>
				</form:select>
			</li>
			<li><label>创建日期：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${wxRechargeOrder.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="createDateEnd" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${wxRechargeOrder.createDateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="btns"><input id="exportButton" class="btn btn-primary" type="button" value="导出"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input type="checkbox" id="allSelect"></th>
				<th>订单号</th>
				<th>支付金额（单位：分）</th>
				<th>创建日期</th>
				<th>支付日期</th>
				<th>确认日期</th>
				<th>市民卡号</th>
				<th>状态</th>
				<th>备注</th>
				<shiro:hasPermission name="wxpay:wxRechargeOrder:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="wxRechargeOrder">
			<tr>
				<td>
					<input type="checkbox" name="selectUsers">
				</td>
				<td>${wxRechargeOrder.no }</td>
				<td>${wxRechargeOrder.money }</td>
				<td><c:if test="${not empty wxRechargeOrder.createDate }"><fmt:formatDate value="${wxRechargeOrder.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></c:if></td>
				<td><c:if test="${not empty wxRechargeOrder.payDate }"><fmt:formatDate value="${wxRechargeOrder.payDate }" pattern="yyyy-MM-dd HH:mm:ss"/></c:if></td>
				<td><c:if test="${not empty wxRechargeOrder.confirmDate }"><fmt:formatDate value="${wxRechargeOrder.confirmDate }" pattern="yyyy-MM-dd HH:mm:ss"/></c:if></td>
				<td>${wxRechargeOrder.citizenCardNo }</td>
				<td>
					<c:choose>
						<c:when test="${wxRechargeOrder.status eq 'SUCCESS' }">微信支付成功,市民卡充值成功,对账成功</c:when>
						<c:when test="${wxRechargeOrder.status eq 'CLOSE' }">订单关闭</c:when>
						<c:when test="${wxRechargeOrder.status eq 'PAYING' }">支付中</c:when>
					</c:choose>
				</td>
				<td>${wxRechargeOrder.remarks }</td>
				<shiro:hasPermission name="wxpay:wxRechargeOrder:edit"><td>
    				<a href="${ctx}/wxpay/wxRechargeOrder/form?id=${wxRechargeOrder.id}">修改</a>
					<a href="${ctx}/wxpay/wxRechargeOrder/delete?id=${wxRechargeOrder.id}" onclick="return confirmx('确认要删除该微信支付订单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
			<tr>
				<th></th>
				<th>合计：</th>
				<th id="amout"></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<shiro:hasPermission name="wxpay:wxRechargeOrder:edit"><th></th></shiro:hasPermission>
			</tr>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	<script type="text/javascript">
		$(function(){
			$("#allSelect").on("click",function(){
				if($(this).is(":checked")){
					$("input[name=selectUsers]").attr("checked",true);
					changeAmout();
				}else{
					$("input[name=selectUsers]").attr("checked",false);
					changeAmout();
				}
			});
			
			$("input[name=selectUsers]").on("click",function(){
				changeAmout();
			});
			
			$("#exportButton").on("click",function(){
				window.open("${ctx}/wxpay/wxRechargeOrder/export?"+$("#searchForm").serialize());
			});
		});
		
		function changeAmout(){
			var sum=0;
			$("input[name=selectUsers]:checked").each(function(){
				sum+=Number($(this).parent().next().next().text());
			});
			$("#amout").text(sum);
		}
	</script>
</body>
</html>