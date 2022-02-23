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
	  
// 	startWith();
	  
// 	function startWith() {
// 		// 화면 로드시 커서가 위치하게
// 		$("#buyDate").focus();	  
// 	};
});

// 유효성 검사
function formCheck() {
	let buyDate = $("#buyDate").val();		
	if( buyDate== null || buyDate ==""  || buyDate.length<10)  {
		alert('주문일을 입력해주세요!');
		$("#buyDate").select();
	      return false;
    }

    return true;
};

function fn_view(cno) {	
	
	//alert(cno);
	var w = 1000;
	var h = 470;
	// &buyDate=${param.buyDate}
	//let query = "&page=${param.page}&perPageNum=${param.perPageNum}";	
	var url = "../view/storageModify.do?cno="+cno;
	
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

	window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
};

//좌측 재료 리스트에서 재료를 선택하면 주문품이 선택된 재료로 셋팅된다.
function fn_item(kname) {	
	let itemOption = new Array();
//	console.log("--------------------"+kname);
	itemOption.push(`<option value=""></option>`);
	<c:forEach items="${ingreList}" var="vo">
		if('${vo.kname}' == kname) {
			itemOption.push(`<option value="${vo.code}" selected >${vo.kname}</option>`);
		} else {
			itemOption.push(`<option value="${vo.code}" >${vo.kname}</option>`);
		}
  	</c:forEach>
  	
  	$("#item").html(itemOption);
};
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
					<tr class="dataRow" onclick="fn_item('${vo.kname}'); return false;">
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
	<form class="form-horizontal" method="post" id="frm" onsubmit="return formCheck()">	
<!-- 	<input class="form-control inputDate" id="inDate" name="inDate" type="hidden" value=""> -->
	<!-- 재료 입출고 입력 Start -->
	<!-- 1블럭 Start -->
	<div class="col-sm-3">
		<div class="form-group">
	      <label for="buyDate" class="col-sm-3 control-label">입출고일</label>
	      <div class="col-sm-8">
	      	<input class="form-control inputDate flatpickr flatpickr-input" id="buyDate" name="buyDate" type="text" 
	      			style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
	      </div>
		</div>
	    <div class="form-group">
	      <label for="item" class="col-sm-3 control-label">재료</label>
	      <div class="col-sm-8">
	      <select id="item" name="item" class="form-control select" required="required">
	      	<option value=""></option>
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
			    <div class="col-sm-3">
					<button type="reset" class="btn btn-block">초기화</button>
			    </div>
			    <div class="col-sm-3">
			    	<button type="submit" class="btn btn-block">저장</button>
			    </div>	
			    <div class="col-sm-3">
			    	<button type="button" onclick="location.href='storageAllList.do'" class="btn btn-block">리스트</button>
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
	        <th width="19%">입출고일</th>
	        <th width="16%">구분</th>
	        <th width="21%">재료</th>	        
	        <th width="14%">용량</th>
	        <th width="30%">비고</th>
	      </tr>
	    </thead>
	    <tbody>
	<c:forEach items="${resultList}" var="vo" varStatus="status">
	 	<tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
	 		<td class="cno" style="display:none">${vo.cno}</td>
	        <td class="buyDate">${vo.buyDate}</td>
	        <td class="gubun">${vo.gubun}</td>	        
	        <td class="kname">${vo.kname}</td>
	        <td class="content text-right"><fmt:formatNumber value="${vo.content}" /> g</td>
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
	<!-- 재료 입출고 List End  -->

	</div>
</div>
</div>
</body>
</html>