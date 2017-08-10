<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

<link title="normal" href="${ctxStatic}/ywsmk/kindeditor/themes/default/default.css" rel="stylesheet" type="text/css" />
<link title="normal" href="${ctxStatic}/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link title="normal" href="${ctxStatic}/icheck/H-ui.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctxStatic}/ywsmk/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="${ctxStatic}/ywsmk/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${ctxStatic}/ywsmk/kindeditor/plugins/image/image.js"></script>
<script type="text/javascript" src="${ctxStatic}/ywsmk/kindeditor/plugins/link/link.js"></script>
<script type="text/javascript" src="${ctxStatic}/icheck/jquery.icheck.min.js"></script>


<!--本页所使用的CSS-->
<style>
.xml_hdsq{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_009.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #FFF;line-height: 50px;text-indent: 70px;}
.xml_hdsq_b{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_999.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #000;line-height: 50px;text-indent: 70px;
	border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #C6C6C6;}
.xml_hdsq_b:hover{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_009.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #FFF;line-height: 50px;text-indent: 70px;}

/***********input输入样式****************/
.inp_rt{ width:210px; padding:0 3px; height:30px; line-height:30px; border:1px solid #c1c1c1; background:none; text-align:left; font-size:14px; color:#666; background-color:#fff;}
.inp_rt:active{border:1px solid #6EC5FC;}

.inp_rts{ padding:0 3px;  float:left; border:1px solid #c1c1c1; background:none; text-align:left; font-size:14px; color:#666; background-color:#fff;}
.inp_rts:active{border:1px solid #6EC5FC;}
select.sel_rt{ width:218px; padding:0 1px; height:30px; line-height:30px; float:left; border:1px solid #c1c1c1; background: url(../images/jt.png) no-repeat 96% center; text-align:left; font-size:14px; color:#666; background-color:#fff; -webkit-appearance:none; }
/***********buttom样式****************/

.but_a{width:100px; height:40px; line-height:40px;  color:#fff; font-size:16px; background-color:#B092EE; border:none; text-align: center; cursor: pointer; font-family:"微软雅黑";
border-radius: 4px;    /*IE9 Firefox4 浏览器圆角边框*/
-webkit-border-radius: 4px; /*苹果谷歌浏览器 圆角边框*/    
-moz-border-radius: 4px;    /*火狐浏览器 圆角边框*/
position:relative;
  behavior: url(js/PIE.htc);}
.but_a:hover,.but_b:hover,.but_n:hover,.tab_b li a:hover,.but_jj:hover{  filter:alpha(opacity=80);
	-moz-opacity:0.8; -khtml-opacity: 0.8;opacity: 0.8;}
	
	.guanggao_minboxx{
		min-width: 970px;
	}
	
	a{
		color:#000;
	}
	.xfmx_xxbutt_hig a{text-decoration: underline;}
	#demo {
		color: #333;
		
		height: 50px;
		line-height: 50px;
		margin: 0;
		padding: 0;
		float: left;
		font-family: 'roboto';
		font-size: 14px;
		
		font-weight: 500;
	}
	p {
		margin: 0;
	}
	#startDate {
		margin: 0px auto;
		height: 32px;
		width: 140px;
		padding: 0 6px;
		border: 1px solid #ccc;
		outline: none;
	}
	#endDate {
		margin: 0px auto;
		height: 32px;
		width: 140px;
		padding: 0 6px;
		border: 1px solid #ccc;
		outline: none;
	}
	.msg{color:red;}
	
	.ywloginboy table tr .lmkaka table tr td {
	    line-height: inherit;
	}
	.docs-example:after{
		content: "网点列表";
	}
	.check-box{
		width:250px;
	}
	.docs-example {
	    margin: 0;
	}
</style>
<!--本页所使用的CSS-->
<script type="text/javascript">
$(document).ready(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});	
});

function Allchecked(){
	$('.skin-minimal input').iCheck('check');
}

function Allunchecked(){
	$('.skin-minimal input').iCheck('uncheck');
}

function validate(){
	var form = $("#inputForm");
	if($("#name").val()==""){
		$("#name_msg").html("&nbsp;&nbsp;*活动名称不能为空");
		return false;
	}
	var startDate=$("#startDate").val(); 
	var endDate=$("#endDate").val();
	if($("#startDate").val()==""||$("#endDate").val()==""){
		$("#date_msg").html("&nbsp;&nbsp;*开始结束时间不能为空");
		return false;
	}
    var start=new Date(startDate.replace("-", "/").replace("-", "/"));  
    var end=new Date(endDate.replace("-", "/").replace("-", "/"));  
    if(end<start){  
    	$("#date_msg").html("&nbsp;&nbsp;*起始时间不正确");
        return false;  
    } 
    
    if($("#id").val()!=""){
    	if(confirm("再次申请，请保证已经按审核未通过的原因进行修改")){
    	}else{
    		return false;
    	}
    }
    //form.submit();
}

function setImagePreview() { 
	var docObj=document.getElementById("image_url"); 
	var imgObjPreview=document.getElementById("preview"); 
	if(docObj.files && docObj.files[0]){ 
	//火狐下，直接设img属性 
	imgObjPreview.style.display = 'block'; 
	imgObjPreview.style.width = '86px'; 
	imgObjPreview.style.height = '86px'; 
	//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
	//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
	imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]); 
	}else{ 
	//IE下，使用滤镜 
	docObj.select(); 
	var imgSrc = document.selection.createRange().text; 
	var localImagId = document.getElementById("localImag"); 
	//必须设置初始大小 
	localImagId.style.width = "86px"; 
	localImagId.style.height = "86px"; 
	//图片异常的捕捉，防止用户修改后缀来伪造图片 
	try{ 
	localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc; 
	}catch(e){ 
	alert("您上传的图片格式不正确，请重新选择!"); 
	return false; 
	} 
	imgObjPreview.style.display = 'none'; 
	document.selection.empty(); 
	} 
	return true; 
} 
</script>
<script>
var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="content"]', {
		/* allowFileManager : true */
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : false,
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link']
	});
});
</script>
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
    <td> <div class="mbx">当前位置：首页&nbsp;〉&nbsp; 商户服务&nbsp;〉&nbsp;活动申请</div></td>
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
            <td><div class="xml_hdsq">活动申请</div></td>
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
	<form id="inputForm"  action="${ctx}/merchant/activityApplyTo" method="post" class="form-horizontal" enctype="multipart/form-data" onsubmit="return validate()">
       <input type="hidden" id="id" name="id" value="${activity.id }" />
       <table style="margin:30px;" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td>
            <table  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="100xp">活动名称：</td>
                <td width="500xp">  <input class="inp_rt" type="text" id="name" name="name" title="请输入活动名称" value="${activity.name }"><span id="name_msg" class="msg"></span></td>
              </tr>
              <tr>
                <td>活动时间：</td>
                <td><div id="demo">
                <input id="startDate" name="startDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate" value="<fmt:formatDate value="${activity.startDate }" pattern="yyyy-MM-dd"/>" placeholder="开始时间"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" />&nbsp;—&nbsp;<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate" value="<fmt:formatDate value="${activity.endDate }" pattern="yyyy-MM-dd"/>" placeholder="结束时间"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" />
                </div>
                <span id="date_msg" class="msg"></span>
              </tr>
              <tr>
                <td>活动图标：</td>
                <td>
                	<input type="file" id="image_url" name="image_url" onchange="javascript:setImagePreview();">
                	
                	<c:choose>
                	<c:when test="${not empty activity.image}">
                	<p></p>
                	<div id="localImag">
                	<img id="preview" width="-1" height="-1" style="display: block; width: 86px; height: 86px;" src="${activity.image }">
                	</div>
                	<p></p>
                	</c:when>
                	<c:otherwise>
                	<p><div id="localImag">
                	<img id="preview" width=-1 height=-1 style="diplay:none" />
                	</div></p>
                	</c:otherwise>
                	</c:choose>
                	
                </td>
              </tr>
              <tr>
                <td valign="top" >参加网点：</td>
                <td>
                	<div class="codeView docs-example">
					<div class="skin-minimal">
						<p><input type="button" value="全选" onclick="Allchecked()" class="btn btn-default" style="background-color: #0092df;">
						<input type="button" value="取消" onclick="Allunchecked()" class="btn btn-default"><p>
						<c:forEach items="${subMerchantList }" var="sub" varStatus="status">
						<div class="check-box">
							<input type="checkbox" id="checkbox-${status.index }" name="forMerchant" class="required"  value="${sub.id }">
							<label for="checkbox-${status.index }">${sub.name }</label>
						</div>
	                	</c:forEach>
					</div>
					</div>
                </td>
              </tr>
              <tr>
                <td valign="top" >活动简介：</td>
                <td>
                	<!-- <textarea id="content" class="inp_rts" cols="50" rows="10"></textarea> -->
                	<textarea id="content" name="content" style="width:500px;height:200px;visibility:hidden;display:block;">${activity.content }</textarea>
                </td>
              </tr>
              <c:if test="${activity.id ne null}">
           	 <tr>
              <td valign="top" >不通过原因：</td>
              <td>
              	<!-- <textarea id="content" class="inp_rts" cols="50" rows="10"></textarea> -->
              	<textarea id="remarks" name="remarks" class="inp_rts" style="width:495px;" cols="50" rows="5">${activity.remarks }</textarea>
              </td>
              </tr>
              </c:if>
              <tr>
                <td></td>
                <td>
                <input type="reset" name="button" id="resetButton" value="重置申请" class="but_a span6 " style="background-color: #e2e2e2;"> &nbsp;&nbsp;
                <input type="submit" name="button" id="submitButton" value="${activity.id ne null?'再次':'提交' }申请" class="but_a span6 mar_t15 "></td>
              </tr>
        </table>

    </td>
     </tr>
    
    </table>
 	</form>

    </td>
  </tr>
 
</table>


</div>
</div>
<!--市民卡服务-->
</body>

</html>