<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchBook</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" rel="stylesheet">
  
<script>
  $( function() {
	
	  // 입력 메세지 처리		
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
		showMonthAfterYear: true, dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
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
		showMonthAfterYear: true, dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
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

  });
  </script>
</head>
<body>
<div class="container">
<form class="form-horizontal" method="post">
<div class="row">
  <h2>구매 입력</h2>  
	<div class="col-sm-6">
	   <div class="form-group">
	      <label for="buyDate" class="col-sm-3 control-label">구매일자</label>
	      <div class="col-sm-8">
	        <input class="form-control" id="buyDate" name="buyDate" type="text" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="item" class="col-sm-3 control-label">구매품</label>
	      <div class="col-sm-8">
	      <select id="item" name="item" class="form-control" required="required">
	      	<option value="*"></option>
	      <c:forEach items="${ingreList}" var="vo">
	      	<option value="${vo.code}">${vo.kname}</option>
	      </c:forEach>
	      </select>	        
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control" required="required">
	            <option value="구매">구매</option>
	            <option value="반품">반품</option>
	            <option value="폐기">폐기</option>
			</select>
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="content" class="col-sm-3 control-label">용량</label>
	      <div class="col-sm-8">
		      <select id="content" name="content" class="form-control" required="required">
				<option value="">수량 1개당 용량</option>	            
			  </select>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="qty" class="col-sm-3 control-label">수량</label>
	      <div class="col-sm-8">
	        <input class="form-control" id="qty" name="qty" type="text" placeholder="qty" required="required">
	      </div>
	    </div>	          
	     <div class="form-group">
	      <label for="unit" class="col-sm-3 control-label">단위</label>
	      <div class="col-sm-8">
			<label class="radio-inline">
		      <input type="radio" name="unit" value="g">g
		    </label>
		    <label class="radio-inline">
		      <input type="radio" name="unit" value="pack">pack
		    </label>
		    <label class="radio-inline">
		      <input type="radio" name="unit" value="box">box
		    </label>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="price" class="col-sm-3 control-label">금액</label>
	      <div class="col-sm-8"> 
	      <div class="input-group">
	      	<span class="input-group-addon"><i class="fas fa-won-sign"></i></span>
			<input class="form-control" type="text" id="price" name="price" required="required">
		  </div></div>
	    </div>
	</div> <!-- 1블럭 End -->
	
	<div class="col-sm-6">
    <div class="form-group">
      <label for="purShop" class="col-sm-3 control-label">거래처</label>
      <div class="col-sm-8">
		<select id="purShop" name="purShop" class="form-control" required="required">
			<option value="*"> </option>
            <option value="넛츠베리">넛츠베리</option>
            <option value="쿠팡">쿠팡</option>
		</select>
      </div>
    </div>
    <div class="form-group">
      <label for="inDate" class="col-sm-3 control-label">입고일자</label>
      <div class="col-sm-8">
       	<input class="form-control" type="text" id="inDate" name="inDate">
      </div>
    </div>
     <div class="form-group">
      <label for="comm" class="col-sm-3 control-label">내역</label>
      <div class="col-sm-8">
      	<textarea class="form-control" rows="5" id="comm" name="comm"></textarea>
      </div>
    </div>
     <div class="form-group">
      <label for="buyer" class="col-sm-3 control-label">구매자</label>
      <div class="col-sm-8">
      	<select id="buyer" name="buyer" class="form-control">
            <option value="홍동호">홍동호</option>
            <option value="대행인">대행인</option>
		</select>
      </div>
    </div>
	</div> <!-- 2블럭 End -->
		</div>
	<div class="row">
    <div class="form-group">
    <div class="col-sm-6"></div>
    <div class="col-sm-6">
    	<button type="submit" class="btn btn-primary btn-block">저장</button>
    </div>	
    </div>
  </div>
    </form>
</div>
</body>
</html>