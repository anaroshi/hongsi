<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchShop</title>

<style type="text/css">
</style>
  
<script>
  $( function() {

  });
  function fn_view(cno) {	
		
		//alert(cno);
		var w = 1000;
		var h = 470;
		let query = "&page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};
		var url = "../view/packModify.do?cno="+cno+"&locate=2"+query;
		
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
	<input type="hidden" name="page" id="page" value="1">
	<input type="hidden" name="perPageNum" id="perPageNum" value="${pageObject.perPageNum}">
  <table class="table table-striped">
    <thead>
    	<tr>
			<td colspan="9" class="text-center"><h5>부자재 주문 LIST</h5></td>    	
		</tr>
       <tr>
        <th style="width: 10%">주문일</th>
        <th colspan="2">주문품</th>
        <th style="width: 8%">수량</th>
        <th style="width: 10%">금액</th>
        <th style="width: 15%">거래처</th>
        <th style="width: 10%">입고일</th>
        <th style="width: 8%">구매자</th>
        <th style="width: 20%">비고</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${packList}" var="vo">
      <tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
    	<td><fmt:formatDate value="${vo.buyDate}" pattern="yyyy-MM-dd" /></td>
        <td style="width: 8%" data-pack_code="${vo.pack_code}">${vo.pack_name}</td>       
        <td style="width: 21%" data-code="${vo.code}">${vo.name}</td>
        <td class="text-right">${vo.qty}</td>
        <td class="text-right">${vo.price}</td>
        <td>${vo.purShop}</td>
        <td><fmt:formatDate value="${vo.inDate}" pattern="yyyy-MM-dd" /></td>
        <td>${vo.buyer}</td>
        <td>${vo.comm}</td>
      </tr>
</c:forEach>
    </tbody>     
  </table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="packAllList.do" pageObject="${pageObject}" />
	</c:if>
</div>  
</div>
</div>
</body>
</html>