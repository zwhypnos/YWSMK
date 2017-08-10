<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ attribute name="category" type="com.thinkgem.jeesite.modules.cms.entity.Category" required="true" description="栏目对象"%>
<div class="Foxpro_title01" style="">
	<div class="Foxpro_title01_txt01">
		<div class="Foxpro_title01_txt02" style="background:url( images/list_title01.gif) no-repeat bottom center;">
		${category.name}</div>
	</div>
	<div class="mix"><strong>当前位置：</strong><a href="${ctx}/index-${site.id}${urlSuffix}">首页</a><c:forEach items="${fnc:getCategoryListByIds(category.parentIds)}" var="tpl">
	<c:if test="${tpl.id ne '1'}">&nbsp;〉&nbsp;<c:set var="categoryList" value="${fnc:getCategoryList(site.id,tpl.id,-1,'')}"/><a href="${ctx}/list-${categoryList[0].id }${urlSuffix}">${tpl.name}</a></c:if>
</c:forEach>&nbsp;〉&nbsp;<a href="${ctx}/list-${category.id}${urlSuffix}">${category.name}</a></div>
</div>

