<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchShop</title>

<style type="text/css">
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}

.order_item {
 	font-size: 12px;
 	padding: 6px 4px;
 }
 
.btn, .select {
 	font-size: 12px;
 }
 
.btn:hover {
	background-color: #CCCCCC;
	color: white;
}

div.panel-body {
	padding-top: 5px;
	padding-bottom: 0px;
}

.dataRow:hover {
	background-color: #ccc;
	cursor: pointer;
}
</style>
  
<script>
  $( function() {

	  startWith();
	  
	  function startWith() {
		  // 화면 로드시 커서가 위치하게
		  $("#ori_250").focus();	  
	  };
	  
    $( "#orderDate" ).datepicker({
		changeMonth: true,
		changeYear: true,
		mdeleveryDate: '-50y', 
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
    $( "#saleDate" ).datepicker({
		changeMonth: true,
		changeYear: true,
		mdeleveryDate: '-50y', 
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
		mdeleveryDate: '-50y', 
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
		mdeleveryDate: '-50y', 
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
    
    $("#item").change(function() {
    	let selectedVal = $(this).val();
    	//alert(selectedVal);
    	
    	let itemA =["100"];
    	let itemB =["200"];
    	let itemC =["500"];
    	let itemD =["545"];
    	let itemE =["800"];
    	let itemF =["1000"];
    	let itemG =["1800"];
    	let itemH =["2000"];
    	let itemI =["2270"];
    	let itemJ =["2300"];
    	let d = "";
    	switch(selectedVal) {
    		case "in_020":
    			d = itemA;
    		break;
    		case "in_009": case "in_019":
    			d = itemB;
    		break;
    		case "in_001":
    			d = itemC;
    		break;
    		case "in_015":
    			d = itemD;
    		break;
    		case "in_014: case in_027":
    			d = itemE;
    		break;
    		case "in_003": case "in_004": case "in_005": case "in_006": case "in_007": case "in_008": case "in_010": case "in_011": case "in_013": case "in_017": case "in_018": case "in_021": case "in_022": case "in_023": case "in_024": case "in_025": case "in_026":
    			d = itemF;
    		break;
    		case "in_016":
    			d = itemG;
    		break;
    		case "in_002":
    			d = itemH;
    		break;
    		case "in_028":
    			d = itemI;
    		break;
    		case "in_012":
    			d = itemJ;
    		break;
    		default:
    			d = "";
    		break;
    	}
    	
    	$("#content").empty();
    	
    	for ( x in d) {
    		let opt = $("<option value='"+d[x]+"'>"+d[x]+"</option>");
    		$("#content").append(opt);
    	}    
    });

  	$("#orderReset").click(function() {  		
  		location = "sale.do";
  	});
  	
  	$(".dataRow").click(function(){
  		let order_cno = $(this).find(".order_cno").text();
  		//alert(order_cno);
  		location = "sale.do?order_cno="+order_cno;
  	});
  	
  	$("#orderSave").click(function(){
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
		
		let price = $("#price").val();
		if(price == null || price =="" || typeof price == "undefined") {
			alert('금액을 입력해주세요!');
			$("#price").val("0");
			$("#price").select();
		      return false;
		}		
		
		let deleveryDate = $("#deleveryDate").val();		
		if( deleveryDate== null || deleveryDate ==""  || deleveryDate.length<10)  {
			alert('수령일을 입력해주세요!');
			$("#deleveryDate").select();
		      return false;
	    }
		
		$("#frm").submit();
  	});
    
});

  
  </script>
</head>

<body>
<div class="container">
<form class="form-horizontal" method="post" id="frm">
	<%-- <input id="order_cno" name="order_cno" type="hidden" value="${vo.cno}"> --%>
  <h4>판매 입력</h4>
  <div class="col-md-2">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">ORIGINAL</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="ori_250">250g</label>
		    <input class="form-control order_item" id="ori_250" name="ori_250" type="number" pattern="[0-9]{4}" value="${vo.ori_250}">
		</div>
	    <div class="col-xs-4">
		    <label for="ori_500">500g</label>
		    <input class="form-control order_item" id="ori_500" name="ori_500" type="number" pattern="[0-9]{4}" value="${vo.ori_500}">
		</div>
		<div class="col-xs-4">
		    <label for="ori_1000">1,000g</label>
		    <input class="form-control order_item" id="ori_1000" name="ori_1000" type="number" pattern="[0-9]{4}" value="${vo.ori_1000}">
		</div>
  		</div>
  	  </div>
	</div>
<!--   </div> -->
<!--   <div class="col-md-4"> -->
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">EARLGREY</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="erl_250">250g</label>
		    <input class="form-control order_item" id="erl_250" name="erl_250" type="number" pattern="[0-9]{4}" value="${vo.erl_250}">
		</div>
	    <div class="col-xs-4">
		    <label for="erl_500">500g</label>
		    <input class="form-control order_item" id="erl_500" name="erl_500" type="number" pattern="[0-9]{4}" value="${vo.erl_500}">
		</div>
		<div class="col-xs-4">
		    <label for="erl_1000">1,000g</label>
		    <input class="form-control order_item" id="erl_1000" name="erl_1000" type="number" pattern="[0-9]{4}" value="${vo.erl_1000}">
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
		    <input class="form-control order_item" id="sns_250" name="sns_250" type="number" pattern="[0-9]{4}" value="${vo.sns_250}">
		</div>
	    <div class="col-xs-4">
		    <label for="sns_500">500g</label>
		    <input class="form-control order_item" id="sns_500" name="sns_500" type="number" pattern="[0-9]{4}" value="${vo.sns_500}">
		</div>
		<div class="col-xs-4">
		    <label for="sns_1000">1,000g</label>
		    <input class="form-control order_item" id="sns_1000" name="sns_1000" type="number" pattern="[0-9]{4}" value="${vo.sns_1000}">
		</div>
  		</div>
  	  </div>
	</div>
	<div class="form-group">
		<label for="orderDate" class="col-sm-4 control-label">주문일</label>
	    <div class="col-sm-7">
        	<input class="form-control" id="orderDate" name="orderDate" type="text" value="${vo.orderDate}" readonly="readonly">
      	</div>
	</div>
	<div class="form-group">
		<label for="orderer" class="col-sm-4 control-label">주문자</label>
	 	<div class="col-sm-7">
			<input class="form-control" type="text" id="orderer" name="orderer" value="${vo.orderer}" readonly="readonly">
	 	</div>
	</div>
	<div class="form-group">
      <label for="manager" class="col-sm-4 control-label">담당자</label>
      <div class="col-sm-7">
		<input class="form-control" type="text" id="" name="manager">
      </div>
 	</div>	
  </div> 
<!--   <div class="row">  -->
	<div class="col-sm-3">
	   <div class="form-group">
	      <label for="saleDate" class="col-sm-3 control-label">판매일</label>
	      <div class="col-sm-8">
	        <input class="form-control" id="saleDate" name="saleDate" type="text" required="required">
	      </div>
	    </div>
	    	    
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select">
	            <option value="판매" <c:if test="${vo.gubun=='주문'}">selected</c:if> >판매</option>
	            <option value="교환" <c:if test="${vo.gubun=='교환'}">selected</c:if> >교환</option>
	            <option value="교환" <c:if test="${vo.gubun=='반품'}">selected</c:if> >반품</option>
	            <option value="손실" <c:if test="${vo.gubun=='손실'}">selected</c:if> >손실</option>
	            <option value="샘플" <c:if test="${vo.gubun=='샘플'}">selected</c:if> >샘플</option>
			</select>
	      </div>
	    </div>	    
		<div class="form-group"> 
			<label for="price" class="col-sm-3 control-label">금액</label>
		 	<div class="col-sm-8">
				<input class="form-control" type="text" id="price" name="price" required="required">
		 	</div>
		</div>
	    <div class="form-group">
	      <label for="paymentPath" class="col-sm-3 control-label">지불방법</label>
	      <div class="col-sm-8">
			<select id="paymentPath" name="paymentPath" class="form-control select">
	            <option value="계좌이체">계좌이체</option>
	            <option value="현금">현금</option>
	            <option value="신용카드">신용카드</option>
	            <option value="경비">경비</option>
			</select>
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="salePath" class="col-sm-3 control-label">주문경로</label>
	      <div class="col-sm-8">
			<select id="salePath" name="salePath" class="form-control select">
	            <option value="개별구매">개별구매</option>
	            <option value="NAVER쇼핑">NAVER쇼핑</option>
	            <option value="Homepage">Homepage</option>
	            <option value="Homepage">쎈인생블로거</option>
			</select>
	      </div>
	    </div>	    
	   	<div class="form-group">
	      <label for="deleveryDate" class="col-sm-3 control-label">수령일</label>
	      <div class="col-sm-8">
	        <input class="form-control" id="deleveryDate" name="deleveryDate" type="text" required="required">
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="deleveryPath" class="col-sm-3 control-label">배송방법</label>
	      <div class="col-sm-8">
			<select id="deleveryPath" name="deleveryPath" class="form-control select">
	            <option value="택배">택배</option>
	            <option value="고객수령">고객수령</option>
	            <option value="직접배송">직접배송</option>
			</select>
	      </div>
	    </div>	    

     <div class="form-group">
      <label for="comm" class="col-sm-3 control-label">내역</label>
      <div class="col-sm-8">
      	<textarea class="form-control" rows="5" id="comm" name="comm"></textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-1"></div>
      <div class="col-sm-5">
		<button type="button" class="btn btn-block" id="orderReset">초기화</button>
      </div>      
      <div class="col-sm-5">
      	<button type="button" class="btn btn-block" id="orderSave">저장</button>
      </div>
      <div class="col-sm-1"></div>
 	</div> 
</div>
</form>
<!-- 	</div> 2블럭 End -->


<!-- 	</div> 3블럭 Start -->
<div class="col-md-7">
	<!-- 	주문 List Start -->
	  <table class="table table-striped orderListTable">
	    <thead>
	      <tr>
	        <th  style="width: 15%">일자</th>
	        <th  style="width: 10%">구분</th>
	        <th  style="width: 15%">주문경로</th>
	        <th style="width: 50%">주문내역 ( 판매 대기 )</th>
	        <th style="width: 10%">주문자</th>
	      </tr>
	    </thead>
	    <tbody>
	<c:forEach items="${orderList}" var="vo">
	      <tr class="dataRow" id="dataRow">
	        <td class="order_cno" style="display:none">${vo.cno}</td>
	        <td>${vo.orderDate}</td>
	        <td>${vo.gubun}</td>
	        <td>${vo.salePath}</td>
	        <td>${vo.ori_250_format}${vo.erl_250_format}${vo.sns_250_format}</td>
	        <td>${vo.orderer}</td>
	      </tr>
	</c:forEach>
	    </tbody>
	  </table>
	
	<!-- 	주문 List End -->

  <table class="table table-striped">
    <thead>
    	<tr>
    		<th colspan="13">판매 List</td>
    	</tr>
      <tr>
        <th  style="width: 15%">판매일</th>
        <th  style="width: 10%">구분</th>
        <th  style="width: 15%">주문경로</th>
        <th style="width: 5%; font-size: 9px">O250</th>
        <th style="width: 5%; font-size: 9px">O500</th>
        <th style="width: 5%; font-size: 9px">O1000</th>
        <th style="width: 5%; font-size: 9px">E250</th>
        <th style="width: 5%; font-size: 9px">E500</th>
        <th style="width: 5%; font-size: 9px">E1000</th>
        <th style="width: 5%; font-size: 9px">S250</th>
        <th style="width: 5%; font-size: 9px">S500</th>
        <th style="width: 5%; font-size: 9px">S1000</th>
        <th style="width: 15%">배송</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${saleList}" var="vo">
      <tr class="dataRow">
        <td>${vo.saleDate}</td>
        <td>${vo.gubun}</td>
        <td>${vo.salePath}</td>
        <td>${vo.ori_250}</td>
        <td>${vo.ori_500}</td>
        <td>${vo.ori_1000}</td>
        <td>${vo.erl_250}</td>
        <td>${vo.erl_500}</td>
        <td>${vo.erl_1000}</td>
        <td>${vo.sns_250}</td>
        <td>${vo.sns_500}</td>
        <td>${vo.sns_1000}</td>
        <td>${vo.deleveryPath}</td>
      </tr>
</c:forEach>
    </tbody>
  </table>
</div>
<!-- 	</div> 3블럭 End -->
</div>
</body>
</html>