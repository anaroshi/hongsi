<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchBook</title>

<!-- 공통함수 -->
<script type="text/javascript" src="/resources/js/common.js"></script>

<style type="text/css">
div.modal-body {
	height: 90px;
}		
</style>  

<script>

//거래처 options
let options = `
	<option value=""> </option>
       <option value="넛츠베리">넛츠베리</option>
       <option value="넛츠피아">넛츠피아</option>
       <option value="네이버쇼핑">네이버쇼핑</option>
       <option value="맘쿠킹">맘쿠킹</option>
       <option value="코스트코구매대행">코스트코구매대행</option>
       <option value="쿠팡">쿠팡</option>
`;

let getPackCode = function(that) {	
	packList(that);
};
	
$( function() {
	
	// 입력 메세지 처리	
	${(empty msg)? "":"alert('"+=msg+="');"};	
// 	<c:if test="${!empty msg}">
// 		alert("${msg}");
// 	</c:if>

	//startWith(); // 화면 로드시 주문일일 열림 
	function startWith() {
		// 화면 로드시 커서가 위치하게
		$("#buyDate").focus();	  
	};	

	// 부자재 세부항목 (초기화)
	packList($('div > #pack_code'));
	
	// 거래처
	$("#purShop").append(options);


//		$('#frm').submit(function() {
//		     // inside event callbacks 'this' is the DOM element so we first
//		     // wrap it in a jQuery object and then invoke ajaxSubmit
//		     $(this).ajaxSubmit(options);

//		     // !!! Important !!!
//		     // always return false to prevent standard browser submit and page navigation
//		     return false;
//		});


// 	$('#frm').submit(function() { //submit이 발생하면
// 		alert("submit");
// 		let formData = JSON.stringify($("#frm").serialize());
// 		console.log("data : "+formData);
		
// 		if($validateForm() != false) {
// 			$.ajax({
// 				type:"POST",
// 				url: "pack.do",
// 				contentType: "application/json",
// 				async: false,
// 				data: formData, // json(전송) 타입
// 				dataType: "json",
// 				success: function(data){
// 					//console.log(data);
// 					//$("#result").html(JSON.stringify(data));
// 				},
// 				error : function(res){ 
// 					alert("error");
// 				}	
// 			});
// 		}
// 	});	

// 	$('#frm').submit(function() { //submit이 발생하면	
// 		console.log("submit");
// 		if($validateForm() != false) {
// 			let f = $("#frm").serialize();
// 			console.log("data : "+f);
// 			let option = {
// 					url: "pack.do",
// 					data: f,		
// 					type:"POST",
// 					dataType: "json",
// 					contentType: 'application/json',
// 					success: function(data){
// 						console.log(data);
// 						$("#result").html(JSON.stringify(data));
// 					},
// 					error : function(res){ 
// 						alert("error");
// 					}
// 			}
	
// 			// alert("validateForm");
// 			$("#frm").ajaxSubmit(option); //옵션값대로 ajax비동기 동작을 시키고
//  		    return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.	
// 		} else {
//  			console.log("---- validateForm failed");
// 		}
// 		return false;
// 	});
});


// 부자재 세부항목 찾아오기
let packList = function(that) {
	let pack_code = $(that).val();
// 	console.log("pack_code:"+pack_code);
	$.ajax({
		type : 'POST',
// 		url : 'packSubList?pack_code='+packCode,
		url : 'packSubList',
		headers : {'content-type':'application/json'}, // 요청 헤더
		data : pack_code,
		cache : false,
		success : function(result) {
			
       		let options = "";
        	if(result) {
        		//alert("검색 성공"+result.length);
        		 
       			for ( x in result) {
        			//	console.log(result[x]);
        			let a = result[x].code;
        			let b = result[x].name;
        			
        			options += `<option value="`+a+`">`+b+`</option>`;
       			}
        	}
//         	console.log("that : "+$(that).val());
//         	console.log("options : "+options);
//         	console.log("class : "+$(that).parent().next().find('#code').attr('class'));
        		
       		$(that).parent().next().find('#code').html(options); // 옵션 List
		},
		error : function(){ alert("error");}				
	}); // $.ajax()
}

