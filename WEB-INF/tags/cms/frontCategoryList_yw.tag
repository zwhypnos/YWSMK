<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ attribute name="categoryList" type="java.util.List" required="true" description="栏目列表"%>
<c:forEach items="${categoryList}" var="tpl">
   		<c:choose>
   			<c:when test="${not empty tpl.href}">
    			<c:choose>
	    			<c:when test="${fn:indexOf(tpl.href, '://') eq -1 && fn:indexOf(tpl.href, 'mailto:') eq -1}">
	    			<c:set var="url" value="${ctx}${tpl.href}"/></c:when><c:otherwise><c:set var="url" value="${tpl.href}"/></c:otherwise>
	    		</c:choose>
   			</c:when>
   			<c:otherwise><c:set var="url" value="${ctx}/list-${tpl.id}${urlSuffix}"/></c:otherwise>
   		</c:choose>
   		<li class="TabbedPanelsTab ${requestScope.category.id eq tpl.id ?'afterClick TabbedPanelsTabSelected':''}" tabindex="0" onclick="window.open('${url}','${tpl.target}');">${tpl.name}</li>
</c:forEach>