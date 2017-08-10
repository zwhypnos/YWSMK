<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户管理</title>
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
			
			$("#btnReset").click(function(){
				if(confirm('确认要重置该商户的密码吗？')){
					location.href = '${ctx}/cms/cmsMerchant/resetPwd?id='+$("#id").val();
				}
			});
		});
		
		function clearfId(){
			$("#fIdId").val("");
			$("#fIdName").val("");
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/cmsMerchant/">商户列表</a></li>
		<li class="active"><a href="${ctx}/cms/cmsMerchant/form?id=${cmsMerchant.id}">商户<shiro:hasPermission name="cms:cmsMerchant:edit">${not empty cmsMerchant.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:cmsMerchant:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="cmsMerchant" action="${ctx}/cms/cmsMerchant/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<shiro:hasPermission name="cms:cmsMerchant:edit">	
		<c:if test="${not empty cmsMerchant.id}">	
		<div class="control-group">
			<label class="control-label">商户编号：</label>
			<div class="controls">
				<form:input path="merchantId" htmlEscape="false" maxlength="64" class="input-xlarge required" readonly="true" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		</c:if>
		</shiro:hasPermission>
		<div class="control-group">
			<label class="control-label">商户名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">区域：</label>
			<div class="controls">
				<form:select path="areaId" class="input-xlarge required">
					<form:option value="" label=""/>
					<c:forEach items="${fnc:getAreas()}" var="area">
						<form:option value="${area.id }" label="${area.name }"/>
					</c:forEach>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类型：</label>
			<div class="controls">
				<form:select path="typeId" class="input-xlarge required">
					<form:option value="" label=""/>
					<c:forEach items="${fnc:getCmsTypes('merchant')}" var="cmsType">
						<form:option value="${cmsType.id }" label="${cmsType.name }"/>
					</c:forEach>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">父级商户:</label>
			<div class="controls">
                <sys:treeselect id="fId" name="fId" value="${f.id}" labelName="fName" labelValue="${f.name}"
					title="商户" url="/cms/cmsMerchant/treeData"/><a onclick="clearfId();" style="text-decoration: underline;cursor: pointer;">清除</a><span style="color:red;">（若不是子商户，请不要选择）</span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">联系方式：</label>
			<div class="controls">
				<form:input path="contactWay" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商户地址：</label>
			<div class="controls">
				<form:input path="contactAddress" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商户图标：</label>
			<div class="controls">
				<form:hidden id="image" path="image" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="image" type="thumb" uploadPath="/cms/cmsMerchant" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">定位坐标：</label>
			<div class="controls">
				<form:input path="mapCoordinates" htmlEscape="false" maxlength="255" class="input-xlarge "/>（以“120.08121,29.313766”形式输入）<a style="color:red;" href="http://lbs.amap.com/console/show/picker" target="_blank">&nbsp;&nbsp;高德坐标获取</a>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商户简介：</label>
			<div class="controls">
				<form:textarea id="profiles" path="profiles" htmlEscape="true" rows="4" class="input-xxlarge "/>
				<sys:ckeditor replace="profiles" uploadPath="/cms/cmsMerchant" />
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
					value="<fmt:formatDate value="${cmsMerchant.weightDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
		<%-- <div class="control-group">
			<label class="control-label">是否前台展示：</label>
			<div class="controls">
				<form:select path="hidden" class="input-xlarge required">
					<form:option value="0" label="展示"/>
					<form:option value="1" label="隐藏"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="form-actions">
			<shiro:hasPermission name="cms:cmsMerchant:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			<shiro:hasPermission name="cms:cmsMerchant:edit">&nbsp;<input id="btnReset" class="btn btn-primary" type="button" value="重置密码"/></shiro:hasPermission>
		</div>
	</form:form>
</body>
</html>