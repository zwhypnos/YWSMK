<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="zh-CN">

<script type="text/javascript" src="${ctxStatic}/ywsmk/klb_ss/jquery1.42.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/ywsmk/klb_ss/jquery.SuperSlide.2.1.1.js"></script>
</head>

<body>



		<style type="text/css">
		/* css 重置 */
		*{margin:0; padding:0; list-style:none; }
		body{ background:#fff; font:normal 12px/22px 宋体;  }
		img{ border:0;  }
		a{ text-decoration:none; color:#333;  }
		a:hover{ color:#1974A1;  }
		.js{width:90%; margin:10px auto 0 auto; }
		.js p{ padding:5px 0; font-weight:bold; overflow:hidden;  }
		.js p span{ float:right; }
		.js p span a{ color:#f00; text-decoration:underline;   }
		.js textarea{ height:100px;  width:98%; padding:5px; border:1px solid #ccc; border-top:2px solid #aaa;  border-left:2px solid #aaa;  }

		/* 本例子css */
		/*只有IE11识别*/
		@media screen and(-ms-high-contrast:active),(-ms-high-contrast:none) {
		.slideGroup{ width:1069px; border:5px solid #5da0e1; text-align:left; margin-left:auto; margin-right: }
		.slideGroup .parBd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center; margin-left:60px; }
		}
		/*只有谷歌识别*/
		@media screen and (-webkit-min-device-pixel-ratio:0) {
		.slideGroup{ width:1069px; border:5px solid #5da0e1; text-align:left; margin-left:auto; margin-right: }
		.slideGroup .parBd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center; margin-left:60px; }
		}
		/*只有火狐识别*/
		@-moz-document url-prefix() {
		.slideGroup{ width:1069px; border:5px solid #5da0e1; text-align:left; margin-left:auto; margin-right: }
		.slideGroup .parBd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center; margin-left:60px; }
		}
		
		
		.slideGroup{ width:99%; border:5px solid #5da0e1; text-align:left; margin-left:auto; margin-right: }
		.slideGroup .parHd{ height:30px; line-height:30px; background:#f4f4f4; padding:0 20px; border-bottom:1px solid #ddd;  position:relative;  }
		.slideGroup .parHd ul{ float:left; position:absolute; left:20px; top:-1px; height:32px;   }
		.slideGroup .parHd ul li{ float:left; padding:0 15px; cursor:pointer;   }
		.slideGroup .parHd ul li.on{ height:30px;  background:#fff; border:1px solid #ddd; border-bottom:2px solid #fff; }
		.slideGroup .slideBox{ overflow:hidden; zoom:1; padding:10px 0 10px 42px; position:relative;   }

		.slideGroup .sPrev,.slideGroup .sNext{ position:absolute; left:5px; top:80px; display:block; width:30px; height:94px; border:1px solid #ddd; background:url(${ctxStatic}/ywsmk/klb_ss/images/icoLeft.gif) center center no-repeat #f4f4f4; }
		.slideGroup .sNext{ left:auto; right:5px; background:url(${ctxStatic}/ywsmk/klb_ss/images/icoRight.gif) center center no-repeat #f4f4f4;  }
		.slideGroup .sPrev:hover,.slideGroup .sNext:hover{ border-color:#f60;  }

		.slideGroup .parBd ul{ overflow:hidden; zoom:1; }
		.slideGroup .parBd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center; margin-left:20px; }
		@media screen and (min-width: 1900px) { 
		.slideGroup .parBd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center; margin-left:60px; }
		} 
		@media screen and (max-width: 1700px) { 
		.slideGroup .parBd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center; margin-left:60px; }
		} 

		@media screen and (max-width: 1500px) { 
		.slideGroup .parBd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center; margin-left:60px; }
		}
		@media screen and (max-width: 1400px) { 
		.slideGroup .parBd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center; margin-left:20px; }
		}
		.slideGroup .parBd ul li .pic{ text-align:center; width:440px; margin-left:20px; }
		.slideGroup .parBd ul li .pic img{ width:240px; height:90px; display:block;  padding:2px; border:1px solid #ccc;}
		.slideGroup .parBd ul li .pic a:hover img{ border-color:#999;  }
		.slideGroup .parBd ul li .title{ line-height:24px;   }
				
		/* 余额卡 */
		/* 市民卡 */
		.shimin_kayue_01{background-image: url(${ctxStatic}/ywsmk/images/shiminka_1.jpg);background-repeat: no-repeat;background-size: 100%100%;
			  height: 230px;width: 410px;}
		.shimin_kayue_01_s{background-image: url(${ctxStatic}/ywsmk/images/shiminka_1_s_2.jpg);background-repeat: no-repeat;background-size: 100%100%;
      			height: 230px;width: 410px;}
		.kahao_fwkahao{padding-top: 25px;margin-right:35px;font-size: 15px;font-weight: bold;color: #666;text-decoration: none;text-align: right;}	  
		/* 市民卡 */  
		
		/* 通用市民卡 */  
		.shimin_kayue_02{background-image: url(${ctxStatic}/ywsmk/images/shiminka_2.jpg);background-repeat: no-repeat;background-size: 100%100%;
			  height: 230px;width: 410px;}
		.yve_box{ width:100%; border: 5px solid #5da0e1;height: 280px;width: auto;margin-left: auto;margin-right: auto;
					 padding:10px;}
		.yve_tybox{padding-top: 25px;}
		.yve_tybiaoti{margin-left:30px; float:left; width:170px; font-size:18px;font-weight: bold;}
		.kahao_tyfwkahao{ margin-right:35px; float: right;width:170px;text-align: right; font-size:15px;font-weight: bold;}
		.yve_dabox{ margin-top:70px;}
		.big_yve{ margin-left:20px; float:left; width:120px; font-size:16px;font-weight: bold;}
		.small_yve{ margin-right:10px; float: right;width:240px;text-align: left; font-size:16px;font-weight: bold;}
		.kayve_foot{margin-top:70px; float:left;}
		.yve_state{margin-left:5px; float:left; width:170px; font-size:16px;font-weight: bold;}
		.yve_loss{ margin-right:30px; float: right;width:170px;text-align: right; font-size:16px;font-weight: bold;}
		.yve_text_red{color: #F00;}
		.yve_loss a{color: #000;text-decoration: underline;}
		/* 通用市民卡 */  
		/* 余额卡 */

		</style>


		<div class="slideGroup" style="margin:0 auto">
			
			<div class="parBd">
					<div class="slideBox">
						<c:if test="${cmsUser.card eq '0'}">
							<a href="javascript:srcollTobind();"><img style="width:950px;height:260px;" alt="对不起！您还没有进行实名绑卡，不能查看卡信息，请先去绑卡" src="${ctxStatic}/ywsmk/images/unbind.jpg"></a>
						</c:if>
						<c:if test="${cmsUser.card eq '1'}">
							<c:if test="${not empty personCardList }">
								<a class="sPrev" href="javascript:void(0)"></a>
								<ul>
									<c:forEach items="${personCardList}" var="personCard" varStatus="status">
										<li id="${personCard.cardNo }" state="${personCard.cardState }">
											<div class="${status.first?'shimin_kayue_01_s':'shimin_kayue_01'}">
		                                      <div class="yve_tybox">
		                                          <div class="yve_tybiaoti"></div>
		                                          <div class="kahao_tyfwkahao">${CARD_TYPE[personCard.cardType] }</div>
		                                      </div>
		                                      <div class="yve_dabox">
		                                          <div class="big_yve">姓名：<span>${personCard.clientName }</span> </div>
		                                          <div class="small_yve">卡号：<span>${personCard.cardNo }</span></div>
		                                      </div>
		                                      <div class="kayve_foot">
		                                          <div class="yve_state">卡状态：
		                                          	<span class="yve_text_red">
														<c:choose>
															<c:when test="${personCard.cardState eq '1'}"><span style="color:green;">${CARD_STATE[personCard.cardState] }</span></c:when>
															<c:otherwise><span class="yve_text_red">${CARD_STATE[personCard.cardState] }</span></c:otherwise>
														</c:choose>
		                                          	</span>
		                                          </div>
		                                      </div>
		                                  </div>
										</li>
									</c:forEach>
								</ul>
								<a class="sNext" href="javascript:void(0)"></a>
							</c:if>
						</c:if>
					</div><!-- slideBox End -->

				


			</div><!-- parBd End -->
		</div>

		<script type="text/javascript">
			/*
			SuperSlide组合注意：
			1、内外层mainCell、targetCell、prevCell、nextCell等对象不能相同，除非特殊应用；
			2、注意书写顺序，通常先写内层js调用，再写外层js调用
			*/

			/* 内层图片滚动切换 */
			jQuery(".slideGroup .slideBox").slide({ mainCell:"ul",vis:2,prevCell:".sPrev",nextCell:".sNext",effect:"leftLoop"});

			/* 外层tab切换 */
			/*jQuery(".slideGroup").slide({titCell:".parHd li",mainCell:".parBd"}); ,delayTime:1000,autoPlay:true */

		</script>
		<script type="text/javascript">
			function srcollTobind(){
				parent.gotoBinding();
			}
			
			$(function(){
				if($(".slideBox li:not(.clone)").length > 0){
					var cardNo = $(".slideBox li:not(.clone)").eq(0).attr("id");
					var state = $(".slideBox li:not(.clone)").eq(0).attr("state");
					parent.$.jBox.tip("查询中...","loading",{persistent: true});
					parent.cardInfo(cardNo,'0',state);
					parent.setPayCardId(cardNo);
				}
				
				$(".slideBox li").click(function(){
					$(".slideBox li>div").each(function(i){
						$(this).attr("class","shimin_kayue_01");
					});
					$(this).children().eq(0).attr("class","shimin_kayue_01_s");
					var cardNo = $(this).attr("id");
					var state = $(this).attr("state");
					parent.$.jBox.tip("查询中...","loading",{persistent: true});
					parent.cardInfo(cardNo,'0',state);
					parent.setPayCardId(cardNo);
				});
			});
		
			function lost(cardNo){
				parent.lost(cardNo);
			}
		</script>





</body>
</html>