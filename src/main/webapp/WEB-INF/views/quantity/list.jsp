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
<div class="container">
	<h4>재료 함량</h4>
  	<p>ITEM별 100G에 함유되는 재료량</p>
<div class="row">  

<c:forEach items="${itemList}" var="itemVO">
<div class="col-md-3">
<div class="panel panel-default">
	<div class="panel-heading">${itemVO.name}</div>
	<div class="panel-body">

<c:forEach items="${itemTypeList}" var="itemTypeVO">
<c:if test="${itemVO.code eq itemTypeVO.itemcode}">     
  <table class="table table-striped">
    <thead>
      <tr align="right">
        <th colspan="2" class="text-right">${itemTypeVO.amount}g</th>
      </tr>
      <tr>
        <th>Ingredient</th>
        <th>Quantity (g)</th>
      </tr>
    </thead>
    <tbody>
	<c:forEach items="${qtyList}" var="vo">	
	<c:if test="${itemTypeVO.code eq vo.code}">
		<tr class="dataRow">
	        <td>${vo.ingredient}</td>
	        <td class="text-right">${vo.qty}</td>
		</tr>
	</c:if>
	</c:forEach> <!-- qtyList End --> 
    </tbody>
  </table>
</c:if>       
</c:forEach> <!-- itemTypeList End --> 
</div>
</div>
</div>

</c:forEach> <!-- itemList End --> 
</div> 
</div>
</html>