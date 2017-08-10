<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>服务网点管理</title>
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
		<li><a href="${ctx}/cms/cmsBranch/">服务网点列表</a></li>
		<li class="active"><a href="${ctx}/cms/cmsBranch/form?id=${cmsBranch.id}">服务网点<shiro:hasPermission name="cms:cmsBranch:edit">${not empty cmsBranch.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:cmsBranch:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="cmsBranch" action="${ctx}/cms/cmsBranch/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">区域：</label>
			<div class="controls">
				<form:select path="areaId" class="input-medium required">
					<form:option value="" label=""/>
					<c:forEach items="${fnc:getAreas()}" var="area">
						<form:option value="${area.id }" label="${area.name }"/>
					</c:forEach>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">卡种：</label>
			<div class="controls">
				<c:forEach items="${fnc:getCmsTypes('card')}" var="cmsType">
				<span><input name="cardType" type="checkbox" value="${cmsType.id }" ${fn:contains(cmsBranch.cardType,cmsType.id) ? 'checked':'' }><label>${cmsType.name }</label></span>
				</c:forEach>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">服务信息：</label>
			<div class="controls">
				<c:forEach items="${fnc:getCmsTypes('branch')}" var="cmsType">
				<span><input name="serviceInfo" type="checkbox" value="${cmsType.id }" ${fn:contains(cmsBranch.serviceInfo,cmsType.id) ? 'checked':'' } class="required"><label>${cmsType.name }</label></span>
				</c:forEach>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机构类别：</label>
			<div class="controls">
				<form:select path="orgCategoryId" class="input-medium required">
					<form:option value="" label=""/>
					<c:forEach items="${fnc:getCmsTypes('branch_category')}" var="cmsType">
						<form:option value="${cmsType.id }" label="${cmsType.name }"/>
					</c:forEach>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">网点名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系方式：</label>
			<div class="controls">
				<form:input path="contactWay" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">网点地址：</label>
			<div class="controls">
				<form:input path="contactAddress" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">网点图标：</label>
			<div class="controls">
				<form:hidden id="image" path="image" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="image" type="thumb" uploadPath="/cms/cmsBranch" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定位坐标：</label>
			<div class="controls">
				<form:input path="mapCoordinates" htmlEscape="false" maxlength="255" class="input-xlarge "/>（以”120.08121,29.313766“形式输入）<a style="color:red;" href="http://lbs.amap.com/console/show/picker" target="_blank">&nbsp;&nbsp;高德坐标获取</a>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">营业时间：</label>
			<div class="controls">
				<form:input path="officeHours" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序：</label>
			<div class="controls">
				<form:input path="weight" htmlEscape="false" maxlength="10" class="input-xlarge  digits"/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">权重期限：</label>
			<div class="controls">
				<input name="weightDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${cmsBranch.weightDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">点击数：</label>
			<div class="controls">
				<form:input path="hits" htmlEscape="false" maxlength="10" class="input-xlarge  digits"/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:cmsBranch:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>