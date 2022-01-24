<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
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
label {
	padding-top: 10px;
}
button {
	font: 12px;
}
.heading, th, #footer {
	background-color: #F5F5F5;
	text-align: center;
}
th {
	text-align: center;
}
#footer {
	text-align: right;
}
</style>

<script type="text/javascript">
$(function() {
	setOriQty();
	
	function setOriQty() {
		let item = "";
		// 주문 받은 양
		let order_ori = ($(".ori_sum").val())/100;
		let order_erl = ($(".erl_sum").val())/100;
		let order_sns = ($(".sns_sum").val())/100;
		
		alert(order_ori+"/"+order_erl+"/"+order_sns);
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
	
});
</script>

</head>
<body>
<div class="container">
	<!-- 재고량 보이기 -->
	<div class="row">
	<div class="col-md-6">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>재료 (g)</th>
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
			    <p><fmt:formatNumber value="${itemSum.ori_200_sum}" groupingUsed="true"/></p>
			    <p><fmt:formatNumber value="${itemSum.ori_500_sum}" groupingUsed="true"/></p>
			    <p><fmt:formatNumber value="${itemSum.ori_1000_sum}" groupingUsed="true"/></p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>			
		</li>
		<li class="list-group-item ori_sum" id="footer"><fmt:formatNumber value="${itemTotSum.ori_sum}" groupingUsed="true"/> g</li>
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
			    <p><fmt:formatNumber value="${itemSum.erl_200_sum}" groupingUsed="true"/></p>
			    <p><fmt:formatNumber value="${itemSum.erl_500_sum}" groupingUsed="true"/></p>
			    <p><fmt:formatNumber value="${itemSum.erl_1000_sum}" groupingUsed="true"/></p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>
		</li>
		<li class="list-group-item erl_sum" id="footer"><fmt:formatNumber value="${itemTotSum.erl_sum}" groupingUsed="true"/> g</li>
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
			    <p><fmt:formatNumber value="${itemSum.sns_200_sum}" groupingUsed="true"/></p>
			    <p><fmt:formatNumber value="${itemSum.sns_500_sum}" groupingUsed="true"/></p>
			    <p><fmt:formatNumber value="${itemSum.sns_1000_sum}" groupingUsed="true"/></p>
			  </div>
			  <div class="media-body" align="right" style="width:10%">
			    <p>개</p>
			    <p>개</p>
			    <p>개</p>
			  </div>
			</div>
			<li class="list-group-item sns_sum" id="footer"><fmt:formatNumber value="${itemTotSum.sns_sum}" groupingUsed="true"/> g</li>
		</li>
		</ul>
	</div>
<!-- 주 생산량 end -->
</div>
</div>
</body>
</html>