<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 수정</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" rel="stylesheet">

<!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- flatpickr 날짜 입력 -->
<script type="text/javascript" src="/resources/js/flatpickr.js"></script>

<link rel="stylesheet" href="/resources/css/style.css">

<style type="text/css">
div.panel.panel-default {
	height: 120px;
}

.order_item {
	font-size: 12px;
	padding: 6px 4px;
}

</style>
<script>
function fn_delete(cno, locate) {
	
	if(confirm("삭제하시겠습니까")) {
		// alert(cno);		
		$.ajax({
			type: "POST",
			url: "orderDelete.do",
			async: false,
			data: "cno="+cno+"&locate="+locate, // json(전송) 타입
			dtatType: "text"				
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+result+" -> xhr: "+xhr);
			let query = "?page=${param.page}&perPageNum=${param.perPageNum}";
	        if(result=="ok1") {
	        	alert("삭제 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/order.do"+query;				
	        	self.close();
			} else if(result=="ok2") {
	        	alert("삭제 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/orderAllList.do"+query;				
	        	self.close();
			} else {
					alert("삭제 실패");	
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
		
		// 주문량 입력 유효성 검사
 		let ori_250 = $("#ori_250").val();
  		if(ori_250 == null || ori_250 =="" || typeof ori_250 == "undefined" || ori_250 >= 10000) ori_250 = 0; 
  		$("#ori_250").val(ori_250);
  		let ori_500 = $("#ori_500").val();
		if(ori_500 == null || ori_500 =="" || typeof ori_500 == "undefined" || ori_500 >= 10000) ori_500 = 0; 
		$("#ori_500").val(ori_500);
		let ori_1000 = $("#ori_1000").val();
		if(ori_1000 == null || ori_1000 =="" || typeof ori_1000 == "undefined" || ori_1000 >= 10000) ori_1000 = 0; 
		$("#ori_1000").val(ori_1000);
		
		let erl_250 = $("#erl_250").val();
		if(erl_250 == null || erl_250 =="" || typeof erl_250 == "undefined" || erl_250 >= 2000) erl_250 = 0; 
		$("#erl_250").val(erl_250);
		let erl_500 = $("#erl_500").val();
		if(erl_500 == null || erl_500 =="" || typeof erl_500 == "undefined" || erl_500 >= 5000) erl_500 = 0; 
		$("#erl_500").val(erl_500);
		let erl_1000 = $("#erl_1000").val();
		if(erl_1000 == null || erl_1000 =="" || typeof erl_1000 == "undefined" || erl_1000 >= 10000) erl_1000 = 0; 
		$("#erl_1000").val(erl_1000);
		
		let stc_250 = $("#stc_250").val();
		if(stc_250 == null || stc_250 =="" || typeof stc_250 == "undefined" || stc_250 >= 2000) stc_250 = 0; 
		$("#stc_250").val(stc_250);
		let stc_500 = $("#stc_500").val();
		if(stc_500 == null || stc_500 =="" || typeof stc_500 == "undefined" || stc_500 >= 5000) stc_500 = 0; 
		$("#stc_500").val(stc_500);
		let stc_1000 = $("#stc_1000").val();
		if(stc_1000 == null || stc_1000 =="" || typeof stc_1000 == "undefined" || stc_1000 >= 10000) stc_1000 = 0; 
		$("#stc_1000").val(stc_1000);

		if((ori_250+ori_500+ori_1000+erl_250+erl_500+erl_1000+stc_250+stc_500+stc_1000)==0) {
		      alert('주문 제품의 수량을 넣어주세요!');
		      $("#ori_250").select();
		      return false;
	    }
		
		let orderDate = $("#orderDate").val();		
		if( orderDate== null || orderDate ==""  || orderDate.length<10)  {
			alert('주문일을 입력해주세요!');
			$("#orderDate").select();
		      return false;
	    }
		
		// alert(cno);
		let formData = $("#frm").serialize();
		//alert(JSON.stringify(formData));
		
		$.ajax({
			type: "POST",
			url: "orderUpdate.do",
			async: false,
			data: formData, // json(전송) 타입
			dataType: "text"					
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+JSON.stringify(result)+" -> xhr: "+ JSON.stringify(xhr));
	        if(result=="ok1") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/order.do";				
	        	self.close();
			} else if(result=="ok2") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/orderAllList.do";				
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
		<form class="form-horizontal" method="post" id="frm"
			action="buyUpdate.do">
			<input name="cno" type="hidden" value="${orderInfo.cno}" />
			<input name="locate" type="hidden" value="${locate}" />
			<div class="row">
				<h4>주문 수정</h4>
				<!-- 주문 Start -->
				<!-- 1블럭 Start -->
				<div class="col-sm-1"></div>
				<div class="col-sm-5">
					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">Original</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-4">
									<label for="ori_250">250g</label> <input
										class="form-control order_item" id="ori_250" name="ori_250"
										type="number" pattern="[0-9]{4}" value="${orderInfo.ori_250}">
								</div>
								<div class="col-xs-4">
									<label for="ori_500">500g</label> <input
										class="form-control order_item" id="ori_500" name="ori_500"
										type="number" pattern="[0-9]{4}" value="${orderInfo.ori_500}">
								</div>
								<div class="col-xs-4">
									<label for="ori_1000">1,000g</label> <input
										class="form-control order_item" id="ori_1000" name="ori_1000"
										type="number" pattern="[0-9]{4}" value="${orderInfo.ori_1000}">
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">Earlgrey</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-4">
									<label for="erl_250">250g</label> <input
										class="form-control order_item" id="erl_250" name="erl_250"
										type="number" pattern="[0-9]{4}" value="${orderInfo.erl_250}">
								</div>
								<div class="col-xs-4">
									<label for="erl_500">500g</label> <input
										class="form-control order_item" id="erl_500" name="erl_500"
										type="number" pattern="[0-9]{4}" value="${orderInfo.erl_500}">
								</div>
								<div class="col-xs-4">
									<label for="erl_1000">1,000g</label> <input
										class="form-control order_item" id="erl_1000" name="erl_1000"
										type="number" pattern="[0-9]{4}" value="${orderInfo.erl_1000}">
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">SaltCaramel</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-4">
									<label for="stc_250">250g</label> <input
										class="form-control order_item" id="stc_250" name="stc_250"
										type="number" pattern="[0-9]{4}" value="${orderInfo.stc_250}">
								</div>
								<div class="col-xs-4">
									<label for="stc_500">500g</label> <input
										class="form-control order_item" id="stc_500" name="stc_500"
										type="number" pattern="[0-9]{4}" value="${orderInfo.stc_500}">
								</div>
								<div class="col-xs-4">
									<label for="stc_1000">1,000g</label> <input
										class="form-control order_item" id="stc_1000" name="stc_1000"
										type="number" pattern="[0-9]{4}" value="${orderInfo.stc_1000}">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 1블럭 End -->

				<!-- 2블럭 Start -->
				<div class="col-sm-5">
					<div class="form-group">
						<label for="orderDate" class="col-sm-3 control-label">주문일자</label>
						<div class="col-sm-8">
							<input class="form-control inputDate flatpickr flatpickr-input" id="orderDate" name="orderDate" 
									style="background: #FFFFFF;" type="text" value="${orderInfo.orderDate}" required="required" placeholder="일자를 선택해주세요" data-input>
						</div>
					</div>
					<div class="form-group">
						<label for="gubun" class="col-sm-3 control-label">구분</label>
						<div class="col-sm-8">
							<select id="gubun" name="gubun" class="form-control select">
								<option value="주문" <c:if test="${orderInfo.gubun=='주문'}">selected</c:if> >주문</option>
<%-- 								<option value="교환" <c:if test="${orderInfo.gubun=='교환'}">selected</c:if> >교환</option> --%>
<%-- 								<option value="반품" <c:if test="${orderInfo.gubun=='반품'}">selected</c:if> >반품</option> --%>
<%-- 								<option value="손실" <c:if test="${orderInfo.gubun=='손실'}">selected</c:if> >손실</option> --%>
								<option value="주문취소" <c:if test="${orderInfo.gubun=='주문취소'}">selected</c:if> >주문취소</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="salePath" class="col-sm-3 control-label">주문경로</label>
						<div class="col-sm-8">
							<select id="gubun" name="salePath" class="form-control select">
								<option value="개별구매" <c:if test="${orderInfo.salePath=='개별구매'}">selected</c:if> >개별구매</option>
								<option value="NAVER쇼핑" <c:if test="${orderInfo.salePath=='NAVER'}">selected</c:if> >NAVER쇼핑</option>
								<option value="Homepage" <c:if test="${orderInfo.salePath=='Homepage'}">selected</c:if> >Homepage</option>
								<option value="쎈인생블로거" <c:if test="${orderInfo.salePath=='쎈인생블로거'}">selected</c:if> >쎈인생블로거</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="orderer" class="col-sm-3 control-label">주문자</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="orderer"
								name="orderer" value="${orderInfo.orderer}">
						</div>
					</div>
					<div class="form-group">					
						<label for="comm" class="col-sm-3 control-label">내역</label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="5" id="comm" name="comm">${orderInfo.comm}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="manager" class="col-sm-3 control-label">담당자</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="" name="manager" value="${orderInfo.manager}">
						</div>
					</div>
	
					<div class="form-group">
						<div class="col-sm-1"></div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-block" id="orderUpdate"
								onclick="fn_update(); return false;">수정</button>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-block" id="orderDelete"
								onclick="fn_delete(${orderInfo.cno},${locate}); return false;">삭제</button>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-block"
								onclick="javascript:self.close();">닫기</button>
						</div>
					</div>
				</div>	
				<!-- 2블럭 End -->
	</div>
	</form>
	</div>
</body>
</html>