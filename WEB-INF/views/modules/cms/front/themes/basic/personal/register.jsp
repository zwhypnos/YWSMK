<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>

<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/css/hangzhouka.css"/>
<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/jquery-jbox/2.3/Skins/Blue/jbox.css"/>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>
<style type="text/css">
.hidden{
	display: none;
}

.red{
	color: red;
}
</style>
</head>
<body>
<!--广告+登录-->
<div class="guanggao_boxx">
	<div class="guanggao_minboxx">
		<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" />
	</div>
</div>
<!--广告+登录-->
<!--新闻公告-->
<div class="guanggao_boxx">
				<div class="guanggao_minboxx">
                        <!--标题 -->
                       
                        <!--标题 -->
                        <!--结果-->
                  
                  <div class="main_ch">
                    <div class="content">
                      <div class="bz_a pad_t30">
                           <ul>
                              <li class="meibg"><a href="#">1<span>快速注册</span></a></li>
                              <li style=" width:66px;" class="huibg"><a href="#">2<span>注册成功</span></a></li>
                           </ul>
                           <div class="clear"></div>
                        </div>
                        <div class="mar_k">
                        
                            <div class="zc_top">
                               <h2>填写个人注册信息</h2>
                               <a class="cole" href="${ctx }/single/login${urlSuffix}">我有账户，直接登录</a> 
                            </div> 
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="gap">
                          <tbody><tr>
                            <th width="40%" valign="top"><span class="">手机号码：</span></th>
                            <td width="60%"> 
                            <div style=" float:left">
                                      <input class="inp_rt" type="text" name="quickmobile" id="quickmobile" title="请输入注册手机号码" autocomplete="off" maxlength="11" onblur="checkMobileformsg()" tabindex="1">
                                      <p id="quickmobilehint" class="red hidden">请输入正确的手机号码！</p>
                            </div>
                            <div class="fdsg_a" id="quickmobile_tip"><span style="color:red;">*</span>请输入11位手机号码，该账号也可用于微信登录</div>
                            </td>
                          </tr>
                          <!-- <tr>
                            <th width="40%" valign="top"><span class="">&nbsp;</span></th>
                            <td width="60%">
                                <span id="chooseLogin" class="xz">
                                    <input type="checkbox" checked="checked" class="dag" disabled="disabled" id="agree" name="agree"> &nbsp;
                                    <label for="agree" style="cursor: pointer;">手机号作为用户名登录</label>
                                </span>
                            </td>
                          </tr> -->
                          <tr id="username" class="hidden">
                            <th width="40%" valign="top"><span class="">用户名：</span></th>
                            <td width="60%">
                                <div style=" float:left">
                                    <input type="text" name="loginname" id="loginname" class="inp_rt" value="" maxlength="20" onblur="checkUsername()" tabindex="2" placeholder="手机号已存在，请设置用户名"> &nbsp;
                                    <p id="usernamehint" class="red hidden">请按要求输入用户名！</p>
                                    <p id="usernamehint2" class="red hidden">用户名已经存在！</p>
                                </div>
                                <div class="fdsg_a" id="loginname_ytip"><span style="color:red;">*</span>6-20位字母或字母和数字的组合，以字母开头，注册后不可修改</div>
                                <!-- <div class="fdsg_e" style="display:none;" id="loginname_tip"><img src="/HzsmkManage/images/cha.png"></div> -->
                            </td>
                          </tr>
                            <tr>
                              <th><span class="">登录密码：</span></th>
                              <td>
                              <div style=" float:left">
                              <input type="text" class="inp_rt" style="display:none;" id="newpas" name="newpas" value="**********">
                                      <input  class="inp_rt" 
                                   type="password"  name="loginpwd" id="loginpwd" onblur="checkpwd()" maxlength="20" tabindex="3" />
                                   <p id="loginpwdhint" class="red hidden">请按要求输入密码！</p>
                            </div>
                                <div class="fdsg_a" id="loginpwd_ytip"><span style="color:red;">*</span>8-20位数字、字母、下划线的组合，至少包含两种类型字符</div>
                              </td>
                            </tr>
                            <tr>
                            <th width="40%"><span class="">确认登录密码：</span></th>
                            <td width="60%">
                            <div style=" float:left">
                            <input type="text" class="inp_rt" style="display:none;" id="renewpas" name="renewpas" value="**********">
                                      <input  class="inp_rt" 
                                      type="password"  name="newloginpwd2" id="newloginpwd2" value="" onblur="checkConfPwd()" maxlength="20" tabindex="4" />
                                      <p id="newloginpwd2hint" class="red hidden">两次输入的密码不一致！</p>
                            </div>
                            <div class="fdsg_a" id="newloginpwd2_ytip"><span style="color:red;">*</span>请再次输入登录密码</div>
                             </td> 
                          </tr>
                            <tr>
                              <th><span class="">短信验证码：</span></th>
                              <td>
                                <div style=" float:left;position: relative;">
                                    <input class="inp_rt span6" type="text" 
                                            name="qmobilecode" id="qmobilecode" maxlength="6" title="请输入获得的手机验证码" tabindex="5">
                             <span id="yzcode">
                                <a class="hqyzm" id="dxyzm" style="min-width:60px;" onclick="getMobilecode()">获取验证码</a></span>
                                    <span id="sms_tip1" style="line-height:30px;"></span>
                                  <div style="position: absolute;left:0;top:30px;"><p id="qmobilecodehint" class="red hidden">请按要求输入短信验证码！</p>
                                    <p id="qmobilecodehint2" class="red hidden"></p></div>  
                             </div>
                              <div id="smsResult" style="line-height: 32px;font-size: 12px;text-align: left;color: #71b83d;text-indent: 10px;float: left;" ></div>
                              
                              <div class="fdsg_a" id="qmobilecode_tip"><span style="color:red;">*</span>短信验证码为六位数字</div>
                              
                              </td>
                            </tr>
                            
                            <tr>
                                  <!-- <th width="34%"><span class="">&nbsp;</span></th>
                                  <td width="66%">
                                  <div style=" float:left"> 
                                        <input type="checkbox" checked="checked" id="agreexy" name="agreexy">
                                        同意<a style="color:#005f96;" href="" target="_blank">《义乌市民卡账户服务协议》</a>
                                    </div>
                                    <div class="fdsg_e" id="checkbox_tip" style="display:none"></div>
                                    </td> -->
                                        </tr>   
                                   <tr>
                                    <th valign="top"></th>
                                    <td><input type="button" name="button" id="button" value="立即注册" class="but_a span9 " <%-- onclick="location.href='${ctx}/single/registerOk${urlSuffix}'" --%>></td>
                                  </tr>
                                </tbody></table>
                                <div class="msg brd_tdashed mar_t30">温馨提示：请您尽量不要在公共场合或网吧使用，以防个人信息泄漏。</div>
                                </div>
                                <div class="mar_ak"></div> 
                                <div class="clear"></div> 
                            </div>
                            <div class="clear"></div> 
                        </div>
                  <!--结果-->
                  
                  </div>
                </div>
