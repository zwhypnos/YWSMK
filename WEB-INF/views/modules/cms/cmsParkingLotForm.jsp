<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>停车场管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/cmsAppNormal/article?typeApp=tcc">文章修改</a></li>
		<li><a href="${ctx}/cms/cmsParkingLot/">停车场列表</a></li>
		<li class="active"><a href="${ctx}/cms/cmsParkingLot/form?id=${cmsParkingLot.id}">停车场<shiro:hasPermission name="cms:cmsParkingLot:edit">${not empty cmsParkingLot.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:cmsParkingLot:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="cmsParkingLot" action="${ctx}/cms/cmsParkingLot/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">停车场名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所在区域：</label>
			<div class="controls">
				<form:select path="areaId" class="input-medium required">
					<form:option value="" label=""/>
					<c:forEach items="${fnc:getAreas()}" var="area">
						<form:option value="${area.id }" label="${area.name }"/>
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">停车场地址：</label>
			<div class="controls">
				<form:textarea path="contactAddress" htmlEscape="false" rows="2" maxlength="500" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">停车场编号：</label>
			<div class="controls">
				<form:input path="parkingId" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定位坐标：</label>
			<div class="controls">
				<form:input path="mapCoordinates" htmlEscape="false" maxlength="255" class="input-xlarge "/>（以”120.08121,29.313766“形式输入）<a style="color:red;" href="http://lbs.amap.com/console/show/picker" target="_blank">&nbsp;&nbsp;高德坐标获取</a>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">权重，越大越靠前：</label>
			<div class="controls">
				<form:input path="weight" htmlEscape="false" maxlength="10" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">权重期限：</label>
			<div class="controls">
				<input name="weightDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${cmsParkingLot.weightDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">停车场类型：</label>
			<div class="controls">
				<form:input path="parkingType" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">version：</label>
			<div class="controls">
				<form:input path="version" htmlEscape="false" maxlength="19" class="input-xlarge  digits"/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">收费标准：</label>
			<div class="controls">
				<form:textarea path="chargeStandard" htmlEscape="false" rows="2" maxlength="500" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">付费类型：</label>
			<div class="controls">
				<form:input path="typeCard" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:cmsParkingLot:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>