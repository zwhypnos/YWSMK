<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>
<!-- 卡片 -->
<link title="normal" href="${ctxStatic}/ywsmk/SpryAssets/SpryAsset.css" rel="stylesheet" type="text/css" />
<!-- 分页 -->
<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/pagination.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link title="normal" href="${ctxStatic}/common/jeesite.min.css" type="text/css" rel="stylesheet" />
</head>
<body>


<!--图片广告-->
<div class="guanggao_boxx">
<div class="guanggao_minboxx">
<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" /> 
</div>
</div>
<!--图片广告-->

<div class="ywloginboy">
<div class="ywxwgonggao">
 <div id="TabbedPanels1" class="TabbedPanels">
 	<!--二级栏目-->
    <ul class="TabbedPanelsTabGroup">
      <cms:frontCategoryList_yw categoryList="${categoryList}"/>
    </ul>
    <!--二级栏目-->
	<!--文章列表-->
    <div class="TabbedPanelsContentGroup">
    	<div class="TabbedPanelsContent TabbedPanelsContentVisible">
    		<div class="nei">
            	<ul class="ulxw">
    			<c:forEach items="${page.list}" var="article">
    				<li><a href="${article.url}" target="_blank"><div class="xwerjixiaobiaoti" style="color:${article.color}">${article.title }<div class="ywxwsj"><c:if test="${not empty article.updateDate }"><fmt:formatDate value="${article.updateDate }" pattern="yyyy-MM-dd"/></c:if></div></div></a></li>
    			</c:forEach>
    			</ul>
    			<div class="pagination" style="float: right;">${page}</div>
				<script type="text/javascript">
					function page(n,s){
						location="${ctx}/list-${category.id}${urlSuffix}?pageNo="+n+"&pageSize="+s;
					}
				</script>
        	</div>
    	</div>
    </div>
	<!--文章列表-->
</div>

</div>
</div>

</body></html>