<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>稠州银行订单管理</title>
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
		
		.form-search label{
			margin-left: 0px;
		}
		
		.input-small {
			width: 90px;
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/czpay/order/">稠州银行订单列表</a></li>
		<shiro:hasPermission name="czpay:order:edit"><li><a href="${ctx}/czpay/order/form">稠州银行订单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="order" action="${ctx}/czpay/order/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="innerSerach" name="innerSerach" type="hidden" value="true"/>
		<ul class="ul-form">
			<li class="btns"><label>卡号：</label><form:input path="cardId" htmlEscape="false" maxlength="64" class="input-small"/></li>
			<li class="btns">
				<label>状态：</label>
				<form:select path="payStatus" class="input-small">
					<form:option value="" label="全部"/>
					<form:option value="0" label="等待银行充值"/>
					<form:option value="1" label="银行充值成功，等待市民卡充值"/>
					<form:option value="2" label="银行充值成功，市民卡充值成功"/>
					<form:option value="3" label="银行充值成功，市民卡充值失败"/>
					<form:option value="4" label="银行充值失败"/>
					<form:option value="5" label="退款成功"/>
					<form:option value="6" label="退款失败"/>
				</form:select>
			</li>
			<li class="btns">
				<label>清算结果：</label>
				<form:select path="clearResult" class="input-small">
					<form:option value="" label="全部"/>
					<form:option value="0" label="尚未对账"/>
					<form:option value="1" label="对账完成无错误"/>
					<form:option value="2" label="对账完成有错误"/>
				</form:select>
			</li>
			<li><label>订单时间：</label>
				<input name="orderTime" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
					value="<fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="submitTime" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
					value="<fmt:formatDate value="${order.submitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>订单金额</th>
				<th>订单时间</th>
				<%-- <th>用户id</th> --%>
				<th>卡号</th>
				<th>状态</th>
				<th>清算结果</th>
				<th>版本</th>
				<shiro:hasPermission name="czpay:order:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="order">
			<tr>
				<td>
					<input type="checkbox" name="selectUsers">
				</td>
				<td>${order.orderNum }</td>
				<td>${order.orderAmt }</td>
				<td><fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<%-- <td>${order.userId }</td> --%>
				<td>${order.cardId }</td>
				<td>
					<c:choose>
						<c:when test="${order.payStatus eq '0' }">等待银行充值</c:when>
						<c:when test="${order.payStatus eq '1' }">银行充值成功，等待市民卡充值</c:when>
						<c:when test="${order.payStatus eq '2' }">银行充值成功，市民卡充值成功</c:when>
						<c:when test="${order.payStatus eq '3' }">银行充值成功，市民卡充值失败</c:when>
						<c:when test="${order.payStatus eq '4' }">银行充值失败</c:when>
						<c:when test="${order.payStatus eq '5' }">退款成功</c:when>
						<c:when test="${order.payStatus eq '6' }">退款失败</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${order.clearResult eq '0' }">尚未对账</c:when>
						<c:when test="${order.clearResult eq '1' }">对账完成无错误</c:when>
						<c:when test="${order.clearResult eq '2' }">对账完成有错误</c:when>
					</c:choose>
				</td>
				<td>${order.version }</td>
				<shiro:hasPermission name="czpay:order:edit"><td>
    				<a href="${ctx}/czpay/order/form?id=${order.id}">修改</a>
					<a href="${ctx}/czpay/order/delete?id=${order.id}" onclick="return confirmx('确认要删除该稠州银行订单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
			<tr>
				<th></th>
				<th>合计：</th>
				<th id="amout"></th>
				<th></th>
				<%-- <th>用户id</th> --%>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<shiro:hasPermission name="czpay:order:edit"><th></th></shiro:hasPermission>
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
				window.open("${ctx}/czpay/order/export?"+$("#searchForm").serialize());
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