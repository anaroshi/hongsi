<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchBook</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" rel="stylesheet">

<style type="text/css">
.btn:hover {
	background-color: #CCCCCC;
	color: white;
}

.select {
	font-size: 12px;
}
.dataRow:hover {
	background: #ccc;
	cursor: pointer; 
}
div.modal-body {
	height: 90px;
}

		
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
    
    $( "#inDateSave" ).datepicker({
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
    
	$(".dataRow").click(function(){
		let cno 	= $(this).find(".cno").text();		
		let buyDate = $(this).find(".buyDate").text();		
		let gubun 	= $(this).find(".gubun").text();		
		let item 	= $(this).find(".item").text();		
		let kname 	= $(this).find(".kname").text();		
		let content = $(this).find(".content").text();		
		let qty 	= $(this).find(".qty").text();
		let purShop	= $(this).find(".purShop").text();
		
		$(".cno").val(cno);		
		$(".buyInfo").css("font-size","16px").text(buyDate+"  "+gubun+"  "+kname+"  "+content+"g  "+qty+"개  "+purShop);		
		$("#myModal").modal("show");
	});	
	
});
  </script>
</head>
<body>
<div class="container">
<div class="row">
  <h4>재료 입출고 입력</h4>
	
	<form class="form-horizontal" method="post">	
	<!-- 재료 입출고 입력 Start -->
	<!-- 1블럭 Start -->
	
	<div class="col-sm-4">
		<div class="form-group">
	      <label for="buyDate" class="col-sm-3 control-label">입출고일</label>
	      <div class="col-sm-8">
	        <input class="form-control" id="buyDate" name="buyDate" type="text" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="item" class="col-sm-3 control-label">재료</label>
	      <div class="col-sm-8">
	      <select id="item" name="item" class="form-control select" required="required">
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
			<select id="gubun" name="gubun" class="form-control select" required="required">
	            <option value="출고">출고</option>
	            <option value="입고_office">입고_office</option>
	            <option value="입고_cafe">입고_cafe</option>
	            <option value="손실">손실</option>
			</select>
	      </div>
	    </div>	    
	   
	    <div class="form-group">
			<label for="content" class="col-sm-3 control-label">용량</label>
			<div class="col-sm-8">
				<input class="form-control" id="content" name="content" type="text" placeholder="content" required="required">		      
			</div>
	    </div>
	    
	    <div class="form-group">
	      <label for="qty" class="col-sm-3 control-label">수량</label>
	      <div class="col-sm-8">
	        	<input class="form-control" id="qty" name="qty" type="text" placeholder="qty" required="required">
	      </div>
	    </div>
	</div>
	<!-- 1블럭 End -->
	
	<!-- 2블럭 Start -->
	<div class="col-sm-3">
	<div class="form-group">
      <label for="comm" class="col-sm-3 control-label">내역</label>
      <div class="col-sm-8">
      	<textarea class="form-control" rows="5" id="comm" name="comm"></textarea>
      </div>
     </div>
     <div class="form-group">
      <label for="buyer" class="col-sm-3 control-label">담당자</label>
      <div class="col-sm-8">
      	<select id="buyer" name="buyer" class="form-control select">
            <option value="홍동호">홍동호</option>
            <option value="대행인">대행인</option>
		</select>
      </div>
 	</div>

	<div class="row">
    <div class="form-group">
	    <div class="col-sm-6"></div>
	    <div class="col-sm-6">
	    	<button type="submit" class="btn btn-block">저장</button>
	    </div>	
    </div>
    </div>
    </div>
    
	<!-- 2블럭 End -->
	<!-- 재료주문 End -->

	<!-- 재료 입출고  List Start -->
	<div class="col-md-5">
	<table class="table table-condensed">
	   <thead>    
	 	<tr>
	    	<td colspan="7" class="text-center"><h5>입출고 LIST</h5></td>    	
	    </tr>
		<tr>
	        <th width="17%">입출고일</th>
	        <th width="10%">구분</th>
	        <th width="22%">재료</th>
	        <th width="22%" style="display:none">재료</th>
	        <th width="9%">용량</th>
	        <th width="9%">수량</th>
	      </tr>
	    </thead>
	    <tbody>
	<c:forEach items="${resultList}" var="vo" varStatus="status">
	 	<tr class="dataRow">
	 		<td class="cno" style="display:none">${vo.cno}</td>
	        <td class="buyDate">${vo.buyDate}</td>
	        <td class="gubun">${vo.gubun}</td>
	        <td class="item" style="display:none">${vo.item}</td>
	        <td class="kname">${vo.kname}</td>
	        <td class="content text-right">${vo.content}</td>
	        <td class="qty text-right">${vo.qty}</td>
	    </tr>
	</c:forEach>
	    </tbody>
	</table>
	</div> 
	<!-- 재료 입출고 List End  -->
    </form>
    
    <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">입출고 내역</h4>
      </div>
      <form method="post" id="inDateSaveForm"  name="inDateSaveForm" action="/purchbook/inDateSave.do">
      <div class="modal-body">
      		<input style="display:none" class="cno" 	name="cno"/>
      		<div class="form-group">
	      		<div>
	      			<p class="buyInfo"></p>
	      		</div>
      		</div>
	      	<label for="inDateSave" class="col-sm-3 text-center control-label" style="font-size: 15px">입고일</label>
	      	<div class="col-sm-4">
	        <input class="form-control" id="inDateSave" name="inDate" type="text" required="required">
	      	</div>         
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-default" id="inDateSaveBtn">저장</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>	
  </div>
</div>
<!-- 모달 끝 -->

	</div>
</div>
</body>
</html>