<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 구매 리스트</title>

<style type="text/css">
</style>
  
<script>
function fn_view(cno) {	
	
	//alert(cno);
	var w = 1000;
	var h = 470;
	var url = "../view/buyModify.do?cno="+cno;
	
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

	window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
};  

</script>
</head>

<body>
<div class="container">
<div class="col-md-12">
  <table class="table table-striped">
   <thead>
   	<tr>
		<td colspan="9" class="text-center"><h5>재료 구매 LIST</h5></td>    	
	</tr>
	<tr>
        <th width="10%">주문일</th>
        <th width="10%">구분</th>
        <th width="10%">주문품</th>
        <th width="10%">용량(g)</th>
        <th width="10%">수량(개)</th>
        <th width="10%">금액(원)</th>
        <th width="10%">거래처</th>
        <th width="10%">입고일</th>
        <th width="20%">비고</th>
      </tr>
    </thead>
    <tbody>
    	<c:set var="contentSum" value="0"/>
    	<c:set var="qtySum" value="0"/>
    	<c:set var="priceSum" value="0"/>
<c:forEach items="${resultList}" var="vo" varStatus="status">	
 	<tr class="dataRow" onclick="fn_view(${vo.cno}); return false;"> 		
 		<c:set var="contentSum" value="${contentSum + vo.content}"/>
 		<c:set var="qtySum" value="${qtySum + vo.qty}"/>
 		<c:set var="priceSum" value="${priceSum + vo.price}"/>
 		<td class="cno" style="display:none">${vo.cno}</td>
        <td>${vo.buyDate}</td>
        <td>${vo.gubun}</td>
        <td>${vo.item}</td>
        <td class="text-right"><fmt:formatNumber value="${vo.content}" /></td>
        <td class="text-right"><fmt:formatNumber value="${vo.qty}" /></td>
        <td class="text-right"><fmt:formatNumber value="${vo.price}" /></td>
        <td>${vo.purShop}</td>
        <td>${vo.inDate}</td>
        <td>${vo.comm}</td>
    </tr>
</c:forEach>
	</tbody>
    <tfoot>    
  	<tr> 		
 		<td class="cno" style="display:none"></td>
        <td></td>
        <td></td>
        <td></td>
        <td class="text-right"><fmt:formatNumber value="${contentSum}" /></td>
        <td class="text-right"><fmt:formatNumber value="${qtySum}" /></td>
        <td class="text-right"><fmt:formatNumber value="${priceSum}" /></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tfoot>
</table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="buyAllList.do" pageObject="${pageObject}" />
	</c:if>
</div>
</div>
</div>
</body>
</html>