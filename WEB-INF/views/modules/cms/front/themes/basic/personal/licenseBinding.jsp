<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>

<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/css/hangzhouka.css"/>
<style type="text/css">
.hidden{
	display: none;
}

.red{
	color: red;
}
</style>
<script type="text/javascript">
var idCardNoUtil = {
 /*省,直辖市代码表*/
 provinceAndCitys: {11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",
 31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",
 45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",
 65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"},
 
 /*每位加权因子*/
 powers: ["7","9","10","5","8","4","2","1","6","3","7","9","10","5","8","4","2"],
  
 /*第18位校检码*/
 parityBit: ["1","0","X","9","8","7","6","5","4","3","2"],
 
 /*性别*/
 genders: {male:"男",female:"女"},
 
 /*校验地址码*/
 checkAddressCode: function(addressCode){
   var check = /^[1-9]\d{5}$/.test(addressCode);
   if(!check) return false;
   if(idCardNoUtil.provinceAndCitys[parseInt(addressCode.substring(0,2))]){
    return true;
   }else{
    return false;
   }
 },
 
 /*校验日期码*/
 checkBirthDayCode: function(birDayCode){
   var check = /^[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))$/.test(birDayCode);
   if(!check) return false;  
   var yyyy = parseInt(birDayCode.substring(0,4),10);
   var mm = parseInt(birDayCode.substring(4,6),10);
   var dd = parseInt(birDayCode.substring(6),10);
  var xdata = new Date(yyyy,mm-1,dd);
  if(xdata > new Date()){
   return false;//生日不能大于当前日期
  }else if ( ( xdata.getFullYear() == yyyy ) && ( xdata.getMonth () == mm - 1 ) && ( xdata.getDate() == dd ) ){
   return true;
  }else{
   return false;
  }
 },
  
 /*计算校检码*/
 getParityBit: function(idCardNo){
  var id17 = idCardNo.substring(0,17);  
   /*加权 */
   var power = 0;
   for(var i=0;i<17;i++){
    power += parseInt(id17.charAt(i),10) * parseInt(idCardNoUtil.powers[i]);
   }       
   /*取模*/
   var mod = power % 11;
   return idCardNoUtil.parityBit[mod];
 },
  
 /*验证校检码*/
 checkParityBit: function(idCardNo){
   var parityBit = idCardNo.charAt(17).toUpperCase();
   if(idCardNoUtil.getParityBit(idCardNo) == parityBit){
     return true;
   }else{
     return false;
   }
 },
 
 /*校验15位或18位的身份证号码*/
 checkIdCardNo: function(idCardNo){
  //15位和18位身份证号码的基本校验
  var check = /^\d{15}|(\d{17}(\d|x|X))$/.test(idCardNo);
  if(!check) return false;
  //判断长度为15位或18位 
  if(idCardNo.length==15){
    return idCardNoUtil.check15IdCardNo(idCardNo);
  }else if(idCardNo.length==18){
    return idCardNoUtil.check18IdCardNo(idCardNo);
  }else{
    return false;
  }
 },
 
 //校验15位的身份证号码
 check15IdCardNo: function(idCardNo){
   //15位身份证号码的基本校验
   var check = /^[1-9]\d{7}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\d{3}$/.test(idCardNo);  
   if(!check) return false;
   //校验地址码
   var addressCode = idCardNo.substring(0,6);
   check = idCardNoUtil.checkAddressCode(addressCode);
   if(!check) return false;
   var birDayCode = '19' + idCardNo.substring(6,12);
   //校验日期码
   return idCardNoUtil.checkBirthDayCode(birDayCode);
 },
 
 //校验18位的身份证号码
 check18IdCardNo: function(idCardNo){
   //18位身份证号码的基本格式校验
   var check = /^[1-9]\d{5}[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\d{3}(\d|x|X)$/.test(idCardNo);
   if(!check) return false;
   //校验地址码
   var addressCode = idCardNo.substring(0,6);
   check = idCardNoUtil.checkAddressCode(addressCode);
   if(!check) return false;
   //校验日期码
   var birDayCode = idCardNo.substring(6,14);
   check = idCardNoUtil.checkBirthDayCode(birDayCode);
   if(!check) return false;
   //验证校检码  
   return idCardNoUtil.checkParityBit(idCardNo);  
 },
 
 formateDateCN: function(day){
    var yyyy =day.substring(0,4);
    var mm = day.substring(4,6);
    var dd = day.substring(6);
    return yyyy + '-' + mm +'-' + dd;
 },
 
 //获取信息
 getIdCardInfo: function(idCardNo){
   var idCardInfo = {
    gender:"",  //性别
    birthday:"" // 出生日期(yyyy-mm-dd)
   };
  if(idCardNo.length==15){
    var aday = '19' + idCardNo.substring(6,12);
    idCardInfo.birthday=idCardNoUtil.formateDateCN(aday);
    if(parseInt(idCardNo.charAt(14))%2==0){
      idCardInfo.gender=idCardNoUtil.genders.female;
    }else{
      idCardInfo.gender=idCardNoUtil.genders.male;
    }   
  }else if(idCardNo.length==18){
    var aday = idCardNo.substring(6,14);
    idCardInfo.birthday=idCardNoUtil.formateDateCN(aday);
     if(parseInt(idCardNo.charAt(16))%2==0){
      idCardInfo.gender=idCardNoUtil.genders.female;
    }else{
      idCardInfo.gender=idCardNoUtil.genders.male;
    } 
     
  }
  return idCardInfo;
 },
  
 /*18位转15位*/
 getId15: function(idCardNo){
  if(idCardNo.length==15){
    return idCardNo;
  }else if(idCardNo.length==18){
    return idCardNo.substring(0,6) + idCardNo.substring(8,17); 
  }else{
  return null;
  }
 },
  
 /*15位转18位*/
 getId18: function(idCardNo){
  if(idCardNo.length==15){
    var id17 = idCardNo.substring(0,6) + '19' + idCardNo.substring(6);
    var parityBit = idCardNoUtil.getParityBit(id17);
    return id17 + parityBit;
  }else if(idCardNo.length==18){
    return idCardNo;
  }else{
  return null;
  }
 }
};

function bind(){
	if(!$("#agreexy").is(":checked")){
		$("#checkbox_tip").html('<span style="color:red;">*请同意本协议</span>');
		return;
	}else{
		$("#checkbox_tip").html('');
	}
	
	var re=/^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/;
	var appNo = $("#appNo").val();
	if(appNo == ""){
		$("#appNo_tip").html('<span style="color:red;">*车牌号码不能为空</span>');
		return;
	}else if(appNo.search(re)==-1){
		$("#appNo_tip").html('<span style="color:red;">*输入的车牌号码格式不正确</span>');
		return;
	}else{
		$("#appNo_tip").html('<span style="color:green;">*格式正确</span>');
	}
	
	var appNo2 = $("#appNo2").val();
	if(appNo != appNo2){
		$("#appNo2_tip").html('<span style="color:red;">*两次输入的车牌号码不一致</span>');
		return;
	}else{
		$("#appNo2_tip").html('<span style="color:green;">*格式正确</span>');
	}
	
	var appNoExt = $("#appNoExt").val();
	if(appNoExt == ""){
		$("#appNoExt_tip").html('<span style="color:red;">*驾驶证号不能为空</span>');
		return;
	}else if(!idCardNoUtil.checkIdCardNo(appNoExt)){
		$("#appNoExt_tip").html('<span style="color:red;">*输入的驾驶证号格式不正确</span>');
		return;
	}else{
		$("#appNoExt_tip").html('<span style="color:green;">*格式正确</span>');
	}
	
	var appNoExt2 = $("#appNoExt2").val();
	if(appNoExt != appNoExt2){
		$("#appNoExt2_tip").html('<span style="color:red;">*两次输入的驾驶证号不一致</span>');
		return;
	}else{
		$("#appNoExt2_tip").html('<span style="color:green;">*格式正确</span>');
	}
	
	var qmobilecode=$("#qmobilecode").val();
	if(qmobilecode==null||qmobilecode==""){
		$("#qmobilecode_tip").html('<span style="color:red;">*请输入短信验证码</span>');
		return;
	}else{
		$("#qmobilecode_tip").html('<span style="color:red;">*</span>短信验证码为六位数字');
	}
	
	$.ajax({
        type: "POST",
        url: "${ctx}/single/licenseBind",
        data: {cardNo:'${cardNo}', appNo:appNo, appNoExt:appNoExt, codeType:'licenseBinding', code:qmobilecode},
        dataType: "json",
        success: function(data){
        	data = data.info;
        	if(data == "unlogined"){
            	location.href = "${ctx}/single/login${urlSuffix}";
            }else if(data == "success"){
            	location.href = "${ctx}/single/licenseBindingOK${urlSuffix}";
            }else{
            	$("#msg").html("*"+data);
            }
        }
    });
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
	$("#dxyzm").html("获取中...");
	$("#dxyzm").attr("onclick","");
	$.ajax({
		url:"${ctx}/single/getMobileCode",
		type:"post",
		async:false,
		data:{
			"codeType":"licenseBinding"
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
}

</script>
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
                           <li class="meibg"><a href="#">1<span>车牌绑定</span></a></li>
                           <li style=" width:66px;" class="huibg"><a href="#">2<span>绑定完成</span></a></li>
                        </ul>
                        <div class="clear"></div>
                     </div>
                     <div class="mar_k">
                     
                         <div class="zc_top">
                            <h2>车牌绑定</h2>
                            <!-- <a class="cole" href="#">我有账户，直接登录</a>  -->
                         </div> 
                         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="gap">
                       <tbody><tr>
                         <th width="40%" valign="top"><span class="">车牌号码：</span></th>
                         <td width="60%"> 
                         <div style=" float:left">
                                   <input class="inp_rt" type="text" name="appNo" id="appNo" title="请输入车牌号码" autocomplete="off" maxlength="7"  tabindex="1">
                         </div>
                         <div class="fdsg_a" id="appNo_tip"><span style="color:red;">*</span>请输入车牌号码，例：浙G12345</div>
                         </td>
                       </tr>
                       <tr>
                         <th width="40%" valign="top"><span class="">确认车牌号码：</span></th>
                         <td width="60%"> 
                         <div style=" float:left">
                                   <input class="inp_rt" type="text" name="appNo2" id="appNo2" title="请再次输入车牌号码" autocomplete="off" maxlength="7"  tabindex="2">
                         </div>
                         <div class="fdsg_a" id="appNo2_tip"><span style="color:red;">*</span>请再次输入车牌号码</div>
                         </td>
                       </tr>
                      
                       <tr id="username" >
                         <th width="40%" valign="top"><span class="">驾驶证号：</span></th>
                         <td width="60%">
                             <div style=" float:left">
                                 <input type="text" name="appNoExt" id="appNoExt" class="inp_rt" value="" maxlength="18" tabindex="3"> &nbsp;
                             </div>
                             <div class="fdsg_a" id="appNoExt_tip"><span style="color:red;">*</span>15位或18位驾驶证号</div>
                         </td>
                       </tr>
                         <tr>
                         <th width="40%" valign="top"><span class="">确认驾驶证号：</span></th>
                         <td width="60%">
                             <div style=" float:left">
                                 <input type="text" name="appNoExt2" id="appNoExt2" class="inp_rt" value="" maxlength="18" tabindex="4" > &nbsp;
                             </div>
                             <div class="fdsg_a" id="appNoExt2_tip"><span style="color:red;">*</span>请再次输入驾驶证号</div>
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
                                  <th width="34%"><span class="">&nbsp;</span></th>
                                  <td width="66%">
                                  <div style=" float:left"> 
                                        <input type="checkbox" id="agreexy" name="agreexy">
                                        同意<a style="color:#005f96;" href="${ctx}/single/cgxy${urlSuffix}" target="_blank">《义乌市停车场车牌绑定扣费协议》</a>
                                    </div>
                                    <div class="fdsg_e" id="checkbox_tip"></div>
                                    </td>
                                        </tr>
                       <tr>
                        <th valign="top"></th>
                        <td><input type="button" name="button" id="button" value="确认绑定" class="but_a span9 " onclick="bind();"><span style="color:red;padding-left:10px;" id="msg"></span></td>
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
</body>
</html>