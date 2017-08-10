<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>

<!-- 分页 -->
 
   <link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/js/base.css"/>
   <link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/js/pageGroup.css"/>
   <link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/js/pageGroup_gonggao.css"/>

<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/index.css" rel="stylesheet" type="text/css" />
<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/css.css" rel="stylesheet" type="text/css" />
<link title="default" href="${ctxStatic}/ywsmk/ywsmk_files/theme_default.css" rel="stylesheet" type="text/css" />
<link title="deepblue" href="${ctxStatic}/ywsmk/ywsmk_files/theme_deepblue.css" rel="stylesheet" type="text/css" disabled="disabled" />
<link title="lightblue" href="${ctxStatic}/ywsmk/ywsmk_files/theme_lightblue.css" rel="stylesheet" type="text/css" disabled="disabled" />
<link title="brown" href="${ctxStatic}/ywsmk/ywsmk_files/theme_brown.css" rel="stylesheet" type="text/css" disabled="disabled" />
<script type="text/javascript" src="${ctxStatic}/ywsmk/ywsmk_files/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/ywsmk/ywsmk_files/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctxStatic}/ywsmk/ywsmk_files/adfloat1.js"></script>
<script charset="UTF-8" src="${ctxStatic}/ywsmk/ywsmk_files/bundle.js"></script>
<script charset="UTF-8" src="${ctxStatic}/ywsmk/ywsmk_files/iframeWidget.js"></script>
  <script type="text/javascript" src="${ctxStatic}/ywsmk/js/pageGroup.js"></script>
  <script type="text/javascript" src="${ctxStatic}/ywsmk/js/pageGroup_gonggao.js"></script>
<!-- 卡片 -->
<link title="normal" href="${ctxStatic}/ywsmk/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/ywsmk/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
</head>
<body>
<iframe id="sina_anywhere_iframe" style="display: none;" src="${ctxStatic}/ywsmk/ywsmk_files/saved_resource.html"></iframe>



<!--广告+登录-->
<div class="guanggao_boxx">
<div class="guanggao_minboxx">
<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" /> 
</div>
</div>

<!--广告+登录-->



<!--新闻公告-->
<div class="ywloginboy">
<div class="ywxwgonggao">
 <div id="TabbedPanels1" class="TabbedPanels">
    <ul class="TabbedPanelsTabGroup">
      <c:forEach items="${fnc:getCategoryList(site.id,category.parentId,-1,'')}" var="categoryTab">
        <li class="TabbedPanelsTab <c:if test="${category.id eq categoryTab.id }">afterClick</c:if>" tabindex="0">${categoryTab.name}</li>
      </c:forEach>
    </ul>
    <div class="TabbedPanelsContentGroup">
      <c:forEach items="${fnc:getCategoryList(site.id,category.parentId,-1,'')}" var="category2">
        <div class="TabbedPanelsContent">
          <div class="nei">
            <ul class="ulxw">
        <c:forEach items="${fnc:getArticleList(site.id,category2.id,-1,'')}" var="article">
          <li><a href="${ctx}/view-${category.id }-${article.id }.html"><div class="xwerjixiaobiaoti">${article.title }<div class="ywxwsj"><c:if test="${not empty article.updateDate }"><fmt:formatDate value="${article.updateDate }" pattern="yyyy-MM-dd"/></c:if></div></div></a></li>
        </c:forEach>
        </ul>
        </div>
        <!--分页 -->
        <div> 
        <div class="fenye">
        <div id="pageGro" class="cb">
	<div class="pageUp"></div>
    <div class="pageList">
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
        </ul>
    </div>
    <div class="pageDown"></div>
    <div class="gong_left">&nbsp;共&nbsp;<span class="lanzi_text">11</span>&nbsp;页</div>
</div></div>
        <!--分页 -->
        
        <div class="gong_right">
        <input class="buttoncxfy" name="" type="submit" value="查询" />
        <div class="fyinputbox"><input  type="number" class="dijiye" name="name"  min="1" value="" />&nbsp;页&nbsp; </div>
       
        <div class="fytext_left"> 共&nbsp;<span class="lanzi_text">11</span>&nbsp;页, 共&nbsp;<span class="lanzi_text">10</span>&nbsp;条
       ,当前第&nbsp;<span class="lanzi_text">1</span>&nbsp;页,转到&nbsp;</div>
        </div>
        
        <!--新闻 结束 -->
      </div>
      </div>
      </c:forEach>
  </div>
</div>

</div>
<!--新闻公告-->



<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");

$(".afterClick").trigger("click");
</script>
</body></html>