<!--新闻公告-->
<script type="text/javascript">
	var quickmobileReg=new RegExp("^1[0-9]{10}$");
	
	function validateMobileformsg(){
		var quickmobile=$("#quickmobile").val();
		return quickmobileReg.test(quickmobile);
	}
	
	function checkMobileformsg(){
		if(validateMobileformsg()){
			$("#quickmobilehint").addClass("hidden");
			$.ajax({
				url:"${ctx}/single/checkPhoneIsExist",
				type:"post",
				data:{
					"phone":$("#quickmobile").val()
				},
				success:function(data){
					if(data.resultCode==0){
						if(data.data=="exist"){
							$("#username").removeClass("hidden");
						}else{
							$("#username").addClass("hidden");
						}
					}
				}
			});
		}else{
			$("#quickmobilehint").removeClass("hidden");
			$("#username").addClass("hidden");
		}
	}
	
	var usernameReg=new RegExp("^[a-zA-Z][a-zA-Z0-9]{5,19}$");
	
	function validateUsername(){
		var loginname=$("#loginname").val();
		return usernameReg.test(loginname);
	}
	
	function validateUsernameExist(){
		var usernameExist=undefined;
		$.ajax({
			url:"${ctx}/single/checkUsernameIsExist",
			type:"post",
			async:false,
			data:{
				"username":$("#loginname").val()
			},
			success:function(data){
				if(data.resultCode==0){
					if(data.data=="exist"){
						usernameExist=true;
					}else{
						usernameExist=false;
					}
				}
			}
		});
		return usernameExist;
	}
	
	function checkUsername(){
		if(!$("#username").hasClass("hidden")){
			if(validateUsername()){
				$("#usernamehint").addClass("hidden");
				$("#usernamehint2").addClass("hidden");
				if(validateUsernameExist()){
					$("#usernamehint2").removeClass("hidden");
				}
			}else{
				$("#usernamehint").removeClass("hidden");
				$("#usernamehint2").addClass("hidden");
			}
		}else{
			$("#usernamehint").addClass("hidden");
			$("#usernamehint2").addClass("hidden");
		}
	}
	
	var loginpwdReg=new RegExp("^[0-9a-zA-Z_]{8,20}$");
	var allNumReg=new RegExp("^[0-9]{8,20}$");
	var allLetterReg=new RegExp("^[a-zA-Z]{8,20}$");
	var allSymbolReg=new RegExp("^[_]{8,20}$");
	
	function validatePwd(){
		var loginpwd=$("#loginpwd").val();
		return loginpwdReg.test(loginpwd)&&!allNumReg.test(loginpwd)&&!allLetterReg.test(loginpwd)&&!allSymbolReg.test(loginpwd);
	}
	
	function checkpwd(){
		if(validatePwd()){
			$("#loginpwdhint").addClass("hidden");
		}else{
			$("#loginpwdhint").removeClass("hidden");
		}
	}
	
	function validateConfPwd(){
		var loginpwd=$("#loginpwd").val();
		var newloginpwd2=$("#newloginpwd2").val();
		return loginpwd==newloginpwd2;
	}
	
	function checkConfPwd(){
		if(validateConfPwd()){
			$("#newloginpwd2hint").addClass("hidden");
		}else{
			$("#newloginpwd2hint").removeClass("hidden");
		}
	}
	
	var mobileCodeReg=new RegExp("^[1-9][0-9]{5}$");
	
	function validateMobileCodeReg(){
		var qmobilecode=$("#qmobilecode").val();
		return mobileCodeReg.test(qmobilecode);
	}
	
	function checkMobileCodemsg(){
		if(validateMobileCodeReg()){
			$("#qmobilecodehint").addClass("hidden");
		}else{
			$("#qmobilecodehint").removeClass("hidden");
		}
	}
	
	var timer = 60;
	function Countdown(){
	if (timer >= 1) {
	        timer -= 1;
	        setTimeout(function() {
	        	$("#dxyzm").html("获取验证码"+timer+"秒");
	            Countdown();
	        }, 1000);
	    }else{
	    	timer = 60;
	    	$("#dxyzm").html("获取验证码");
	    	$("#dxyzm").attr("onclick","getMobilecode()");
	    }
	}
	
	function getMobilecode(){
		if(validateMobileformsg()){
			$("#dxyzm").html("获取中...");
			$("#dxyzm").attr("onclick","");
			$.ajax({
				url:"${ctx}/single/getMobileCode",
				type:"post",
				async:false,
				data:{
					"phone":$("#quickmobile").val(),
					"codeType":"register"
				},
				success:function(data){
					if(data.resultCode ==0){
						$("#smsResult").css("color","#71b83d");
						$("#smsResult").html("短信发送成功！");
					}else if(data.resultCode ==11){
						$("#smsResult").css("color","#71b83d");
						$("#smsResult").html("短信发送成功！");
						$("#qmobilecodehint2").html(data.data);
						$("#qmobilecodehint2").removeClass("hidden");
					}else if(data.resultCode ==9||data.resultCode ==10){
						$("#smsResult").css("color","red");
						$("#smsResult").html("短信发送失败！");
						$("#qmobilecodehint2").html(data.resultMessage);
						$("#qmobilecodehint2").removeClass("hidden");
					}else{
						$("#smsResult").css("color","red");
						$("#smsResult").html("短信发送失败！");
					}
					Countdown();
				}
			});
		}else{
			checkMobileformsg();
		}
		
	}
	
	$(function(){
		$("#button").on("click",function(){
			/* if($("#agreexy").attr("checked")){ */
				if(!$("#username").hasClass("hidden")&&validateUsername()&&validateUsernameExist()){
					$.jBox.error("注册信息填写有误，请检查","错误",{"persistent":true});
					return;
				}
				if(validateMobileformsg()&&validatePwd()&&validateConfPwd()&&validateMobileCodeReg()){
					var quickmobile=$("#quickmobile").val();
					var username=$("#username").hasClass("hidden")?"":$("#loginname").val();
					var loginpwd=$("#loginpwd").val();
					var qmobilecode=$("#qmobilecode").val();
					$.jBox.tip("正在提交...","loading");
					$.ajax({
						url:"${ctx}/single/register",
						type:"post",
						data:{
							"phone":quickmobile,
							"username":username,
							"password":loginpwd,
							"code":qmobilecode,
							"codeType":"register"
						},
						success:function(data){
							$.jBox.closeTip();
							if(data.resultCode==0){
								location.href='${ctx}/single/registerOk${urlSuffix}';
							}else if(data.resultCode==7){
								$("#qmobilecodehint").addClass("hidden");
								$("#qmobilecodehint2").html("验证码错误，请检查");
								$("#qmobilecodehint2").removeClass("hidden");
								$.jBox.error(data.resultMessage,"错误",{"persistent":true});
							}else{
								$("#qmobilecodehint").addClass("hidden");
								$("#qmobilecodehint2").addClass("hidden");
								$.jBox.error(data.resultMessage,"错误",{"persistent":true});
							}
						},
						error:function(){
							$.jBox.closeTip();
							$.jBox.error("注册失败，未知错误","错误",{"persistent":true});
						}
					});
				}else{
					checkMobileformsg();
					checkpwd();
					checkConfPwd();
					checkMobileCodemsg();
					$.jBox.error("注册信息填写有误，请检查","错误",{"persistent":true});
				}
			/* }else{
				$.jBox.error("请同意《义乌市民卡账户服务协议》","错误",{"persistent":true});
			} */
		});
	});
</script>
</body>
</html>