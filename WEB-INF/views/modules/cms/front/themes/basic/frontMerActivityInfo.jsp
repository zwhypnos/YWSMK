<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>
<link title="normal" href="${ctxStatic}/ywsmk/css/merchant.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function(){
	$(".m_content").css("min-height",$(".company_act").height()+"px");
})
</script>
</head>
<body>
<!--图片广告-->
<div class="guanggao_boxx">
<div class="guanggao_minboxx" style="width:1026px;">
<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" /> 
</div>
</div>
<!--图片广告-->

<div class="ywloginboy">
<div class="guanggao_minboxx" style="width:1026px;">
<div class="Main_page" style="position: relative;">
	<div class="current">
		<span class="bh-fl">联盟商户活动</span>
	    <span class="bh-fr">当前位置：<a href="${ctx }">首页</a> &gt; <a href="${ctx }/marlist-48789f612cd24e5093f32be5295666c4${urlSuffix}">联盟商户</a> &gt; <a href="${ctx }/merActivity${urlSuffix}"><strong>联盟商户活动</strong></a></span>
	</div>
	<div class="current_icon1"></div>
	<div class="m_content" style="margin-top:20px;">
        <div class="con_left" style="padding-top:0px;">
            	<div class="event_detail">
                	<h1 style="color:;font-size:px">${activity.name }</h1>
                    <p class="date">有效期：<fmt:formatDate value="${activity.startDate }" pattern="yyyy年MM月dd日"/>至<fmt:formatDate value="${activity.endDate }" pattern="yyyy年MM月dd日"/></p>
                    <div>
                    	<p align="center">
							${activity.content }
						</p>
                    </div>
                </div>
       	  </div>
          <div class="bh-clear"></div>
           <div class="p_type" id="p_type"><span class="bh-fl">参与活动的商户</span></div>
			<div class="p_type_menu">
				<c:forEach items="${merchantList }" var="mer">              		
				<ul onclick="window.open('${ctx }/marInfo-${mer.id }${urlSuffix}')" style="cursor: pointer;">
					<div class="company_pic">
						<img src="${mer.image }" onerror="this.src='${ctxStatic }/ywsmk/images/yw_mar_log.png'" width="95" height="95">
					</div>
			     	<li class="branch_name">${mer.name }</li>
			         <li class="branch_add">地址：${mer.contactAddress }</li>
			         <li class="branch_tel">电话： ${mer.contactWay }</li>
			     </ul>
				</c:forEach>
			</div>
     </div>
     <!--商户活动-->
	<div class="company_act" style="position: absolute;left:785px;top:78px;">
	<!--标题-->
	<div class="hot_title"> 
	  <div class="hot_title_txt">商户活动</div>
	</div>
	<!--标题-->
	
	<!--活动-->
	<div class="company_act_main">
	  <ul>
	  <c:forEach items="${rightList }" var="right">
	    <li>
	      <div class="company_act_inf">
	        <div class="company_act_inf01">
	          <span class="ellipsis eps190" title="${right.name }">${right.name }</span>
	          <fmt:formatDate value="${right.startDate}" pattern="yyyy.MM.dd"/>~<fmt:formatDate value="${right.endDate}" pattern="yyyy.MM.dd"/>
	        </div>
	      </div>
	      <div class="company_act_pic"><a href="${ctx }/merActivityInfo-${right.id}${urlSuffix}" target="_blank"><img src="${right.poster }" onerror="" style="width:190px;height:215px;"></a></div>
	    </li>
	   </c:forEach>
	  </ul>
	  <div class="company_act_more"><input type="button" class="inf_btn" value="查看全部活动" onclick="javascript:window.open('${ctx }/merActivity${urlSuffix}');"></div>
	  <div style="clear:both;"></div>
	</div>
	<!--活动-->
	</div>
	<!--商户活动-->
</div>

</div>
</div>

</body>
</html>