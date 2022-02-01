<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 수정</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	rel="stylesheet">

<link rel="stylesheet" href="/resources/css/style.css">

<style type="text/css">
.order_item {
	font-size: 12px;
	padding: 6px 4px;
}

div.panel-body {
	padding: 8px 0px 0px;
	height: 63px;
}
</style>
<script>

$( function() {

    $( "#saleDate" ).datepicker({
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

    $( "#deleveryDate" ).datepicker({
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
    
    $( "#orderDate" ).datepicker({
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
		// alert(cno);		
		$.ajax({
			type: "POST",
			url: "saleDelete.do",
			async: false,
			data: "cno="+cno, // json(전송) 타입
			dtatType: "text"				
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+result+" -> xhr: "+xhr);
	        if(result=="ok") {
	        	alert("삭제완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/saleAllList.do";				
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
		
		// 판매량 입력 유효성 검사
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
		
		let sns_250 = $("#sns_250").val();
		if(sns_250 == null || sns_250 =="" || typeof sns_250 == "undefined" || sns_250 >= 2000) sns_250 = 0; 
		$("#sns_250").val(sns_250);
		let sns_500 = $("#sns_500").val();
		if(sns_500 == null || sns_500 =="" || typeof sns_500 == "undefined" || sns_500 >= 5000) sns_500 = 0; 
		$("#sns_500").val(sns_500);
		let sns_1000 = $("#sns_1000").val();
		if(sns_1000 == null || sns_1000 =="" || typeof sns_1000 == "undefined" || sns_1000 >= 10000) sns_1000 = 0; 
		$("#sns_1000").val(sns_1000);

		if((ori_250+ori_500+ori_1000+erl_250+erl_500+erl_1000+sns_250+sns_500+sns_1000)==0) {
		      alert('주문 제품의 수량을 넣어주세요!');
		      $("#ori_250").select();
		      return false;
	    }
		
		let saleDate = $("#saleDate").val();		
		if( saleDate== null || saleDate ==""  || saleDate.length<10)  {
			alert('판매일을 입력해주세요!');
			$("#saleDate").select();
		      return false;
	    }
		
		// alert(cno);
		let formData = $("#frm").serialize();		
		alert(JSON.stringify(formData));
		
		$.ajax({
			type: "POST",
			url: "saleUpdate.do",
			async: false,
			data: formData, // json(전송) 타입
			dataType: "text"	
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+JSON.stringify(result)+" -> xhr: "+ JSON.stringify(xhr));
	        if(result=="ok") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/saleAllList.do";				
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
			<input name="cno" type="hidden" value="${saleInfo.cno}" />
			<div class="row">
				<h4>판매 수정</h4>
				<!-- 판매 Start -->
				<!-- 1블럭 Start -->
				<div class="col-sm-3" style="margin-left: 20px;">
					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">ORIGINAL</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-4">
									<label for="ori_250">250g</label>
									<input class="form-control order_item" id="ori_250" name="ori_250" type="number" pattern="[0-9]{4}" value="${saleInfo.ori_250}" >
								</div>
								<div class="col-xs-4">
									<label for="ori_500">500g</label>
									<input class="form-control order_item" id="ori_500" name="ori_500" type="number" pattern="[0-9]{4}" value="${saleInfo.ori_500}" >
								</div>
								<div class="col-xs-4">
									<label for="ori_1000">1,000g</label>
									<input class="form-control order_item" id="ori_1000" name="ori_1000" type="number" pattern="[0-9]{4}" value="${saleInfo.ori_1000}" >
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">EARLGREY</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-4">
									<label for="erl_250">250g</label>
									<input class="form-control order_item" id="erl_250" name="erl_250" type="number" pattern="[0-9]{4}" value="${saleInfo.erl_250}" >
								</div>
								<div class="col-xs-4">
									<label for="erl_500">500g</label>
									<input class="form-control order_item" id="erl_500" name="erl_500" type="number" pattern="[0-9]{4}" value="${saleInfo.erl_500}" >
								</div>
								<div class="col-xs-4">
									<label for="erl_1000">1,000g</label>
									<input class="form-control order_item" id="erl_1000" name="erl_1000" type="number" pattern="[0-9]{4}" value="${saleInfo.erl_1000}" >
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">SWEET &amp; SALTY</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-4">
									<label for="sns_250">250g</label>
									<input class="form-control order_item" id="sns_250" name="sns_250" type="number" pattern="[0-9]{4}" value="${saleInfo.sns_250}" >
								</div>
								<div class="col-xs-4">
									<label for="sns_500">500g</label>
									<input class="form-control order_item" id="sns_500" name="sns_500" type="number" pattern="[0-9]{4}" value="${saleInfo.sns_500}" >
								</div>
								<div class="col-xs-4">
									<label for="sns_1000">1,000g</label>
									<input class="form-control order_item" id="sns_1000" name="sns_1000" type="number" pattern="[0-9]{4}" value="${saleInfo.sns_1000}" >
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 1블럭 End -->

				<!-- 2블럭 Start -->
				<div class="col-sm-4" style="margin-left: 30px;">
					<div class="form-group">
						<label for="saleDate" class="col-sm-3 control-label">판매일</label>
						<div class="col-sm-8">
							<input class="form-control inputDate" id="saleDate"
								name="saleDate" type="text" required="required" value="${saleInfo.saleDate}" >
						</div>
					</div>

					<div class="form-group">
						<label for="gubun" class="col-sm-3 control-label">구분</label>
						<div class="col-sm-8">
							<select id="gubun" name="gubun" class="form-control select">
								<option value="판매" <c:if test="${saleInfo.gubun=='주문'}">selected</c:if>>판매</option>
								<option value="교환출고" <c:if test="${saleInfo.gubun=='교환출고'}">selected</c:if>>교환_출고</option>
								<option value="교환입고" <c:if test="${saleInfo.gubun=='교환입고'}">selected</c:if>>교환_입고</option>
								<option value="교환손실" <c:if test="${saleInfo.gubun=='교환손실'}">selected</c:if>>교환_손실</option>
								<option value="반품" <c:if test="${saleInfo.gubun=='반품'}">selected</c:if>>반품</option>
								<option value="손실" <c:if test="${saleInfo.gubun=='손실'}">selected</c:if>>손실</option>
								<option value="경비" <c:if test="${saleInfo.gubun=='경비'}">selected</c:if>>경비</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="price" class="col-sm-3 control-label">금액</label>
						<div class="col-sm-8">
							<input class="form-control inputNumber" type="number" id="price" name="price" required="required" value="${saleInfo.price}" >
						</div>
					</div>
					<div class="form-group">
						<label for="paymentPath" class="col-sm-3 control-label">지불방법</label>
						<div class="col-sm-8">
							<select id="paymentPath" name="paymentPath"
								class="form-control select">
								<option value="계좌이체" <c:if test="${saleInfo.paymentPath == '계좌이체'}">selected</c:if> >계좌이체</option>
								<option value="현금" <c:if test="${saleInfo.paymentPath == '현금'}">selected</c:if> >현금</option>
								<option value="신용카드" <c:if test="${saleInfo.paymentPath == '신용카드'}">selected</c:if> >신용카드</option>
								<option value="경비" <c:if test="${saleInfo.paymentPath == '경비'}">selected</c:if> >경비</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="salePath" class="col-sm-3 control-label">주문경로</label>
						<div class="col-sm-8">
							<select id="salePath" name="salePath" class="form-control select">
								<option value="개별구매" <c:if test="${saleInfo.salePath == '개별구매'}">selected</c:if> >개별구매</option>
								<option value="NAVER쇼핑" <c:if test="${saleInfo.salePath == 'NAVER쇼핑'}">selected</c:if> >NAVER쇼핑</option>
								<option value="Homepage" <c:if test="${saleInfo.salePath == 'Homepage'}">selected</c:if> >Homepage</option>
								<option value="쎈인생블로거" <c:if test="${saleInfo.salePath == '쎈인생블로거'}">selected</c:if> >쎈인생블로거</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="deleveryDate" class="col-sm-3 control-label">수령일</label>
						<div class="col-sm-8">
							<input class="form-control inputDate" id="deleveryDate" name="deleveryDate" type="text" required="required" value="${saleInfo.deleveryDate}" >
						</div>
					</div>
					<div class="form-group">
						<label for="deleveryPath" class="col-sm-3 control-label">배송방법</label>
						<div class="col-sm-8">
							<select id="deleveryPath" name="deleveryPath" class="form-control select">
								<option value="택배" <c:if test="${saleInfo.deleveryPath == '택배'}">selected</c:if> >택배</option>
								<option value="고객수령" <c:if test="${saleInfo.deleveryPath == '고객수령'}">selected</c:if> >고객수령</option>
								<option value="직접배송" <c:if test="${saleInfo.deleveryPath == '직접배송'}">selected</c:if> >직접배송</option>
							</select>
						</div>
					</div>

				</div>
				<!-- 2블럭 End -->

				<!-- 3블럭 Start -->
				<div class="col-sm-4">
					<div class="form-group">
						<label for="comm" class="col-sm-3 control-label">내역</label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="5" id="comm" name="comm">${saleInfo.comm}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="orderDate" class="col-sm-3 control-label">주문일</label>
					    <div class="col-sm-8">
				        	<input class="form-control inputDate" id="orderDate" name="orderDate" type="text" value="${saleInfo.orderDate}">
				      	</div>
					</div>
					<div class="form-group">
						<label for="orderer" class="col-sm-3 control-label">주문자</label>
					 	<div class="col-sm-8">
							<input class="form-control" type="text" id="orderer" name="orderer" value="${saleInfo.orderer}">
					 	</div>
					</div>
					<div class="form-group">
						<label for="manager" class="col-sm-3 control-label">담당자</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="" name="manager" value="${saleInfo.manager}" >
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
								onclick="fn_delete(${saleInfo.cno}); return false;">삭제</button>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-block"
								onclick="javascript:self.close();">닫기</button>
						</div>
					</div>
				</div>
				<!-- 3블럭 End -->

			</div>
		</form>
	</div>
</body>
</html>