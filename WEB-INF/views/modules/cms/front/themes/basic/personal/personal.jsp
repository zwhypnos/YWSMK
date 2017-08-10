<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<!-- 卡片 -->
<link title="normal" href="${ctxStatic}/ywsmk/SpryAssets/SpryAsset.css" rel="stylesheet" type="text/css" />
<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/ywsmk/css/hangzhouka.css"/>
<!-- 分页 -->
<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/pagination.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link title="normal" href="${ctxStatic}/common/jeesite.min.css" type="text/css" rel="stylesheet" />
<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/jquery-jbox/2.3/Skins/Blue/jbox.css"/>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>
<style type="text/css">
	.guanggao_minboxx{
		min-width: 970px;
	}
	a{
		color:#000;
	}
	.xfmx_xxbutt_hig a{text-decoration: underline;}
	#demo {
		color: #333;
		width: 280px;
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
	#dt {
		margin: 0px auto;
		height: 28px;
		width: 80px;
		padding: 0 6px;
		border: 1px solid #ccc;
		outline: none;
	}
	#ds {
		margin: 0px auto;
		height: 28px;
		width: 80px;
		padding: 0 6px;
		border: 1px solid #ccc;
		outline: none;
	}
	
	/*只有IE11识别*/
@media screen and(-ms-high-contrast:active),(-ms-high-contrast:none) {
.tishi_tu_r{padding-left:5px; padding-right:5px; padding-top:20px; width:22px;  float:left;}
.tishi_text_r{padding:10px; float: left; }
}
/*只有谷歌识别*/
@media screen and (-webkit-min-device-pixel-ratio:0) {
.tishi_tu_r{padding-left:5px; padding-right:5px; padding-top:20px; width:22px;  float:left;}
.tishi_text_r{padding:10px; float: left; }
}
/*只有火狐识别*/
@-moz-document url-prefix() {
.tishi_tu_r{padding-left:5px; padding-right:5px; padding-top:20px; width:22px;  float:left;}
.tishi_text_r{padding:10px; float: left; }
}
	.daxiao_100{
		width: 60px;
		height: 30px;
		line-height: 20px;
		border-radius: 5px;
		padding: 5px;
		border: solid 1px #a3a4a6;
	}
	
	.daxiao_100:focus{
		border-radius: 5px;
		padding: 5px;
		border: solid 1px #00CCFF;
	}
	
	.tishi_tu_r{padding-left:5px; padding-right:5px;  width:22px;  float:left;}
.tishi_text_r{padding-left:5px; padding-right:5px; float: left; }
	
	.bank-empty{
		float: left;
		width: 100px;
		height: 30px;
		line-height: 30px;
		display: block;
		border: 1px solid #DDDEDE;
		margin: 0 -1px -1px 0;
		padding: 2px;
		position: relative;
		z-index: 0;
		cursor: pointer;
		text-align: center;
	}
	
	.bank-empty:hover{
		float: left;
		width: 100px;
		height: 30px;
		line-height: 30px;
		display: block;
		border: 1px solid #A5C85B;
		margin: 0 0 -1px 0;
		padding: 2px;
		position: relative;
		z-index: 0;
		cursor: pointer;
		text-align: center;
	}
	
	.ico_yh_nx{
		background: url("${ctxStatic}/ywsmk/images/yh_nx_18.png") no-repeat;
		background-size: 100% 100%;
		display: inline-block;
		height: 18px;
		margin-right: 1px;
		line-height: 999px;
		overflow: hidden;
		width: 18px;
		position: relative;
		vertical-align: -3px;
	}
	
	.ico_yh_cz{
		background: url("${ctxStatic}/ywsmk/images/yh_cz_18.png") no-repeat;
		background-size: 100% 100%;
		display: inline-block;
		height: 18px;
		margin-right: 1px;
		line-height: 999px;
		overflow: hidden;
		width: 18px;
		position: relative;
		vertical-align: -3px;
	}
	
	.ico_yh_zfb{
		background: url("${ctxStatic}/ywsmk/images/yh_zfb_hb_18.png") no-repeat;
		background-size: 100% 100%;
		display: inline-block;
		height: 18px;
		margin-right: 1px;
		line-height: 999px;
		overflow: hidden;
		width: 18px;
		position: relative;
		vertical-align: -3px;
	}
	
	.ico_yh_yl{
		background: url("${ctxStatic}/ywsmk/images/yh_yl_18.png") no-repeat;
		background-size: 100% 100%;
		display: inline-block;
		height: 18px;
		margin-right: 1px;
		line-height: 999px;
		overflow: hidden;
		width: 18px;
		position: relative;
		vertical-align: -3px;
	}
	
	#xml_zxcz td{
		padding: 0;
	}
	
	/* blue */ 
