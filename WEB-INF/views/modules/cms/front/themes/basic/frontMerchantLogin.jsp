<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>义乌市民卡服务平台</title>
<link title="normal" href=" ${ctxStatic}/ywsmk/ywsmk_files/index.css" rel="stylesheet" type="text/css" />
<link title="normal" href=" ${ctxStatic}/ywsmk/ywsmk_files/css.css" rel="stylesheet" type="text/css" />
<link title="default" href=" ${ctxStatic}/ywsmk/ywsmk_files/theme_default.css" rel="stylesheet" type="text/css"  />
<link title="deepblue" href=" ${ctxStatic}/ywsmk/ywsmk_files/theme_deepblue.css" rel="stylesheet" type="text/css" disabled="disabled" />
<link title="lightblue" href=" ${ctxStatic}/ywsmk/ywsmk_files/theme_lightblue.css" rel="stylesheet" type="text/css" disabled="disabled" />
<link title="brown" href=" ${ctxStatic}/ywsmk/ywsmk_files/theme_brown.css" rel="stylesheet" type="text/css" disabled="disabled" />
<link title="normal" href=" ${ctxStatic}/ywsmk/ywsmk_files/login/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src=" ${ctxStatic}/ywsmk/ywsmk_files/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src=" ${ctxStatic}/ywsmk/ywsmk_files/jquery.cookie.js"></script>
<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/jquery-jbox/2.3/Skins/Blue/jbox.css"/>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>
<div class="login_header">
	<div class="logo_box">
		<div class="logo">
		<a href="${ctx }/"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/logo.png"></a>
		</div>
		<div style="float:right;height: 73px;padding-top: 28px;"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/logo2.png" style="width:200px;"></div>
	</div>
</div>
<div class="ywloginbg">

<div class="ywloginboy">

<div class="ywloginbox">
<table class="ywlogintable" width="396px" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><div class="denglutext">联盟商户登录</div></td>
  </tr>
  <tr>
    <td colspan="2">
      <div class="">
        <input class="daxiaolog" id="username" placeholder="请输入用户名" type="text" value="请输入用户名" 
           onFocus="if(value==defaultValue){value='';this.style.color='#000'}" 
           onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999">
        </div>
    </td>
    </tr>
  <tr>
    <td  colspan="2"><div class="">
    <input class="daxiaolog" id="password" placeholder="请输入密码" type="password" 
           onFocus="if(value==defaultValue){value='';this.style.color='#000'}" 
           onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999">
    </div></td>
    
  </tr>
  <%-- <tr>
    <td width="90"><div class="">
    <input class="yzminput" id="validateCode" placeholder="请输入验证码" type="text" value="请输入验证码"
           onFocus="if(value==defaultValue){value='';this.style.color='#000'}" 
           onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999">
     </div></td>
    <td><img style="margin:3px 0" src="${pageContext.request.contextPath}/servlet/validateCodeServlet" width="80" height="28" /><a onclick="javascript:$(this).prev().attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+Math.random());"><span style="float:right;line-height:34px;height:34px;">换一张？</span></a></td>
  </tr> --%>
  <tr>
     <td colspan="2">
	 <div style="width:90px; height:34px; float:left;  margin-right:7px;">
		<input class="yzminput" id="validateCode" placeholder="请输入验证码" type="text" value="请输入验证码"
           onFocus="if(value==defaultValue){value='';this.style.color='#000'}" 
           onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999; width:80px;">
     </div>
    <div style="width:70px; height:34px; float:left; margin-right:7px;">
		<img id="validateImg" style=" margin-left:2px;" src="${pageContext.request.contextPath}/servlet/validateCodeServlet" width="70px" height="34px" />
	</div>
	<div style="width:60px; height:34px; float:left;">
		<a onclick="javascript:$('#validateImg').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+Math.random());">
		<span style="line-height:34px;height:34px;  ">换一张？</span>
		</a>
	</div>
	</td>
  </tr>
  <tr class="nopain">
    <td   colspan="2">
      <table class="nopainss" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr >
    <td class="huise" width="130"> <input type="checkbox" name="checkbox" id="checkbox" />
        <label for="checkbox"></label>
         自动登录</td>
    <td>
      <%-- <a class="huise" href="${ctx }/merchant/forgetPassword${urlSuffix}">忘记密码？</a> --%></td>
  </tr>
</table>

       </td>
    </tr>
  <tr>
    <td  colspan="2">
    
    <table class="nopain" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="huise" width="50%"> <input id="loginButton" name="登录" type="button" class="ywdenglubut" value="登录" /></td>
    <td width="50%">
    <input id="resetButton" class="ywsydenglubut" name="" value="重置"  type="button" />
        </td>
  </tr>
</table>
 </td>
    
  </tr>
