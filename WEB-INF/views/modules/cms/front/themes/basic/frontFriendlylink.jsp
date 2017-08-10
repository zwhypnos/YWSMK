<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="cms_ywsmk_index"/>

<title>义乌市民卡服务平台</title>
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
           <div class="guanggao_boxx">
				<div class="guanggao_minboxx">
			<div class="Main_page">
				<!--商户查询-->
				<div class="Search_company">
					<!--标题 -->
					<div class="Foxpro_title01">
						<div class="Foxpro_title01_txt01">
							<div class="Foxpro_title01_txt02" style="background:url( images/list_title01.gif) no-repeat bottom center;">
                            友情链接</div>
						</div>
                        <div class="mix">当前位置：首页&nbsp;〉&nbsp;友情链接</div>
					</div>
					<!--标题 -->

					<!--结果-->
					<div class="frendlink">
						<ul>
							<c:forEach items="${linkList }" var="link">
								<li>
									<a target="_blank" href="${link.href }">${link.title}</a>
								</li>
							</c:forEach>
						</ul>
        </div>

						</div>
						<div style="clear:both;"></div>
					</div>
					<!--结果-->
				</div>
				<!--商户查询-->

				<div style="clear:both;"></div>
			</div>
			<!--新闻公告-->
</body>
</html>