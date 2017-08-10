<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>

<!--右侧快捷-->
<div class="rfloat">
  <ul>
    <li title="意见反馈" onclick="window.open('${ctx}/feedback-22.html');">
      <div class="rfloatbg1" style="display: block;"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_3.jpg" alt="意见反馈"></div>
      <div class="rfloatbg2" style="display: none;"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_33.jpg" alt="意见反馈"></div>
      <div class="rfloatitem" style="display: none;">
        <div class="rfloatitem1">意见反馈</div>
      </div>
    </li>
    <%-- <li title="关注新浪微博">
      <div class="rfloatbg1" onclick="" style="display: block;"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_4.jpg" alt="新浪微博"></div>
      <div class="rfloatbg2" onclick="" style="display: none;"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_44.jpg" alt="新浪微博"></div>
      <!-- <div class="rfloatitem" style="display: none;">
        <wb:follow-button uid="2541984024" type="red_2" width="120" height="32"><iframe src="./ywsmk_files/followbutton.html" width="120" height="32" frameborder="0" scrolling="no" marginheight="0"></iframe></wb:follow-button>
      </div> -->
    </li> --%>
    <li title="淘宝店铺" onclick="window.open('https://shop202253761.taobao.com/shop/view_shop.htm?tracelog=twddp&user_number_id=673400510&user_id=673400510');">
      <div class="rfloatbg1" onclick="" style="display: block;"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_5.jpg" alt="淘宝店铺"></div>
      <div class="rfloatbg2" onclick="" style="display: none;"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_55.jpg" alt="淘宝店铺"></div>
      <div class="rfloatitem" style="display: none;">
        <div class="rfloatitem1">淘宝店铺</div>
      </div>
    </li>
    <li title="微信二维码">
      <div class="rfloatbg1" style="display: block;"><img src="${ctxStatic}/ywsmk/ywsmk_files/weixin11.png" alt="微信"></div>
      <div class="rfloatbg2" style="display: none;"><img src="${ctxStatic}/ywsmk/ywsmk_files/weixin1.png" alt="微信"></div>
      <div class="rfloatitem" style="display: none;">
        <img src="${ctxStatic}/ywsmk/ywsmk_files/wx8cm.jpg" alt="微信二维码">
      </div>
    </li>
    <li title="APP下载" style="background-color: #FFFFFF;">
      <div class="rfloatbg1" style="display: block;"><img src="${ctxStatic}/ywsmk/ywsmk_files/app1.png" alt="微信"></div>
      <div class="rfloatbg2" style="display: none;"><img src="${ctxStatic}/ywsmk/ywsmk_files/app11.png" alt="微信"></div>
      <div class="rfloatitem" style="display: none;">
        <img src="${ctxStatic}/ywsmk/ywsmk_files/wx800x800.jpg" style="width: 258px;" alt="APP下载">
      </div>
    </li>
    <li title="回到顶部" onclick="javascript:scroll(0,0);">
      <div class="rfloatbg1"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_7.jpg" alt="回到顶部"></div>
      <div class="rfloatbg2"><img src="${ctxStatic}/ywsmk/ywsmk_files/icon_77.jpg" alt="回到顶部"></div>
      <div class="rfloatitem">
        <div class="rfloatitem1">回到顶部</div>
      </div>
    </li>
  </ul>
</div>
<script src="${ctxStatic}/ywsmk/ywsmk_files/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
  $(function () {
    $(".rfloat ul li").hover(
      function () {
        $(this).children(".rfloatbg1").hide();
        $(this).children(".rfloatbg2").show();
        $(this).children(".rfloatitem").show();
      },
      function () {
        $(this).children(".rfloatbg1").show();
        $(this).children(".rfloatbg2").hide();
        $(this).children(".rfloatitem").hide();
      }
    );
  });
</script>
<!--右侧快捷-->