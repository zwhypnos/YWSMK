<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>

<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/css/hangzhouka.css"/>
<script type="text/javascript">

function UnBund(){
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
	
	$.ajax({
        type: "POST",
        url: "${ctx}/single/licenseUnBund",
        data: {cardNo:'${cardNo}', appNo:appNo},
        dataType: "json",
        success: function(data){
        	data = data.info;
        	if(data == "unlogined"){
            	location.href = "${ctx}/single/login${urlSuffix}";
            }else if(data == "success"){
            	location.href = "${ctx}/single/licenseUnBundlingOK${urlSuffix}";
            }else{
            	$("#msg").html("*"+data);
            }
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
                           <li class="meibg"><a href="#">1<span>车牌解绑</span></a></li>
                           <li style=" width:66px;" class="huibg"><a href="#">2<span>解绑完成</span></a></li>
                        </ul>
                        <div class="clear"></div>
                     </div>
                     <div class="mar_k">
                     
                         <div class="zc_top">
                            <h2>车牌解绑</h2>
                            <!-- <a class="cole" href="#">我有账户，直接登录</a>  -->
                         </div> 
                         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="gap">
                       <tbody><tr>
                         <th width="40%" valign="top"><span class="">车牌号码：</span></th>
                         <td width="60%"> 
                         <div style=" float:left">
                                   <input class="inp_rt" type="text" name="appNo" id="appNo" title="请输入车牌号码" autocomplete="off" maxlength="7"  tabindex="1">
                         </div>
                         <div class="fdsg_a" id="appNo_tip"><span style="color:red;">*</span>请输入车牌号码</div>
                         </td>
                       </tr>
                         <tr>
                         <th width="40%" valign="top"><span class="">确认车牌号码：</span></th>
                         <td width="60%">
                             <div style=" float:left">
                                 <input type="text" name="appNo2" id="appNo2" class="inp_rt" value="" maxlength="7" tabindex="2" > &nbsp;
                             </div>
                             <div class="fdsg_a" id="appNo2_tip"><span style="color:red;">*</span>请再次输入车牌号码</div>
                         </td>
                       </tr>     
                       <tr>
                        <th valign="top"></th>
                        <td><input type="button" name="button" id="button" value="确认解绑" class="but_a span9 " onclick="UnBund();"><span style="color:red;padding-left:10px;" id="msg"></span></td>
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