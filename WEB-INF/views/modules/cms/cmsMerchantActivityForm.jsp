<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商户活动管理</title>
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
			
			if($("#weight").val()!='0'){
				$("#poster_div").css("display","block");
			}
			
			$("#weight").change(function(){
				if($("#weight").val()!='0'){
					$("#poster_div").css("display","block");
				}else{
					$("#poster_div").css("display","none");
				}
			});
		});
		
		function submitTo(auditState){
			$("#auditState").val(auditState);
			$("#inputForm").submit();
		}
		
		String.prototype.replaceAll  = function(oldstring,newstring){    
			return this.replace(new RegExp(oldstring,"gm"),newstring);    
			}   
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/cmsMerchantActivity/">商户活动列表</a></li>
		<li class="active"><a href="${ctx}/cms/cmsMerchantActivity/form?id=${cmsMerchantActivity.id}">商户活动<shiro:hasPermission name="cms:cmsMerchantActivity:edit">${cmsMerchantActivity.auditState eq '0'?'审核':'查看'}</shiro:hasPermission><shiro:lacksPermission name="cms:cmsMerchantActivity:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="cmsMerchantActivity" action="${ctx}/cms/cmsMerchantActivity/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">活动名称：</label>
			<div class="controls">
			${cmsMerchantActivity.name }
				<%-- <form:input path="name" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">活动时间：</label>
			<div class="controls">
			<fmt:formatDate value="${cmsMerchantActivity.startDate}" pattern="yyyy-MM-dd"/> 至 <fmt:formatDate value="${cmsMerchantActivity.endDate}" pattern="yyyy-MM-dd"/>
				<%-- <input name="startDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${cmsMerchantActivity.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span> --%>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">活动图标：</label>
			<div class="controls">
				<img src="${cmsMerchantActivity.image}" alt="">
				<%-- <form:hidden id="image" path="image" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="image" type="files" uploadPath="/cms/cmsMerchantActivity" selectMultiple="true"/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">活动内容：</label>
			<div class="controls" id="content">
			${cmsMerchantActivity.content }
				<%-- <form:textarea path="content" htmlEscape="false" rows="4" class="input-xxlarge "/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商家编号：</label>
			<div class="controls">
			${cmsMerchantActivity.merchantId }
				<%-- <form:input path="merchantId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商家名称：</label>
			<div class="controls">
			${cmsMerchantActivity.merchantName }
				<%-- <form:input path="merchantName" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">顶部轮播：</label>
			<div class="controls">
				<form:select path="weight" class="input-medium required">
					<form:option value="" label=""/>
						<form:option value="0" label="不展示"/>
						<form:option value="1" label="展示"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div id="poster_div" class="control-group" style="display: none;">
			<label class="control-label">展示图片：</label>
			<div class="controls">
				<form:hidden id="poster" path="poster" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="poster" type="images" uploadPath="/cms/cmsMerchantActivity" selectMultiple="false"/>
				<font color="red">（顶部：983*200px 右侧：190*215）若不选择展示图片，则前台展示默认使用活动图标</font>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">审核者：</label>
			<div class="controls">
				<form:input path="auditBy" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核时间：</label>
			<div class="controls">
				<input name="auditDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${cmsMerchantActivity.auditDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">权重，越大越靠前：</label>
			<div class="controls">
				<form:input path="weight" htmlEscape="false" maxlength="10" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">权重期限：</label>
			<div class="controls">
				<input name="weightDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${cmsMerchantActivity.weightDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">点击数：</label>
			<div class="controls">
				<form:input path="hits" htmlEscape="false" maxlength="10" class="input-xlarge  digits"/>
			</div>
		</div> --%>
		<c:if test="${cmsMerchantActivity.auditState ne '0' }">
		<div class="control-group">
			<label class="control-label">审核状态：</label>
			<div class="controls">
				<span style="color:red;"><c:if test="${cmsMerchantActivity.auditState eq '1' }">通过</c:if><c:if test="${cmsMerchantActivity.auditState eq '2' }">未通过</c:if></span>
			</div>
		</div>
		</c:if>
		<div class="control-group">
			<label class="control-label">若不通过，原因：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		
		<form:hidden path="auditState" htmlEscape="false"/>
		<div class="form-actions">
			<c:if test="${cmsMerchantActivity.auditState eq '0' }">
				<shiro:hasPermission name="cms:cmsMerchantActivity:edit"><input id="btnSubmit_yes" onclick="submitTo('1')" class="btn btn-primary" type="button" value="通 过"/>&nbsp;</shiro:hasPermission>
			<shiro:hasPermission name="cms:cmsMerchantActivity:edit"><input id="btnSubmit_no" onclick="submitTo('2')" class="btn btn-primary" type="button" value="不通过"/>&nbsp;</shiro:hasPermission>
			</c:if>
			<c:if test="${cmsMerchantActivity.auditState eq '1' }">
			<shiro:hasPermission name="cms:cmsMerchantActivity:edit"><input class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			</c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>