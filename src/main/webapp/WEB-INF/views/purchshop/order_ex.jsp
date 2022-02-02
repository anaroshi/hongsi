<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
    	
.btn:hover {
	background-color: #CCCCCC;
	color: white;
}
</style>
  
<script>
  $( function() {

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
    		case "in_001": case "in_014":
    			d = itemC;
    		break;
    		case "in_015":
    			d = itemD;
    		break;
    		case "in_027":
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
		
		$("#frm").submit();
  	});
    
  });
  
  </script>
</head>

<body>
<div class="container">
<form class="form-horizontal" method="post" id="frm">
  <h4>주문 입력</h4>
  <div class="row">
  <div class="col-md-4">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">ORIGINAL</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="ori_250">200g</label>
		    <input class="form-control" id="ori_250" name="ori_250" type="number" pattern="[0-9]{4}">
		</div>
	    <div class="col-xs-4">
		    <label for="ori_500">500g</label>
		    <input class="form-control" id="ori_500" name="ori_500" type="number" pattern="[0-9]{4}">
		</div>
		<div class="col-xs-4">
		    <label for="ori_1000">1,000g</label>
		    <input class="form-control" id="ori_1000" name="ori_1000" type="number" pattern="[0-9]{4}">
		</div>
  		</div>
  	  </div>
	</div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">EARLGREY</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="erl_250">200g</label>
		    <input class="form-control" id="erl_250" name="erl_250" type="number" pattern="[0-9]{4}">
		</div>
	    <div class="col-xs-4">
		    <label for="erl_500">500g</label>
		    <input class="form-control" id="erl_500" name="erl_500" type="number" pattern="[0-9]">
		</div>
		<div class="col-xs-4">
		    <label for="erl_1000">1,000g</label>
		    <input class="form-control" id="erl_1000" name="erl_1000" type="number" pattern="[0-9]">
		</div>
  		</div>
  	  </div>
	</div>
  </div>
  <div class="col-md-4">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">SWEET &amp; SALTY</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="sns_250">200g</label>
		    <input class="form-control" id="sns_250" name="sns_250" type="number" pattern="[0-9]{4}">
		</div>
	    <div class="col-xs-4">
		    <label for="sns_500">500g</label>
		    <input class="form-control" id="sns_500" name="sns_500" type="number" pattern="[0-9]">
		</div>
		<div class="col-xs-4">
		    <label for="sns_1000">1,000g</label>
		    <input class="form-control" id="sns_1000" name="sns_1000" type="number" pattern="[0-9]">
		</div>
  		</div>
  	  </div>
	</div>
  </div>
  </div> 
  <div class="row"> 
	<div class="col-sm-6">
	   <div class="form-group">
	      <label for="orderDate" class="col-sm-3 control-label">주문일자</label>
	      <div class="col-sm-8">
	        <input class="form-control" id="orderDate" name="orderDate" type="text" required="required">
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control">
	            <option value="판매">판매</option>
	            <option value=""></option>
			</select>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="salePath" class="col-sm-3 control-label">주문경로</label>
	      <div class="col-sm-8">
			<select id="gubun" name="salePath" class="form-control">
	            <option value="개별구매">개별구매</option>
	            <option value="NAVER쇼핑">NAVER쇼핑</option>
	            <option value="Homepage">Homepage</option>
			</select>
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="orderer" class="col-sm-3 control-label">주문자</label>
	      <div class="col-sm-8">
			<input class="form-control" type="text" id="orderer" name="orderer">
	      </div>
	    </div>
	</div> <!-- 1블럭 End -->
	
	<div class="col-sm-6">       
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
	</div> <!-- 2블럭 End -->
		</div>
	<div class="row">
    <div class="form-group">
    <div class="col-sm-6"></div>
	<div class="col-sm-3">    	
    	<button type="reset" class="btn btn-block">초기화</button>
    </div>	
    <div class="col-sm-3">
    	<button type="button" class="btn btn-block" id="orderSave">저장</button>
	</div>
    </div>
  </div>
    </form>
</div>
</body>
</html>