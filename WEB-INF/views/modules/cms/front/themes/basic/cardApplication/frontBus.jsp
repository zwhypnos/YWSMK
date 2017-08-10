<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>
<!-- 卡片 --> 
<link title="normal" href="${ctxStatic}/ywsmk/SpryAssets/SpryAsset.css" rel="stylesheet" type="text/css" />
<!-- 分页 -->
<link title="normal" href="${ctxStatic}/ywsmk/ywsmk_files/pagination.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link title="normal" href="${ctxStatic}/common/jeesite.min.css" type="text/css" rel="stylesheet" />
<!-- 分页 -->

<style type="text/css">
.ywloginboy table tr table tr td{padding: 5px;height: 50px;line-height: 50px;background-position: center center;}
.ywloginboy table tr table .data td{padding: 5px;height: 15px;line-height: 15px;background-position: center center;border-right: solid 1px #E2E3E3;}
.xfmx_tb_box {border-right-width: 0px;}
.xfmx_tb_top{border-right: solid 1px #E2E3E3;}
</style>


</head>
<body>



<!--图片广告-->
<div class="guanggao_boxx">
<div class="guanggao_minboxx">
<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" /> 
</div>
</div>
<!--图片广告-->

<!--新闻公告-->
           <div class="ywloginboy">
<div class="guanggao_minboxx">

<div class="Main_page">
<!--标题-->
<div class="Foxpro_title01">
  <div class="Foxpro_title01_txt01">
    <div class="Foxpro_title01_txt02">公交线路查询</div>
  </div>
</div>
<!--标题-->
<!--搜索条件-->
<form id="searchForm" modelAttribute="cmsBus" action="${ctx}/busline${urlSuffix}" method="post">
<div class="NetSearch">
  <div class="SearchTxt">
    <table width="921" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr>
        <td width="80">线路名称：</td>
        <td width="187"><input id="loadName" name="loadName" type=	"text" class="text" placeholder="" value="${cmsBus.loadName }"></td>
        <td width="60">起点站：</td>
        <td width="187"><input id="startSite" name="startSite" type="text" class="text" placeholder="" value="${cmsBus.startSite }"></td>
        <td width="60">终点站：</td>
        <td width="187"><input id="endSite" name="endSite" type="text" class="text" placeholder="" value="${cmsBus.endSite }"></td>
        <td width="100"><input id="btnSearch" type="submit" class="btn" value="搜 索"></td>
      </tr>
    </tbody></table>
  </div>
</div>
</form>
<!--搜索条件-->
<!--结果标题-->
<div class="result_title" style="height: 0;">
</div>
<!--结果标题-->
<table class="" width="100%" style="margin:0px;" border="0" cellspacing="0" cellpadding="0">
<tr>
<td > 
	<table class="xfmx_tb_box" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr class="xfmx_tb_top">
          <td>线路名称</td>
          <td>起点</td>
          <td>终点</td>
          <td>起点首末班车时间</td>
          <td>终点首末班车时间</td>
          <td>发车间隔</td>
          <td>途径站点</td>
        </tr>
        <c:forEach items="${page.list}" var="line">
        <tr class="data">
        <td style="width:8%"><a href="${ctx }/busline-${line.id}${urlSuffix}" target="_blank" style="text-decoration:underline;">${line.loadName }</a></td>
        <td style="width:9%">${line.startSite }</td>
        <td style="width:9%">${line.endSite }</td>
        <td style="width:13%">${line.startTimes }</td>
        <td style="width:13%">${line.endTimes }</td>
        <td style="width:8%">${line.interval }</td>
        <td style="width:40%">${line.pathwaySite }</td>
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
		var loadName = $("#loadName").val();
		var startSite = $("#startSite").val();
		var endSite = $("#endSite").val();
		var action = "${ctx }/busline${urlSuffix}?pageNo="+n+"&pageSize="+s;
		var form = $('<form></form>');
		form.attr('action', action);  
	    form.attr('method', 'post');
	    form.attr('target', '_self');
	    form.attr('style', 'display: none;');
	    var loadName_input = $('<input type="text" name="loadName" />');  
	    loadName_input.attr('value', loadName);
	    var startSite_input = $('<input type="text" name="startSite" />');  
	    startSite_input.attr('value', startSite);
	    var endSite_input = $('<input type="text" name="endSite" />');  
	    endSite_input.attr('value', endSite);
	    form.append(loadName_input);
	    form.append(startSite_input);
	    form.append(endSite_input);
	    $("body").append(form);
	    form.submit();
	}
	</script>
	</td>
</tr>
</table>
<div style="clear:both;"></div>
</div>

</div>
</div>
<!--新闻公告-->

</body>

</html>