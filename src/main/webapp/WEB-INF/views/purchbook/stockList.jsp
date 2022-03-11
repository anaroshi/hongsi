<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quantity</title>
<style type="text/css">
th {
	vertical-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h4>재료 재고</h4>
		<div class="row">
			<div class="col-md-9">
				<!-- private String  kname;		// 구매품 이름
					private long 	inTotal;	// 입고 수량
					private long 	outTotal;	// 출고 수량
					private long 	disTotal;	// 폐기 수량
					private long 	total;		// 잔고 수량 -->

				<table class="table table-striped">
					<thead>
						<tr>
							<th rowspan="2" style="vertical-align:middle; text-align:center;">Ingredient</th>
							<th rowspan="2" style="vertical-align:middle; text-align:center;">잔고량 (g)</th>
							<th rowspan="2"> </th>
							<th colspan="3">입고량 (g)</th>
							<th rowspan="2"> </th>
							<th colspan="3">출고량 (g)</th>
							<th rowspan="2"> </th>
							<th colspan="3">폐기량 (g)</th>
						</tr>
						<tr>
							<th>Office</th>
							<th>Cafe</th>
							<th>Total</th>
							<th>Office</th>
							<th>Cafe</th>
							<th>Total</th>
							<th>Office</th>
							<th>Cafe</th>
							<th>Total</th>							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ingreTotalList}" var="vo">
						<c:if test="${vo.inTotal != '0' or vo.total != '0'}">
							<tr class="dataRow">
								<td><strong>${vo.kname}</strong></td>
								<td class="text-right"><strong><fmt:formatNumber>${vo.total}</fmt:formatNumber></strong></td>
								<td class="text-right"> </td>
								<td class="text-right"><fmt:formatNumber>${vo.inTotal - vo.inCafeTotal}</fmt:formatNumber></td>
								<td class="text-right"><fmt:formatNumber>${vo.inCafeTotal}</fmt:formatNumber></td>
								<td class="text-right"><strong><fmt:formatNumber>${vo.inTotal}</fmt:formatNumber></strong></td>
								<td class="text-right"> </td>
								<td class="text-right"><fmt:formatNumber>${vo.outTotal - vo.outCafeTotal}</fmt:formatNumber></td>
								<td class="text-right"><fmt:formatNumber>${vo.outCafeTotal}</fmt:formatNumber></td>
								<td class="text-right"><strong><fmt:formatNumber>${vo.outTotal}</fmt:formatNumber></strong></td>
								<td class="text-right"> </td>
								<td class="text-right"><fmt:formatNumber>${vo.disTotal - vo.disCafeTotal}</fmt:formatNumber></td>
								<td class="text-right"><fmt:formatNumber>${vo.disCafeTotal}</fmt:formatNumber></td>
								<td class="text-right"><strong><fmt:formatNumber>${vo.disTotal}</fmt:formatNumber></strong></td>
							</tr>
						</c:if>	
						</c:forEach>
						<!-- qtyList End -->
					</tbody>
				</table>
			</div>

			<div class="col-md-3">
				<div class="panel-group">
				<div class="panel panel-danger">
					<div class="panel-heading">재고 확인해 주세요.</div>
					<div class="panel-body">
						<ul class="list-group">
							<c:forEach items="${ingreTotalList}" var="vo">
								<c:if test="${vo.total < 500}">
									<li class="list-group-item" style="border: none; padding-bottom:20px;" >
 										<div class="col-md-5">${vo.kname}</div>
										<div class="col-md-7"> - 재고 ${vo.total} g입니다.</div>
									</li>
								</c:if>
							</c:forEach>
							<!-- ingreTotalList End -->
						</ul>
					</div>
				</div>
				</div>
			</div>			
		</div>		
	</div>
</html>