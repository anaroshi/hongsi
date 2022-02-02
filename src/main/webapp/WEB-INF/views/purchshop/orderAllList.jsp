<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
		var h = 600;
		var url = "../view/orderModify.do?cno="+cno;
		
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
			<td colspan="13" class="text-center"><h5>주문 LIST</h5></td>    	
		</tr>
       <tr>
        <th  style="width: 8%">주문일</th>
        <th  style="width: 9%">구분</th>
        <th style="width: 7%">O250</th>
        <th style="width: 7%">O500</th>
        <th style="width: 7%">O1000</th>
        <th style="width: 7%">E250</th>
        <th style="width: 7%">E500</th>
        <th style="width: 7%">E1000</th>
        <th style="width: 7%">S250</th>
        <th style="width: 7%">S500</th>
        <th style="width: 7%">S1000</th>
        <th style="width: 8%">주문자</th>
		<th style="width: 12%">비고</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${orderList}" var="vo">
      <tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
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