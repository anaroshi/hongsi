<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료구매 수정</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/style.css">
<!-- 재료 용량 등록 -->
<script type="text/javascript" src="/resources/js/item.js"></script>

<style type="text/css">
</style>  
<script>
  $( function() {
	
	//  입력 메세지 처리		
  	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
	  
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
    
    $( "#inDate" ).datepicker({
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
			url: "buyDelete.do",
			async: false,
			data: "cno="+cno, // json(전송) 타입
			dtatType: "text"				
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+result+" -> xhr: "+xhr);
	        if(result=="ok") {
	        	alert("삭제완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchbook/buyAllList.do";				
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
			url: "buyUpdate.do",
			async: false,
			data: formData, // json(전송) 타입
			dataType: "text"					
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+JSON.stringify(result)+" -> xhr: "+ JSON.stringify(xhr));
	        if(result=="ok") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchbook/buyAllList.do";				
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
<form class="form-horizontal" method="post" id="frm" action="buyUpdate.do">
<input name = "cno" type="hidden" value="${buyInfo.cno}" />
<div class="row">
  <h4>재료구매 수정</h4>  	
	<!-- 재료주문 Start -->
	<!-- 1블럭 Start -->
	<div class="col-sm-1"></div>
	<div class="col-sm-5">
	   <div class="form-group">
	      <label for="buyDate" class="col-sm-3 control-label">주문일</label>
	      <div class="col-sm-8">
	        <input class="form-control inputDate" id="buyDate" name="buyDate" type="text" required="required" value="${buyInfo.buyDate}">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="item" class="col-sm-3 control-label">주문품</label>
	      <div class="col-sm-8">
	      <select id="item" name="item" class="form-control select" required="required">
	      	<option value="*"></option>
	      <c:forEach items="${ingreList}" var="vo">
	      	<option value="${vo.code}" <c:if test="${buyInfo.item==vo.code}">selected</c:if> >${vo.kname}</option>
	      </c:forEach>
	      </select>	        
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select" required="required">
	            <option value="구매" <c:if test="${buyInfo.gubun=='구매'}">selected</c:if>>구매</option>
<%-- 	            <option value="교환" <c:if test="${buyInfo.gubun=='교환'}">selected</c:if>>교환</option> --%>
	            <option value="반품" <c:if test="${buyInfo.gubun=='반품'}">selected</c:if>>반품</option>
	            <option value="손실" <c:if test="${buyInfo.gubun=='손실'}">selected</c:if>>손실</option>
	            <option value="취소" <c:if test="${buyInfo.gubun=='취소'}">selected</c:if>>취소</option>
			</select>
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="content" class="col-sm-3 control-label">용량</label>
	      <div class="col-sm-8">
		      <select id="content" name="content" class="form-control select" required="required">
				<option value="${buyInfo.content}">${buyInfo.content}</option>	            
			  </select>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="qty" class="col-sm-3 control-label">수량</label>
	      <div class="col-sm-8">
	        <input class="form-control inputNumber" id="qty" name="qty" type="number" placeholder="qty" required="required" value="${buyInfo.qty}">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="price" class="col-sm-3 control-label">금액</label>
	      <div class="col-sm-8"> 
	      <div class="input-group">
	      	<span class="input-group-addon"><i class="fas fa-won-sign"></i></span>
			<input class="form-control inputNumber" type="number" id="price" name="price" required="required" value="${buyInfo.price}">
		  </div></div>
	    </div>
	</div> 
	<!-- 1블럭 End -->
	
	<!-- 2블럭 Start -->
	<div class="col-sm-5">
    <div class="form-group">
      <label for="purShop" class="col-sm-3 control-label">거래처</label>
      <div class="col-sm-8">
		<select id="purShop" name="purShop" class="form-control select" required="required">
			<option value="*"> </option>
            <option value="넛츠베리" <c:if test="${buyInfo.purShop=='넛츠베리'}">selected</c:if>>넛츠베리</option>
            <option value="네이버쇼핑" <c:if test="${buyInfo.purShop=='네이버쇼핑'}">selected</c:if>>네이버쇼핑</option>
            <option value="쿠팡" <c:if test="${buyInfo.purShop=='쿠팡'}">selected</c:if>>쿠팡</option>
		</select>
      </div>
    </div>
    <div class="form-group">
      <label for="inDate" class="col-sm-3 control-label">입고일자</label>
      <div class="col-sm-8">
       	<input class="form-control inputDate" type="text" id="inDate" name="inDate" value="${buyInfo.inDate}">
      </div>
    </div>
     <div class="form-group">
      <label for="comm" class="col-sm-3 control-label">내역</label>
      <div class="col-sm-8">
      	<textarea class="form-control" rows="5" id="comm" name="comm">${buyInfo.comm}</textarea>
      </div>
    </div>
     <div class="form-group">
      <label for="buyer" class="col-sm-3 control-label">구매자</label>
      <div class="col-sm-8">
      	<select id="buyer" name="buyer" class="form-control select">
            <option value="홍동호" <c:if test="${buyInfo.buyer=='홍동호'}">selected</c:if>>홍동호</option>
            <option value="대행인" <c:if test="${buyInfo.buyer=='대행인'}">selected</c:if>>대행인</option>
		</select>
      </div>
    </div>
    <div class="form-group">
    	<div class="col-sm-1"></div>
    	<div class="col-sm-3"><button type="button" class="btn btn-block" id="orderUpdate" onclick="fn_update(); return false;">수정</button></div>
    	<div class="col-sm-3"><button type="button" class="btn btn-block" id="orderDelete" onclick="fn_delete(${buyInfo.cno}); return false;">삭제</button></div>
    	<div class="col-sm-4"><button type="button" class="btn btn-block" onclick="javascript:self.close();" >닫기</button></div> 
    </div>
	</div> 
	<!-- 2블럭 End -->	
	
</div>
</form>
</div>
</body>
</html>