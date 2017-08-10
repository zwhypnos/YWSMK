<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>rejectOrderResult</title>
</head>
<body>
	<p>
	网关返回码:${rejectOrderResult.returnCode }<br />
	网关错误信息:${rejectOrderResult.errorMessage }<br />
	签名数据:${rejectOrderResult.signData }<br />
	商户号:${rejectOrderResult.rejectOrderResultData.merCode }<br />
	订单号:${rejectOrderResult.rejectOrderResultData.orderNum }<br />
	订单金额:${rejectOrderResult.rejectOrderResultData.orderAmt }<br />
	退款金额:${rejectOrderResult.rejectOrderResultData.rejectAmt }<br />
	银行流水:${rejectOrderResult.rejectOrderResultData.hostFlowNo }<br />
	交易结果:${rejectOrderResult.rejectOrderResultData.orderResult }<br />
	</p>
</body>
</html>