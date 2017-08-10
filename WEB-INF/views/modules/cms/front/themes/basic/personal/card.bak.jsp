<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/card/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctxStatic}/ywsmk/card/css/style.css">

</head>
<body>

<div class="yve_box">

<section class="htmleaf-container">
	<div class="container">
	<c:if test="${cmsUser.card eq '0'}"><!-- 未绑定卡开始 -->
		<!-- <div style="padding-top:100px;font-size: 25px;">  
		<span style="color:red;">对不起！您还没有进行实名绑卡，不能查看卡信息，请先去<a href="javascript:srcollTobind();" style="text-decoration:underline;color:green;">绑卡</a></span>
		</div> -->
		<a href="javascript:srcollTobind();"><img style="width:950px;height:260px;" alt="对不起！您还没有进行实名绑卡，不能查看卡信息，请先去绑卡" src="${ctxStatic}/ywsmk/images/unbind.jpg"></a>
	</c:if><!-- 未绑定卡结束 -->
	<c:if test="${cmsUser.card eq '1'}"><!-- 已绑定卡开始 -->
	<c:if test="${not empty personCardList }"><!-- 卡列表不为空开始 -->
	<div id="single-quad" class="carousel slide" data-ride="carousel" data-shift="1">
		<div class="carousel-inner">
		<c:forEach begin="0" end="${count-1}" varStatus="status"><!-- 遍历卡列表开始 -->
		<c:if test="${status.index eq '0'}"><!-- 遍历卡列表开始 -->
		  <ul class="row item active">
		  	<c:set var="card1" value="${personCardList[status.index*2] }"></c:set>
			<li class="col-xs-6">
			<c:choose><c:when test="${status.index*2 eq '0' }"><div class="shimin_kayue_01_s" id="${card1.cardNo }" state="${card1.cardState}"></c:when><c:otherwise><div class="shimin_kayue_01" id="${card1.cardNo }" state="${card1.cardState}"></c:otherwise></c:choose>
                  <div class="yve_tybox">
                      <div class="yve_tybiaoti"></div>
                      <div class="kahao_tyfwkahao">${CARD_TYPE[card1.cardType] }</div>
                  </div>
                  <div class="yve_dabox">
                      <div class="big_yve"> 姓名：${card1.clientName } </div>
                      <div class="small_yve"> 卡号：${card1.cardNo } </div>
                  </div>
                  <div class="kayve_foot">
                  	  <div class="yve_state">卡状态：<c:choose><c:when test="${card1.cardState eq '1'}"><span style="color:green;">${CARD_STATE[card1.cardState] }</span></c:when><c:otherwise><span class="yve_text_red">${CARD_STATE[card1.cardState] }</span></c:otherwise></c:choose></div>
                      <div class="yve_loss"><c:if test="${card1.cardState eq '1'}"><%-- <a href="javascript:lost('${card1.cardNo }')">挂失</a> --%></c:if></div>
                  </div>
              </div>
			</li>
			<c:if test="${(size-1) ge (status.index*2 + 1) }">
			<c:set var="card2" value="${personCardList[status.index*2 + 1] }"></c:set>
			<li class="col-xs-6">
			  <div class="shimin_kayue_01" id="${card2.cardNo }" state="${card2.cardState}">
                  <div class="yve_tybox">
                      <div class="yve_tybiaoti"></div>
                      <div class="kahao_tyfwkahao">${CARD_TYPE[card2.cardType] }</div>
                  </div>
                  <div class="yve_dabox">
                      <div class="big_yve"> 姓名：${card2.clientName } </div>
                      <div class="small_yve"> 卡号：${card2.cardNo } </div>
                  </div>
                  <div class="kayve_foot">
                  	  <div class="yve_state">卡状态：<c:choose><c:when test="${card2.cardState eq '1'}"><span style="color:green;">${CARD_STATE[card2.cardState] }</span></c:when><c:otherwise><span class="yve_text_red">${CARD_STATE[card2.cardState] }</span></c:otherwise></c:choose></div>
                      <div class="yve_loss"><c:if test="${card2.cardState eq '1'}"><%-- <a href="javascript:lost('${card2.cardNo }')">挂失</a> --%></c:if></div>
                  </div>
              </div>
			</li>
			</c:if>
			</c:if>
		  </ul>
		  </c:forEach>
		</div>

		<a class="carousel-control left" href="#single-quad" data-slide="prev">Previous</a>
		<a class="carousel-control right" href="#single-quad" data-slide="next">Next</a>
	  </div>
	 </c:if>
	</c:if> 
	</div>
</section>
</div>
<%-- <script src="${ctxStatic}/ywsmk/card/js/jquery-2.1.1.min.js"></script> --%>
<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/ywsmk/card/dist/js/bootstrap.min.js"></script>
<%-- <script src="${ctxStatic}/ywsmk/card/js/index.js"></script> --%>
<script type="text/javascript">
	function srcollTobind(){
		parent.gotoBinding();
	}
	
	$(function(){
		if($(".col-xs-6>div").length > 0){
			var cardNo = $(".col-xs-6>div").eq(0).attr("id");
			var state = $(".col-xs-6>div").eq(0).attr("state");
			parent.$.jBox.tip("查询中...","loading",{persistent: true});
			parent.cardInfo(cardNo,'0',state);
			parent.setPayCardId(cardNo);
		}
		
		$(".col-xs-6>div").click(function(){
			$(".col-xs-6>div").each(function(i){
				$(this).attr("class","shimin_kayue_01");
			});
			$(this).attr("class","shimin_kayue_01_s");
			var cardNo = $(this).attr("id");
			var state = $(this).attr("state");
			parent.$.jBox.tip("查询中...","loading",{persistent: true});
			parent.cardInfo(cardNo,'0',state);
			parent.setPayCardId(cardNo);
		});
	});

	function lost(cardNo){
		parent.lost(cardNo);
	}
</script>

</body>
</html>