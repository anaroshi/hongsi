<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	    	<td colspan="7" class="text-center"><h5>재료 입출고 LIST</h5></td>    	
	    </tr>
		<tr>
	        <th width="15%">입출고일</th>
	        <th width="15%">구분</th>
	        <th width="30%">재료</th>
	        <th style="display:none">재료</th>
	        <th width="15%">용량</th>
	        <th width="25%">비고</th>
	      </tr>
	</thead>
	<tbody>
	<c:forEach items="${resultList}" var="vo" varStatus="status">
	 	<tr class="dataRow">
	 		<td class="cno" style="display:none">${vo.cno}</td>
	        <td class="buyDate">${vo.buyDate}</td>
	        <td class="gubun">${vo.gubun}</td>
	        <td class="item" style="display:none">${vo.item}</td>
	        <td class="kname">${vo.kname}</td>
	        <td class="content text-right">${vo.content} g</td>
	        <td class="comm">${vo.comm}</td>
	    </tr>
	</c:forEach>
	</tbody>
    <tfoot>
      	<tr>
<!-- 	        <td></td> -->
<!-- 	        <td></td> -->
<!-- 	        <td></td> -->
<%-- 	        <th class="text-right">${saleStock.ori_250_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.ori_500_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.ori_1000_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.erl_250_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.erl_500_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.erl_1000_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.sns_250_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.sns_500_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.sns_1000_sum}</th> --%>
<!-- 	        <td></td> -->
<!-- 	        <td></td> -->
<!-- 	        <td></td> -->
      	</tr>
    </tfoot>
</table>
</div>
</div>
</body>
</html>