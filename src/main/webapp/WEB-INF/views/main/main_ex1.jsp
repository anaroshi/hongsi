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
td {
	text-align: right;
}
#footer {
	text-align: right;
}
.dataRow:hover {
	background: #ccc;
	cursor: pointer;
}
#itemTotSum {
	background-color: #F5F5F5;
}
</style>

<script type="text/javascript">
$(function() {
	setOriQty();
	
	function setOriQty() {
		let item = "";
		// 주문 받은 양
		let order_ori = ${itemTotSum.ori_sum}/100;
		let order_erl = ${itemTotSum.erl_sum}/100;
		let order_sns = ${itemTotSum.sns_sum}/100;
		
		// alert(order_ori+"/"+order_erl+"/"+order_sns);
		// console.log(order_ori+"/"+order_erl+"/"+order_sns);

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
// 			if(finalTotal <0 ) {
// 				$("#ftt_"+index).addClass('danger');
// 			} else {
// 				$("#ftt_"+index).removeClass('danger');	
// 			}
			
			// 주문필요 (500g * 80개 2주분 생산재료 + 최종 재고)
			let need2weekTotal = $("#need2week_"+index).text()-($("#tot_"+index).text()-needSum);
			if ($("#need2week_"+index).text() != 0 && need2weekTotal>=0) {
				$("#totNeed2week_"+index).text(need2weekTotal);
				$("#totNeed2week_"+index).addClass('danger');
			} else {
				$("#totNeed2week_"+index).text("0");
				$("#totNeed2week_"+index).removeClass('danger');
			}
			
			if ($("#tot_"+index).text() == 0 && need2weekTotal == 0) {
				$("#tot_"+index).closest("tr").remove();
			}
		});
	}
	
});
</script>

</head>
<body>
<div class="container">
	
	<!-- 주 생산량 start -->
<div class="col-md-6">
<table class="table table-condensed">
   <thead>
    <tr>
    	<td colspan="5">${weekDay.toDate}</td>
    </tr>
 	<tr>
    	<td colspan="3" class="text-center">Week 생산량</td>
    	<td colspan="2">${weekDay.startDate} ~ ${weekDay.endDate}</td>
    </tr>
	<tr>
        <th colspan="2" class="text-center">제품명</th>
        <th width="20%">주문량</th>
        <th width="20%">재고량</th>
        <th width="20%">금주필요</th>
      </tr>
    </thead>
    <tbody>
 	<tr>
        <td rowspan="3" class="text-center">Original</td>
        <td width="20%">250g</td>
        <td>${itemSum.ori_250_sum}개</td>
        <td>${itemSum.ori_250_sum}개</td>
        <td>${itemSum.ori_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td>${itemSum.ori_500_sum}개</td>
        <td>${itemSum.ori_500_sum}개</td>
        <td>${itemSum.ori_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td>${itemSum.ori_1000_sum}개</td>
        <td>${itemSum.ori_1000_sum}개</td>
        <td>${itemSum.ori_1000_sum}개</td>
    </tr>
	<tr>
    	<td id="itemTotSum" colspan="5">${itemTotSum.ori_sum}</td>
    </tr>
	<tr>
        <td rowspan="3" class="text-center">Earlgrey</td>
        <td>250g</td>
        <td>${itemSum.erl_250_sum}개</td>
        <td>${itemSum.erl_250_sum}개</td>
        <td>${itemSum.erl_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td>${itemSum.erl_500_sum}개</td>
        <td>${itemSum.erl_500_sum}개</td>
        <td>${itemSum.erl_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td>${itemSum.erl_1000_sum}개</td>
        <td>${itemSum.erl_1000_sum}개</td>
        <td>${itemSum.erl_1000_sum}개</td>
    </tr>
    <tr>
    	<td id="itemTotSum" colspan="5">${itemTotSum.erl_sum}</td>
    </tr>
    <tr>
        <td rowspan="3" class="text-center">Sweet &amp; Salty</td>
        <td>250g</td>
        <td>${itemSum.sns_250_sum}개</td>
        <td>${itemSum.sns_250_sum}개</td>
        <td>${itemSum.sns_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td>${itemSum.sns_500_sum}개</td>
        <td>${itemSum.sns_500_sum}개</td>
        <td>${itemSum.sns_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td>${itemSum.sns_1000_sum}개</td>
        <td>${itemSum.sns_1000_sum}개</td>
        <td>${itemSum.sns_1000_sum}개</td>
    </tr>
    <tr>
    	<td id="itemTotSum" colspan="5">${itemTotSum.sns_sum}</td>
    </tr>
    </tbody>
  	</table>
 	</div>
<!-- 주 생산량 end -->

<!-- 재고량 보이기 -->
	<div class="col-md-6">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>재료 (g)</th>
					<th style="display:none">재료</th>
					<th style="display:none">code</th>
					<th>ORI</th>
					<th>ERL</th>
					<th>SnS</th>
					<th>현재재고</th>
					<th>금주필요</th>
					<th>최종재고</th>
					<th style="display:none">주문필요</th>
					<th>주문필요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="vo" varStatus="status">
					<tr class="dataRow">
						<td class="text-center">${vo.kname}</td>
						<td style="display:none">${vo.ename}</td>
						<td style="display:none" id="code">${vo.code}</td>
						<td id="ori_${status.count}">${vo.ori_qty}</td>
						<td id="erl_${status.count}">${vo.erl_qty}</td>
						<td id="sns_${status.count}">${vo.sns_qty}</td>
						<td id="tot_${status.count}">${vo.total}</td>
						<td class="text-right warning" id="need_${status.count}"> </td>
						<c:if test="${vo.total < 0}">
						<td class="text-right danger" id="ftt_${status.count}">${vo.total}</td>
						</c:if>
						<c:if test="${vo.total >= 0}">
						<td id="ftt_${status.count}">${vo.total}</td>
						</c:if>
						<td style="display:none" class="text-right warning" id="need2week_${status.count}">${vo.need2week}</td>
						<td class="text-right warning" id="totNeed2week_${status.count}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
</div>

</body>
</html>