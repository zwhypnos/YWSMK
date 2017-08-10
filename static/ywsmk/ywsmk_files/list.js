var _Cond = {};

$(function () {
  //获取数据
  BtnSearch();

  //搜索按钮
  $("#btnSearch").click(function () {
    BtnSearch();
  });
});



/** 
* 设置检索数据
*/
function SetCond() {
  var KeyWords = "";
  var RegionIds = "";
  var ServiceIds = "";

  KeyWords = $.trim($("#KeyWords").val());
  if (KeyWords == "请输入关键字") {
    KeyWords = "";
  }

  //所属区域
  $("#listRegion a").each(function () {
    if ($(this).attr("class") == "selected" && $(this).attr("cvalue") != "") {
      RegionIds += $(this).attr("cvalue") + ",";
    }
  });
  if (RegionIds.length > 0) {
    $("#cRegionEmpty").removeClass("selected");
    RegionIds = RegionIds.substring(0, RegionIds.length - 1);
  } else {
    $("#cRegionEmpty").attr("class", "selected");
  }

  //服务类型
  $("#listService a").each(function () {
    if ($(this).attr("class") == "selected" && $(this).attr("cvalue") != "") {
      ServiceIds += $(this).attr("cvalue") + ",";
    }
  });
  if (ServiceIds.length > 0) {
    $("#cServiceEmpty").removeClass("selected");
    ServiceIds = ServiceIds.substring(0, ServiceIds.length - 1);
  } else {
    $("#cServiceEmpty").attr("class", "selected");
  }

  _Cond = {
    "CorpNm": KeyWords,
    "CorpRegionIds": RegionIds,
    "CorpServiceIds": ServiceIds,
    "PageNo": "1"
  };
}

/** 
* 点击检索按钮
*/
function BtnSearch() {
  SetCond();
  Search(_Cond);
}

/** 
* 点击页码导航链接
* 
* @param pageNo 页码
*/
function ASearch(pageNo) {
  _Cond.PageNo = pageNo
  Search(_Cond);
}

/** 
* 检索
* 
* @param data 检索条件
*/
function Search(data) {
  $.ajax({
    type: "POST",
    url: "List",
    data: data,
    dataType: "json",
    beforeSend: function () {
      //showPopup("WAITING", "正在查询信息，请稍等...");
    },
    success: function (data) {
      //hidePopup();
      if (data.type == "OK") {
        ShowListData(data, "ASearch");
      } else {
        //showAlertMsg("ERROR", '数据读取失败');
      }
    },
    error: function () {
      //showAlertMsg("ERROR", '数据读取失败');
    }
  });
}

/** 
* 显示列表数据
* 
* @param data     显示数据
* @param methodNm 方法名
*/
function ShowListData(data, methodNm) {
  $("#listbody").setTemplateElement("listTemplate").processTemplate(data.Records);
  var pageNavi = getPage(data.PageNo, data.TotalPages, data.TotalCnt, methodNm);
  $(".page").html(pageNavi);
  $("#recordcnt").html(data.TotalCnt);
}

function checkRegion(obj) {
  if ($(obj).attr("class")=="selected") {
    $(obj).removeClass("selected");
  } else {
    $(obj).addClass("selected");
  }
  BtnSearch();
}

function checkService(obj) {
  if ($(obj).attr("class") == "selected") {
    $(obj).removeClass("selected");
  } else {
    $(obj).addClass("selected");
  }
  BtnSearch();
}

function clearRegion() {
  //所属区域
  $("#listRegion a").each(function () {
    $(this).removeClass("selected");
  });
  $("#cRegionEmpty").attr("class", "selected");
  BtnSearch();
}

function clearService() {
  //服务类型
  $("#listService a").each(function () {
    $(this).removeClass("selected");
  });
  $("#cServiceEmpty").attr("class", "selected");
  BtnSearch();
}