.blue { 
color: #d9eef7; 
border: solid 1px #0076a3; 
background: #0095cd; 
background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#0078a5)); 
background: -moz-linear-gradient(top, #00adee, #0078a5); 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5'); 
} 
.blue:hover { 
background: #007ead; 
background: -webkit-gradient(linear, left top, left bottom, from(#00678e), to(#00678e)); 
background: -moz-linear-gradient(top, #0095cc, #00678e); 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e'); 
} 
.blue:active { 
color: #80bed6; 
background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#00adee)); 
background: -moz-linear-gradient(top, #0078a5, #00adee); 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee'); 
} 
/* button */

.gs_box {width: 440px;height: 280px;border-radius: 10px;border: solid 1px #BDBDBD;background: #EDEDED;}
.gs_kb {width: 400px;height: 220px;border-radius: 5px;border: solid 2px #B8B8B8;background: #ffffff;
	margin-left: auto;margin-right: auto;margin-top: 10px;padding: 10px;font-family: "微软雅黑";}
.gs_kh{font-size: 22px;color: #666666;margin-top: 10px; text-align:center; margin-top:20px;}
.gs_but {text-align:right;padding:10px;border-top-width: 1px;border-top-style: dashed;border-top-color: #CCC;
	font-size: 22px;color: #666666;margin-top: 60px;}
.gs_yzm{ float:left; width:200px; line-height:30px;margin-top:14px;}
.yzm_put {width: 80px;height: 30px;line-height: 20px;padding: 5px;border:solid 1px #a3a4a6;  float:left; }
.mages_top_10{margin-top:0px; margin-left:5px;}

.hidden{
	display: none;
}
</style>
<script type="text/javascript">
Date.prototype.format =function(format)
{
    var o = {
    "M+" : this.getMonth()+1, //month
	"d+" : this.getDate(),    //day
	"h+" : this.getHours(),   //hour
	"m+" : this.getMinutes(), //minute
	"s+" : this.getSeconds(), //second
	"q+" : Math.floor((this.getMonth()+3)/3),  //quarter
	"S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
    (this.getFullYear()+"").substr(4- RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
    format = format.replace(RegExp.$1,
    RegExp.$1.length==1? o[k] :
    ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}

$(function(){
var mydata = new Date();
var endTime = mydata.format('yyyy-MM-dd');
var startTime = (new Date(mydata.getTime()-6*24*60*60*1000)).format('yyyy-MM-dd');
$("#dt").val(startTime);
$("#ds").val(endTime);
	
var startOption = 'xml_${type}';

$("#menu tr td div").each(function(i){
	$(this).attr("class",$(this).attr("class").replace("_b","")+"_b");
});
$("."+startOption+"_b").attr("class",startOption);
$("#contents>table").each(function(i){
$(this).css("display","none");
});
if(startOption == "xml_hlht" || startOption == "xml_zqsz"){
	$("#"+startOption).css("display","table");
}else{
	$("#"+startOption).css("display","block");
}
$("#option").html($("."+startOption).html());

$("#menu tr td div").click(function(){
	if('${cmsUser.card}' == '0'){
		if($(this).attr("class")!='xml_smrz_b'&&$(this).attr("class")!='xml_zqsz_b'&&$(this).attr("class")!='xml_smrz'&&$(this).attr("class")!='xml_zqsz'){
			alert("对不起！您还没有进行实名绑卡，不能查看该信息，请先绑卡");
			return;
		}
	}
	
	if($("#state").val()!='1'){
		if($(this).attr("class")!='xml_smrz_b'&&$(this).attr("class")!='xml_zqsz_b'&&$(this).attr("class")!='xml_jbxx_b'&&$(this).attr("class")!='xml_smrz'&&$(this).attr("class")!='xml_zqsz'&&$(this).attr("class")!='xml_jbxx'){
			alert("对不起！您的市民卡已挂失，请在解挂后再使用该功能");
			return;
		}
	}
$("#bindingCard").css("display","none");
var option = $(this).attr("class");

$("#menu tr td div").each(function(i){
	$(this).attr("class",$(this).attr("class").replace("_b","")+"_b");
});
$(this).attr("class",option.replace("_b",""));
$("#contents>table").each(function(i){
$(this).css("display","none");
});
if(option.replace("_b","") == "xml_hlht" || option.replace("_b","") == "xml_zqsz"){
	$("#"+option.replace("_b","")).css("display","table");
}else{
	$("#"+option.replace("_b","")).css("display","block");
}

$("#option").html($(this).html());
});
});

function toBinding(){
$("#xml_smrz").css("display","none");
$("#bindingCard").css("display","block");
}

var timer = 3;
function Countdown(){
if (timer >= 1) {
        timer -= 1;
        setTimeout(function() {
        	$("#countdown").html(timer);
            Countdown();
        }, 1000);
    }else{
    	location.reload();
    }
}

function isBinding(){
	$.ajax({
        type: "POST",
        url: "${ctx}/single/bindCard",
        data: {phone:$("#phone").val(), idcard:$("#idcard").val()},
        dataType: "json",
        success: function(data){
                    if(data == "0"){
                    	$("#bind_msg").css("display","table-row");
                    }else if(data == "unlogined"){
                    	location.href = "${ctx}/single/login.html";
                    }else{
                    	$("#bindingCard").css("display","none");
                    	$("#xml_smrz_ok").css("display","block");
                    	Countdown();
                    }
                 }
    });
}

function gotoBinding(){
	var option = 'xml_smrz_b';
	$("#menu tr td div").each(function(i){
		$(this).attr("class",$(this).attr("class").replace("_b","")+"_b");
	});
	
	$(".xml_smrz_b").attr("class","xml_smrz");
	$("#contents>table").each(function(i){
	$(this).css("display","none");
	});
	$("#xml_smrz").css("display","block");

	$("#option").html('实名绑卡');
	
	$("html,body").animate({scrollTop: $("#contents").offset().top}, 300);
}
var accKindMap={"01":"小钱包","02":"大钱包","11":"自行车押金"};
var trStateMap={"0":"正常","1":"撤销","2":"冲正","3":"退货","9":"灰记录"};
function cardInfo(cardNo,pageNo,state){
	$("#state").val(state);
	if(state == "1"){
		$.ajax({
	        type: "POST",
	        url: "${ctx}/single/cardInfo",
	        data: {cardNo: cardNo,accKind: $("#accKind").val(),startDate: $("#dt").val(),endDate: $("#ds").val(),pageNo: pageNo},
	        dataType: "json",
	        success: function(data){
	        			//console.log(data);
	        			//卡内余额
	                    $("#bigBal").html(data.bigBal);
	                    $("#smallBal").html(data.smallBal);
	                    //当前大钱包最大可充值金额
	                    var curr_amt=0;
	                    if(data==null||data.bigBal==null||data.bigBal==""||isNaN(data.bigBal)){
	                    	curr_amt=0;
	                    }else{
	                    	curr_amt=Number(data.bigBal);
	                    }
	                    $("#curr_max_amt").val(5000-curr_amt);
	                    //交易明细
	                    $(".xfmx_tb_box .data").remove();
	                    var deal = data.dealDetailList;
	                    if(deal == ""){
	                    	$(".xfmx_tb_box").append('<tr class="data"><td colspan="7">暂无明细！</td></tr>');
	                    }else{
	                    	for(var i=0;i<deal.length;i++){
		                    	$(".xfmx_tb_box").append('<tr class="data"><td>'+deal[i].trDate.substring(0,19)+'</td><td>'+accKindMap[deal[i].accKind]+'</td><td>'+deal[i].trCodeName+'</td><td>'+deal[i].amt+'</td><td>'+deal[i].acptName+'</td><td>'+trStateMap[deal[i].trState]+'</td></tr>');
		                    }
	                    }
	                    var pageTotal = Math.ceil(data.totCount/10);
	                    pageNo = pageNo-0+1;
	                    var pagination =  '<ul>';
	                    if(pageNo == 1){
	                    	pagination += '<li ><a href="javascript:">首页</a></li><li ><a href="javascript:" >上一页</a></li>';
	                    }else{
	                    	pagination += '<li ><a href="javascript:turn(\''+cardNo+'\',\'0\');">首页</a></li><li ><a href="javascript:turn(\''+cardNo+'\',\''+(pageNo-2)+'\');" >上一页</a></li>';
	                    }
	                    
	                    if(pageTotal == 0 || pageNo == pageTotal){
	                    	pagination += '<li><a href="javascript:">下一页</a></li><li ><a href="javascript:">尾页</a></li>';
	                    }else{
	                    	pagination += '<li><a href="javascript:turn(\''+cardNo+'\',\''+pageNo+'\');">下一页</a></li><li ><a href="javascript:turn(\''+cardNo+'\',\''+(pageTotal-1)+'\');">尾页</a></li>';
	                    }
	                    
	                    pagination += '<li class="controls"><a href="javascript:">当前第 '+pageNo+' 页，共 '+pageTotal+' 页 '+data.totCount+' 条记录</a></li>';
	                    var options = '';
	                    for(var i=1;i<=pageTotal;i++){
	                    	if(i==pageNo){
	                    		options += '<option value="'+i+'" selected="true">'+i+'</option>';
	                    	}else{
	                    		options += '<option value="'+i+'">'+i+'</option>'
	                    	}
	                    }
	                    pagination += '<li class="controls"><a href="javascript:" style="padding:0 12px;"><select id="pageno" style="width: 40px;font-size:14px;padding:5px 0;">'+options+'</select></a></li>';
	                    pagination += '<li ><a href="javascript:GO();" style="border-left-width: 1px;">GO</a></li></ul>';
	                    $(".pagination").html(pagination);
	                    
	                    $("#mxcx").attr("onclick","turn('"+cardNo+"','0')");
	                    $("#mx_week").attr("href","javascript:weekormonth('week','"+cardNo+"')");
	                    $("#mx_month").attr("href","javascript:weekormonth('month','"+cardNo+"')");
	                    
	                    //便民服务
	                    $("#bmfw_title").html("义乌市民卡-卡号："+cardNo);
	                    
	                    if(data.card.bicycleState == "0"){
	                    	$("#bicycleState").html('<img src="${ctxStatic}/ywsmk/images/yes_hint.png" width="15" height="15" /><span class="blacker_text">已开通</span>');
	                    }else{
	                    	$("#bicycleState").html('<img src="${ctxStatic}/ywsmk/images/no_hint.png" width="15" height="15" /><span class="blacker_text">未开通</span>');
	                    }
	                    if(data.card.interState == "0"){
	                    	$("#interState").html('<img src="${ctxStatic}/ywsmk/images/yes_hint.png" width="15" height="15" /><span class="blacker_text">已开通</span>');
	                    }else{
	                    	$("#interState").html('<img src="${ctxStatic}/ywsmk/images/no_hint.png" width="15" height="15" /><span class="blacker_text">未开通</span>');
	                    }
	                    if(data.card.parkState == "0"){
	                    	var appNo=data.card.appNo;
	                    	var appNos=appNo.split("|");
	                    	if(appNos.length==1){
	                    		$("#parkState,#parkState2").parent().removeClass("hidden");
		                    	$("#parkState3").parent().addClass("hidden");
		                    	$("#parkState").html('<img src="${ctxStatic}/ywsmk/images/yes_hint.png" width="15" height="15" /><span class="blacker_text">已绑定（'+appNos[0]+'）</span>');
		                    	$("#license_oper").html('<a href="${ctx}/single/licenseUnBundling-'+cardNo+'${urlSuffix}"><span class="blacker_text">解绑</span></a>');
		                    	$("#parkState2").html('<img src="${ctxStatic}/ywsmk/images/no_hint.png" width="15" height="15" /><span class="blacker_text">未绑定</span>');
		                    	$("#license_oper2").html('<a href="${ctx}/single/licenseBinding-'+cardNo+'${urlSuffix}"><span class="blacker_text">绑定</span></a>');
	                    	}else if(appNos.length==2){
	                    		$("#parkState,#parkState2,#parkState3").parent().removeClass("hidden");
	                    		$("#parkState").html('<img src="${ctxStatic}/ywsmk/images/yes_hint.png" width="15" height="15" /><span class="blacker_text">已绑定（'+appNos[0]+'）</span>');
		                    	$("#license_oper").html('<a href="${ctx}/single/licenseUnBundling-'+cardNo+'${urlSuffix}"><span class="blacker_text">解绑</span></a>');
		                    	$("#parkState2").html('<img src="${ctxStatic}/ywsmk/images/yes_hint.png" width="15" height="15" /><span class="blacker_text">已绑定（'+appNos[1]+'）</span>');
		                    	$("#license_oper2").html('<a href="${ctx}/single/licenseUnBundling-'+cardNo+'${urlSuffix}"><span class="blacker_text">解绑</span></a>');
		                    	$("#parkState3").html('<img src="${ctxStatic}/ywsmk/images/no_hint.png" width="15" height="15" /><span class="blacker_text">未绑定</span>');
		                    	$("#license_oper3").html('<a href="${ctx}/single/licenseBinding-'+cardNo+'${urlSuffix}"><span class="blacker_text">绑定</span></a>');
	                    	}else if(appNos.length==3){
	                    		$("#parkState,#parkState2,#parkState3").parent().removeClass("hidden");
	                    		$("#parkState").html('<img src="${ctxStatic}/ywsmk/images/yes_hint.png" width="15" height="15" /><span class="blacker_text">已绑定（'+appNos[0]+'）</span>');
		                    	$("#license_oper").html('<a href="${ctx}/single/licenseUnBundling-'+cardNo+'${urlSuffix}"><span class="blacker_text">解绑</span></a>');
		                    	$("#parkState2").html('<img src="${ctxStatic}/ywsmk/images/yes_hint.png" width="15" height="15" /><span class="blacker_text">已绑定（'+appNos[1]+'）</span>');
		                    	$("#license_oper2").html('<a href="${ctx}/single/licenseUnBundling-'+cardNo+'${urlSuffix}"><span class="blacker_text">解绑</span></a>');
		                    	$("#parkState2").html('<img src="${ctxStatic}/ywsmk/images/yes_hint.png" width="15" height="15" /><span class="blacker_text">已绑定（'+appNos[2]+'）</span>');
		                    	$("#license_oper2").html('<a href="${ctx}/single/licenseUnBundling-'+cardNo+'${urlSuffix}"><span class="blacker_text">解绑</span></a>');
	                    	}
	                    }else{
	                    	$("#parkState").parent().removeClass("hidden");
	                    	$("#parkState2,#parkState3").parent().addClass("hidden");
	                    	$("#parkState").html('<img src="${ctxStatic}/ywsmk/images/no_hint.png" width="15" height="15" /><span class="blacker_text">未绑定</span>');
	                    	$("#license_oper").html('<a href="${ctx}/single/licenseBinding-'+cardNo+'${urlSuffix}"><span class="blacker_text">绑定</span></a>');
	                    }
	                    
	                    switch(data.card.busType){
	                    case "01":
	                    	$("#busType").html("普通卡");
	                    	break;
	                    case "10":
	                    	$("#busType").html("学生卡");
	                    	break;
	                    case "11":
	                    	$("#busType").html("高龄卡");
	                    	break;
	                    case "20":
	                    	$("#busType").html("老年卡");
	                    	break;
	                    default:
	                    	$("#busType").html("未知");
	                    	break;	
	                    }
	                    
	                    //挂失
	                    $(".gs_kh").html("卡号："+cardNo);
	                    $("#gs_btn").attr("onclick","lost('"+cardNo+"')");
	                    $.jBox.closeTip();
	                 }
	    });
	}
}

function turn(cardNo,pageNo){
	$.ajax({
        type: "POST",
        url: "${ctx}/single/turn",
        data: {cardNo: cardNo,accKind: $("#accKind").val(),startDate: $("#dt").val(),endDate: $("#ds").val(),pageNo: pageNo},
        dataType: "json",
        success: function(data){
        			//console.log(data);
                    $(".xfmx_tb_box .data").remove();
                    var deal = data.dealDetailList;
                    for(var i=0;i<deal.length;i++){
                    	$(".xfmx_tb_box").append('<tr class="data"><td>'+deal[i].trDate.substring(0,19)+'</td><td>'+accKindMap[deal[i].accKind]+'</td><td>'+deal[i].trCodeName+'</td><td>'+deal[i].accBalBef+'</td><td>'+deal[i].amt+'</td><td>'+deal[i].acptName+'</td><td>'+trStateMap[deal[i].trState]+'</td></tr>');
                    }
                    var pageTotal = Math.ceil(data.totCount/10);
                    pageNo = pageNo-0+1;
                    var pagination =  '<ul>';
                    if(pageNo == 1){
                    	pagination += '<li ><a href="javascript:">首页</a></li><li ><a href="javascript:" >上一页</a></li>';
                    }else{
                    	pagination += '<li ><a href="javascript:turn(\''+cardNo+'\',\'0\');">首页</a></li><li ><a href="javascript:turn(\''+cardNo+'\',\''+(pageNo-2)+'\');" >上一页</a></li>';
                    }
                    
                    if(pageTotal == 0 || pageNo == pageTotal){
                    	pagination += '<li><a href="javascript:">下一页</a></li><li ><a href="javascript:">尾页</a></li>';
                    }else{
                    	pagination += '<li><a href="javascript:turn(\''+cardNo+'\',\''+pageNo+'\');">下一页</a></li><li ><a href="javascript:turn(\''+cardNo+'\',\''+(pageTotal-1)+'\');">尾页</a></li>';
                    }
                    
                    pagination += '<li class="controls"><a href="javascript:">当前第 '+pageNo+' 页，共 '+pageTotal+' 页 '+data.totCount+' 条记录</a></li>';
                    var options = '';
                    for(var i=1;i<=pageTotal;i++){
                    	if(i==pageNo){
                    		options += '<option value="'+i+'" selected="true">'+i+'</option>';
                    	}else{
                    		options += '<option value="'+i+'">'+i+'</option>'
                    	}
                    }
                    pagination += '<li class="controls"><a href="javascript:" style="padding:0 12px;"><select id="pageno" style="width: 40px;font-size:14px;padding:5px 0;">'+options+'</select></a></li>';
                    pagination += '<li ><a href="javascript:GO(\''+cardNo+'\');" style="border-left-width: 1px;">GO</a></li></ul>';
                    $(".pagination").html(pagination);
                 }
    });
}

function GO(cardNo){
	var pageNo = $("#pageno").val()-1;
	turn(cardNo,pageNo);
}

function weekormonth(type,cardNo){
	var mydata = new Date();
	var endTime = mydata.format('yyyy-MM-dd');
	var startTime = "";
	if(type == "week"){
		startTime = (new Date(mydata.getTime()-6*24*60*60*1000)).format('yyyy-MM-dd');
	}else{
		startTime = (new Date(mydata.getTime()-30*24*60*60*1000)).format('yyyy-MM-dd');
	}
	$("#dt").val(startTime);
	$("#ds").val(endTime);
	
	turn(cardNo,'0');
}

function lost(cardNo){
	var validate=$("#validate").val();
	if(validate==null||validate==""||validate=="请输入验证码"){
		alert("请输入验证码");
		return;
	}else{
		$.ajax({
			url:"${pageContext.request.contextPath}/servlet/validateCodeServlet",
			type:"get",
			dataType:"text",//防止firefox解析成html
			cache:false,
			data:{
				"validateCode":validate
			},
			success:function(data){
				if(data=="true"){
					if(confirm("是否挂失卡号为"+cardNo+"的市民卡？")){
						location.href = "${ctx}/single/lost?cardNo="+cardNo+"&validate="+validate;
					}
				}else{
					alert("验证码错误!");
				}
			}
		});
	}
}

function unbundling(){
	if(confirm("是否解除账号与市民卡的绑定？")){
		location.href = "${ctx}/single/unbundling";
	}
}

var moneyReg=new RegExp("^[1-9][0-9]*$");
$(function(){
	$("#gotopay").on("click",function(){
		var cardId=$("#cardId").val();
		var orderAmt=$("#orderAmt").val();
		var curr_max_amt=$("#curr_max_amt").val();
		if(cardId==null||cardId==""){
			alert("请输入卡号");
			return;
		}
		if(orderAmt==null||orderAmt==""){
			alert("请输入充值金额");
			return;
		}
		if(!moneyReg.test(orderAmt)){
			alert("请输入正确的金额");
			return;
		}
		if(Number(orderAmt)<50){
			$("#pay_tip").css("display","block");
			return;
		}else{
			$("#pay_tip").css("display","none");
		}
		if(Number(orderAmt)>Number(curr_max_amt)){
			alert("账户最大余额为5000元，您目前最多可充值"+curr_max_amt+"元");
			return;
		}
		
		if($("input[name=paybank]:checked").val()==undefined){
			alert("请选择一个支付机构");
			return;
		}
		
		if($("#RadioGroup1_1").attr("checked")){
			window.location.href="${pageContext.request.contextPath}/czcb/pay?cardId="+cardId+"&orderAmt="+orderAmt;
			return;
		}
		
		if($("#RadioGroup1_0").attr("checked")){
			window.location.href="${pageContext.request.contextPath}/nxcb/pay?cardId="+cardId+"&transAmt="+orderAmt;
			return;
		}
		
		if($("#RadioGroup1_2").attr("checked")){
			window.location.href="${pageContext.request.contextPath}/alipay/pay?cardId="+cardId+"&totalFee="+orderAmt;
			return;
		}
		
		if($("#RadioGroup1_3").attr("checked")){
			window.location.href="${pageContext.request.contextPath}/unionpay/pay?cardId="+cardId+"&transAmt="+orderAmt;
			return;
		}
	});
});

function setPayCardId(cardId){
	$("#cardId").val(cardId);
}
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
 <span class="xiawuhao_xinming">&nbsp;${cmsUser.username }&nbsp;</span> 
 <span class="huanyingdaolai">,&nbsp;欢迎你来到个人中心！</span></div>
 <div class="shenfenzheng">身&nbsp;&nbsp;份&nbsp;&nbsp;证：${cmsUser.idcard }</div>
<div class="shangcidenglu">本次登录：<fmt:formatDate value="${cmsUser.cuLoginDate }" type="both" pattern="yyyy-MM-dd hh:mm:ss" />  上次登录：<fmt:formatDate value="${cmsUser.preLoginDate }" type="both" pattern="yyyy-MM-dd hh:mm:ss" /> </div>
</div>
</div>
</div>
<!--欢迎-->
<!--卡余额-->

<div class="guanggao_boxx">
<div class="yve_bigbox">
<iframe  style="width:100%; margin-left:auto; margin-right:auto; height:350px;" 
	scrolling="no"  frameborder="0" name="cardFrame"  src="${ctx}/single/card.html"></iframe>
</div>
</div>
<!--卡余额-->


<!--市民卡服务-->
<div class="ywloginboy">
<div class="guanggao_minboxx">
<input type="hidden" id="state" value="" />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="280px"><div class="smkbt">市民卡服务</div></td>
    <td> <div class="mbx">当前位置：<a href="${ctx}/index-${site.id}${urlSuffix}">首页</a>&nbsp;〉&nbsp; <%-- <a href="${ctx}/single/personal-jbxx${urlSuffix}">市民卡服务</a>&nbsp;〉&nbsp; --%><span id="option">基本信息</span></div></td>
  </tr>
  <tr>
    <td class="lmkaka">
     <table id="menu" width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td> <div class="xml_jbxx">个人信息</div></td>
          </tr>
            <tr>
            <td><div class="xml_lnye_b">卡内余额</div></td>
            </tr>
           <tr>
            <td><div class="xml_xxmx_b">交易明细</div></td>
            </tr>
            <tr>
            <td><div class="xml_zxcz_b">在线充值</div></td>
            </tr>
           <tr>
            <td><div class="xml_hlht_b">便民服务</div></td>
            </tr>
             <tr>
            <td><div class="xml_zqsz_b">安全设置</div></td>
            </tr>
            <tr>
            <td><div class="xml_smrz_b">实名绑卡</div></td>
            </tr>
            <tr>
            <td><div class="xml_gs_b">在线挂失</div></td>
            </tr>
	 </table>
	</td>
<td id="contents" class="lmkaka">
    <table id="xml_jbxx" style="margin:30px;" border="0" cellspacing="0" cellpadding="0">
 	 <tr>
    
   		 <td width="111px;"> 
     		 <img src="${ctxStatic}/ywsmk/images/touxiang_03.png" width="111" height="111" />
     	 </td>
     	 <td width="300px;"> 
             <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                 <tr>
            	    <td width="100px;" align="right" ><strong> 
                    身份证：
                    </strong></td>
                    <td> 
                    <span class="red"><c:if test="${not empty cmsUser.idcard and fn:length(cmsUser.idcard) eq 18 }">${fn:substring(cmsUser.idcard,0,12) }******</c:if></span>
                    </td>
                 </tr>
                  <tr>
            	    <td align="right"><strong> 
                    姓名：
                    </strong></td>
                    <td> 
                    ${cmsUser.name }
                    </td>
                 </tr>
                  <tr>
            	    <td align="right"><strong> 
                    手机号：
                    </strong></td>
                    <td> 
                    <span style="float:left"><c:if test="${not empty cmsUser.phone and fn:length(cmsUser.phone) eq 11 }">${fn:substring(cmsUser.phone,0,3) }****${fn:substring(cmsUser.phone,7,11) }</c:if></span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </td>
                 </tr>
            
              </table>
       </td>
      </tr>
    </table>

    <table id="xml_lnye" width="100%" style="margin:50px 0px 0px 10px;display:none;" border="0" cellspacing="0" cellpadding="0">
 	 <tr>
    
   		 <td > 
     		<div class="knye_bigmoney_bigbox">
           		<div class="knye_bigmoney_smallbox">
           			<div class="knye_bigmoney_tx">
       				  <img src="${ctxStatic}/ywsmk/images/touxiang_03.png" width="80" height="80"/><span>&nbsp;&nbsp;&nbsp;&nbsp;${cmsUser.name }</span> </div> 
                    <div class="knye_bigmoney_yvetext">
           				大钱包余额：&nbsp;<span class="dahong_yuan" id="bigBal">0.00</span> &nbsp;元
            		</div> 
            	</div> 
                <!-- <div class="but_recharge">
                <input class="button_recharge white" name="" type="submit" value="立即充值" />
                </div> -->
            </div> 
     	 </td>
     	 <td > 
           <div class="knye_bigmoney_bigbox">
           		<div class="knye_bigmoney_smallbox">
           			<div class="knye_bigmoney_tx">
       				  <img src="${ctxStatic}/ywsmk/images/touxiang_03.png" width="80" height="80" /><span>&nbsp;&nbsp;&nbsp;&nbsp;${cmsUser.name }</span> </div> 
                    <div class="knye_bigmoney_yvetext">
           				小钱包余额：&nbsp;<span class="dahong_yuan" id="smallBal">0.00</span> &nbsp;元
            		</div> 
            	</div> 
                <!-- <div class="but_recharge">
                <input class="button_recharge white" name="" type="submit" value="立即充值" />
                </div> -->
            </div> 
       </td>
      </tr>
      <tr>
      	<td>
      	<div class="wxtsh_n brd_tdashed" id="wxtsh_n">
                <h2>温馨提示：</h2>
               		<p>小钱包余额非实时显示</p>
	            
	            <div class=" clear"></div>
             </div>
      	</td>
      </tr>
    </table>

	<table id="xml_xxmx" width="100%" style="margin:0px;display:none;" border="0" cellspacing="0" cellpadding="0">
 	  <tr>
   		 <td > 
     		<div class="xfmx_cx_box">
        		<div class="xc_zhh">账户号： 
                <select id="accKind" name="drop1" class="ui-select"  style="width:120px; padding-right:0px; height:30px;">
						<option selected value="">所有</option>
						<option value="02">大钱包</option>
						<option value="01">小钱包</option>
					</select>
                </div>
                <div id="demo">
                日期：<input id="dt" name="" type="text" readonly="readonly" maxlength="20" class="input-small Wdate" value="" placeholder="开始时间"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" />&nbsp;—&nbsp;<input id="ds" name="" type="text" readonly="readonly" maxlength="20" class="input-small Wdate" value="" placeholder="结束时间"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" />
                </div>
                <div class="xfmx_xxbutt_hig">
                 &nbsp;&nbsp;&nbsp; <input id="mxcx" class="but_a span6" style="height: 40px;width: 70px;" name="" type="button" onclick=""  value="查询" /> &nbsp;&nbsp;
                 <a id="mx_week">一周</a> &nbsp;&nbsp;<a id="mx_month">一月</a></div>
         	</div>
     	 </td>
      </tr>
      <tr>
   		 <td > 
     		<table class="xfmx_tb_box" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr class="xfmx_tb_top">
                <td>交易时间</td>
                <td>账户类型</td>
                <td>交易名称</td>
                <td>交易金额</td>
                <td>受理点</td>
                <td>交易状态</td>
              </tr>
            </table>
     	 </td>
      </tr>
       <tr>
   		 <td > 
        <!--分页 -->
		<div class="pagination" style="float: right;">
		
		</div>
        <!--分页 -->
     	 </td>
      </tr>
      <tr>
      <td>
      <div class="wxtsh_n brd_tdashed" >
           <h2>温馨提示：</h2>
          		<p>1.小钱包金额不是实时数据。</p>
        
        	<p id="pwdp" name="pwdp" style="display: block;">2. 如果控件没有正常显示，请手动刷新页面或重启浏览器。</p>
        
        </div> 
      </td>
      </tr>
    </table>
    <table id="xml_zxcz" style="margin:30px;display:none;" border="0" cellspacing="0" cellpadding="0">
 	 <tr>
   		 <tr class="lmkaka">
    <td width="150px" style="text-align: right;color:#000;">充值卡号：</td>
    <td width="255px"> <img src="${ctxStatic}/ywsmk/images/hongxintishi.jpg" width="11" height="10" />  
        <input class="daxiao" name="name" id="cardId" type="text" style="color:#999999" readonly="readonly"/>
        </td>
    <td>
    <%-- <div class="tishi_tu"><img src="${ctxStatic}/ywsmk/images/tishi033.png" width="22" height="23" /> </div>
    <div class="tishi_text">请输入充值卡号，并确认。</div> --%></td>
  </tr>
   
      <tr>
    <td style="text-align: right; color:#000;">充值金额：</td>
    <td > <img src="${ctxStatic}/ywsmk/images/hongxintishi.jpg" width="11" height="10" />
           <input name="name" id="orderAmt" type="text" class="daxiao_100" placeholder="充值金额" style="color:#999999" size="20" />
           <input type="hidden" id="curr_max_amt" value="5000">
           <span style="font-size:20px;"> ￥</span>&nbsp;
           <div id="pay_tip" style="position: absolute;display: none"><p style="position: relative;top: -20px;color: red;font-weight: bold;">&nbsp;&nbsp;&nbsp;充值金额最低为50元!</p></div>
    </td>
    <td>
        <div class="tishi_tu_r"><img src="${ctxStatic}/ywsmk/images/tishi033.png" width="22" height="23" /> </div>
        <div class="tishi_text_r">必须是纯数字</div>
    </td>
  </tr>
      <tr>
  
    <td style="text-align: right; color:#000;">选择银行：</td>
    <td colspan="2"> 
           
             <p>
               <!-- <label class="bank-empty">
                 <input type="radio" name="RadioGroup1" value="1" id="RadioGroup1_0" />
               <i class="ico_yh_nx"></i>浙江农信</label> -->
                 
               <label class="bank-empty">
                 <input type="radio" name="paybank" value="2" id="RadioGroup1_1" />
                   <i class="ico_yh_cz"></i> 稠州银行</label>
                   
               <label class="bank-empty">
                 <input type="radio" name="paybank" value="1" id="RadioGroup1_0"/>
               <i class="ico_yh_nx"></i>浙江农信</label>
               
               <label class="bank-empty">
                 <input type="radio" name="paybank" value="3" id="RadioGroup1_2"/>
               <i class="ico_yh_zfb"></i>支付宝</label>
               
               <label class="bank-empty">
                 <input type="radio" name="paybank" value="4" id="RadioGroup1_3"/>
               <i class="ico_yh_yl"></i>银联支付</label>
              
             </p>
         
           </td>
      
  
      
    
  </tr>
     
      <tr>
        <td>&nbsp;</td>
        <td> <input class="button_recharge blue" name="" id="gotopay" type="submit" value="确认充值" />&nbsp;&nbsp; 
        </td>
        <td>&nbsp;</td>
      </tr>
      
      <tr>
      	<td colspan="4">
      	<div class="wxtsh_n brd_tdashed">
                <h2>温馨提示：</h2>
               		<p>1.市民卡充值当前仅支持大钱包。</p><br />
               		<p>2.当前仅稠州银行能够充值。</p><br />
               		<p>3.首次充值请先查看<a href="${ctx }/single/paySteps.html" target="_blank" style="color: red;font-size: 1.6em">《充值步骤》</a></p>
	            
	            <div class=" clear"></div>
             </div>
      	</td>
      </tr>
      </tr>
    
    </table>

    <table id="xml_hlht" class="fwka_bmfwcx" width="100%" style="margin:0px 0px 0px 0px;display:none;" border="0" cellspacing="0" cellpadding="0">
 	  <tr>
   		 <td colspan="3" style="text-align: left;font-weight: bold;" id="bmfw_title">
   		 	义乌市民卡-卡号：
   		 </td>
      </tr> 
 	  <tr>
   		 <td > 
     		<span class="blacker_text">自行车服务</span>
     	 </td>
          <td id="bicycleState"> 
     		
     	 </td>
          <td > 
     		<a href="${ctx }/bicycle${urlSuffix}" target="_blank"><span class="blacker_text">（地图站点查看）</span></a>
     	 </td>
      </tr>
       <tr>
   		 <td > 
     		<span class="blacker_text">	互联互通</span>
     	 </td>
          <td id="interState"> 
     		 </td>
          <td > 
     		
     	 </td>
      </tr>
       <tr>
   		 <td > 
     		<span class="blacker_text">车牌绑定</span>
     	 </td>
          <td id="parkState"> 
     		
     	 </td>
          <td id="license_oper"> 
     		
     	 </td>
      </tr>
      <tr class="hidden">
   		 <td > 
     		<span class="blacker_text"></span>
     	 </td>
          <td id="parkState2"> 
     		
     	 </td>
          <td id="license_oper2"> 
     		
     	 </td>
      </tr>
      <tr class="hidden">
   		 <td > 
     		<span class="blacker_text"></span>
     	 </td>
          <td id="parkState3"> 
     		
     	 </td>
          <td id="license_oper3"> 
     		
     	 </td>
      </tr>
      <tr>
   		 <td > 
     		<span class="blacker_text">卡子类型</span>
     	 </td>
          <td> 
     		<span class="blacker_text" id="busType"></span>
     	 </td>
     	 <td > 
     		
     	 </td>
      </tr>
      <tr>
      	<td colspan="3" style="border-bottom-width: 0px;">
      	<div class="wxtsh_n brd_tdashed" id="wxtsh_n">
                <h2>温馨提示：</h2>
               		<p>车牌绑定功能与自行车服务功能必须为同一张卡</p>
	            
	            <div class=" clear"></div>
             </div>
      	</td>
      </tr>
    </table>

	<table id="xml_zqsz" class="fwka_bmfwcx" width="100%" style="margin:30px 0px 0px 0px;display:none;" border="0" cellspacing="0" cellpadding="0">
 	  <!-- <tr>
   		 <td width="20%" > 
     		<span class="blacker_text">交易密码</span>
     	 </td>
          <td > 
     		<a><span class="red">修改</span></a>
     	 </td>
          <td width="50%"></td>
      </tr> -->
       <tr>
   		 <td > 
     		<span class="blacker_text">登录密码</span>
     	 </td>
          <td > 
     		<a href="${ctx }/single/editPassword${urlSuffix}"><span class="red">修改</span></a>
          </td>
      	 <td ></td>
      </tr>
    </table>
	<c:if test="${cmsUser.card eq '0'}">
	<table id="xml_smrz" style=" background-color:#fff;display:none;" width="100%" border="0" cellspacing="0" cellpadding="0" class="gap mar_tno">
		<tbody>
		<tr>
			<td><div class="h100"></div></td>
		</tr>
		<tr>
				  <th width="32%" valign="top" style=" padding:0;"><img class="ogre" src="${ctxStatic}/ywsmk/images/error.png"></th>
				  <td width="68%"> 
				  <h2>
					未实名绑卡。 
				  </h2> 
				  <span style="font-size:18px; color:#95bd56; font-weight:bold; font-family:微软雅黑 ">实名绑卡后可获得更高级别的应用和更安全的保护。</span>
				  <br>
				  <input type="button" name="button" id="button" value="马上去绑卡" class="but_a span6 mar_t15" onclick="toBinding()">
				  </td>
				</tr>   
				<tr>
					<td><div class="h100"></div></td>
				</tr>
				</tbody>
		</table> 
		<table id="xml_smrz_ok" style=" background-color:#fff;display:none;" width="100%" border="0" cellspacing="0" cellpadding="0" class="gap mar_tno">
		<tbody>
		<tr>
			<td><div class="h100"></div></td>
		</tr>
		<tr>
			  <th width="32%" valign="top" style=" padding:0;"><img class="ogre" src="${ctxStatic}/ywsmk/images/yes.png"></th>
              <td width="68%"> 
              <h2>
              	实名绑卡成功。 
              </h2> 
              <span style="font-size:18px; color:#95bd56; font-weight:bold; font-family:微软雅黑 ">实名绑卡后可获得更高级别的应用和更安全的保护。</span>
              <br>
              <input type="button" name="button" id="button" value="立即刷新" class="but_a span6 mar_t15" onclick="location.reload()">
              <span id="countdown" style="color: red; font-weight: bold; font-size: 20px;">3</span>
                                            <span style="font-size:20px;font-weight:bold;color:#ADADAD">秒自动刷新</span>
              </td>
				</tr>   
				<tr>
					<td><div class="h100"></div></td>
				</tr>
				</tbody>
		</table>
	</c:if>
	<c:if test="${cmsUser.card eq '1'}">
	<table id="xml_smrz" style=" background-color:#fff;display:none;" width="100%" border="0" cellspacing="0" cellpadding="0" class="gap mar_tno">
		<tbody>
		<tr>
			<td><div class="h100"></div></td>
		</tr>
		<tr>
			  <th width="32%" valign="top" style=" padding:0;"><img class="ogre" src="${ctxStatic}/ywsmk/images/yes.png"></th>
              <td width="68%"> 
              <h2>
              	已实名绑卡。 
              </h2> 
              <span style="font-size:18px; color:#95bd56; font-weight:bold; font-family:微软雅黑 ">实名绑卡后可获得更高级别的应用和更安全的保护。</span>
              <br>
              <!-- <input type="button" name="button" id="button" value="解除绑定" class="but_a span6 mar_t15" onclick="unbundling()"> -->
              </td>
				</tr>   
				<tr>
					<td><div class="h100"></div></td>
				</tr>
				</tbody>
		</table> 
	</c:if>
	<div id="bindingCard" style="display:none;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="gap mar_tno">
          <tbody><tr>
            <td class="pad_no" colspan="2"><div class="orm">身份信息 &nbsp;&nbsp;&nbsp;<span class=" txt_12 col_9">请填写本人真实身份信息</span></div></td>
            </tr>
          <tr>
            <th width="22%"><span class="">手机号码：</span></th>
            <td width="78%"> 
            <input class="inp_rt" type="text" name="phone" id="phone" onkeyup="value=value.replace(/\s/g,'')" title="请输入手机号" value="${cmsUser.phone }" autocomplete="off" >
            <div class="fdsg_e" id="idnumber_tip" style="none"></div>
            </td>
          </tr>
            <tr>
              <th><span class="">身份证号：</span></th>
              <td><input class="inp_rt" type="text" name="idcard" id="idcard" maxlength="18" style="text-transform:uppercase;" autocomplete="off" onblur="checkIdNumber();" value="">
              <div class="fdsg_a" id="idnumber_msg">15位或18位身份证号</div>

              </td>
            </tr> 
            <tr style="display:none;" id="bind_msg">
            	<td colspan="2">
            	<span style="color:red;margin-left:60px;">未查询到人员信息，请仔细检查或到市民卡服务网点修改预留手机号码！</span>
            	</td>
            </tr>
            </tbody>
            </table>
             
              <div class="buttom_h brd_t">
         	<input type="button" name="button" id="button" value="完成" class="but_a span7 mar_r20" onclick="isBinding();" >
            <div class="clear"></div>
            </div>
            
            <div class="wxtsh_n brd_tdashed" id="wxtsh_n">
                <h2>温馨提示：</h2>
               		<p>1. 您需填写真实身份信息以获得更高支付安全保障。</p>
	            
	            	<p id="pwdp" name="pwdp" style="display: block;">2. 实名绑卡只能绑定一次，请认真填写。</p>
	            
	            <div class=" clear"></div>
             </div>
	</div>
	<table id="xml_gs" width="100%"style="margin:30px 0px 0px 30px;" border="0" cellspacing="0" cellpadding="0">
 	 <tr>
   		 <td > 
         <div class="gs_box">
        	 <div class="gs_kb">
                 <div class="gs_kh">
                 	卡号：
                 </div>
                 <div class="gs_but">
                 	<div class="gs_yzm">
	                 <input class="yzm_put" id="validate" name="validate" type="text" placeholder="请输入验证码" value="请输入验证码" onfocus="if(value==defaultValue){value='';this.style.color='#000'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}" style="color: rgb(153, 153, 153);">
	                 <a href="javascript:void(0);" onclick="javascript:$(this).children().attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+Math.random());"><img class="mages_top_10" src="${pageContext.request.contextPath}/servlet/validateCodeServlet" width="96" height="40" /></a>
	                 </div>
                 	<input class="button_recharge white" id="gs_btn" name="" onclick="" type="button" value="挂失" style="font-size: 22px;width:120px;height:60px;" />
                 </div>
             </div>
          <div>   
     	 </td>
      </tr>
    </table>
    </td>
  </tr>

</table>


</div>
</div>
<!--市民卡服务-->

</body>
</html>