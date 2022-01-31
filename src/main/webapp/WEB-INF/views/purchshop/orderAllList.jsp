<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchShop</title>

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

tfoot {
	border-color: #F9F9F9;
	border-top: 2px double;
	border-bottom: 1px solid;
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
			<td colspan="13" class="text-center"><h5>주문 LIST</h5></td>    	
		</tr>
       <tr>
        <th  style="width: 8%">주문일</th>
        <th  style="width: 5%">구분</th>
        <th style="width: 8%">O250</th>
        <th style="width: 8%">O500</th>
        <th style="width: 8%">O1000</th>
        <th style="width: 8%">E250</th>
        <th style="width: 8%">E500</th>
        <th style="width: 8%">E1000</th>
        <th style="width: 8%">S250</th>
        <th style="width: 8%">S500</th>
        <th style="width: 8%">S1000</th>
        <th style="width: 8%">주문자</th>
		<th style="width: 7%">비고</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${orderList}" var="vo">
      <tr>
        <td>${vo.orderDate}</td>
        <td>${vo.gubun}</td>
        <td class="text-right">${vo.ori_250}</td>
        <td class="text-right">${vo.ori_500}</td>
        <td class="text-right">${vo.ori_1000}</td>
        <td class="text-right">${vo.erl_250}</td>
        <td class="text-right">${vo.erl_500}</td>
        <td class="text-right">${vo.erl_1000}</td>
        <td class="text-right">${vo.sns_250}</td>
        <td class="text-right">${vo.sns_500}</td>
        <td class="text-right">${vo.sns_1000}</td>
        <td>${vo.orderer}</td>
		<td>${vo.comm}</td>
      </tr>
</c:forEach>
    </tbody>     
    <tfoot>
      	<tr>
	        <td></td>
	        <td></td>
	        <th class="text-right">${orderStock.ori_250_sum}</th>
	        <th class="text-right">${orderStock.ori_500_sum}</th>
	        <th class="text-right">${orderStock.ori_1000_sum}</th>
	        <th class="text-right">${orderStock.erl_250_sum}</th>
	        <th class="text-right">${orderStock.erl_500_sum}</th>
	        <th class="text-right">${orderStock.erl_1000_sum}</th>
	        <th class="text-right">${orderStock.sns_250_sum}</th>
	        <th class="text-right">${orderStock.sns_500_sum}</th>
	        <th class="text-right">${orderStock.sns_1000_sum}</th>
	        <td></td>
	        <td></td>
      	</tr>
    </tfoot>
  </table>
</div>
</div>
</body>
</html>