function addRow() {	
	let row = `
		<tr>
	        <td>
				<div class="col-sm-4">
		        	<select id="pack_code" name="pack_codes" class="form-control select fieldChk" data-fieldTitle="주문품 대분류" data-type="select" onchange="getPackCode(this);">
						<option value=""></option>
						<c:forEach items="${pack_code}" var="vo">
							<option value="${vo.code}">${vo.name}</option>
					 	</c:forEach>			 	
			      	</select>
				</div>
	  			<div class="col-sm-8">
					<select id="code" name="codes" class="form-control select fieldChk" data-fieldTitle="주문품 소분류" data-type="select">
				      	<option value=""></option>
			      	</select>	      	
			    </div>
	      	</td>
	        <td>
	        	<input class="form-control inputNumber fieldChk" id="qty" name="qtys" type="number" data-type="number" placeholder="qty" data-fieldTitle="수량">
	        </td>
	        <td>
				<div> 
					<div class="input-group">
				    	<span class="input-group-addon"><i class="fas fa-won-sign"></i></span>
						<input class="form-control fieldChk" type="number" data-type="number" id="price" name="prices" data-fieldTitle="금액">
					</div>
				</div>
	        </td>
	        <td>
				<select id="purShop" name="purShops" class="form-control select purShop6 fieldChk" data-fieldTitle="거래처" data-type="select">
					`+options+`
				</select>
	        </td>
	        <td>
	        	<div class="col-sm-8">
				<input class="form-control inputDate flatpickr flatpickr-input fieldChk" id="inDate" name="inDates" type="text" data-type="text" 
					 data-fieldTitle="입고일자" data-fieldTitle="주문일" style="background: #FFFFFF;" placeholder="일자를 선택해주세요" data-input>
				</div>	 
				<div class="col-sm-4">
				 	<button type="button" onclick="delRow(this)" class="btn btn-block">삭제</button>	
				</div>	 
	        </td>
		</tr>	
	`;
	
	$(".buyPack").append(row).find('.flatpickr').flatpickr();

}

let delRow = function(that) {
	$(that).closest('tr').remove();
}

</script>
</head>
<body>
<div class="container">
<form id="frm" class="form-horizontal" method="post" onsubmit='return $validateForm()'>
<input type="hidden" name="gubun" value="in">
  	<h4>부자재 구매 입력</h4>
	<div class="col-lg-12">
		<div class="row">
		    <div class="form-group">
			    	<!-- 주문일 Start -->
				<div class="col-md-2">
					<div class="form-group">
				      <label for="buyDate" class="col-sm-4 control-label">주문일</label>
				      <div class="col-sm-8">
						<input class="form-control inputDate flatpickr flatpickr-input fieldChk" id="buyDate" name="buyDate" type="text" data-type="text" 
								 data-fieldTitle="주문일" data-fieldTitle="주문일" style="background: #FFFFFF;" placeholder="일자를 선택해주세요" data-input>
				      </div>
				    </div>
				</div>
				<!-- 주문일 End -->
				
				<!-- 구매자 Start -->
				<div class="col-md-2">
			     	<div class="form-group">
			      		<label for="buyer" class="col-sm-4 control-label">구매자</label>
			     		<div class="col-sm-8">
					      	<select id="buyer" name="buyer" class="form-control select fieldChk" data-fieldTitle="구매자" data-type="select">
					            <option value="홍동호">홍동호</option>
					            <option value="대행인">대행인</option>
							</select>
			     		</div>
			    	</div>
			    </div>
				<!-- 구매자 End -->
				
			    <div class="col-md-4"></div>
			    <div class="col-md-1">
					<button type="reset" class="btn btn-block">초기화</button>
			    </div>
			    <div class="col-md-1">
			    	<button type="button" onclick="addRow()" class="btn btn-block">추가</button>
			    </div>  
			    <div class="col-md-1">
