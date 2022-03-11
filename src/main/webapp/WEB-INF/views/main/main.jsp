<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

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

});
</script>

</head>
<body>
<div class="container">
	
	<!-- 주 생산량 start -->
<div class="col-md-4">
<table class="table table-condensed">
   <thead>
    <tr>
    	<td colspan="3" class="text-center">Week 생산량</td>
    	<td colspan="2">${weekDay.toDate}</td>
    </tr>
 	<tr>    	
    	<td colspan="5">${weekDay.startDate} ~ ${weekDay.endDate}</td>
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
        <td>${stockSum.ori_250_sum}개</td>
        <td>${stockSum.ori_250_sum - itemSum.ori_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td>${itemSum.ori_500_sum}개</td>
        <td>${stockSum.ori_500_sum}개</td>
        <td>${stockSum.ori_500_sum - itemSum.ori_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td>${itemSum.ori_1000_sum}개</td>
        <td>${stockSum.ori_1000_sum}개</td>
        <td>${stockSum.ori_1000_sum - itemSum.ori_1000_sum}개</td>
    </tr>
	<tr>
    	<td id="itemTotSum" colspan="5"><fmt:formatNumber value="${itemTotSum.ori_sum}"/> g</td>
    </tr>
	<tr>
        <td rowspan="3" class="text-center">Earlgrey</td>
        <td>250g</td>
        <td>${itemSum.erl_250_sum}개</td>
        <td>${stockSum.erl_250_sum}개</td>
        <td>${stockSum.erl_250_sum - itemSum.erl_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td>${itemSum.erl_500_sum}개</td>
        <td>${stockSum.erl_500_sum}개</td>
        <td>${stockSum.erl_500_sum - itemSum.erl_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td>${itemSum.erl_1000_sum}개</td>
        <td>${stockSum.erl_1000_sum}개</td>
        <td>${stockSum.erl_1000_sum - itemSum.erl_1000_sum}개</td>
    </tr>
    <tr>
    	<td id="itemTotSum" colspan="5"><fmt:formatNumber value="${itemTotSum.erl_sum}"/> g</td>
    </tr>
    <tr>
        <td rowspan="3" class="text-center">SaltCaramel</td>
        <td>250g</td>
        <td>${itemSum.stc_250_sum}개</td>
        <td>${stockSum.stc_250_sum}개</td>
        <td>${stockSum.stc_250_sum - itemSum.stc_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td>${itemSum.stc_500_sum}개</td>
        <td>${stockSum.stc_500_sum}개</td>
        <td>${stockSum.stc_500_sum - itemSum.stc_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td>${itemSum.stc_1000_sum}개</td>
        <td>${stockSum.stc_1000_sum}개</td>
        <td>${stockSum.stc_1000_sum - itemSum.stc_1000_sum}개</td>
    </tr>
    <tr>
    	<td id="itemTotSum" colspan="5"><fmt:formatNumber value="${itemTotSum.stc_sum}"/> g</td>
    </tr>
    </tbody>
  	</table>
 	</div>
	<!-- 주 생산량 end -->

	<!-- 재고량 보이기 -->
	<div class="col-md-8">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th rowspan="2" style="vertical-align:middle; text-align:center;">재료 (g)</th>					
					<th style="display:none">code</th>
					<th colspan="3">주문된 제품</th>
					<th rowspan="2" style="vertical-align:middle; text-align:center;">금주필요</th>
					<th colspan="3">현재재고</th>
					<th rowspan="2" style="vertical-align:middle; text-align:center;">주문필요</th>
					<th colspan="4" style="vertical-align:middle; text-align:center;">2주분</th>
				</tr>
				<tr>
					<th>ORI</th>
					<th>ERL</th>
					<th>STC</th>
					<th>Office</th>
					<th>Cafe</th>
					<th>Total</th>
					<th>O:2</th>
					<th>E:1</th>
					<th>S:1</th>
					<th>Total</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="vo" varStatus="status">
				<c:if test="${vo.total != '0' or vo.finalNeed != '0'}">
					<tr class="dataRow">
						<td class="text-center"><strong>${vo.kname}</strong></td>						
						<td style="display:none" id="code">${vo.code}</td>
						<td id="ori_${status.count}"><fmt:formatNumber value="${vo.ori_qty_2week}" /></td>
						<td id="erl_${status.count}"><fmt:formatNumber value="${vo.erl_qty_2week}" /></td>
						<td id="stc_${status.count}"><fmt:formatNumber value="${vo.stc_qty_2week}" /></td>
						<td class="text-right warning" id="need_${status.count}"><fmt:formatNumber value="${vo.needSum}" /></td>						
						<td id="ftt_${status.count}"><fmt:formatNumber value="${vo.total-vo.sumCafe}" /></td>
						<td id="ftt_${status.count}"><fmt:formatNumber value="${vo.sumCafe}" /></td>
						<td id="tot_${status.count}"><strong><fmt:formatNumber value="${vo.total}" /></strong></td>						
						<c:if test="${vo.finalNeed >=0}"><td class="text-right warning" id="totNeed2week_${status.count}"></c:if>
						<c:if test="${vo.finalNeed <0}"><td class="text-right warning" id="totNeed2week_${status.count}" style="background-color:yellowgreen;"></c:if>
							<fmt:formatNumber value="${vo.finalNeed}" /></td>
						<td class="text-right" id="need2week_${status.count}"><fmt:formatNumber value="${vo.ori_need2week}" /></td>
						<td class="text-right" id="need2week_${status.count}"><fmt:formatNumber value="${vo.erl_need2week}" /></td>
						<td class="text-right" id="need2week_${status.count}"><fmt:formatNumber value="${vo.stc_need2week}" /></td>
						<td class="text-right" id="need2week_${status.count}"><strong><fmt:formatNumber value="${vo.need2week}" /></strong></td>
					</tr> <!-- style="display:none"  -->
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>	
</div>

</body>
</html>