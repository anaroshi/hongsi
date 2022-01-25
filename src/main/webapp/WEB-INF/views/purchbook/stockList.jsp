<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quantity</title>
</head>
<body>
	<div class="container">
		<h4>재료 재고</h4>
		<div class="panel-group">
			<div class="panel panel-danger">
				<div class="panel-heading">재고 확인해 주세요.</div>
				<div class="panel-body">
					<ul class="list-group">
						<c:forEach items="${ingreTotalList}" var="vo">
							<c:if test="${vo.total < 500}">
								<li class="list-group-item" style="border: none" >${vo.kname} - 재고 ${vo.total} g입니다.</li>
							</c:if>
						</c:forEach>
						<!-- ingreTotalList End -->
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<!-- private String  kname;		// 구매품 이름
	private long 	inTotal;	// 입고 수량
	private long 	outTotal;	// 출고 수량
	private long 	disTotal;	// 폐기 수량
	private long 	total;		// 잔고 수량 -->

				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Ingredient</th>
							<th>입고량 (g)</th>
							<th>출고량 (g)</th>
							<th>폐기량 (g)</th>
							<th>잔고량 (g)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ingreTotalList}" var="vo">
							<tr>
								<td>${vo.kname}</td>
								<td class="text-right">${vo.inTotal}</td>
								<td class="text-right">${vo.outTotal}</td>
								<td class="text-right">${vo.disTotal}</td>
								<td class="text-right">${vo.total}</td>
							</tr>
						</c:forEach>
						<!-- qtyList End -->
					</tbody>
				</table>
			</div>

			<div class="col-md-6">
			</div>
		</div>
	</div>
</html>