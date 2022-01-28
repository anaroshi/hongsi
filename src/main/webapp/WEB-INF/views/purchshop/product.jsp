<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchShop</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" rel="stylesheet">

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
	padding: 5px 15px 0px;
}
</style>
  
<script>
  $( function() {

	  startWith();
	  
	  function startWith() {
		  // 화면 로드시 커서가 위치하게
		  $("#ori_200").focus();	  
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

  	$("#orderSave").click(function(){
  		let ori_200 = $("#ori_200").val();
  		if(ori_200 == null || ori_200 =="" || typeof ori_200 == "undefined" || ori_200 >= 10000) ori_200 = 0; 
  		$("#ori_200").val(ori_200);
  		let ori_500 = $("#ori_500").val();
		if(ori_500 == null || ori_500 =="" || typeof ori_500 == "undefined" || ori_500 >= 10000) ori_500 = 0; 
		$("#ori_500").val(ori_500);
		let ori_1000 = $("#ori_1000").val();
		if(ori_1000 == null || ori_1000 =="" || typeof ori_1000 == "undefined" || ori_1000 >= 10000) ori_1000 = 0; 
		$("#ori_1000").val(ori_1000);
		
		let erl_200 = $("#erl_200").val();
		if(erl_200 == null || erl_200 =="" || typeof erl_200 == "undefined" || erl_200 >= 2000) erl_200 = 0; 
		$("#erl_200").val(erl_200);
		let erl_500 = $("#erl_500").val();
		if(erl_500 == null || erl_500 =="" || typeof erl_500 == "undefined" || erl_500 >= 5000) erl_500 = 0; 
		$("#erl_500").val(erl_500);
		let erl_1000 = $("#erl_1000").val();
		if(erl_1000 == null || erl_1000 =="" || typeof erl_1000 == "undefined" || erl_1000 >= 10000) erl_1000 = 0; 
		$("#erl_1000").val(erl_1000);
		
		let sns_200 = $("#sns_200").val();
		if(sns_200 == null || sns_200 =="" || typeof sns_200 == "undefined" || sns_200 >= 2000) sns_200 = 0; 
		$("#sns_200").val(sns_200);
		let sns_500 = $("#sns_500").val();
		if(sns_500 == null || sns_500 =="" || typeof sns_500 == "undefined" || sns_500 >= 5000) sns_500 = 0; 
		$("#sns_500").val(sns_500);
		let sns_1000 = $("#sns_1000").val();
		if(sns_1000 == null || sns_1000 =="" || typeof sns_1000 == "undefined" || sns_1000 >= 10000) sns_1000 = 0; 
		$("#sns_1000").val(sns_1000);
		
		$("#frm").submit();
  	});
    
  });
  
  </script>
</head>

<body>
<div class="container">
<form class="form-horizontal" method="post" id="frm">
  <h4>생산 입력</h4>
 <!-- 재고량 보이기 Start -->
	<div class="col-md-2">
		<table class="table">
			<thead>
				<tr>
					<th colspan="2">제품</th>
					<th>재고</th>
				</tr>
			</thead>
			<tbody>
			 	<tr class="dataRow">
			 		<td rowspan="3" class="text-center">Original</td>
			        <td width="50%">250g</td>
			        <td  class="text-right" width="50%" >${stockSum.ori_200_sum}개</td>
			    </tr>
				<tr class="dataRow">
			        <td>500g</td>
			        <td class="text-right">${stockSum.ori_500_sum}개</td>
			    </tr>
				<tr class="dataRow">        
			        <td>1,000g</td>
			        <td class="text-right">${stockSum.ori_1000_sum}개</td>
			    </tr>
				<tr class="dataRow">
					<td rowspan="3" class="text-center">Earlgrey</td>
			        <td>250g</td>
			        <td class="text-right">${stockSum.erl_200_sum}개</td>
			    </tr>
				<tr class="dataRow">
			        <td>500g</td>
			        <td class="text-right">${stockSum.erl_500_sum}개</td>
			    </tr>
				<tr class="dataRow">        
			        <td>1,000g</td>
			        <td class="text-right">${stockSum.erl_1000_sum}개</td>
			    </tr>
			    <tr class="dataRow">
			    	<td rowspan="3" class="text-center">Sweet &amp; Salty</td>
			        <td>250g</td>
			        <td class="text-right">${stockSum.sns_200_sum}개</td>
			    </tr>
				<tr class="dataRow">
			        <td>500g</td>
			        <td class="text-right">${stockSum.sns_500_sum}개</td>
			    </tr>
				<tr class="dataRow">        
			        <td>1,000g</td>
			        <td class="text-right">${stockSum.sns_1000_sum}개</td>
			    </tr>			
		   </tbody>
		</table>
	</div>
	<!-- 재고량 보이기 End -->
	
  <div class="col-md-2">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">ORIGINAL</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="ori_200">200g</label>
		    <input class="form-control order_item" id="ori_200" name="ori_200" type="number" pattern="[0-9]{4}" >
		</div>
	    <div class="col-xs-4">
		    <label for="ori_500">500g</label>
		    <input class="form-control order_item" id="ori_500" name="ori_500" type="number" pattern="[0-9]{4}">
		</div>
		<div class="col-xs-4">
		    <label for="ori_1000">1,000g</label>
		    <input class="form-control order_item" id="ori_1000" name="ori_1000" type="number" pattern="[0-9]{4}">
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
		    <label for="erl_200">200g</label>
		    <input class="form-control order_item" id="erl_200" name="erl_200" type="number" pattern="[0-9]{4}">
		</div>
	    <div class="col-xs-4">
		    <label for="erl_500">500g</label>
		    <input class="form-control order_item" id="erl_500" name="erl_500" type="number" pattern="[0-9]{4}">
		</div>
		<div class="col-xs-4">
		    <label for="erl_1000">1,000g</label>
		    <input class="form-control order_item" id="erl_1000" name="erl_1000" type="number" pattern="[0-9]{4}">
		</div>
  		</div>
  	  </div>
	</div>
<!--   </div> -->
<!--   <div class="col-md-4"> -->
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">SWEET &amp; SALTY</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="sns_200">200g</label>
		    <input class="form-control order_item" id="sns_200" name="sns_200" type="number" pattern="[0-9]{4}">
		</div>
	    <div class="col-xs-4">
		    <label for="sns_500">500g</label>
		    <input class="form-control order_item" id="sns_500" name="sns_500" type="number" pattern="[0-9]{4}">
		</div>
		<div class="col-xs-4">
		    <label for="sns_1000">1,000g</label>
		    <input class="form-control order_item" id="sns_1000" name="sns_1000" type="number" pattern="[0-9]{4}">
		</div>
  		</div>
  	  </div>
	</div>
  </div> 
<!--   <div class="row">  -->
	<div class="col-sm-3">
	   <div class="form-group">
	      <label for="orderDate" class="col-sm-3 control-label">생산일</label>
	      <div class="col-sm-8">
	        <input class="form-control" id="orderDate" name="orderDate" type="text" required="required">
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select">
	            <option value="생산">생산</option>
	            <option value="교환">교환</option>
	            <option value="교환">반품</option>
	            <option value="손실">손실</option>
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
      <label for="manager" class="col-sm-3 control-label">담당자</label>
      <div class="col-sm-8">
		<input class="form-control" type="text" id="" name="manager">
      </div>
 	</div> 
    <div class="form-group">
      <div class="col-sm-1"></div>
      <div class="col-sm-5">
		<button type="reset" class="btn btn-block">초기화</button>
      </div>      
      <div class="col-sm-5">
      	<button type="button" class="btn btn-block" id="orderSave">저장</button>
      </div>
      <div class="col-sm-1"></div>
 	</div> 
</div>
</form>
<!-- 	</div> 2블럭 End -->

<!-- 	생산 내역 List -->
<div class="col-md-5">
  <table class="table table-striped">
    <thead>
      <tr>
        <th  style="width: 20%">생산일</th>
        <th style="width: 10%">구분</th>
        <th style="width: 70%">내역</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${productList}" var="vo">
      <tr>
        <td>${vo.orderDate}</td>
        <td>${vo.gubun}</td>
        <td>${vo.ori_200_order}${vo.erl_200_order}${vo.sns_200_order}</td>
      </tr>
</c:forEach>
    </tbody>
  </table>
</div>
<!-- 	 생산 내역 List End  -->
</div>
</body>
</html>