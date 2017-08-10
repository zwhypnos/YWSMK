// JavaScript Document
$(function(){
	//根据总页数判断，如果小于5页，则显示所有页数，如果大于5页，则显示5页。根据当前点击的页数生成
	
	var pageCount_gonggao = 11;//模拟后台总页数
	//生成分页按钮
	if(pageCount_gonggao>5){
		page_icon_gonggao(1,5,0);
	}else{
		page_icon_gonggao(1,pageCount_gonggao,0);
	}
	
	//点击分页按钮触发
	$("#pageGro_gogngao li").live("click",function(){
		if(pageCount_gonggao > 5){
			var pageNum = parseInt($(this).html());//获取当前页数
			pageGro_gogngaoup_gonggao(pageNum,pageCount_gonggao);
		}else{
			$(this).addClass("on");
			$(this).siblings("li").removeClass("on");
		}
	});
	
	//点击上一页触发
	$("#pageGro_gogngao .pageUp_gonggao").click(function(){
		if(pageCount_gonggao > 5){
			var pageNum = parseInt($("#pageGro_gogngao li.on").html());//获取当前页
			pageUp_gonggao(pageNum,pageCount_gonggao);
		}else{
			var index = $("#pageGro_gogngao ul li.on").index();//获取当前页
			if(index > 0){
				$("#pageGro_gogngao li").removeClass("on");//清除所有选中
				$("#pageGro_gogngao ul li").eq(index-1).addClass("on");//选中上一页
			}
		}
	});
	
	//点击下一页触发
	$("#pageGro_gogngao .pageDown_gonggao").click(function(){
		if(pageCount_gonggao > 5){
			var pageNum = parseInt($("#pageGro_gogngao li.on").html());//获取当前页
			pageDown_gonggao(pageNum,pageCount_gonggao);
		}else{
			var index = $("#pageGro_gogngao ul li.on").index();//获取当前页
			if(index+1 < pageCount_gonggao){
				$("#pageGro_gogngao li").removeClass("on");//清除所有选中
				$("#pageGro_gogngao ul li").eq(index+1).addClass("on");//选中上一页
			}
		}
	});
});

//点击跳转页面
function pageGro_gogngaoup_gonggao(pageNum,pageCount_gonggao){
	switch(pageNum){
		case 1:
			page_icon_gonggao(1,5,0);
		break;
		case 2:
			page_icon_gonggao(1,5,1);
		break;
		case pageCount_gonggao-1:
			page_icon_gonggao(pageCount_gonggao-4,pageCount_gonggao,3);
		break;
		case pageCount_gonggao:
			page_icon_gonggao(pageCount_gonggao-4,pageCount_gonggao,4);
		break;
		default:
			page_icon_gonggao(pageNum-2,pageNum+2,2);
		break;
	}
}

//根据当前选中页生成页面点击按钮
function page_icon_gonggao(page,count,eq){
	var ul_html = "";
	for(var i=page; i<=count; i++){
		ul_html += "<li>"+i+"</li>";
	}
	$("#pageGro_gogngao ul").html(ul_html);
	$("#pageGro_gogngao ul li").eq(eq).addClass("on");
}

//上一页
function pageUp_gonggao(pageNum,pageCount_gonggao){
	switch(pageNum){
		case 1:
		break;
		case 2:
			page_icon_gonggao(1,5,0);
		break;
		case pageCount_gonggao-1:
			page_icon_gonggao(pageCount_gonggao-4,pageCount_gonggao,2);
		break;
		case pageCount_gonggao:
			page_icon_gonggao(pageCount_gonggao-4,pageCount_gonggao,3);
		break;
		default:
			page_icon_gonggao(pageNum-2,pageNum+2,1);
		break;
	}
}

//下一页
function pageDown_gonggao(pageNum,pageCount_gonggao){
	switch(pageNum){
		case 1:
			page_icon_gonggao(1,5,1);
		break;
		case 2:
			page_icon_gonggao(1,5,2);
		break;
		case pageCount_gonggao-1:
			page_icon_gonggao(pageCount_gonggao-4,pageCount_gonggao,4);
		break;
		case pageCount_gonggao:
		break;
		default:
			page_icon_gonggao(pageNum-2,pageNum+2,3);
		break;
	}
}