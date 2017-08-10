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

<style type="text/css">
.ywloginboy table tr table .data td{padding: 5px 10px;height: 15px;line-height: 15px;background-position: center center;border-right: solid 1px #E2E3E3;}
.xfmx_tb_box {border-right-width: 0px;}
.xfmx_tb_top{border-right: solid 1px #E2E3E3;}
.xfmx_tb_box td {text-align: left;}
.ywloginboy table tr table .data th{min-height:50px;padding: 5px;height: 50px;line-height: 15px;background: #ededed;border-right: solid 1px #E2E3E3;border-bottom: solid 1px #E2E3E3;}
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
    <div class="Foxpro_title01_txt02">公交线路详情</div>
  </div>
</div>
<!--标题-->
<table class="" width="100%" style="margin:0px;" border="0" cellspacing="0" cellpadding="0">
<tr>
<td > 
	<table class="xfmx_tb_box" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr class="data">
        <th style="width:13%">线路名称</th>
        <td style="width:87%">${cmsBus.loadName }</td>
        </tr>
        <tr class="data">
        <th style="width:13%">起点</th>
        <td style="width:87%">${cmsBus.startSite }</td>
        </tr>
        <tr class="data">
        <th style="width:13%">终点</th>
        <td style="width:87%">${cmsBus.endSite }</td>
        </tr>
        <tr class="data">
        <th style="width:13%">起点首末班车时间</th>
        <td style="width:87%">${cmsBus.startTimes }</td>
        </tr>
        <tr class="data">
        <th style="width:13%">终点首末班车时间</th>
        <td style="width:87%">${cmsBus.endTimes }</td>
        </tr>
        <tr class="data">
        <th style="width:13%">发车间隔</th>
        <td style="width:87%">${cmsBus.interval }</td>
        </tr>
        <tr class="data">
        <th style="width:13%">票价（元）</th>
        <td style="width:87%">${cmsBus.price }</td>
        </tr>
        <tr class="data">
        <th style="width:13%">途径站点</th>
        <td style="width:87%">${cmsBus.pathwaySite }</td>
        </tr>
        <tr class="data">
        <th style="width:13%">走向</th>
        <td style="width:87%">${cmsBus.trend }</td>
        </tr>
      </table>
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