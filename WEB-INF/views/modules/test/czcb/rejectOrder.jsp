<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>rejectOrder</title>
</head>
<body>
	<form action="rejectOrder" method="get">
		原订单号：<input type="text" name="originalOrderNum" value=""><br />
		原订单时间：<input type="text" name="originalOrderTime" value=""><br />
		订单金额：<input type="text" name="orderAmt" value=""><br />
		退款金额：<input type="text" name="rejectAmt" value=""><br />
		<input type="submit" value="退款">
	</form>
</body>
</html>