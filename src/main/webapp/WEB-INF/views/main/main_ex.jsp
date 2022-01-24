<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

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
.panel-body {
	padding: 5px 5px;
}
.col-xs-3 {
	padding: 0px 3px important;
}
.form-group {
	margin-bottom: 0px;
}

th {
	text-align: center;
}

label {
	padding-top: 10px;
}

button {
	font: 12px;
}

.heading {
	background-color: #F5F5F5;
}
</style>
<script>
  $( function() {
	  
	// 입력 메세지 처리		
  	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
	
	// 화면 입력값 처리 후 reload
	setOriQty();
	
	  // 주문일자
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
		showMonthAfterYear: true, dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
      
	});
	  
	// original
	
	function setOriQty() {
		let item = "";
		// 주문 받은 양
		let order_ori = ($("#oriMark").text())/100;
		let order_erl = ($("#erlMark").text())/100;
		let order_sns = ($("#snsMark").text())/100;
		
		//alert(order_ori+"/"+order_erl+"/"+order_sns);
		console.log(order_ori+"/"+order_erl+"/"+order_sns);

		// 생산에 필요한 양 구하기
		$("tr").each(function(index) {

			oriNeedQty = $("#ori_"+index).text() * order_ori;
			erlNeedQty = $("#erl_"+index).text() * order_erl;
			snsNeedQty = $("#sns_"+index).text() * order_sns;
			
			// 필요량
			let needSum = oriNeedQty+erlNeedQty+snsNeedQty;			
			$("#need_"+index).text(needSum);
			
			// 최종재고
			let finalTotal = $("#tot_"+index).text()-needSum;
			$("#ftt_"+index).text(finalTotal);
			if(finalTotal <0 ) {
				$("#ftt_"+index).addClass('danger');
			} else {
				$("#ftt_"+index).removeClass('danger');	
			}
			
		});
	}
	
	$("#calculateBtn").click(function() {
		//alert("계산");
		$("#indivisuleSum").text("");
		// original 주문 수량
		let ori_200 	= ($("#ori_200").val())*200;
		let ori_500 	= ($("#ori_500").val())*500;
		let ori_1000 	= ($("#ori_1000").val())*1000;
		let ori_sum 	= (ori_200+ori_500+ori_1000);
		//$("#indivisuleSum").text(ori_200+"/"+ori_500+"/"+ori_1000+" = "+ori_sum+" -----  ");			
		
		// earlgrey 주문 수량
		let erl_200 	= ($("#erl_200").val())*200;
		let erl_500 	= ($("#erl_500").val())*500;
		let erl_1000 	= ($("#erl_1000").val())*1000;
		let erl_sum 	= (erl_200+erl_500+erl_1000);
		//$("#indivisuleSum").append(erl_200+"/"+erl_500+"/"+erl_1000+"  -----  ");
		
		// sweet&salty 주문 수량
		let sns_200 	= ($("#sns_200").val())*200;
		let sns_500 	= ($("#sns_500").val())*500;
		let sns_1000 	= ($("#sns_1000").val())*1000;
		let sns_sum 	= (sns_200+sns_500+sns_1000);
		//$("#indivisuleSum").append(sns_200+"/"+sns_500+"/"+sns_1000);
		//$("#indivisuleSum").append("original : "+ori_sum+" / earlgrey : "+erl_sum+" / sweet&salty"+sns_sum);
		$("#oriMark").text(ori_sum);
		$("#erlMark").text(erl_sum);
		$("#snsMark").text(sns_sum);
		
		setOriQty();
	});
	
	$("#orderBtn").click(function() {
		alert("주문");
	});	
	
});
</script>

</head>
<body>
<div class="container">
<form method="post" id="frm">
<div class="row">
  <div class="col-md-3">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">ORIGINAL</div>
	  <div class="panel-body">
	  	<div class="form-group form-group-sm">
	  	<div class="col-xs-4">
		    <label for="ori_200">200g</label>
		    <input class="form-control" id="ori_200" name="ori_200" type="number" pattern="[0-9]{4}">
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
  <div class="col-md-3">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">EARLGREY</div>
	  <div class="panel-body">
	  	<div class="form-group form-group-sm">
	  	<div class="col-xs-4">
		    <label for="erl_200">200g</label>
		    <input class="form-control" id="erl_200" name="erl_200" type="number" pattern="[0-9]{4}">
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
  <div class="col-md-3">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">SWEET & SALTY</div>
	  <div class="panel-body">
	  	<div class="form-group form-group-sm">
	  	<div class="col-xs-4">
		    <label for="sns_200">200g</label>
		    <input class="form-control" id="sns_200" name="sns_200" type="number" pattern="[0-9]{4}">
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
  <div class="col-md-2">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">주문</div>
	  <div class="panel-body">
	  	<div class="form-group form-group-sm">
	      <label for="orderDate" class="col-sm-4 control-label">일자</label>
	      <div class="col-xs-8">
	        <input class="form-control" id="orderDate" name="orderDate" type="text" required="required">
	      </div>	      
	    </div>	    
  	  </div>
	</div>
  </div>
  <div class="col-md-1">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-body">
	  	<button type="button" class="btn" id="calculateBtn">계산</button>
	  </div>
	  <div class="panel-body">	  	
	    <button type="button" class="btn" id="orderBtn">주문</button>
  	  </div>
	</div>
  </div>
