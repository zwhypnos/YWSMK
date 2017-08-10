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
</head>
<body>



<!--图片广告-->
<div class="guanggao_boxx">
<div class="guanggao_minboxx">
<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" /> 
</div>
</div>
<!--图片广告-->


<c:if test="${isSingleArticle eq 'false'}">
<div class="ywloginboy">
	<div class="ywxwgonggao">
		<cms:frontCurrentPosition_yw category="${category}"/>
		<div class="span10">
			<h3 style="color:#555555;font-size:20px;text-align:center;border-bottom:0px solid #ddd;padding-bottom:25px;">${article.title}</h3>
			<c:if test="${not empty article.description}"><div>摘要：${article.description}</div></c:if>
			<div>${article.articleData.content}</div>
			<c:if test="${not empty article.files}">
			
			<ol style="line-height:25px;">
			<li>附件下载：</li>
			<c:forTokens items="${article.files}" delims="|" var="name" varStatus="status">
				<li><a href="<c:out value='${name}'/>" url="<c:out value='${name}'/>" target="_blank">${status.index+1}.${fnc:getNamefromUrl(name)}</a></li>
			</c:forTokens>
			</ol>
			</c:if>
			<div style="border-top:1px solid #ddd;padding:10px;margin:25px 0;">来源：${article.articleData.copyfrom} &nbsp;发布时间：<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
		</div>
	</div>
</div>
</c:if>
<c:if test="${isSingleArticle eq 'true'}">
<div class="ywloginboy">
<div class="ywxwgonggao">
	<div id="TabbedPanels1" class="TabbedPanels">
	 	<!--二级栏目-->
	    <ul class="TabbedPanelsTabGroup">
	      <cms:frontCategoryList_yw categoryList="${categoryList}"/>
	    </ul>
	    <!--二级栏目-->
		<!--文章内容-->
	    <div class="TabbedPanelsContentGroup">
	    	<div class="TabbedPanelsContent TabbedPanelsContentVisible">
	    		<div class="nei">
	            	<div class="row">
						<div class="span10" style="padding-top:20px;">
							<c:if test="${not empty article.description}"><div>摘要：${article.description}</div></c:if>
							<div>${article.articleData.content}</div>
							<c:if test="${not empty article.files}">
							<ol style="line-height:25px;">
							<li>附件下载：</li>
							<c:forTokens items="${article.files}" delims="|" var="name" varStatus="status">
								<li><a href="<c:out value='${name}'/>" url="<c:out value='${name}'/>" target="_blank">${status.index+1}.${fnc:getNamefromUrl(name)}</a></li>
							</c:forTokens>
							</ol>
							</c:if>
							<div style="border-top:1px solid #ddd;padding:10px;margin:25px 0;">发布时间：<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </div>
						</div>
					</div>
	        	</div>
	    	</div>
	    </div>
		<!--文章内容-->
	</div>
</div>
</div>
</c:if>
</body>
</html>