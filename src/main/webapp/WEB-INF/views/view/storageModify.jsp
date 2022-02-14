<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 입출고 수정</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/style.css">

<style type="text/css">
</style>

<script>
$( function() {
    $( "#buyDate" ).datepicker({
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

function fn_delete(cno) {
	if(confirm("삭제하시겠습니까")) {
		//alert(cno);		
		$.ajax({
			type: "POST",
			url: "storageDelete.do",
			async: false,
			data: "cno="+cno, // json(전송) 타입
			dtatType: "text"				
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+result+" -> xhr: "+xhr);
	        if(result=="ok") {
	        	alert("삭제완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchbook/storageAllList.do";				
	        	self.close();
			}
		})
		.fail(function(data, textStatus, errorThrown) {
			console.log("fail");
			alert("오류발생");
		});
	}	
};

function fn_update() {
	if(confirm("수정하시겠습니까")) {
		
		let formData = $("#frm").serialize();		
		//alert(JSON.stringify(formData));
		
		$.ajax({
			type: "POST",
			url: "storageUpdate.do",
			async: false,
			data: formData, // json(전송) 타입
			dataType: "text"					
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+JSON.stringify(result)+" -> xhr: "+ JSON.stringify(xhr));
	        if(result=="ok") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchbook/storageAllList.do";				
	        	self.close();
			} else {
				alert("수정 실패");	
			}
		})
		.fail(function(data, textStatus, errorThrown) {
			console.log("fail");
			alert("오류발생");
		});
	}	
};
</script>
</head>

<body>
<div class="container">
<form class="form-horizontal" method="post" id="frm" action="storageUpdate.do">
<input name = "cno" type="hidden" value="${storageInfo.cno}" />
<div class="row">
  <h4>재료 입출고 수정</h4>  	
	<!-- 재료 입출고 수정 Start --> 	
	<!-- 1블럭 Start -->
	<div class="col-sm-1"></div>
	<div class="col-sm-5">
		<div class="form-group">
	      <label for="buyDate" class="col-sm-3 control-label">입출고일</label>
	      <div class="col-sm-8">
	        <input class="form-control inputDate" id="buyDate" name="buyDate" type="text" required="required" value="${storageInfo.buyDate}">
	      </div>
		</div>
	    <div class="form-group">
	      <label for="item" class="col-sm-3 control-label">재료</label>
	      <div class="col-sm-8">
	      <select id="item" name="item" class="form-control select" required="required">
	      	<option value="*"></option>
		      <c:forEach items="${ingreList}" var="vo">
		      	<option value="${vo.code}" <c:if test="${storageInfo.item ==vo.code}">selected</c:if> >${vo.kname}</option>
		      </c:forEach>
	      </select>	        
	      </div>
		</div>
		<div class="form-group" id="gubunForm">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select" required="required">
	            <option value="출고" <c:if test="${storageInfo.gubun =='출고'}">selected</c:if> >출고</option>
	            <option value="출고_office" <c:if test="${storageInfo.gubun=='출고_office'}">selected</c:if> >출고_office</option>
	            <option value="출고_cafe" <c:if test="${storageInfo.gubun=='출고_office'}">selected</c:if> >출고_cafe</option>
	            <option value="입고_office" <c:if test="${storageInfo.gubun=='입고_office'}">selected</c:if> >입고_office</option>
	            <option value="입고_cafe" <c:if test="${storageInfo.gubun=='입고_cafe'}">selected</c:if> >입고_cafe</option>
	            <option value="손실" <c:if test="${storageInfo.gubun=='손실'}">selected</c:if> >손실</option>
			</select>
	      </div>
		</div>	    
			   
	    <div class="form-group">
			<label for="content" class="col-sm-3 control-label">용량</label>
			<div class="col-sm-8">
				<input class="form-control inputNumber" id="content" name="content" type="number" placeholder="content" required="required" value="${storageInfo.content}">		      
			</div>
	    </div>
	</div> 
	<!-- 1블럭 End -->
	
	<!-- 2블럭 Start -->
	<div class="col-sm-5">
		<div class="form-group">
	      <label for="comm" class="col-sm-3 control-label">비고</label>
	      <div class="col-sm-8">
	      	<textarea class="form-control" rows="5" id="comm" name="comm">${storageInfo.comm}</textarea>
	      </div>
	     </div>	     
	     <div class="form-group">
	      <label for="buyer" class="col-sm-3 control-label">담당자</label>
	      <div class="col-sm-8">
	      	<select id="buyer" name="buyer" class="form-control select">
	            <option value="홍동호" <c:if test="${storageInfo.buyer=='홍동호'}">selected</c:if> >홍동호</option>
	            <option value="대행인" <c:if test="${storageInfo.buyer=='대행인'}">selected</c:if> >대행인</option>
			</select>
	      </div>
 		</div>	    
	    <div class="form-group">
    	<div class="col-sm-1"></div>
    	<div class="col-sm-3"><button type="button" class="btn btn-block" id="orderUpdate" onclick="fn_update(); return false;">수정</button></div>
    	<div class="col-sm-3"><button type="button" class="btn btn-block" id="orderDelete" onclick="fn_delete(${storageInfo.cno}); return false;">삭제</button></div>
    	<div class="col-sm-4"><button type="button" class="btn btn-block" onclick="javascript:self.close();" >닫기</button></div> 
    	</div>

	</div>
	<!-- 2블럭 End -->	
	<!-- 재료주문 End -->
</div>
</form>
</div>
</body>
</html>