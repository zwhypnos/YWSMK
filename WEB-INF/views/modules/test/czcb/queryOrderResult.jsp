<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>queryOrderResult</title>
</head>
<body>
	<p>
	网关返回码:${orderQueryResult.returnCode }<br />
	网关错误信息:${orderQueryResult.errorMessage }<br />
	签名数据:${orderQueryResult.signData }<br />
	商户号:${orderQueryResult.orderQueryResultData.merCode }<br />
	订单号:${orderQueryResult.orderQueryResultData.orderNum }<br />
	订单金额:${orderQueryResult.orderQueryResultData.orderAmt }<br />
	订单时间:${orderQueryResult.orderQueryResultData.orderTime }<br />
	订单状态:${orderQueryResult.orderQueryResultData.orderState }<br />
	</p>
</body>
</html>