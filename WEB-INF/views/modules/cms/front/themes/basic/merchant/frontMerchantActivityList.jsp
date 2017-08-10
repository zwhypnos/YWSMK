<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>

<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<!-- 分页 -->
<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/pagination.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link title="normal" href="${ctxStatic}/common/jeesite.min.css" type="text/css" rel="stylesheet" />
<!-- 分页 -->

<!--本页所使用的CSS-->
<style type="text/css">
body{
    font-family: "微软雅黑";
    font-size: 14px;
}
.xml_hdsq{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_009.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #FFF;line-height: 50px;text-indent: 70px;}
.xml_hdsq_b{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_999.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #000;line-height: 50px;text-indent: 70px;
	border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #C6C6C6;}
.xml_hdsq_b:hover{background-image: url(${ctxStatic}/ywsmk/images/xiangmulian_009.jpg);background-repeat: no-repeat;background-size: 100%100%;
	width: 280px;;height: 50px;font-size: 14px;font-weight: bold;color: #FFF;line-height: 50px;text-indent: 70px;}
ul, ol, li {
	list-style: none;
	padding: 0;
	margin: 0;
}
.guanggao_minboxx{
		min-width: 970px;
	}
#demo {
	color: #333;
	width: 310px;
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
#beginAuditDate {
	margin: 0px auto;
	height: 28px;
	width: 85px;
	padding: 0 6px;
	border: 1px solid #ccc;
	outline: none;
}
#endAuditDate {
	margin: 0px auto;
	height: 28px;
	width: 85px;
	padding: 0 6px;
	border: 1px solid #ccc;
	outline: none;
}

.xfmx_xxbutt_hig {
    width: 170px;
}

</style>
<!--本页所使用的CSS-->
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

function weekormonth(type){
	var mydata = new Date();
	var endTime = mydata.format('yyyy-MM-dd');
	
	var startTime = "";
	if(type == "week"){
		startTime = (new Date(mydata.getTime()-6*24*60*60*1000)).format('yyyy-MM-dd');
	}else{
		startTime = (new Date(mydata.getTime()-30*24*60*60*1000)).format('yyyy-MM-dd');
	}
	$("#beginAuditDate").val(startTime);
	$("#endAuditDate").val(endTime);
	
	$("#searchForm").submit();
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
    <td> <div class="mbx">当前位置：首页&nbsp;〉&nbsp; 商户服务&nbsp;〉&nbsp;活动列表</div></td>
  </tr>
  <tr>
    <td class="lmkaka">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td> <div class="xml_jbxx_b" onclick="location.href='${ctx }/merchant/baseInfo${urlSuffix}'">基本信息</div></td>
          </tr>
          <c:if test="${not empty merchant_user and empty merchant_user.fId }">
          	<tr>
            <td><div class="xml_xxmx">活动列表</div></td>
            </tr>
           <tr>
            <td><div class="xml_hdsq_b" onclick="location.href='${ctx }/merchant/activityApply${urlSuffix}'">活动申请</div></td>
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
    <table class="" width="100%" style="margin:0px;" border="0" cellspacing="0" cellpadding="0"> 
 	  <tr>
   		 <td > 
   		 <form id="searchForm" modelAttribute="cmsMerchantActivity" action="${ctx}/merchant/activityList${urlSuffix}" method="post" class="breadcrumb form-search">
     		<div class="xfmx_cx_box">
        		<div class="xc_zhh">审核状态： 
                <select id="auditState" name="auditState" class="ui-select"  style="width:120px; padding-right:0px; height:30px;">
						<option selected value="">所有</option>
						<option value="0" ${cmsMerchantActivity.auditState eq '0'?'selected':'' }>未审核</option>
						<option value="1" ${cmsMerchantActivity.auditState eq '1'?'selected':'' }>通过</option>
						<option value="2" ${cmsMerchantActivity.auditState eq '2'?'selected':'' }>未通过</option>
					</select>
                </div>
                <div id="demo">
                审核时间：<input id="beginAuditDate" name="beginAuditDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate" value="<fmt:formatDate value="${cmsMerchantActivity.beginAuditDate}" pattern="yyyy-MM-dd"/>" placeholder="开始时间"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" />&nbsp;—&nbsp;<input id="endAuditDate" name="endAuditDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate" value="<fmt:formatDate value="${cmsMerchantActivity.endAuditDate}" pattern="yyyy-MM-dd"/>" placeholder="结束时间"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" />
                </div>
                <div class="xfmx_xxbutt_hig">
                 &nbsp;&nbsp;&nbsp; <input id="mxcx" class="but_a span6" style="height: 40px;width: 60px;" name="" type="submit" onclick=""  value="查询" /> &nbsp;&nbsp;
                 <a id="mx_week" href="javascript:weekormonth('week');">一周</a> &nbsp;&nbsp;<a id="mx_month" href="javascript:weekormonth('month');">一月</a></div>
         	</div>
         	</form>
     	 </td>
      </tr>
      
      <tr>
   		 <td > 
     		<table class="xfmx_tb_box" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr class="xfmx_tb_top">
                <td>活动名称</td>
                <td>活动时间</td>
                <td>审核状态</td>
                <td>审核时间</td>
                <td>操作</td>
              </tr>
              <c:forEach items="${page.list}" var="activity">
              <tr class="data">
                <td style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;max-width:280px;">${activity.name }</td>
                <td><fmt:formatDate value="${activity.startDate }" pattern="yyyy-MM-dd"/> 至 <fmt:formatDate value="${activity.endDate }" pattern="yyyy-MM-dd"/></td>
                <td><c:if test="${activity.auditState eq '0' }"><span style="color:yellow;">未审核</span></c:if><c:if test="${activity.auditState eq '1' }"><span style="color:green">通过</span></c:if><c:if test="${activity.auditState eq '2' }"><span style="color:red">未通过</span></c:if></td>
                <td><fmt:formatDate value="${activity.auditDate }" pattern="yyyy-MM-dd"/></td>
                <td><a href="${ctx }/merchant/activityInfo${urlSuffix}?id=${activity.id}" style="text-decoration:underline;">查看详情</a></td>
              </tr>
              </c:forEach>
            </table>

     	 </td>
      </tr>
       <tr>
   		 <td > 
        	<div class="pagination" style="float: right;">${page}</div>
				<script type="text/javascript">
					function page(n,s){
						var auditState = $("#auditState").val();
						var beginAuditDate = $("#beginAuditDate").val();
						var endAuditDate = $("#endAuditDate").val();
						var action = "${ctx }/merchant/activityList${urlSuffix}?pageNo="+n+"&pageSize="+s;
						var form = $('<form></form>');
						form.attr('action', action);  
					    form.attr('method', 'post');
					    form.attr('target', '_self');
					    var auditState_input = $('<input type="text" name="auditState" />');  
					    auditState_input.attr('value', auditState);
					    var beginAuditDate_input = $('<input type="text" name="beginAuditDate" />');  
					    beginAuditDate_input.attr('value', beginAuditDate);
					    var endAuditDate_input = $('<input type="text" name="endAuditDate" />');  
					    endAuditDate_input.attr('value', endAuditDate);
					    form.append(auditState_input);
					    form.append(beginAuditDate_input);
					    form.append(endAuditDate_input);
					    form.submit();
					}
				</script>
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