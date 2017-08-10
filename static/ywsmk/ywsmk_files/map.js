$(function () {
  //百度地图
  map = new BMap.Map('map');
  var point=new BMap.Point($("#lng").val(), $("#lat").val());
  map.centerAndZoom(point, 15);
  var opts = { type: BMAP_NAVIGATION_CONTROL_LARGE };
  map.addControl(new BMap.NavigationControl(opts));
  map.addControl(new BMap.ScaleControl());
  map.addControl(new BMap.OverviewMapControl());
  map.addControl(new BMap.MapTypeControl());
  map.enableScrollWheelZoom();
});

function SetMapPoint(nm, snms, address, phone, wt, lng, lat, center) {
  var gc = new BMap.Geocoder();
  var opts = { type: BMAP_NAVIGATION_CONTROL_LARGE };
  var point = new BMap.Point(lng, lat);
  var marker = new BMap.Marker(point);

  map.addOverlay(marker);
  gc.getLocation(point, function (rs) {
    showLocationInfo(point, rs, marker, map, nm, snms, address, phone, wt, center);
  });
}

//显示地址信息窗口  
function showLocationInfo(pt, rs, objmk, map, nm, snms, address, phone, wt, center) {
  var addr = "<p style='line-height:20px;'>服务类型：" + snms + "<br />";
  addr += "网点地址：" + address + "<br />";
  addr += "联系电话：" + phone + "<br />";
  addr += "服务时间：" + wt + "<br /></p>";

  //样式1
  var infoWindow = new BMapLib.SearchInfoWindow(map, addr, {
    title: nm, //标题
    width: 270,
    panel: "panel", //检索结果面板
    enableAutoPan: true, //自动平移
    searchTypes: [
      BMAPLIB_TAB_SEARCH,   //周边检索
      BMAPLIB_TAB_TO_HERE,  //到这里去
      BMAPLIB_TAB_FROM_HERE //从这里出发
    ]
  });

  if (center == "0") {
    map.centerAndZoom(pt, 14);
    infoWindow.open(objmk);
  } else if (center == "1") {
    map.centerAndZoom(pt, 14);
  }

  objmk.addEventListener("click", function (e) {
    infoWindow.open(objmk);
  });
}