<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchBook</title>

<style type="text/css">

</style>

<script>
  $( function() {	  
	  
	startWith();
	  
	function startWith() {
		// 화면 로드시 커서가 위치하게
		$("#buyDate").focus();	  
	};

	$("#buyDate").datepicker({
		changeMonth: true,
		changeYear: true,
		minDate: '-50y', 
		nextText: '다음 달', 
		prevText: '이전 달', 
		yearRange: 'c-3:c+3', 
		showButtonPanel: true, 
		currentText: '오늘 날짜', 
		closeText: '닫기', 
		dateFormat: "yy-mm-dd", 
		showAnim: "slide", 
		showMonthAfterYear: true, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
      
    });		
});
  </script>
</head>
<body>
<div class="container">
<div class="row">
  <h4>재료 입출고 입력</h4>
		<!-- 재고량 보이기 Start -->
	<div class="col-md-4">
		<table class="table">
			<thead>
				<tr>
					<th>재료</th>
					<th>재고 (g)</th>
					<th>금주</th>
					<th>Cafe</th>
					<th>이동</th>
				</tr>
			</thead>
			<tbody>
 				<c:forEach items="${ingreTotalList}" var="vo" varStatus="status">
 				<c:if test="${vo.total ne '0'}">
					<tr class="dataRow">
						<td class="text-center">${vo.kname}</td>
						<td class="text-right" id="need_${status.count}"><fmt:formatNumber value="${vo.total}" /></td>
						<td class="text-right" id="need_${status.count}"><fmt:formatNumber value="${vo.needSum}" /></td>
						<td class="text-right" id="need_${status.count}"><fmt:formatNumber value="${vo.sumCafe}" /></td>
						<td class="text-right" id="need_${status.count}"><c:if test="${vo.sumOffice<0}">0</c:if><c:if test="${vo.sumOffice>=0}"><fmt:formatNumber value="${vo.sumOffice}" /></c:if></td>
					</tr>
				</c:if>	
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 재고량 보이기 End -->
	<form class="form-horizontal" method="post">	
<!-- 	<input class="form-control inputDate" id="inDate" name="inDate" type="hidden" value=""> -->
	<!-- 재료 입출고 입력 Start -->
	<!-- 1블럭 Start -->
	<div class="col-sm-3">
		<div class="form-group">
	      <label for="buyDate" class="col-sm-3 control-label">입출고일</label>
	      <div class="col-sm-8">
	        <input class="form-control inputDate" id="buyDate" name="buyDate" type="text" required="required">
	      </div>
		</div>
	    <div class="form-group">
	      <label for="item" class="col-sm-3 control-label">재료</label>
	      <div class="col-sm-8">
	      <select id="item" name="item" class="form-control select" required="required">
	      	<option value="*"></option>
		      <c:forEach items="${ingreList}" var="vo">
		      	<option value="${vo.code}">${vo.kname}</option>
		      </c:forEach>
	      </select>	        
	      </div>
		</div>
		<div class="form-group" id="gubunForm">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select" required="required">
	            <option value="출고">출고</option>
	            <option value="출고_office">출고_office</option>
	            <option value="출고_cafe">출고_cafe</option>
	            <option value="입고_office">입고_office</option>
	            <option value="입고_cafe">입고_cafe</option>
	            <option value="손실">손실</option>
			</select>
	      </div>
		</div>	    
			   
	    <div class="form-group">
			<label for="content" class="col-sm-3 control-label">용량</label>
			<div class="col-sm-8">
				<input class="form-control inputNumber" id="content" name="content" type="number" required="required">		      
			</div>
	    </div>

		<div class="form-group">
	      <label for="comm" class="col-sm-3 control-label">비고</label>
	      <div class="col-sm-8">
	      	<textarea class="form-control" rows="5" id="comm" name="comm"></textarea>
	      </div>
	     </div>
	     
	     <div class="form-group">
	      <label for="buyer" class="col-sm-3 control-label">담당자</label>
	      <div class="col-sm-8">
	      	<select id="buyer" name="buyer" class="form-control select">
	            <option value="홍동호">홍동호</option>
	            <option value="대행인">대행인</option>
			</select>
	      </div>
 		</div>

		<div class="row">
	    <div class="form-group">
		    <div class="col-sm-2"></div>
		    <div class="col-sm-9">
		    	<button type="submit" class="btn btn-block">저장</button>
		    </div>	
	    </div>
	    </div>
    </div>
    </form>    
	<!-- 2블럭 End -->
	<!-- 재료주문 End -->

	<!-- 재료 입출고  List Start -->
	<div class="col-md-5">
	<table class="table table-striped">
	   <thead>    
		<tr>
	        <th width="20%">입출고일</th>
	        <th width="17%">구분</th>
	        <th width="21%">재료</th>	        
	        <th width="12%">용량</th>
	        <th width="30%">비고</th>
	      </tr>
	    </thead>
	    <tbody>
	<c:forEach items="${resultList}" var="vo" varStatus="status">
	 	<tr class="dataRow">
	 		<td class="cno" style="display:none">${vo.cno}</td>
	        <td class="buyDate">${vo.buyDate}</td>
	        <td class="gubun">${vo.gubun}</td>	        
	        <td class="kname">${vo.kname}</td>
	        <td class="content text-right">${vo.content} g</td>
	        <td class="kname">${vo.comm}</td>
	    </tr>
	</c:forEach>
	    </tbody>
	</table>
	<div class="text-center">
		<c:if test="${pageObject.totalPage>1}" >		
			<pageObject:pageNav listURI="storage.do" pageObject="${pageObject}" />
		</c:if>
	</div>
	</div> 
	<!-- 재료 입출고 List End  -->

	</div>
</div>
</body>
</html>