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
<link title="normal" rel="stylesheet" type="text/css" href="${ctxStatic}/jquery-jbox/2.3/Skins/Blue/jbox.css"/>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
<script charset="UTF-8" src="${ctxStatic}/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>
</head>
<body>



<!--图片广告-->
<div class="guanggao_boxx">
<div class="guanggao_minboxx">
<img src="${ctxStatic}/ywsmk/images/6.png" width="100%" height="200px;" /> 
</div>
</div>
<!--图片广告-->



<div class="ywloginboy">
<div class="ywxwgonggao">
	<div id="TabbedPanels1" class="TabbedPanels">
	 	<!--二级栏目-->
	    <ul class="TabbedPanelsTabGroup">
	      <cms:frontCategoryList_yw categoryList="${categoryList}"/>
	    </ul>
	    <!--二级栏目-->
		<!--文章内容-->
	    <div class="TabbedPanelsContentGroup">
	    	<div class="TabbedPanelsContent TabbedPanelsContentVisible">
	    		<div class="nei">
	            	<table width="730" border="0" cellspacing="0" cellpadding="0" style="line-height:38px; font-size:12px;">
					  <tbody><tr>
						<td colspan="2" style=" padding:0px 13px 20px 13px; line-height:20px; color:#888;">您好！  如果您想咨询相关问题或者你有什么意见和建议，请留下您想说的话，附上联系方式，以便我们与你取得联系！<br>
						<span style="color:#FF0000;">下面红色星号 *为必填项。</span></td>
					 </tr>
					 <tr>
					   <td width="72" align="right"><span style="color:#FF0000;">*</span>标　　题：</td>
					   <td width="658">
						 <input id="Title" type="text" class="opinion_text01" maxlength="50">
						 &nbsp;<span id="mTitle"></span>
					   </td>
					</tr>
					<tr>
					   <td width="72" align="right"><span style="color:#FF0000;">*</span>姓　　名：</td>
					   <td width="658">
						 <input id="Name" type="text" class="opinion_text01" maxlength="50">
						 &nbsp;<span id="mName"></span>
					   </td>
					</tr>
					<tr>
					  <td width="72" align="right"><span style="color:#FF0000;">*</span>身份证号：</td>
					  <td width="658">
						 <input id="CertNo" type="text" class="opinion_text01" maxlength="30">
						&nbsp;<span id="mCertNo"></span>
					  </td>
					</tr>
					<tr>
					  <td width="72" align="right"><span style="color:#FF0000;">*</span>电子邮箱：</td>
					  <td width="658">
						 <input id="Email" type="text" class="opinion_text01" maxlength="30">
						&nbsp;<span id="mEmail"></span>
					  </td>
					</tr>
					<tr>
					  <td align="right">Q&nbsp;Q&nbsp;号码：</td>
					  <td>
						<input id="QQ" type="text" class="opinion_text01" maxlength="30">
						&nbsp;<span id="mQQ" class=""></span>
					  </td>
					</tr>
					<tr>
					  <td align="right"><span style="color:#FF0000;">*</span>联系电话：</td>
					  <td>
						<input id="Phone" type="text" class="opinion_text01" maxlength="30">
						&nbsp;<span id="mPhone"></span>
					  </td>
					</tr>
					<tr>
					  <td align="right" valign="top"><span style="color:#FF0000;">*</span> 反馈内容：</td>
					  <td valign="top" style="padding:4px 0;">
						<textarea id="Content" cols="" rows="" class="opinion_text02"></textarea>
						&nbsp;<span id="mContent" style="vertical-align:top;"></span>
						<div class="count-info" style="height:14px;line-height:14px;">还可输入<span id="counter">500</span>个字符</div>
					  </td>
					</tr>
					<tr>
					  <td align="right"><span style="color:#FF0000;">*</span>验&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码：</td>
					  <td>
						<input id="VCode" type="text" class="opinion_text03" maxlength="10">
						&nbsp;<span id="mVCode" class="msg error">请输入验证码</span>
					  </td>
					</tr>
					<tr>
					  <td>&nbsp;</td>
					  <td>
						<a href="javascript:void(0);" onclick="changeValidateCode()"><img id="imgValidateCode" src="${pageContext.request.contextPath}/servlet/validateCodeServlet" alt="验证码" title="不区分大小写" style="vertical-align:middle;width:80px;height:28px;"></a>
						<a href="javascript:void(0);" onclick="changeValidateCode()">看不清，换一个</a></td>
					</tr>
					<tr>
					  <td>&nbsp;</td>
					  <td style="padding-top:15px;"><input id="btnSave" type="button" value="确 定" class="opinion_btn" onclick="javascript:submitForm();"><input id="btnReset" type="button" value="重 置" class="opinion_btn" onclick="javascript:resetForm();"></td>
					</tr>
					<tr>
					  <td colspan="2" style="border-bottom:1px dotted #ccc; line-height:20px;">&nbsp;</td>
					 </tr>
					<tr>
					 <td colspan="2" style=" padding:10px 13px; line-height:28px; color:#888;"><span style="color:#FF0000;">留言说明：</span><br>
					   一、本留言版主要受理义乌社会保障市民卡相关业务咨询和投诉。<br>
					   二、为了让您能得到及时、准确的服务，请您详细填写各项内容，并保证信息完整、准确、真实、有效。
					   <br>
					   三、经受理的咨询和投诉问题，一般在3个工作日内完成答复。<br>
					   四、咨询内容如涉及机密或个人隐私不宜公开的，请直接前往市民卡服务中心大厅咨询和办理。<br>
					   客服热线：0579-85336078。</td>
					 </tr>
				   </tbody></table>
	        	</div>
	    	</div>
	    </div>
		<!--文章内容-->
	</div>
