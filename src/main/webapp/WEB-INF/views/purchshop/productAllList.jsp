<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산 리스트</title>

<style type="text/css">
</style>
  
<script>
  $( function() {

  });
  function fn_view(cno) {	
		
		//alert(cno);
		var w = 1000;
		var h = 470;
		var url = "../view/productModify.do?cno="+cno;
		
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
			<td colspan="15" class="text-center"><h5>생산 LIST</h5></td>    	
		</tr>
       <tr>
        <th style="width: 9%">생산일</th>
        <th style="width: 6%">구분</th>
        <th style="width: 6%">O250</th>
        <th style="width: 6%">O500</th>
        <th style="width: 6%">O1000</th>
        <th style="width: 6%">E250</th>
        <th style="width: 6%">E500</th>
        <th style="width: 6%">E1000</th>
        <th style="width: 6%">S250</th>
        <th style="width: 6%">S500</th>
        <th style="width: 6%">S1000</th>
        <th style="width: 6%">총갯수</th>
        <th style="width: 8%">총생산량</th>
        <th style="width: 17%">비고</th>
      </tr>
    </thead>
    <tbody>
       	<c:set var="ori_250_sum" value="0"/>
    	<c:set var="ori_500_sum" value="0"/>
    	<c:set var="ori_1000_sum" value="0"/>
       	<c:set var="erl_250_sum" value="0"/>
    	<c:set var="erl_500_sum" value="0"/>
    	<c:set var="erl_1000_sum" value="0"/>
       	<c:set var="stc_250_sum" value="0"/>
    	<c:set var="stc_500_sum" value="0"/>
    	<c:set var="stc_1000_sum" value="0"/>
    	<c:set var="totalProduct" value="0"/>
    	<c:set var="totalProduct_sum" value="0"/>
    	<c:set var="totalGram" value="0"/>
    	<c:set var="totalGram_sum" value="0"/>
<c:forEach items="${productList}" var="vo">	
      <tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
       	<c:set var="ori_250_sum" value="${ori_250_sum + vo.ori_250}"/>
    	<c:set var="ori_500_sum" value="${ori_500_sum + vo.ori_500}"/>
    	<c:set var="ori_1000_sum" value="${ori_1000_sum + vo.ori_1000}"/>
       	<c:set var="erl_250_sum" value="${erl_250_sum + vo.erl_250}"/>
    	<c:set var="erl_500_sum" value="${erl_500_sum + vo.erl_500}"/>
    	<c:set var="erl_1000_sum" value="${erl_1000_sum + vo.erl_1000}"/>
       	<c:set var="stc_250_sum" value="${stc_250_sum + vo.stc_250}"/>
    	<c:set var="stc_500_sum" value="${stc_500_sum + vo.stc_500}"/>
    	<c:set var="stc_1000_sum" value="${stc_1000_sum + vo.stc_1000}"/>
    	<c:set var="totalProduct" 
    		value="${vo.ori_250+vo.ori_500+vo.ori_1000+vo.erl_250+vo.erl_500+vo.erl_1000+vo.stc_250+vo.stc_500+vo.stc_1000}"/>
    	<c:set var="totalProduct_sum" 
    		value="${totalProduct_sum+totalProduct}"/>
        <td>${vo.productDate}</td>
        <td>${vo.gubun}</td>
        <td class="text-right">${vo.ori_250}</td>
        <td class="text-right">${vo.ori_500}</td>
        <td class="text-right">${vo.ori_1000}</td>
        <td class="text-right">${vo.erl_250}</td>
        <td class="text-right">${vo.erl_500}</td>
        <td class="text-right">${vo.erl_1000}</td>
        <td class="text-right">${vo.stc_250}</td>
        <td class="text-right">${vo.stc_500}</td>
        <td class="text-right">${vo.stc_1000}</td>
        <td class="text-right">${totalProduct}</td>
        <td class="text-right">${totalGram}</td>
        <td>${vo.comm}</td>
      </tr>
</c:forEach>
	</tbody>      
    <tfoot>
      	<tr>
	        <td></td>
	        <td></td>
	        <th class="text-right">${ori_250_sum}</th>
	        <th class="text-right">${ori_500_sum}</th>
	        <th class="text-right">${ori_1000_sum}</th>
	        <th class="text-right">${erl_250_sum}</th>
	        <th class="text-right">${erl_500_sum}</th>
	        <th class="text-right">${erl_1000_sum}</th>
	        <th class="text-right">${stc_250_sum}</th>
	        <th class="text-right">${stc_500_sum}</th>
	        <th class="text-right">${stc_1000_sum}</th>
	        <th class="text-right">${totalProduct_sum}</th>
	        <th>${totalGram_sum}</th>
      	</tr>
    </tfoot> 
  </table>
</div>
</div>
</body>
</html>