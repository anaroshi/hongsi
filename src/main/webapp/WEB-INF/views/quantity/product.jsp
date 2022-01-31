<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 생산</title>
<style type="text/css">
label {
	font-size: 15px;
	text-align: center;
}

.dataRow:hover {
	background: #ccc;
	cursor: pointer;
}	
</style>

<script type="text/javascript">
$(function() {
	// 로스팅
	$("#roast").change(function() {
		let code = $(this).val();
		// 테이블 자리 비우기
		$("#roastQtyTable").empty();
		$("#roastQty").val("1");
		$.ajax({			
			type:'POST',
			url : 'productProcess.do',
			data : 'code='+code,
			dataType : 'json'
		})
		.done(function(result, status, xhr) {
						
        	if(result) {
        		//alert("검색 성공"+result.length);
        			let ingreStr = "";
        		 
        			for ( x in result) {
	        			//	console.log(result[x]);
	        			let a = result[x].kname;
	        			let b = result[x].qty;
	        			let c = result[x].total;
	        			let d = c-b;
	        			
	        			ingreStr += `<tr class="dataRow">
	        					<td>`+ a +`</td>
	        					<td class='text-right' id="roastStockQty`+x+`">`+ c +`</td>
	        					<td class='text-right' id="roastBasicQty`+x+`">`+ b +`</td>
	        					<td class='text-right' id="roastMultiQty`+x+`">`+ b +`</td>`;
	        					
	       				if (d<= 0) {
	       					ingreStr +=  `<td class='text-right bg-danger' id="roastFinalQty`+x+`">`+ d +`</td></tr>`;
	           			} else {
	           				ingreStr +=  `<td class='text-right' id="roastFinalQty`+x+`">`+ d +`</td></tr>`;
	           			}
        			}      			
        			 
        			let tableBodyIngre = `				
    				    <thead>
    				      	<tr>
	    				        <th>재료</th>
	    				        <th>재고량</th>
	    				        <th>기본량</th>
	    				        <th>필요량</th>
	    				        <th>최종량</th>    				        
    				      	</tr>
    				    </thead>
    				    <tbody>
    				 ` + ingreStr + `
    				    </tbody>				
    				`;  
    				
      			$("#roastQtyTable").html(tableBodyIngre);	

			} else {				
				alert("검색 실패했습니다. 다시 시도해 주세요.");
			}
      	})
        .fail(function (jqXHR, textStatus, errorThrown) {
        	console.log('서버오류: '+ textStatus);
        	console.log('서버오류: '+ errorThrown);
       	});		
	});

	// 제품
	$("#item").change(function() {
		let code = $(this).val();
		// 테이블 자리 비우기
		$("#itemQty").empty();
		$("#qty").val("1");
		$.ajax({			
			type:'POST',
			url : 'productProcess.do',
			data : 'code='+code,
			dataType : 'json'
		})
		.done(function(result, status, xhr) {
						
        	if(result) {
        		//alert("검색 성공"+result.length);
        			let ingreStr = "";
        		 
        			for ( x in result) {
	        			//	console.log(result[x]);
	        			let a = result[x].kname;
	        			let b = result[x].qty;
	        			let c = result[x].total;
	        			let d = c-b;
	        			
	        			ingreStr += `<tr class="dataRow">
	        					<td>`+ a +`</td>
	        					<td class='text-right' id="stockQty`+x+`">`+ c +`</td>
	        					<td class='text-right' id="basicQty`+x+`">`+ b +`</td>
	        					<td class='text-right' id="multiQty`+x+`">`+ b +`</td>`;
	        					
	       				if (d<= 0) {
	       					ingreStr +=  `<td class='text-right bg-danger' id="finalQty`+x+`">`+ d +`</td></tr>`;
	           			} else {
	           				ingreStr +=  `<td class='text-right' id="finalQty`+x+`">`+ d +`</td></tr>`;
	           			}
        			}      			
        			 
        			let tableBodyIngre = `				
    				    <thead>
    				  		<tr>
	    				      	<th>재료</th>
		  				        <th>재고량</th>
		  				        <th>기본량</th>
		  				        <th>필요량</th>
		  				        <th>최종량</th>     				        
    				      	</tr>
    				    </thead>
    				    <tbody>
    				 ` + ingreStr + `
    				    </tbody>				
    				`;  
    				
      			$("#itemQty").html(tableBodyIngre);	

			} else {				
				alert("검색 실패했습니다. 다시 시도해 주세요.");
			}
      	})
        .fail(function (jqXHR, textStatus, errorThrown) {
        	console.log('서버오류: '+ textStatus);
        	console.log('서버오류: '+ errorThrown);
       	});		
	});
	
	// 로스팅 수량 변경시마다 필요량 재계산
	$("#roastQty").change(function() {
		
		let trlength = $("#roastQtyTable > tbody> tr").length;
		let qty = $(this).val();		
		for (var i = 0; i <trlength; i++) {
			
			let multiQty = $("#roastBasicQty"+i).text();
			let stockQty = $("#roastStockQty"+i).text();
			  
			$("#roastMultiQty"+i).text(qty*multiQty);
			$("#roastFinalQty"+i).text(stockQty -(qty*multiQty));				
		};
	});
	
	// 제품 수량 변경시마다 필요량 재계산
	$("#qty").change(function() {		
		let trlength = $("#itemQty > tbody> tr").length;
		let qty = $(this).val();
		
		for (var i = 0; i <trlength; i++) {
			  //console.log("#multiQty"+i);
			  let multiQty = $("#basicQty"+i).text();
			  let stockQty = $("#stockQty"+i).text();
				$("#multiQty"+i).text(qty*multiQty);
				$("#finalQty"+i).text(stockQty -(qty*multiQty));
				
		};
	});
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">			
			<h4>제품 생산</h4>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="roast" class="col-sm-3 control-label">로스팅 1회 단위 (g)</label>
					<div class="col-sm-7">
						<select id="roast" name="roast" class="form-control"
							required="required">
							<option value="*"></option>
							<c:forEach items="${itemList}" var="vo">
								<option value="${vo.code}_ROAST_001">${vo.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="roastQty" name="roastQty" class="form-control"
							required="required">								
							<c:forEach var="i" begin="1" end="100" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">						
					  	<table class="table table-striped" id="roastQtyTable">
 						</table>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
					<label for="item" class="col-sm-3 control-label">제품 100g 단위 (g)</label>
					<div class="col-sm-7">
						<select id="item" name="item" class="form-control"
							required="required">
							<option value="*"></option>
							<c:forEach items="${itemList}" var="vo">
								<option value="${vo.code}_100_001">${vo.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-2">
						<select id="qty" name="qty" class="form-control"
							required="required">								
							<c:forEach var="i" begin="1" end="100" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">						
					  	<table class="table table-striped" id="itemQty">
 						</table>
					</div>
				</div>
			</div>
		</div>			
	</div>
</body>
</html>