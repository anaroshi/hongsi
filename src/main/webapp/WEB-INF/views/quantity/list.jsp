<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quantity</title>
</head>
<body>
<h1>List</h1>
<c:forEach items="${resultList}" var="vo">
${vo}<br>
<!-- QuantityVO(cno=34, code=SNS_100_001, name=SNS_100, amount=100, ingredient=Whole Wheat, igt_code=in_028, qty=4) -->
</c:forEach>
</body>
</html>