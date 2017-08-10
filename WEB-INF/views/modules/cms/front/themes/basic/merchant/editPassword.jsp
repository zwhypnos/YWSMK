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
               <!--结果-->
               <div class="main_ch">
                 <div class="content">
                   <div class="bz_a pad_t30">
                        <ul>
                           <li class="meibg"><a href="#">1<span>修改密码</span></a></li>
                           <li style=" width:66px;" class="huibg"><a href="#">2<span>修改完成</span></a></li>
                        </ul>
                        <div class="clear"></div>
                     </div>
                     <div class="mar_k">
                     
                         <div class="zc_top">
                            <h2>修改密码</h2>
                            <!-- <a class="cole" href="#">我有账户，直接登录</a>  -->
                         </div> 
                         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="gap">
                       <tbody>
                         <tr>
                           <th><span class="">新密码：</span></th>
                           <td>
                           <div style=" float:left">
                                   <input  class="inp_rt" 
                                   type="password"  name="loginpwd" id="loginpwd" onblur="checkpwd()" maxlength="20" tabindex="3" />
                                   <p id="loginpwdhint" class="red hidden">请按要求输入密码！</p>
                         </div>
                             <div class="fdsg_a" id="loginpwd_ytip"><span style="color:red;">*</span>用于登录联盟商户，8-20位数字、字母的组合</div>
                           </td>
                         </tr>
                         <tr>
                         <th width="40%"><span class="">确认新密码：</span></th>
                         <td width="60%">
                         <div style=" float:left">
                         <input  class="inp_rt" 
                                      type="password"  name="newloginpwd2" id="newloginpwd2" value="" onblur="checkConfPwd()" maxlength="20" tabindex="4" />
                                      <p id="newloginpwd2hint" class="red hidden">两次输入的密码不一致！</p>
                         </div>
                         <div class="fdsg_a" id="newloginpwd2_ytip"><span style="color:red;">*</span>请再次输入新密码</div>
                          </td> 
                       </tr>
                         <tr>
                               <th width="34%"><span class="">&nbsp;</span></th>
                               <td width="66%">
                               <div style=" float:left"> 
                                     <input type="checkbox" checked="checked" id="agreexy" name="agreexy">
                                     同意<a style="color:#005f96;" href="" target="_blank">《义乌市民卡账户服务协议》</a>
                                 </div>
                                 <div class="fdsg_e" id="checkbox_tip" style="display:none"></div>
                                 </td>
                                     </tr>   
                                <tr>
                                 <th valign="top"></th>
                                 <td><input type="button" name="button" id="button" value="确认修改" class="but_a span9 " <%-- onclick="location.href='${ctx}/single/editPasswordOk${urlSuffix}'" --%>></td>
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
var loginpwdReg=new RegExp("^[0-9a-zA-Z]{8,20}$");

function validatePwd(){
	var loginpwd=$("#loginpwd").val();
	return loginpwdReg.test(loginpwd);
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

$(function(){
	$("#button").on("click",function(){
		if($("#agreexy").attr("checked")){
			if(validatePwd()&&validateConfPwd()){
				var loginpwd=$("#loginpwd").val();
				$.jBox.tip("正在提交...","loading");
				$.ajax({
					url:"${ctx}/merchant/editPassword",
					type:"post",
					data:{
						"password":loginpwd,
					},
					success:function(data){
						$.jBox.closeTip();
						if(data.resultCode==0){
							location.href='${ctx}/merchant/editPasswordOk${urlSuffix}';
						}else if(data.resultCode==8){
							location.href = "${ctx}/merchant/login${urlSuffix}";
						}else{
							$.jBox.error(data.resultMessage,"错误",{"persistent":true});
						}
					},
					error:function(){
						$.jBox.closeTip();
						$.jBox.error("修改密码失败，未知错误","错误",{"persistent":true});
					}
				});
			}else{
				checkpwd();
				checkConfPwd();
				$.jBox.error("修改密码信息填写有误，请检查","错误",{"persistent":true});
			}
		}else{
			$.jBox.error("请同意《义乌市民卡账户服务协议》","错误",{"persistent":true});
		}
	});
});
</script>
</body>
</html>