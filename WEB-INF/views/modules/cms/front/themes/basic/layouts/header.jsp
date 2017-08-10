<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!--头部-->
<div class="theme_back">
<div class="top_bar">
<div id="switch" style="float:right;position: relative;width:70px;height:31px;">
<img class="switch" src="${ctxStatic}/ywsmk/ywsmk_files/switch.png" />
<div id="switch_options" class="switch_options">
  <a id="white" style="background-color: #F0F0F0" >白色</a>
  <!-- <a id="red" style="background-color: #FF0000" >红色</a> -->
  <a id="default" style="background-color: #1380c1" >经典</a>
  <a id="lightblue" style="background-color: #90c5e7" >淡蓝</a>
  <!-- <a id="brown" style="background-color: #601f00" >棕色</a> -->
  <!-- <a id="brown" style="background-color: #FF0000" >红色</a> -->
</div>
</div>
<script type="text/javascript">
$(function(){
	$.ajax({
        type: "POST",
        url: "${ctx}/validateLogin",
        data: {},
        dataType: "json",
        success: function(data){
                    if(data.result == "0"){
                    	$("#"+data.type+"name").html(data.name);
                    	$("#"+data.type+"login").css("display","block"); 
                    }else{
                    	$("#unlogin").css("display","block");
                    }
                 }
    });
});

function exit(){
	$.ajax({
        type: "POST",
        url: "${ctx}/exit",
        data: {},
        dataType: "json",
        success: function(data){
                    if(data == "0"){
                    	location.reload();
                    }
                 }
    });
}
</script>
  <div class="top_box">
    <div class="top_l">您好！欢迎您来到义乌市民卡网上服务厅！</div>
    <div id="singlelogin" class="top_r" style="padding-top:0;display:none;">
    	<div class="topcontent">
		     <div class="top_righta">
		       <a class="bgtop1 tc" onclick="javascript:exit()">退出登录</a>
		       <div class="bgtop2" ><div style="width: 180px;"><a href="${ctx }/single/personal-lnye${urlSuffix}" id="singlename" ></a>，您好！</div></div>
		     </div>
		  </div>
    </div>
    <div id="merchantlogin" class="top_r" style="padding-top:0;display:none;">
    	<div class="topcontent">
		     <div class="top_righta">
		       <a class="bgtop1 tc" onclick="javascript:exit()">退出登录</a>
		       <div class="bgtop2" ><div style="width: 230px;"><a href="${ctx }/merchant/baseInfo${urlSuffix}" id="merchantname"></a>，您好！</div></div>
		     </div>
		  </div>
    </div>
    <div id="unlogin" class="top_r" style="display:none;"> 
         <a style="text-decoration:underline;" href="${ctx}/single/login${urlSuffix}">个人用户登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	 <a style="text-decoration:underline;" href="${ctx}/merchant/login${urlSuffix}">联盟商户登录</a>
    </div>
  </div>
</div>
<div class="logo_box">
  <div class="logo">
    <a href="${ctx }/"><img src="${ctxStatic}/ywsmk/ywsmk_files/logo.png"></a>
  </div>
  <div style="float:right;padding-top: 31px;width:220px;">
  	<form method="post" action="/search.html">
      <div class="search_box">
        <input id="title" name="title" type="text" value="全站搜索" onclick="javascript:{if(this.value==&quot;全站搜索&quot;){this.value=&quot;&quot;}}" onfocus="javascript:{if(this.value==&quot;全站搜索&quot;){this.value=&quot;&quot;}}" onblur="javascript:{if(this.value==&quot;&quot;){this.value=&quot;全站搜索&quot;}}" class="search_text">
        <input type="submit" value="" class="search_btn">
      </div>
    </form>
  </div>
  <div style="float:right;height: 73px;padding-top: 28px;padding-right: 30px;"><img src="${ctxStatic}/ywsmk/ywsmk_files/logo2.png" style="width:200px;"></div>
</div>
</div>
<!--头部-->