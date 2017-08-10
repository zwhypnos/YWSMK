<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="decorator" content="cms_ywsmk_index"/>
		<title>义乌市民卡服务平台</title>
        <script  charset="UTF-8"  type="text/javascript" src="${ctxStatic}/ywsmk/ywsmk_files/list.js"></script>
		<style>
		.card_con{ WIDTH: 100%; overflow:hidden;}
.card_con ul{ width:100%; overflow:hidden; border-bottom:1px dotted #dbdfdc;}
.bg_b{ background:#F6F9FF;  height:137px;}
.bg_y{ background:#F6F9FF;  height:137px;}
.card_con ul li{ float:left; overflow:hidden; overflow:hidden; height:137px;}
.card_con ul li a{ color:#5d5d5d; display:block; height:104px; line-height:30px; padding:20px 0px 20px 0px; _height:23px; _line-height:23px; _padding:24px 0px 23px 0px; }
.card_con ul li a:hover{ color:##029AEE; background:#90C5E7!important;}
.card_con ul.card_c li a:hover{ color:#3eae66; background:#90C5E7!important;}
.list_a{ height:66px!important; line-height:66px!important;  background:url(${ctxStatic}/ywsmk/images/apply_hover_bg2.jpg) -2px center no-repeat!important;}
.card_l_t{ color:#313131; font-size:18px; font-family:"微软雅黑"; padding-left:15px; padding-right:6px; height:120px;
		 width:120px;font-weight: bold; }
.card_l_c_1{ text-align:center; font-family:"微软雅黑"; font-size:14px; color:#5d5d5d; width:150px;}
.card_l_c_2{   text-align:center; font-family:"微软雅黑"; font-size:14px; color:#5d5d5d; width:150px;}
.card_con ul li img{ margin-right:5px;}
.KSS_btnBox ul{ width:100px!important;}
.card_menu{ position:absolute; top:0px; right:0px; width:306px; height:312px; background:url(${ctxStatic}/ywsmk/images/current3.png) right 0px repeat-y;}
.card_menu ul{ width:306px; height:312px; overflow:hidden;}
.card_menu ul li{ float:left; width:306px; font-size:20px; font-family:"微软雅黑"; CURSOR: pointer; WORD-BREAK: break-all; TEXT-INDENT: 30px; WHITE-SPACE: nowrap; HEIGHT: 104px; line-height:104px; TEXT-OVERFLOW: ellipsis;}
.card_menu ul li a{ display:block; width:306px; height:104px; line-height:104px; _HEIGHT:87px; _line-height:87px; _padding-top:17px; overflow:}
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
                        <!--标题 -->
                        <div class="Foxpro_title01">
                            <div class="Foxpro_title01_txt01">
                                <div class="Foxpro_title01_txt02" >
                                卡应用
                                </div>
                            </div>
                            <div class="mix">当前位置：首页&nbsp;〉&nbsp;卡应用</div>
                        </div>
                        <!--标题 -->
                        <!--结果-->
                        <div class="card_con bh-fl" id="app_1" style="display: block;">
                            <ul class="bg_b" id="shbz">
                                <li class="card_l_t">
                                    <span style="height:137px; line-height:137px; padding:px 0px 25px 0px; display:inline-block;">社会保障:</span>
                                </li>
                                <li class="card_l_c_1" >
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-316af497816e49678e1c2b3a97d8dcd7${urlSuffix}" style="width:100%;">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_1.png">
                                   </a>
                                </li>
                                <li class="card_l_c_2" >
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-5b60730feb42402f93bbc6c59d742d25${urlSuffix}" style="width: 100%; _width: 100%;">
									<img width="80px" height="104px" src="${ctxStatic}/ywsmk/images/cardap_2.png">
                                    </a>
                                </li>
                            </ul>
                            <ul class="bg_b" id="jrzf">
                                <li class="card_l_t">
                                    <span style="height:137px; line-height:137px; padding:px 0px 25px 0px; display:inline-block;">金融支付:</span>
                                </li>
                                <li class="card_l_c_1" >
                                    <a href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-9ee14078e71b49f3b94541f7e615e155${urlSuffix}" style="width:100%;">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_0.png">
                                   </a>
                                </li>
                            </ul>
                            <ul class="bg_y" id="ggfw">
                                <li class="card_l_t">
                                    <span style="height:137px; line-height:137px; padding:px 0px 25px 0px; display:inline-block;">公共服务:</span>
                                </li>
							  <li class="card_l_c_1" >
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-7310ca0be62c4ebebb001f2359cc559b${urlSuffix}">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_3.png">
                                   </a>
                                </li>
                               
                              <li class="card_l_c_2" >
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-e508268eb4e04b59bac7e72dbba4a65b${urlSuffix}" style="width:100%;">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_4.png">
                                   </a>
                                </li>
                            </ul>
                            <ul class="bg_b" id="csjt">
                                <li class="card_l_t">
                                    <span style="height:137px; line-height:137px; padding:px 0px 25px 0px; display:inline-block;">城市交通:</span>
                                </li>
                                <li class="card_l_c_1">
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-377fa7c11c8a4bf9b879da5cf551e1cc${urlSuffix}" style="width:100%;">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_5.png">
                                   </a>
                                </li>
                              <li class="card_l_c_1" >
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-447c133d02f848629676f2bf71eebcd0${urlSuffix}" style="width:100%;">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_6.png">
                                   </a>
                                </li>
                              <li class="card_l_c_1" >
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-d429ca9ba1494cd3a526a282d1d5cd0c${urlSuffix}" style="width:100%;">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_7.png">
                                   </a>
                                </li>
                              <li class="card_l_c_1">
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-acc9964f630c4a15a5bcf582db9b47c1${urlSuffix}" style="width:100%;">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_8.png">
                                   </a>
                                </li>
                              <li class="card_l_c_1">
                                    <a target="_blank" href="${ctx }/view-b11acacd2597413a84e45d040ae2e999-2b1f74d875204a3d9d5163b78d5ed204${urlSuffix}" style="width:100%;">
									<img width="80px" hight="104px" src="${ctxStatic}/ywsmk/images/cardap_9.png">
                                   </a>
                                </li>
                                
                          </ul>
                          
                  </div>
                  <!--结果-->
                  
                  </div>
                </div>
			<!--新闻公告-->
		
		
	</body>

</html>