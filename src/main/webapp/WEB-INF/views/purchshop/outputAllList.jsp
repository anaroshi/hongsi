<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
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
		let query = "&page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};
		var url = "../view/outputModify.do?cno="+cno+"&locate=2"+query;
		
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
			<td colspan="15" class="text-center"><h5>M생산 LIST</h5></td>    	
		</tr>
       <tr>
        <th style="width: 8%">생산일</th>
        <th style="width: 8%">구분</th>
        <th style="width: 8%">ORI</th>
        <th style="width: 8%">ERL</th>
        <th style="width: 8%">STC</th>
        <th style="width: 8%">총생산량</th>
        <th style="width: 52%">비고</th>
      </tr>
    </thead>
    <tbody>
       	<c:set var="ori_sum" value="0"/>
       	<c:set var="erl_sum" value="0"/>
       	<c:set var="stc_sum" value="0"/>
		<c:forEach items="${outputList}" var="vo">	
	      	<tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
		       	<c:set var="ori_sum" value="${ori_sum + vo.ori}"/>
		       	<c:set var="erl_sum" value="${erl_sum + vo.erl}"/>
		       	<c:set var="stc_sum" value="${stc_sum + vo.stc}"/>
		        <td><fmt:formatDate value="${vo.outputDate}" pattern="yyyy-MM-dd" /></td>
		        <td>${vo.gubun}</td>
		        <td class="text-right">${vo.ori}</td>
		        <td class="text-right">${vo.erl}</td>
		        <td class="text-right">${vo.stc}</td>
		        <td class="text-right">${vo.ori+vo.erl+vo.stc}</td>
		        <td class="text-left">${vo.comm}</td>
	      	</tr>
		</c:forEach>
	</tbody>      
    <tfoot>
      	<tr>
	        <td></td>
	        <td></td>
	        <th class="text-right"><fmt:formatNumber value="${ori_sum}" /></th>
	        <th class="text-right"><fmt:formatNumber value="${erl_sum}" /></th>
	        <th class="text-right"><fmt:formatNumber value="${stc_sum}" /></th>
	        <th class="text-right"><fmt:formatNumber value="${ori_sum+erl_sum+stc_sum}" /></th>
	        <td></td>
      	</tr>
    </tfoot> 
  </table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="outputAllList.do" pageObject="${pageObject}" />
	</c:if>
</div>
</div>
</div>
</body>
</html>