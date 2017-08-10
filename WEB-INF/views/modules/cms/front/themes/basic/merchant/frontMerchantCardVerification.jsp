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

<!--本页新增的CSS-->
<link rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/css/kqhx_3.css"/>
<style type="text/css">
.ywloginboy_1 {margin-top: 20px;width: 90%;margin-right: auto;margin-left: auto;clear: none;}
.hidden {display: none;}
</style>
<!--本页新增的CSS-->

<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/jquery-jbox/2.3/Skins/Blue/jbox.css"/>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>
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
<div class="ywloginboy_1">
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
            <td> <div class="xml_jbxx_b" onclick="location.href='${ctx }/merchant/baseInfo${urlSuffix}'">基本信息</div></td>
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
	            <td><div class="xml_lnye">卡券核销</div></td>
	            </tr>
            </c:if>
            </tr>
	 </table>
	</td>
<td class="lmkaka">
    <table class="" width="100%" style="margin:0px;" border="0" cellspacing="0" cellpadding="0">
 	 <tr><td>
     <!-- 标题及搜索--> 
     <div id="body" class="body page_simple ">  
     <div class="container_box"> 
<div class="main_hd">
<h2>卡券核销</h2>
</div>
<div class="main_bd disple_wrp">
<div class="search_box" id="js_search_box">
<div class="sub_search">
<div class="frm_controls">
<span class="frm_input_box search append">
<a href="javascript:;" id="js_search" class="frm_input_append">
<!-- <i class="icon16_common search_gray">搜索</i>&nbsp; -->
<i class="icon16_common ok_gray">搜索</i>&nbsp;
</a>
<input id="js_cardid" name="product" type="text" placeholder="请输入优惠券号" value="" class="frm_input" cursn="">
</span>
<p class="frm_tips">
</p>
</div></div></div>
 <!-- 标题及搜索--> 	
 
 <!-- 引导--> 	
<div id="js_search_result" class="hidden">
<div class="card_intro" id="js_intro">
<div class="image_left">
<img src="https://res.wx.qq.com/mpres/htmledition/images/pic/cardticket/demo_card218877.png">
</div>
<div class="step_list_wrp">
<ul class="step_list">
<li class="step_item step_box no_extra_up">
<div class="step_inner">
<div class="step_content">
<h4>搜索卡券</h4>
<div class="step_desc">请顾客出示卡券，输入优惠券号或会员卡号</div></div></div> 
<span class="icon_step_line icon_step_line_up"></span>
<span class="icon_step_line icon_step_line_down"></span>
	<span class="icon_step_wrapper">
	<i class="icon_step_list finish">1</i>
	</span></li>
	<li class="step_item step_box">
	<div class="step_inner">
	<div class="step_content">
	<h4>校检</h4>
	<div class="step_desc">微信提供有效期验证，其他信息请自行核对</div></div></div>
	<span class="icon_step_line icon_step_line_up"></span>
	<span class="icon_step_line icon_step_line_down"></span>
	<span class="icon_step_wrapper">
	<i class="icon_step_list finish">2</i>
	</span></li>
	<li class="step_item step_box no_extra_down">
	<div class="step_inner">
	<div class="step_content">
	<h4>使用完成</h4>
	<div class="step_desc">查看使用结果，顾客将同时收到优惠券核销或会员卡使用通知</div></div></div>
	<span class="icon_step_line icon_step_line_up"></span>
	
	<span class="icon_step_wrapper">
	<i class="icon_step_list step">3</i>
	</span></li>
	</ul></div>
	</div>
</div>
<!-- 引导--> 	

 <!-- 确认--> 	
<div id="js_search_result" class="hidden">
<div class="outcome">
<div class="outcome_hd">
<img src="https://mmbiz.qlogo.cn/mmbiz_jpg/5UiciboxBQ9L56RxZC77Q6ibq6cSQVxnuXor5OD1m624SPGBVc5tjekwkmZbm7Ryf0rPX7TAjTp6Pm8tFUrHGLxIQ/0?wx_fmt=jpeg" width="84" height="84" class="shop_logo">
<div class="card_contract">
<h3 class="card_title">测试卡券1</h3>
<div class="card_info">
<p>
<label class="status   ">


<span class="valid">有效卡券</span>


