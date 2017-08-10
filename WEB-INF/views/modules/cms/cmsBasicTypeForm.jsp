<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>基本类型管理</title>
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
			
			$("#belong").change(function(){
				if($("#id").val()==null||$("#id").val()==''){
					var belong = $("#belong").val();
					$.ajax({
						url:"${ctx}/cms/cmsBasicType/getNewSort",
						type:"post",
						data:{
							"belong":belong
						},
						success:function(data){
							$("#sort").val(data);
						},
						error:function(){
							alert("获取排序失败");
						}
					});
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/cmsBasicType/">基本类型列表</a></li>
		<li class="active"><a href="${ctx}/cms/cmsBasicType/form?id=${cmsBasicType.id}">基本类型<shiro:hasPermission name="cms:cmsBasicType:edit">${not empty cmsBasicType.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:cmsBasicType:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="cmsBasicType" action="${ctx}/cms/cmsBasicType/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">类型名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属模块：</label>
			<div class="controls">
				<form:select path="belong" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:option value="branch" label="服务类型"/>
					<form:option value="branch_category" label="服务机构"/>
					<form:option value="merchant" label="商户类型"/>
					<form:option value="card" label="卡种"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序：</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="20" class="input-xlarge required" style="width:50px;text-align:center;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:cmsBasicType:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>