</table>
</div>
</div>
</div>
<!--右侧快捷-->
<div class="rfloat">
  <ul>
    <li title="意见反馈" onclick="">
      <div class="rfloatbg1" style="display: block;"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/icon_3.jpg" alt="意见反馈"></div>
      <div class="rfloatbg2" style="display: none;"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/icon_33.jpg" alt="意见反馈"></div>
      <div class="rfloatitem" style="display: none;">
        <div class="rfloatitem1">意见反馈</div>
      </div>
    </li>
    <%-- <li title="关注新浪微博">
      <div class="rfloatbg1" onclick="" style="display: block;"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/icon_4.jpg" alt="新浪微博"></div>
      <div class="rfloatbg2" onclick="" style="display: none;"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/icon_44.jpg" alt="新浪微博"></div>
      <!-- <div class="rfloatitem" style="display: none;">
        <wb:follow-button uid="2541984024" type="red_2" width="120" height="32"><iframe src="./ywsmk_files/followbutton.html" width="120" height="32" frameborder="0" scrolling="no" marginheight="0"></iframe></wb:follow-button>
      </div> -->
    </li> --%>
    <li title="淘宝店铺" onclick="window.open('https://shop202253761.taobao.com/shop/view_shop.htm?tracelog=twddp&user_number_id=673400510&user_id=673400510');">
      <div class="rfloatbg1" onclick="" style="display: block;"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_5.jpg" alt="淘宝店铺"></div>
      <div class="rfloatbg2" onclick="" style="display: none;"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_55.jpg" alt="淘宝店铺"></div>
      <div class="rfloatitem" style="display: none;">
        <div class="rfloatitem1">淘宝店铺</div>
      </div>
    </li>
    <li title="微信二维码">
      <div class="rfloatbg1" style="display: block;"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/weixin11.png" alt="微信"></div>
      <div class="rfloatbg2" style="display: none;"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/weixin1.png" alt="微信"></div>
      <div class="rfloatitem" style="display: none;">
        <img src="${ctxStatic}/ywsmk/ywsmk_files/wx8cm.jpg" alt="微信二维码">
      </div>
    </li>
    <li title="APP下载" style="background-color: #FFFFFF;">
      <div class="rfloatbg1" style="display: block;"><img src="${ctxStatic}/ywsmk/ywsmk_files/app1.png" alt="微信"></div>
      <div class="rfloatbg2" style="display: none;"><img src="${ctxStatic}/ywsmk/ywsmk_files/app11.png" alt="微信"></div>
      <div class="rfloatitem" style="display: none;">
        <img src="${ctxStatic}/ywsmk/ywsmk_files/wx800x800.jpg" style="width: 258px;" alt="APP下载">
      </div>
    </li>
    <li title="回到顶部" onclick="javascript:scroll(0,0);">
      <div class="rfloatbg1"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/icon_7.jpg" alt="回到顶部"></div>
      <div class="rfloatbg2"><img src=" ${ctxStatic}/ywsmk/ywsmk_files/icon_77.jpg" alt="回到顶部"></div>
      <div class="rfloatitem">
        <div class="rfloatitem1">回到顶部</div>
      </div>
    </li>
  </ul>
</div>
<script src=" ${ctxStatic}/ywsmk/ywsmk_files/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
  $(function () {
    $(".rfloat ul li").hover(
      function () {
        $(this).children(".rfloatbg1").hide();
        $(this).children(".rfloatbg2").show();
        $(this).children(".rfloatitem").show();
      },
      function () {
        $(this).children(".rfloatbg1").show();
        $(this).children(".rfloatbg2").hide();
        $(this).children(".rfloatitem").hide();
      }
    );
  });
</script>
<!--右侧快捷-->
<!--底部-->
<div class="foot_bar" style="background-color: #ffffff;border-top: 0px solid #C9C9C9;">
  <div class="foot_nav">
    <a href="${ctx}/" target="_self">首页</a>|
    <a href="${ctx}/list-3.html" target="_self">关于市民卡</a>|
    <a href="${ctx}/branch-1.html" target="_self">服务网点</a>|
    <!-- <a href="#" target="_blank">网站地图</a>| -->
    <a href="${ctx}/friendlylink-25.html" target="_self">友情链接</a>|
    <a href="${ctx}/list-23.html" target="_self">常见问题</a>|
    <a href="http://www.ywsmk.com:3355" target="_self">市民论坛</a>
  </div>
  <div class="foot_txt">浙ICP备16045287号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;版权所有：2016-2018&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;义乌市社会保障市民卡服务有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务热线：96150</div>
  <div style="width:300px;margin:0 auto; padding:20px 0;">
    <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33078202000559" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="${ctxStatic}/ywsmk/images/备案图标.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">浙公网安备 33078202000559号</p></a>
  </div>
</div>
<div style="display:none;">
  <script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fcf49a367ad697d7b30a634442b6e0bbc' type='text/javascript'%3E%3C/script%3E"));
  </script><script src=" ${ctxStatic}/ywsmk/ywsmk_files/h.js" type="text/javascript"></script><a href="http://tongji.baidu.com/hm-web/welcome/ico?s=cf49a367ad697d7b30a634442b6e0bbc" target="_blank"><img border="0" src=" ${ctxStatic}/ywsmk/ywsmk_files/21.gif" width="20" height="20"></a>
</div>
<!--底部-->
<script type="text/javascript">
	$(function(){
		$("#resetButton").on("click",function(){
			$("#username").val("");
			$("#password").val("");
			$("#validateCode").val("");
		});
		
		$("#loginButton").on("click",function(){
			var username=$("#username").val();
			var password=$("#password").val();
			var validateCode=$("#validateCode").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/servlet/validateCodeServlet",
				type:"get",
				data:{
					"validateCode":validateCode
				},
				success:function(data){
					if(data=="true"){
						$.ajax({
							url:"${ctx}/merchant/login",
							type:"post",
							data:{
								"bizId":username,
								"pwd":password,
								"validateCode":validateCode
							},
							success:function(data){
								if(data.resultCode==0){
									location.href='${ctx}/merchant/baseInfo${urlSuffix}';
								}else{
									$.jBox.error(data.resultMessage,"错误",{"persistent":true,"top":"35%"});
								}
							}
						});
					}else{
						$.jBox.error("验证码错误","错误",{"persistent":true,"top":"35%"});
					}
				}
			});
		});
	});
</script>
</body></html>