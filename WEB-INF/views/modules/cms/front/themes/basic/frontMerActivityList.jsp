<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>

<link title="normal" href="${ctxStatic}/ywsmk/css/merchant.css" rel="stylesheet" type="text/css" />

<!-- 分页 -->
<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/pagination.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link title="normal" href="${ctxStatic}/common/jeesite.min.css" type="text/css" rel="stylesheet" />
<!-- 分页 -->
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
<div class="guanggao_minboxx">
<div class="Main_page">
<div class="active_box">
        	<h1 class="a_h">联盟商户活动</h1>
            <div class="active_icon"></div>
            <div class="wrap_active_menu">
                <div class="active_menu">  
                <c:forEach items="${page.list}" var="activity"> 
                    <div onclick="findActivity('${activity.id}')" class="">
                        <a href="${ctx }/merActivityInfo-${activity.id}${urlSuffix}" class="img_shadow png">
                        <img src="${activity.image }" alt="${activity.name }">
                        </a>
                        <h1><a style="color:" href="${ctx }/merActivityInfo-${activity.id}${urlSuffix}">${activity.name }</a></h1>  
                        <h2>有效期：<fmt:formatDate value="${activity.startDate }" pattern="yyyy.MM.dd"/>-<fmt:formatDate value="${activity.endDate }" pattern="yyyy.MM.dd"/></h2> 
                        
                        <c:if test="${nowdate.time-activity.startDate.time < 0}"> 
						<span class="date_new png"></span>
						</c:if>
						<c:if test="${nowdate.time-activity.startDate.time >= 0 && nowdate.time-(activity.endDate.time+86400000) < 0}"> 
						<span class="date_now png"></span>
						</c:if>
						<c:if test="${nowdate.time-(activity.endDate.time+86400000) >= 0}"> 
						<span class="over_date png"></span>
						</c:if>
                    </div> 
                </c:forEach>            
                </div>
                 
                    <div class="page">
                    <div class="pagination" >${page}</div>
					<script type="text/javascript">
						function page(n,s){
							location="${ctx }/merActivity${urlSuffix}?pageNo="+n+"&pageSize="+s;
						}
					</script>
	            	
	            	</div>
                
            </div>
        </div>
</div>

</div>
</div>
<script type="text/javascript">
$(function (){
$(".active_menu div:nth-child(3n)").addClass("div_pos");
$(".active_menu div").mouseover(function(){   
  $(this).addClass("active_over");   
});
$(".active_menu div").mouseout(function(){   
  $(this).removeClass("active_over");   
});
});

function findActivity(id){
	window.location = "${ctx }/merActivityInfo-"+id+"${urlSuffix}";
}

</script>
</body>
</html>