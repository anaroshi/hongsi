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
      <tr class = "dataRow">
        <td>${vo.saleDate}</td>
        <td>${vo.gubun}</td>
        <td>${vo.salePath}</td>
        <td class="text-right">${vo.ori_250}</td>
        <td class="text-right">${vo.ori_500}</td>
        <td class="text-right">${vo.ori_1000}</td>
        <td class="text-right">${vo.erl_250}</td>
        <td class="text-right">${vo.erl_500}</td>
        <td class="text-right">${vo.erl_1000}</td>
        <td class="text-right">${vo.sns_250}</td>
        <td class="text-right">${vo.sns_500}</td>
        <td class="text-right">${vo.sns_1000}</td>
        <td class="text-right">${vo.price}</td>
        <td>${vo.paymentPath}</td>
        <td>${vo.deleveryPath}</td>
      </tr>
</c:forEach>
    </tbody>
    <tfoot>
      	<tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <th class="text-right">${saleStock.ori_250_sum}</th>
	        <th class="text-right">${saleStock.ori_500_sum}</th>
	        <th class="text-right">${saleStock.ori_1000_sum}</th>
	        <th class="text-right">${saleStock.erl_250_sum}</th>
	        <th class="text-right">${saleStock.erl_500_sum}</th>
	        <th class="text-right">${saleStock.erl_1000_sum}</th>
	        <th class="text-right">${saleStock.sns_250_sum}</th>
	        <th class="text-right">${saleStock.sns_500_sum}</th>
	        <th class="text-right">${saleStock.sns_1000_sum}</th>
	        <td></td>
	        <td></td>
	        <td></td>
      	</tr>
    </tfoot>
  </table>
</div>
</div>
</body>
</html>