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
var timer = 3;
$(function(){
Countdown();
});

function Countdown(){
if (timer >= 1) {
        timer -= 1;
        setTimeout(function() {
        	$("#countdown").html(timer);
            Countdown();
        }, 1000);
    }else{
    location.href = "${ctx}/merchant/login${urlSuffix}";
    }
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
        <!--标题 -->
       
        <!--标题 -->
        <!--结果-->
        <div class="main_ch">
            <div class="content">
              <div class="bz_a pad_t30">
                   <ul>
                      <li class="huibg"><a href="#">1<span>修改密码</span></a></li>
                      <li style=" width:66px;" class="meibg"><a href="#">2<span>修改完成</span></a></li>
                   </ul>
                   <div class="clear"></div>
                </div>
                <div class="mar_k">
                    <div class="zc_top">
                       <h2>修改密码</h2>
                      
                    </div> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="gap">
                  <tbody><tr>
                    <th width="42%" valign="top"><img class="ogre" src="${ctxStatic}/ywsmk/images/yes.png"></th>
                    <td width="58%"> 
                    <h2>修改密码成功，</h2>   
                   <span id="countdown" style="color: red; font-weight: bold; font-size: 20px;">3</span>
                            <span style="font-size:20px;font-weight:bold;color:#ADADAD">秒后将重新登录</span>
                        <br><input type="button" name="button" id="button" value="立即前往" class="but_a span6 mar_t15 " onclick="location.href = '${ctx}/merchant/login${urlSuffix}'">
                    </td>
                  </tr>
                </tbody></table>
              
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