</label>
<label>
<span>有效期</span>&nbsp;
<span class="outdate">
2017.03.09 - 2017.05.29
</span>
</label></p>
<label><span>序列号</span>&nbsp;<span class="series_num">2775-0029-8391</span></label>
</div>

</div>

</div>
<div class="outcome_bd">
<div class="member_info" id="js_card_detail_p" style="border-bottom-width: 0px; display: block;">




<div class="frm_control_group show_value">
<label for="" class="frm_label">
使用须知</label>
<div class="frm_controls">
<span class="frm_input_box">测试卡券1
</span>
</div>
</div>

<div class="frm_control_group show_value">
<label for="" class="frm_label">
适用门店</label>
<div class="frm_controls">
<ul class="supplement_list">
<li class="list_info">
<div id="js_shoplist"><table cellspacing="0" cellspading="0" class="shop_table">
<thead>
<tr><th class="name">门店名称</th> <th class="address th_last">地址</th></tr>
</thead>
<tbody>

<tr>
<td class="name">义乌市市民卡公司本部

</td>
<td class="address">浙江省金华市义乌市香山路389号</td>
</tr>

</tbody>
</table>
<div id="js_pagerbar"></div></div>
</li>
</ul>
<div id="js_pagebar"></div>
</div>
</div>

</div>

        

<div class="common_info" id="js_member_info_p">
<div class="frm_control_group">
 <label for="" class="frm_label">核销备注<br><span class="frm_tips">(选填)</span></label>
 <div class="frm_controls">
 <span class="frm_input_box with_counter counter_out append"><input id="remarkInput" type="text" class="frm_input" maxlength="9"></span>
</div>
</div>
</div>
</div>
</div>

<div class="ft">
<button data-code="277500298391" class="js_destroy_card btn btn_primary">确定销券</button>
<p class="mass_send_tips">卡券核销后不可撤回 </p>
</div>
</div>
<!-- 确认--> 

<!-- 查不到--> 
<div id="js_search_result" class="hidden">
<p class="no_data">无法查到相关信息，请仔细核对并重新输入</p>
</div>
<!-- 查不到-->

 <!-- 销券成功-->  
 <div id="js_search_result" class="hidden">
 <div class="disple_outcome successed">
 <div class="page_msg large default simple">
<div class="inner group">
<span class="msg_icon_wrp">
<i class="icon_msg success"></i>
</span>
<div class="msg_content">
<h4>已成功销券</h4>
<p>卡券已使用。可在“核销记录”查看核销记录。</p>

<p>
<a href="#" class="btn btn_primary">返回继续销券</a>             
</p><p>
</p></div>
</div>
</div>
</div></div>
 <!-- 销券成功-->  
	
	</div>
</div>
</div>
</td></tr>
<tr><td>


</td></tr>
    </table>

    </td>
  </tr>
 
</table>


</div>
</div>
<!--市民卡服务-->
<script type="text/javascript">
$(function(){
	$("#js_search").on("click",function(){
		var code=$("#js_cardid").val();
		if(code==null||code==""){
			$.jBox.error("请输入优惠券号","信息",{"persistent":true,"top":"35%"});
			return;
		}
		$.ajax({
			"url":"${ctx}/merchant/cardVerification",
			"data":{"code":code},
			"type":"post",
			"success":function(data){
				if(data.resultCode==0){
					if(data.data.statusCode==0){
						$.jBox.error("核销成功","信息",{"persistent":true,"top":"35%"});
					}else{
						switch(data.data.resultData.errcode){
							case 40056:
								$.jBox.error("不合法的Code码","信息",{"persistent":true,"top":"35%"});
								break;
							case 40099:
								$.jBox.error("卡券已被核销","信息",{"persistent":true,"top":"35%"});
								break;
							case 40127:
								$.jBox.error("卡券被用户删除或转赠中","信息",{"persistent":true,"top":"35%"});
								break;
							default:
								$.jBox.error(data.data.resultData.errmsg,"信息",{"persistent":true,"top":"35%"});
						}
					}
				}else{
					$.jBox.error("处理失败，请稍后再试","错误",{"persistent":true,"top":"35%"});
				}
			},
			"error":function(){
				$.jBox.error("ajax错误","错误",{"persistent":true,"top":"35%"});
			}
		});
	});
});
</script>
</body>
</html>