<!-- 			    	<button type="button" onclick="saveBtn()" class="btn btn-block">저장</button> -->
		    	<button type="submit" class="btn btn-block">저장</button>
			    </div>	
			    <div class="col-md-1">
			    	<button type="button" onclick="location.href='buyAllList.do'" class="btn btn-block">리스트</button>
			    </div>
		    </div>
	    </div>
	</div>

	<table class="table">
	    <thead>
	      <tr>
	        <th class="col-xs-5">주문품</th>
	        <th class="col-xs-1">수량</th>
	        <th class="col-xs-2">금액</th>
	        <th class="col-xs-2">거래처</th>
	        <th class="col-xs-2">입고일자</th>
	      </tr>
	   	</thead>
	    <tbody class="buyPack">
	    		<!-- 1블럭 -->    
			<tr>
		        <td>						
					<div class="col-sm-4">
			        	<select id="pack_code" name="pack_codes" class="form-control select fieldChk" data-fieldTitle="주문품 대분류" data-type="select" onchange="getPackCode(this);">
							<c:forEach items="${pack_code}" var="vo">
								<option value="${vo.code}">${vo.name}</option>
						 	</c:forEach>			 	
				      	</select>
			      	</div>
					<div class="col-sm-8">
						<select id="code" name="codes" class="form-control select fieldChk" data-fieldTitle="주문품 소분류" data-type="select">
					      	<option value=""></option>
			<%-- 						<c:forEach items="${code}" var="vo"> --%>
			<%-- 							<option value="${vo.code}">${vo.name}</option> --%>
			<%-- 					 	</c:forEach> --%>
				      	</select>
					</div>
		        </td>
		        <td>
		        	<input class="form-control inputNumber fieldChk" id="qty" name="qtys" type="number" data-type="number" placeholder="qty" data-fieldTitle="수량">
		        </td>
		        <td>
					<div> 
						<div class="input-group">
					    	<span class="input-group-addon"><i class="fas fa-won-sign"></i></span>
							<input class="form-control fieldChk" type="number" data-type="number" id="price" name="prices" data-fieldTitle="금액">
						</div>
					</div>
		        </td>
		        <td>
					<select id="purShop" name="purShops" class="form-control select purShop1 fieldChk" data-fieldTitle="거래처" data-type="select">
	<!-- 					<option value=""> </option> -->
	<!-- 		            <option value="넛츠베리">넛츠베리</option> -->
	<!-- 		            <option value="넛츠피아">넛츠피아</option> -->
	<!-- 		            <option value="네이버쇼핑">네이버쇼핑</option> -->
	<!-- 		            <option value="맘쿠킹">맘쿠킹</option> -->
	<!-- 		            <option value="코스트코구매대행">코스트코구매대행</option> -->
	<!-- 		            <option value="쿠팡">쿠팡</option> -->
					</select>
		        </td>
		        <td>
		        <div class="col-sm-8">
					<input class="form-control inputDate flatpickr flatpickr-input fieldChk" id="inDate" name="inDates" type="text" data-type="text" 
						 data-fieldTitle="입고일자" data-fieldTitle="주문일" style="background: #FFFFFF;" placeholder="일자를 선택해주세요" data-input>
				</div>
				<div class="col-sm-4">
				</div>		         	
		        </td>		        
			</tr>
		</tbody>
	</table>			
</form>	
<!-- 	<hr width = "102%"> -->

	<table class="table table-striped">
		<thead>
	 		<tr>
				<td colspan="9" class="text-center"><h5>부자재 주문 LIST (금일 입력분)</h5></td>    	
			</tr>
	       <tr>
		        <th style="width: 10%">주문일</th>
		        <th colspan="2">주문품</th>
		        <th style="width: 8%">수량</th>
		        <th style="width: 10%">금액</th>
		        <th style="width: 15%">거래처</th>
		        <th style="width: 10%">입고일</th>
		        <th style="width: 8%">구매자</th>
		        <th style="width: 20%">비고</th>
	      </tr>
	    </thead>
	    <tbody>
			<c:forEach items="${packList}" var="vo">
			      <tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
			    	<td><fmt:formatDate value="${vo.buyDate}" pattern="yyyy-MM-dd" /></td>
			        <td style="width: 8%" data-pack_code="${vo.pack_code}">${vo.pack_name}</td>       
			        <td style="width: 21%" data-code="${vo.code}">${vo.name}</td>
			        <td class="text-right">${vo.qty}</td>
			        <td class="text-right">${vo.price}</td>
			        <td>${vo.purShop}</td>
			        <td><fmt:formatDate value="${vo.inDate}" pattern="yyyy-MM-dd" /></td>
			        <td>${vo.buyer}</td>
			        <td>${vo.comm}</td>
			      </tr>
			</c:forEach>
 		</tbody>     
	</table>
</div>
<script>
//let f = new FormData($("#frm"));
// let f = $("#frm").serialize();
// console.log("data : "+f);
// let option = {
// 		url: "/pack",
// 		data: f,		
// 		type:"POST",
// 		success: function(data){
// 			console.log(data);
// 			$("#result").html(JSON.stringify(data));
// 		},
// 		error : function(res){ 
// 			alert("error");
// 		}
// }

// //	$('#frm').submit(function() {
// //	     // inside event callbacks 'this' is the DOM element so we first
// //	     // wrap it in a jQuery object and then invoke ajaxSubmit
// //	     $(this).ajaxSubmit(options);

// //	     // !!! Important !!!
// //	     // always return false to prevent standard browser submit and page navigation
// //	     return false;
// //	});


// function saveBtn() {
// //$('#frm').submit(function() { //submit이 발생하면	
	
// if($validateForm() != false) {
// 	let f = $("#frm").serialize();
// 	console.log("data : "+f);
// 	let option = {
// 			url: "/pack",
// 			data: f,		
// 			type:"POST",
// 			success: function(data){
// 				console.log(data);
// 				$("#result").html(JSON.stringify(data));
// 			},
// 			error : function(res){ 
// 				alert("error");
// 			}
// 	}

// 	// alert("validateForm");
// 	$("#frm").ajaxSubmit(option); //옵션값대로 ajax비동기 동작을 시키고
//     return false; //기본 동작인 submit의 동작을 막아 페이지 reload를 막는다.	
// });

//}

</script>
</body>
</html>