</div>
</div>
<script type="text/javascript">
  $(function () {
    // 输入验证
    // 验证标题
    $("#Title").blur(chkTitle).focus(showInfo);
 	// 验证姓名
    $("#Name").blur(chkName).focus(showInfo);
    // 验证身份证号
    $("#CertNo").blur(chkCertNo).focus(showInfo);
    // 验证电子邮箱
    $("#Email").blur(chkEmail).focus(showInfo);
    // 验证联系电话
    $("#Phone").blur(chkPhone).focus(showInfo);
    // 验证QQ号码
    $("#QQ").blur(chkQQ).focus(showInfo);
    // 验证反馈内容
    $("#Content").blur(chkContent).focus(showInfo);
    // 验证验证码
    $("#VCode").blur(chkValidCodeExist).focus(showInfo);

    // 最大字符数设定
    $("#Content").charCounter(500, {
      container: "#counter",
      format: "%1"
    });

    //按钮事件
    //$("#btnSave").click(submitForm);
    //$("#btnReset").click(resetForm);
  });

  /**
  * 表单提交前验证
  */
  function submitValid() {
    if (chkTitle() && chkName() && chkCertNo() && chkEmail() && chkPhone() && chkQQ() &&
    chkContent()) {
      return true;
    }

    return false;
  }

  /**
  * 表单提交
  */
  function submitForm() {
    if (!submitValid()) {
      return false;
    }
    var data = {
      "title": $.trim($("#Title").val()),
      "name": $.trim($("#Name").val()),
      "idcard": $.trim($("#CertNo").val()),
      "email": $.trim($("#Email").val()),
      "phone": $.trim($("#Phone").val()),
      "qq": $.trim($("#QQ").val()),
      "content": $("#Content").val(),
      "validateCode": $.trim($("#VCode").val())
    };

    $.ajax({
      type: "POST",
      url: "${ctx}/uploadFeedback",
      data: data,
      dataType: "json",
      beforeSend: function () {
		$.jBox.tip("正在提交...","loading");
      },
      success: function (data) {
    	$.jBox.closeTip();
        if (data.resultCode==0) {
          resetForm();
          $.jBox.success("信息提交成功","信息",{"persistent":true});
        } else {
          $.jBox.error(data.resultMessage,"错误",{"persistent":true});
        }
      },
      error: function () {
    	$.jBox.error("未知错误","错误",{"persistent":true});
    	$.jBox.closeTip();
      }
    });
  }

  /**
  * 标题验证
  */
  function chkTitle() {
    if ($.trim($("#Title").val()) != "") {
      $("#mTitle").attr("class", "msg ok").html("");
      return true;
    } else {
      $("#mTitle").attr("class", "msg error").html("标题不能为空");
      return false;
    }
  }
  
  /**
   * 标题姓名
   */
  function chkName(){
    if ($.trim($("#Name").val()) != "") {
	  $("#mName").attr("class", "msg ok").html("");
	  return true;
	} else {
	  $("#mName").attr("class", "msg error").html("姓名不能为空");
	  return false;
	}
  }

  /**
  * 身份证号验证
  */
  function chkCertNo() {
    if ($.trim($("#CertNo").val()) != "") {
      var cert = $.trim($("#CertNo").val());
      if (isCardNo(cert)) {
        $("#mCertNo").attr("class", "msg ok").html("");
        return true;
      } else {
        $("#mCertNo").attr("class", "msg error").html("身份证号不正确");
        return false;
      }
    } else {
      $("#mCertNo").attr("class", "msg error").html("身份证号不能为空");
      return false;
    }
  }
  
  var certNoReg=new RegExp("^([0-9]{15}|[0-9]{17}[0-9xX])$");
  function isCardNo(certNo){
	  return certNoReg.test(certNo);
  }

  /**
  * 电子邮件验证
  */
  function chkEmail() {
    if ($.trim($("#Email").val()) != "") {
      var email = $.trim($("#Email").val());
      if (isEmail(email)) {
        $("#mEmail").attr("class", "msg ok").html("");
        return true;
      } else {
        $("#mEmail").attr("class", "msg error").html("格式不正确，正确格式如：1234567@qq.com");
        return false;
      }
    } else {
      $("#mEmail").attr("class", "msg error").html("电子邮箱不能为空");
      return false;
    }
  }
  
  var emailReg=new RegExp("^[0-9a-zA-Z][0-9a-zA-Z\-_]*@[0-9a-zA-Z\-_.]*$");
  function isEmail(email){
	  return emailReg.test(email);
  }

  /**
  * 联系电话验证
  */
  function chkPhone() {
    if ($.trim($("#Phone").val()) != "") {
      var phone = $.trim($("#Phone").val());
      if (isPhone(phone)) {
        $("#mPhone").attr("class", "msg ok").html("");
        return true;
      } else {
        $("#mPhone").attr("class", "msg error").html("联系电话不正确");
        return false;
      }
    } else {
      $("#mPhone").attr("class", "msg error").html("联系电话不能为空");
      return false;
    }
  }
  
  var phoneReg=new RegExp("^1[0-9]{10}$");
  function isPhone(phone){
	  return phoneReg.test(phone);
  }

  /**
  * QQ号码验证
  */
  function chkQQ() {
    if ($.trim($("#QQ").val()) != "") {
      var qq = $.trim($("#QQ").val());
      if (isQQ(qq)) {
        $("#mQQ").attr("class", "msg ok").html("");
        return true;
      } else {
        $("#mQQ").attr("class", "msg error").html("QQ号码不正确");
        return false;
      }
    } else {
      $("#mQQ").attr("class", "").html("");
      return true;
    }
  }
  
  var qqReg=new RegExp("^[0-9]{6,13}$");
  function isQQ(qq){
	  return qqReg.test(qq);
  }

  /**
  * 标题内容
  */
  function chkContent() {
    if ($.trim($("#Content").val()) != "") {
      $("#mContent").attr("class", "msg ok").html("");
      return true;
    } else {
      $("#mContent").attr("class", "msg error").html("反馈内容不能为空");
      return false;
    }
  }

  /**
  * 更换验证码
  */
  function changeValidateCode() {
    $("#imgValidateCode").attr("src","${pageContext.request.contextPath}/servlet/validateCodeServlet?"+Math.random());
  }

  /**
  * 判断验证码是否正确
  */
  function chkValidCodeExist() {
    if ($.trim($("#VCode").val()) == "") {
      $("#mVCode").attr("class", "msg error").html("请输入验证码");
      return false;
    }
    $.ajax({
      type: "get",
      url: "${pageContext.request.contextPath}/servlet/validateCodeServlet",
      data: { "validateCode": $.trim($("#VCode").val()) },
      beforeSend: function () {
        $("#mVCode").attr("class", "msg wait").html("正在验证...");
      },
      success: function (data) {
        if (data=="true") {
          $("#mVCode").attr("class", "msg ok").html("");
          return true;
        } else {
          $("#mVCode").attr("class", "msg error").html("验证码错误");
          return false;
        }
      },
      error: function () {
        return false;
      }
    });
  }

  /** 
  * 显示消息
  */
  var _arrInfo;
  function showInfo(event) {
    var key = $(this)[0].id;

    if (_arrInfo == undefined) {
      var arrInfo = new Array();
      arrInfo["Title"] = "请输入标题";
      arrInfo["Name"] = "请输入姓名";
      arrInfo["CertNo"] = "请输入15或18位身份证号";
      arrInfo["Email"] = "请输入邮箱，如：1234567@qq.com";
      arrInfo["Phone"] = "请输入您的电话号码或手机号码";
      arrInfo["QQ"] = "请输入您的QQ号码";
      arrInfo["Content"] = "请输入反馈内容";
      arrInfo["VCode"] = "请输入验证码";
    }
    $("#m" + key).attr("class", "msg info").html(arrInfo[key]);
  }

  /** 
  * 重置信息
  */
  function resetForm(event) {
    //重置输入框
    $("#Title").val("");
    $("#Name").val("");
    $("#CertNo").val("");
    $("#Email").val("");
    $("#Phone").val("");
    $("#QQ").val("");
    $("#Content").val("");
    $("#VCode").val("");
    //重置图片验证码
    changeValidateCode();
    //重置验证信息
    $("#mTitle").attr("class", "").html("");
    $("#mName").attr("class", "").html("");
    $("#mCertNo").attr("class", "").html("");
    $("#mEmail").attr("class", "").html("");
    $("#mPhone").attr("class", "").html("");
    $("#mQQ").attr("class", "").html("");
    $("#mContent").attr("class", "").html("");
    $("#mVCode").attr("class", "").html("");
  }

</script>
</body>
</html>