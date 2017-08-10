<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
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
	
	.guanggao_minboxx{
		min-width: 970px;
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
    <td> <div class="mbx">当前位置：首页&nbsp;〉&nbsp; 商户服务&nbsp;〉&nbsp;基本信息</div></td>
  </tr>
  <tr>
    <td class="lmkaka">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td> <div class="xml_jbxx" >基本信息</div></td>
          </tr>
          	<c:if test="${not empty merchant_user and empty merchant_user.fId }">
          		<tr>
	            <td><div class="xml_xxmx_b" onclick="location.href='${ctx }/merchant/activityList${urlSuffix}'">活动列表</div></td>
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
    
   		 <td width="111px;"> 
     		 <img src="${ctxStatic}/ywsmk/images/touxiang_03.png" width="111" height="111" />
     	 </td>
     	 <td width="300px;"> 
             <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                 <tr>
            	    <td width="100px;" align="right" ><strong> 
                    商户编码：
                    </strong></td>
                    <td> 
                    <span class="red">${merchant_user.merchantId }</span>&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                 </tr>
                  <tr>
            	    <td align="right"><strong> 
                    商户名称：
                    </strong></td>
                    <td> 
                    ${merchant_user.name }
                    </td>
                 </tr>
                  <tr>
            	    <td align="right"><strong> 
                    联系电话：
                    </strong></td>
                    <td> 
                    ${merchant_user.contactWay }
                    </td>
                 </tr>
                  <tr>
            	    <td align="right"><strong> 
                   商户密码：
                    </strong></td>
                    <td> 
                     <a style="text-decoration: underline;color:red;" href="${ctx }/merchant/editPassword${urlSuffix}">修改</a></td>
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