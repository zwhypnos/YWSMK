<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>


<!-- 分页 -->
<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/pagination.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link title="normal" href="${ctxStatic}/common/jeesite.min.css" type="text/css" rel="stylesheet" />
<!-- 分页 -->

<style type="text/css">
.ywloginboy .ywxwgonggao #TabbedPanels1 .TabbedPanelsContentGroup .TabbedPanelsContent.TabbedPanelsContentVisible .nei .ulxw li {
    margin-left: 0; padding-left: 0; text-indent: 25px; background-position: 10px center;
}
</style>
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
		<div class="Foxpro_title01" style="">
			<div class="Foxpro_title01_txt01">
				<div class="Foxpro_title01_txt02" style="background:url( images/list_title01.gif) no-repeat bottom center;">
				全站搜索</div>
			</div>
		</div>
		<form:form id="searchForm" action="${ctx}/search${urlSuffix}" method="post">
		<table border="0" cellspacing="0" cellpadding="0" style="line-height:38px; font-size:12px; width:100%;">
					  <tbody>
					 <tr>
					   <td>
					   	<input type="hidden" id="pageNo" name="pageNo" value="${page.pageNo}"/>
						<input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize}"/>
						<input type="text" htmlEscape="false" name="title" value="${article.title}" placeholder="请输入搜索内容" class="opinion_text01" style="height:33px;line-height:33px;"/>
						<input type="submit" value="搜  索" class="opinion_btn" style="height:35px;margin-left:20px;"/>
						</td>	   
					</tr>
				   </tbody></table>
		</form:form>
	</div>
</div>
<div class="ywloginboy">
<div class="ywxwgonggao">
 <div id="TabbedPanels1" class="TabbedPanels">
	<!--文章列表-->
    <div class="TabbedPanelsContentGroup">
    	<div class="TabbedPanelsContent TabbedPanelsContentVisible">
    		<div class="nei">
           	<ul class="ulxw">
           	<c:choose>
           	<c:when test="${not empty page.list }">
           	<c:forEach items="${page.list}" var="article">
   				<li><a href="${article.url}" target="_blank"><div class="xwerjixiaobiaoti" style="color:${article.color}">${article.title }<div class="ywxwsj"><c:if test="${not empty article.updateDate }"><fmt:formatDate value="${article.updateDate }" pattern="yyyy-MM-dd"/></c:if></div></div></a></li>
   			</c:forEach>
           	</c:when>
           	<c:otherwise>
           	<span style="color:black;font-weight: bold;font-size: 20px;">请键入要查找的关键字。</span>
           	</c:otherwise>
           	</c:choose>
   			</ul>
   			<div class="pagination">${page}</div>
			<script type="text/javascript">
				function page(n,s){
					$("#pageNo").val(n);
					$("#pageSize").val(s);
					$("#searchForm").submit();
			    	return false;
			    }
			</script>
       	</div>
    	</div>
    </div>
  </div>
  </div>
  </div>
</body>
</html>