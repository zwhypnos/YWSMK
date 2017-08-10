<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>


<!--本页所使用的CSS-->
<style>
.xml_hdsq{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_009.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #FFF;line-height: 50px;text-indent: 70px;}
.xml_hdsq_b{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_999.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #000;line-height: 50px;text-indent: 70px;
	border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #C6C6C6;}
.xml_hdsq_b:hover{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_009.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #FFF;line-height: 50px;text-indent: 70px;}

/***********buttom样式****************/

.but_a{width:100px; height:40px; line-height:40px;  color:#fff; font-size:16px; background-color:#B092EE; border:none; text-align: center; cursor: pointer; font-family:"微软雅黑";
border-radius: 4px;    /*IE9 Firefox4 浏览器圆角边框*/
-webkit-border-radius: 4px; /*苹果谷歌浏览器 圆角边框*/    
-moz-border-radius: 4px;    /*火狐浏览器 圆角边框*/
position:relative;
  behavior: url(js/PIE.htc);}
.but_a:hover,.but_b:hover,.but_n:hover,.tab_b li a:hover,.but_jj:hover{  filter:alpha(opacity=80);
	-moz-opacity:0.8; -khtml-opacity: 0.8;opacity: 0.8;}
	
	.guanggao_minboxx{
		min-width: 970px;
	}
	
	a{
		color:#000;
	}
</style>
<!--本页所使用的CSS-->

</head>
<body>


<!--欢迎-->
<div class="guanggao_boxx">
<div class="smkafw_minboxx">
<div class="touxiang_03">
  <img src="${ctxStatic}/ywsmk/images/touxiang_03.png" width="111" height="111" /> </div>
<div class="huuyuantishi">
<div class="huanying"><span class="xiawuhao">下午好&nbsp;,</span> 
 <span class="huanyingdaolai">&nbsp;欢迎您来到商户中心！</span></div>
 <div class="shenfenzheng">商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户：${merchant.name }</div>
<div class="shangcidenglu">本次登录：<fmt:formatDate value="${merchant.cuLoginDate }" type="both" pattern="yyyy-MM-dd hh:mm:ss" />  上次登录：<fmt:formatDate value="${merchant.preLoginDate }" type="both" pattern="yyyy-MM-dd hh:mm:ss" /> </div>
</div>
</div>
</div>
<!--欢迎-->



<!--市民卡服务-->
<div class="ywloginboy">
<div class="guanggao_minboxx">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="280px"><div class="smkbt">商户服务</div></td>
    <td> <div class="mbx">当前位置：首页&nbsp;〉&nbsp; 商户服务&nbsp;〉&nbsp;活动列表&nbsp;〉&nbsp;活动详情</div></td>
  </tr>
  <tr>
    <td class="lmkaka">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td> <div class="xml_jbxx_b" onclick="location.href='${ctx }/merchant/baseInfo${urlSuffix}'">基本信息</div></td>
          </tr>
          <c:if test="${not empty merchant_user and empty merchant_user.fId }">
          	<tr>
            <td><div class="xml_xxmx">活动列表</div></td>
            </tr>
           <tr>
            <td><div class="xml_hdsq_b" onclick="location.href='${ctx }/merchant/activityApply${urlSuffix}'">活动申请</div></td>
            </tr>
          </c:if>
          <c:if test="${not empty merchant_user and not empty merchant_user.fId }">
          	<tr>
            <td><div class="xml_lnye_b" onclick="location.href='${ctx }/merchant/cardVerification${urlSuffix}'">卡券核销</div></td>
            </tr>
          </c:if>
            </tr>
	 </table>
	</td>
	<td class="lmkaka">
       <table style="margin:30px;" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td>
            <table  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="100xp">活动名称：</td>
                <td width="500xp">${activity.name }</td>
              </tr>
              <tr>
                <td>活动时间：</td>
                <td>
                <fmt:formatDate value="${activity.startDate }" pattern="yyyy-MM-dd"/> 至 <fmt:formatDate value="${activity.endDate }" pattern="yyyy-MM-dd"/>
              </tr>
              <tr>
                <td>活动图标：</td>
                <td>
                	<c:if test="${not empty activity.image}">
                	<div id="localImag">
                	<img id="preview" width="-1" height="-1" style="display: block; width: 86px; height: 86px;" src="${activity.image }">
                	</div>
                	</c:if>
                </td>
              </tr>
              <tr>
                <td valign="top" >活动简介：</td>
                <td>
                	${activity.content }
                </td>
              </tr>
              <tr>
                <td valign="top" >审核状态：</td>
                <td>
                	<c:if test="${activity.auditState eq '0' }"><span style="color:yellow;">未审核</span></c:if><c:if test="${activity.auditState eq '1' }"><span style="color:green">通过</span></c:if><c:if test="${activity.auditState eq '2' }"><span style="color:red">未通过</span></c:if>
                </td>
              </tr>
              <c:if test="${activity.auditState eq '2'}">
           	 <tr>
              <td valign="top" >未通过原因：</td>
              <td>
              	${activity.remarks }
              </td>
              </tr>
              </c:if>
              <tr>
                <td></td>
                <td>
                <input type="button" name="button" id="resetButton" onclick="history.go(-1);" value="返回" class="but_a span6 " style="background-color: #e2e2e2;"> &nbsp;&nbsp;
                <c:if test="${activity.auditState eq '2'}">
                <input type="button" name="button" id="submitButton" onclick="location.href='${ctx }/merchant/activityApply${urlSuffix}?id=${activity.id}'" value="修改申请" class="but_a span6 mar_t15 "></td>
              	</c:if>
              </tr>
        </table>

    </td>
     </tr>
    
    </table>

    </td>
  </tr>
 
</table>


</div>
</div>
<!--市民卡服务-->

</body>
</html>