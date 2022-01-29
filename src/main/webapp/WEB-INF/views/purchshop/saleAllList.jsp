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
			<td colspan="15" class="text-center"><h5>판매 LIST</h5></td>    	
		</tr>
       <tr>
        <th  style="width: 10%">판매일</th>
        <th  style="width: 5%">구분</th>
        <th  style="width: 10%">주문</th>
        <th style="width: 5%; font-size: 9px">O250</th>
        <th style="width: 5%; font-size: 9px">O500</th>
        <th style="width: 5%; font-size: 9px">O1000</th>
        <th style="width: 5%; font-size: 9px">E250</th>
        <th style="width: 5%; font-size: 9px">E500</th>
        <th style="width: 5%; font-size: 9px">E1000</th>
        <th style="width: 5%; font-size: 9px">S250</th>
        <th style="width: 5%; font-size: 9px">S500</th>
        <th style="width: 5%; font-size: 9px">S1000</th>
        <th style="width: 10%">금액</th>
        <th style="width: 10%">지불방식</th>
        <th style="width: 10%">배송</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${saleList}" var="vo">
      <tr>
        <td>${vo.saleDate}</td>
        <td>${vo.gubun}</td>
        <td>${vo.salePath}</td>
        <td>${vo.ori_250}</td>
        <td>${vo.ori_500}</td>
        <td>${vo.ori_1000}</td>
        <td>${vo.erl_250}</td>
        <td>${vo.erl_500}</td>
        <td>${vo.erl_1000}</td>
        <td>${vo.sns_250}</td>
        <td>${vo.sns_500}</td>
        <td>${vo.sns_1000}</td>
        <td>${vo.price}</td>
        <td>${vo.paymentPath}</td>
        <td>${vo.deleveryPath}</td>
      </tr>
</c:forEach>
    </tbody>
  </table>
</div>
</div>
</body>
</html>