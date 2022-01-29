<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
</style>
  
<script>
  $( function() {

  });
  
  </script>
</head>

<body>
<div class="container">
<div class="col-md-12">
  <table class="table table-striped">
    <thead>
    	<tr>
			<td colspan="4" class="text-center"><h5>생산 LIST</h5></td>    	
		</tr>
      	<tr>
	        <th style="width: 20%">생산일</th>
	        <th style="width: 10%">구분</th>
	        <th style="width: 55%">내역</th>
	        <th style="width: 15%">비고</th>
      	</tr>
    </thead>
    <tbody>
<c:forEach items="${productList}" var="vo">
      <tr>
        <td>${vo.orderDate}</td>
        <td>${vo.gubun}</td>
        <td>${vo.ori_250_order}${vo.erl_250_order}${vo.sns_250_order}</td>
        <td>${vo.comm}</td>
      </tr>
</c:forEach>
    </tbody>
  </table>
</div>
</div>
</body>
</html>