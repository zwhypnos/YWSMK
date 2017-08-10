<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>

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
<!-- 本页基于 index.css另加的CSS-->
<style>
.daxiao_100 {width: 60px;height: 30px;line-height: 20px;border-radius: 5px;padding: 5px;border:solid 1px #a3a4a6;}
.daxiao_100:focus {border-radius: 5px;padding: 5px;border:solid 1px #00CCFF;}
.tishi_tu_r{padding:20px 5px 5px 5px; width:22px;  float:right;}
.tishi_text_r{padding: 5px; float: right; }
.bank-empty {float: left;width: 120px; height: 30px; line-height: 30px;display: block; border: 1px solid #DDDEDE; 
		margin: 0 -1px -1px 0;padding:2px; position: relative; z-index: 0; cursor: pointer;text-align:center;}
.bank-empty:hover{float: left;width: 120px; height: 30px; line-height: 30px;display: block; border: 1px solid #A5C85B; 
		margin: 0 0px -1px 0;padding:2px; position: relative; z-index: 0; cursor: pointer;text-align:center;}
.ico_yh_nx { background: url(images/yh_nx.png) no-repeat;background-size:100% 100%; display: inline-block;
	height: 18px; margin-right: 1px;line-height: 999px; overflow: hidden; width: 18px; position: relative;vertical-align: -3px;}
.ico_yh_cz { background: url(images/yh_cz.png) no-repeat;background-size:100% 100%; display: inline-block;
	height: 18px; margin-right: 1px;line-height: 999px; overflow: hidden; width: 18px; position: relative;vertical-align: -3px;}
</style>
<!-- 本页另加的CSS-->
</head>


<body>
<div class="boss_box">
<iframe id="sina_anywhere_iframe" style="display: none;" src="${ctxStatic}/ywsmk/ywsmk_files/saved_resource.html"></iframe>


<!--市民卡服务-->
<div class="ywloginboy">
<div class="guanggao_minboxx">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
<td class="lmkaka">
    <table style="margin:30px;" width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
    <td style=" color:#000;">第一步：输入金额并选择银行</td>
  </tr>
  <tr>
    <td width="150px" style="color:#000;"><img src="${ctxStatic}/ywsmk/images/cz_1.jpg" width="790px" height="500px" /></td>
  </tr>
    <tr>
    <td style=" color:#000;">第二步：输入银行卡号</td>
  </tr>
  <tr>
    <td width="150px" style="color:#000;"><img src="${ctxStatic}/ywsmk/images/cz_2.jpg" width="790px" height="500px" /></td>
  </tr>
    <tr>
    <td style=" color:#000;">第三步：选择认证方式并输入交易密码</td>
  </tr>
  <tr>
    <td width="150px" style="color:#000;"><img src="${ctxStatic}/ywsmk/images/cz_3.png" width="790px" height="500px" /></td>
  </tr>
    <tr>
    <td style=" color:#000;">第四步：确认付款信息</td>
  </tr>
  <tr>
    <td width="150px" style="color:#000;"><img src="${ctxStatic}/ywsmk/images/cz_4.png" width="790px" height="500px" /></td>
  </tr>
    <tr>
    <td style=" color:#000;">第五步：输入验证坚石e盾·智能Key密码</td> 
  </tr>
  <tr>
    <td width="150px" style="color:#000;"><img src="${ctxStatic}/ywsmk/images/cz_5.jpg" width="790px" height="500px" /></td>
  </tr>
    <tr>
    <td style=" color:#000;">第六步：订单支付成功</td>
  </tr>
  <tr>
    <td width="150px" style="color:#000;"><img src="${ctxStatic}/ywsmk/images/cz_6.png" width="790px" height="500px" /></td>
  </tr>
    </table>
     <table width="98%" class="mm_wxts" border="0" cellspacing="0" cellpadding="0">
    
  <tr>
    <td>
   <p><span class="tishi_no1">温馨提示：</span></p>
   <span class="tishi_no2">
	请再三确认卡号与金额后点击确认！！
</span>
    </td></tr></table>
    

    </td>
  </tr>
 
</table>

</div>
</div>
<!--市民卡服务-->

</div>
</body></html>