</div>
</form>
<!-- ----------------------------------------------------------------------------------------------------------- -->
	<!-- 재고량 보이기 -->
	<div class="row">
	<div class="col-md-6">
		<table class="table table-bordered">
			<thead>
				<tr><th colspan="9" style="text-align: right;">(g)</th></tr>
				<tr>
					<th>재료</th>
					<th hidden>재료</th>
					<th hidden>code</th>
					<th>ORI</th>
					<th>ERL</th>
					<th>SnS</th>
					<th>재고</th>
					<th>필요량</th>
					<th>최종재고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="vo" varStatus="status">
					<tr>
						<td class="text-center">${vo.kname}</td>
						<td hidden>${vo.ename}</td>
						<td hidden class="text-center" id="code">${vo.code}</td>
						<td class="text-right" id="ori_${status.count}">${vo.ori_qty}</td>
						<td class="text-right" id="erl_${status.count}">${vo.erl_qty}</td>
						<td class="text-right" id="sns_${status.count}">${vo.sns_qty}</td>
						<td class="text-right" id="tot_${status.count}">${vo.total}</td>
						<td class="text-right warning" id="need_${status.count}"> </td>
						<c:if test="${vo.total < 0}">
						<td class="text-right danger" id="ftt_${status.count}">${vo.total}</td>
						</c:if>
						<c:if test="${vo.total >= 0}">
						<td class="text-right" id="ftt_${status.count}">${vo.total}</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<!-- 주 생산량 start -->
	<div class="col-md-3">
		<ul class="list-group">
		<li class="list-group-item text-center heading" id="">Week 생산량</li>
		<li class="list-group-item" id="">	
			<div class="media"  style="width:100%">
			  <div class="media-left media-middle" style="width:40%">
			    <p>Original</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%">
			    <p>200g</p>
			    <p>500g</p>
			    <p>1,000g</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%" id="oriWeekProduct">
			    <p>10</p>
			    <p>10</p>
			    <p>10</p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>
		</li>
		<li class="list-group-item" id="">	
			<div class="media"  style="width:100%">
			  <div class="media-left media-middle" style="width:40%">
			    <p>Earlgrey</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%">
			    <p>200g</p>
			    <p>500g</p>
			    <p>1,000g</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%" id="erlWeekProduct">
			    <p>10</p>
			    <p>10</p>
			    <p>10</p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>
		</li>
		<li class="list-group-item" id="">	
			<div class="media"  style="width:100%">
			  <div class="media-left media-middle" style="width:40%">
			    <p>Sweet&Salty</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%">
			    <p>200g</p>
			    <p>500g</p>
			    <p>1,000g</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%" id="snsWeekProduct">
			    <p>10</p>
			    <p>10</p>
			    <p>10</p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>
		</li>
		</ul>
<!-- 주 생산량 end -->
		
<!-- 주 주문량 start -->
		<ul class="list-group">
		<li class="list-group-item text-center heading" id="">Week 주문량</li>
		<li class="list-group-item" id="">	
			<div class="media"  style="width:100%">
			  <div class="media-left media-middle" style="width:40%">
			    <p>Original</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%">
			    <p>200g</p>
			    <p>500g</p>
			    <p>1,000g</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%" id="oriWeekOrder">
			    <p>10</p>
			    <p>10</p>
			    <p>10</p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>
		</li>
		<li class="list-group-item" id="">	
			<div class="media"  style="width:100%">
			  <div class="media-left media-middle" style="width:40%">
			    <p>Earlgrey</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%">
			    <p>200g</p>
			    <p>500g</p>
			    <p>1,000g</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%" id="erlWeekOrder">
			    <p>10</p>
			    <p>10</p>
			    <p>10</p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>
		</li>
		<li class="list-group-item" id="">	
			<div class="media"  style="width:100%">
			  <div class="media-left media-middle" style="width:40%">
			    <p>Sweet&Salty</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%">
			    <p>200g</p>
			    <p>500g</p>
			    <p>1,000g</p>
			  </div>
			  <div class="media-body" align="right" style="width:30%" id="snsWeekOrder">
			    <p>10</p>
			    <p>10</p>
			    <p>10</p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>
		</li>
		</ul>
	</div>
<!-- 주 주문량 end -->
	
	<div class="col-md-3">
		<ul class="list-group">
		  <li class="list-group-item text-center heading" id="">주문 생산량</li>
		  <li class="list-group-item" id="">original <span class="badge" id="oriMark"></span></li>
		  <li class="list-group-item" id="">earlgrey <span class="badge" id="erlMark"></span></li>
		  <li class="list-group-item" id="">sweet&salty <span class="badge" id="snsMark"></span></li>
		</ul>
		<ul class="list-group">
		  <li class="list-group-item text-center heading" id="">주문 주문량</li>
		  <li class="list-group-item" id="">original <span class="badge" id="oriMarkOrder"></span></li>
		  <li class="list-group-item" id="">earlgrey <span class="badge" id="erlMarkOrder"></span></li>
		  <li class="list-group-item" id="">sweet&salty <span class="badge" id="snsMarkOrder"></span></li>
		</ul>					
	</div>
	</div>

</div>
</body>
</html>