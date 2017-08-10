<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<style>
<!--
.inputTxt {
    position: relative;
    float: left;
    border: none;
    background: url(${ctxStatic}/ywsmk/images/inputBg.gif) no-repeat;
    height: 30px;
    width: 85px;
    padding-left: 5px;
    line-height: 30px;
}
.searchBtn {
    position: relative;
    float: left;
    border: none;
    height: 30px;
    width: 34px;
    cursor:pointer;
    background: url(${ctxStatic}/ywsmk/images/searchBg.gif) no-repeat;
}
-->
</style>
<div class="nav_bar">
	<div class="nav">
		<ul>
			<li><a href="${ctx}/index-${site.id }.html">首 页</a></li>
			<c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
				<li class="nav1">
					<c:set var="categoryList2" value="${fnc:getCategoryList(site.id,category.id,-1,'')}" />
					<c:choose>
						<c:when test="${not empty category.href}">
							<c:choose>
								<c:when test="${fn:indexOf(category.href, '://') eq -1 && fn:indexOf(category.href, 'mailto:') eq -1}">
								<c:set var="url" value="${ctx}${category.href}"/></c:when><c:otherwise><c:set var="url" value="${category.href}"/></c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise><c:set var="url" value="${ctx}/list-${categoryList2[0].id }${urlSuffix}"/></c:otherwise>
					</c:choose>
					<a href="${url}" class="one">${category.name}</a>
					<div style="display: none;">
						<c:forEach items="${categoryList2}" var="tpl">
							<c:choose>
								<c:when test="${not empty tpl.href}">
									<c:choose>
										<c:when test="${fn:indexOf(tpl.href, '://') eq -1 && fn:indexOf(tpl.href, 'mailto:') eq -1}">
										<c:set var="url" value="${ctx}${tpl.href}"/></c:when><c:otherwise><c:set var="url" value="${tpl.href}"/></c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise><c:set var="url" value="${ctx}/list-${tpl.id}${urlSuffix}"/></c:otherwise>
							</c:choose>
							<a href="${url}" target="${tpl.target}">${tpl.name}</a>
						</c:forEach>
					</div>
				</li>
				
			</c:forEach>
			<li class="nav1">
				<a href="http://www.ywsmk.com:3355" target="_blank" class="one">市民论坛</a>
				</li>
			<%-- <li class="nav1"  style="padding:3px 0 3px 0px; width:124px">
				<form method="post" action="${ctx}/search${urlSuffix}">
					<input type="text" class="inputTxt" placeholder="全站搜索" id="title" name="title">
					<input type="submit" class="searchBtn" value="">
				</form>
				<form method="post" action="${ctx}/search">
					<input name="title" htmlEscape="false" type="text" value="" placeholder="输入关键字" class="search_text">
					<input type="submit" value="" class="search_btn">
				</form>
			</li> --%>
		</ul>
	</div>
</div>

<script type="text/javascript">
  $(function () {
    $("li.nav1").hover(function () {
      $(this).children("div").slideDown(200);
    }, function () {
      $(this).children("div").slideUp(200);
    });
    
    $("#switch").hover(function () {
      $(this).children("img").attr("src","${ctxStatic}/ywsmk/ywsmk_files/switch_hover.png");
      $("#switch_options").slideDown(200);
    }, function () {
      $(this).children("img").attr("src","${ctxStatic}/ywsmk/ywsmk_files/switch.png");
      $("#switch_options").slideUp(200);
    });
    
    $("#switch_options a").click(function(){ 
	    var style = $(this).attr("id"); 
	    $("link[title='"+style+"']").removeAttr("disabled"); 
	    $("link[title!='"+style+"'][title!='normal']").attr("disabled","disabled"); 
	    $.cookie("mystyle",style,{expires:30}); 
	    $(this).children("img").attr("src","${ctxStatic}/ywsmk/ywsmk_files/switch.png");
      	$("#switch_options").slideUp(200);
	}); 
  });
</script>