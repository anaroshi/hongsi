<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산 수정</title>

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
	height: 89px;
}

.order_item {
	font-size: 12px;
	padding: 6px 4px;
}

div.panel-body {
	padding: 3px 0px 0px;
	height: 60px;
}
</style>
<script>
function fn_delete(cno, locate) {
	
	if(confirm("삭제하시겠습니까")) {
		// alert(cno);		
		$.ajax({
			type: "POST",
			url: "productDelete.do",
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
				opener.parent.location ="/purchshop/product.do"+query;				
	        	self.close();
			} else if(result=="ok2") {
	        	alert("삭제 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/productAllList.do"+query;				
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

function fn_update(cno) {

	if(confirm("수정하시겠습니까")) {
		
		// 생산량 입력 유효성 검사
		let ori_200 = $("#ori_200").val();
		if(ori_200 == null || ori_200 =="" || typeof ori_200 == "undefined" || ori_200 >= 20000) ori_200 = 0; 
		$("#ori_200").val(ori_200);
		let ori_250 = $("#ori_250").val();
		if(ori_250 == null || ori_250 =="" || typeof ori_250 == "undefined" || ori_250 >= 20000) ori_250 = 0; 
		$("#ori_250").val(ori_250);
		let ori_500 = $("#ori_500").val();
		if(ori_500 == null || ori_500 =="" || typeof ori_500 == "undefined" || ori_500 >= 20000) ori_500 = 0; 
		$("#ori_500").val(ori_500);
		let ori_1000 = $("#ori_1000").val();
		if(ori_1000 == null || ori_1000 =="" || typeof ori_1000 == "undefined" || ori_1000 >= 20000) ori_1000 = 0; 
		$("#ori_1000").val(ori_1000);
		
		let erl_200 = $("#erl_200").val();
		if(erl_200 == null || erl_200 =="" || typeof erl_200 == "undefined" || erl_200 >= 20000) erl_200 = 0; 
		let erl_250 = $("#erl_250").val();
		if(erl_250 == null || erl_250 =="" || typeof erl_250 == "undefined" || erl_250 >= 20000) erl_250 = 0; 
		$("#erl_250").val(erl_250);
		let erl_500 = $("#erl_500").val();
		if(erl_500 == null || erl_500 =="" || typeof erl_500 == "undefined" || erl_500 >= 20000) erl_500 = 0; 
		$("#erl_500").val(erl_500);
		let erl_1000 = $("#erl_1000").val();
		if(erl_1000 == null || erl_1000 =="" || typeof erl_1000 == "undefined" || erl_1000 >= 20000) erl_1000 = 0; 
		$("#erl_1000").val(erl_1000);
		
		let stc_200 = $("#stc_200").val();
		if(stc_200 == null || stc_200 =="" || typeof stc_200 == "undefined" || stc_200 >= 20000) stc_200 = 0; 
		let stc_250 = $("#stc_250").val();
		if(stc_250 == null || stc_250 =="" || typeof stc_250 == "undefined" || stc_250 >= 20000) stc_250 = 0; 
		$("#stc_250").val(stc_250);
		let stc_500 = $("#stc_500").val();
		if(stc_500 == null || stc_500 =="" || typeof stc_500 == "undefined" || stc_500 >= 20000) stc_500 = 0; 
		$("#stc_500").val(stc_500);
		let stc_1000 = $("#stc_1000").val();
		if(stc_1000 == null || stc_1000 =="" || typeof stc_1000 == "undefined" || stc_1000 >= 20000) stc_1000 = 0; 
		$("#stc_1000").val(stc_1000);
	
		if((ori_200+ori_250+ori_500+ori_1000+erl_200+erl_250+erl_500+erl_1000+stc_200+stc_250+stc_500+stc_1000)==0) {
		      alert('주문 제품의 수량을 넣어주세요!');
		      $("#ori_200").select();
		      return false;
	    }
		
		let productDate = $("#productDate").val();		
		if( productDate== null || productDate ==""  || productDate.length<10)  {
			alert('생산일을 입력해주세요!');
			$("#productDate").select();
		      return false;
	    }
		
		// alert(cno);
		let formData = $("#frm").serialize();		
		// alert(JSON.stringify(formData));
		
		$.ajax({
			type: "POST",
			url: "productUpdate.do",
			async: false,
			data: formData, // json(전송) 타입
			dataType: "text"					
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+JSON.stringify(result)+" -> xhr: "+ JSON.stringify(xhr));
	        if(result=="ok1") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/product.do";				
	        	self.close();
			} else if(result=="ok2") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/productAllList.do";				
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
		<form class="form-horizontal" method="post" id="frm">
			<input name="cno" 		type="hidden" 	value="${productInfo.cno}" />
			<input name="locate"	type="hidden" 	value="${locate}" />
			<div class="row">
				<h4>생산 수정</h4>
				<!-- 생산 Start -->
				<!-- 1블럭 Start -->
				<div class="col-sm-1"></div>
				<div class="col-sm-4">
					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">ORIGINAL</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-3 text-center">
									<label for="ori_200">200g</label> 
									<input class="form-control order_item text-right" id="ori_200" name="ori_200" type="number" pattern="[0-9]{4}" value="${productInfo.ori_200}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="ori_250">250g</label> 
									<input class="form-control order_item text-right" id="ori_250" name="ori_250" type="number" pattern="[0-9]{4}" value="${productInfo.ori_250}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="ori_500">500g</label>
									<input class="form-control order_item text-right" id="ori_500" name="ori_500" type="number" pattern="[0-9]{4}" value="${productInfo.ori_500}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="ori_1000">1,000g</label>
									<input class="form-control order_item text-right" id="ori_1000" name="ori_1000" type="number" pattern="[0-9]{4}" value="${productInfo.ori_1000}">
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">EARLGREY</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-3 text-center">
									<label for="erl_200">200g</label>
									<input class="form-control order_item text-right" id="erl_200" name="erl_200" type="number" pattern="[0-9]{4}" value="${productInfo.erl_200}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="erl_250">250g</label>
									<input class="form-control order_item text-right" id="erl_250" name="erl_250" type="number" pattern="[0-9]{4}" value="${productInfo.erl_250}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="erl_500">500g</label>
									<input class="form-control order_item text-right" id="erl_500" name="erl_500" type="number" pattern="[0-9]{4}" value="${productInfo.erl_500}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="erl_1000">1,000g</label>
									<input class="form-control order_item text-right" id="erl_1000" name="erl_1000" type="number" pattern="[0-9]{4}" value="${productInfo.erl_1000}">
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default" style="border: none;">
						<div class="panel-heading">SALTCARAMEL</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-xs-3 text-center">
									<label for="stc_200">200g</label>
									<input class="form-control order_item text-right" id="stc_200" name="stc_200" type="number" pattern="[0-9]{4}" value="${productInfo.stc_200}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="stc_250">250g</label>
									<input class="form-control order_item text-right" id="stc_250" name="stc_250" type="number" pattern="[0-9]{4}" value="${productInfo.stc_250}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="stc_500">500g</label>
									<input class="form-control order_item text-right" id="stc_500" name="stc_500" type="number" pattern="[0-9]{4}" value="${productInfo.stc_500}">
								</div>
								<div class="col-xs-3 text-center">
									<label for="stc_1000">1,000g</label>
									<input class="form-control order_item text-right" id="stc_1000" name="stc_1000" type="number" pattern="[0-9]{4}" value="${productInfo.stc_1000}">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 1블럭 End -->
				<div class="col-sm-1"></div>
				<!-- 2블럭 Start -->
				<div class="col-sm-5">
					<div class="form-group">
						<label for="productDate" class="col-sm-3 control-label">생산일</label>
						<div class="col-sm-8">
							<input class="form-control inputDate flatpickr flatpickr-input" id="productDate" name="productDate" type="text" 
									style="background: #FFFFFF;" value='<fmt:formatDate value="${productInfo.productDate}" pattern="yyyy-MM-dd" />' 
									required="required" placeholder="일자를 선택해주세요" data-input>
						</div>
					</div>
					<div class="form-group">
						<label for="gubun" class="col-sm-3 control-label">구분</label>
						<div class="col-sm-8">
							<select id="gubun" name="gubun" class="form-control select">
								<option value="생산" ${(productInfo.gubun=='생산')?"selected":""}>생산</option>
<%-- 								<option value="교환"<c:if test="${productInfo.gubun == '교환'}">selected</c:if> >교환</option> --%>
<%-- 								<option value="반품"<c:if test="${productInfo.gubun == '반품'}">selected</c:if> >반품</option> --%>
<%-- 								<option value="손실"<c:if test="${productInfo.gubun == '손실'}">selected</c:if> >손실</option> --%>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="comm" class="col-sm-3 control-label">내역</label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="5" id="comm" name="comm">${productInfo.comm}</textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="manager" class="col-sm-3 control-label">담당자</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="" name="manager" value="${productInfo.manager}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-1"></div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-block" id="orderUpdate"
								onclick="fn_update(${productInfo.cno}); return false;">수정</button>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-block" id="orderDelete"
								onclick="fn_delete(${productInfo.cno},${locate}); return false;">삭제</button>
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