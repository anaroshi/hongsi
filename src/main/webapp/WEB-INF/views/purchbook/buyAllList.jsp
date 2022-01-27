<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchShop</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" rel="stylesheet">

<style type="text/css">
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}

.order_item {
 	font-size: 12px;
 	padding: 6px 4px;
 }
 
.btn, .select {
 	font-size: 12px;
 }
 
.btn:hover {
	background-color: #CCCCCC;
}

div.panel-body {
	padding-bottom: 7px;
}

.dataRow:hover {
	background: #ccc;
	cursor: pointer; 
}
</style>
  
<script>
  $( function() {
		
  });
  
  </script>
</head>

<body>
<div class="container">
<h4>주문 List</h4>
<div class="col-md-12">
  <table class="table table-striped">
   <thead> 	
	<tr>
        <th width="10%">주문일</th>
        <th width="10%">구분</th>
        <th width="10%">주문품</th>
        <th width="10%">용량</th>
        <th width="10%">수량</th>
        <th width="10%">금액</th>
        <th width="10%">거래처</th>
        <th width="10%">입고일</th>
        <th width="20%">비고</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${resultList}" var="vo" varStatus="status">
 	<tr class="dataRow">
 		<td class="cno" style="display:none">${vo.cno}</td>
        <td>${vo.buyDate}</td>
        <td>${vo.gubun}</td>
        <td>${vo.item}</td>
        <td class="text-right"><fmt:formatNumber value="${vo.content}" /></td>
        <td class="text-right"><fmt:formatNumber value="${vo.qty}" /></td>
        <td class="text-right"><fmt:formatNumber type="currency" value="${vo.price}" /></td>
        <td>${vo.purShop}</td>
        <td>${vo.inDate}</td>
        <td>${vo.comm}</td>
    </tr>
</c:forEach>
    </tbody>
</table>
</div>
</div>
</body>
</html>