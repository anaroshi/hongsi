<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 생산</title>
<script type="text/javascript">
$(function() {
	
	$("#item").change(function() {
		let code = $(this).val();		
		$("#itemQty").empty();
		$("#totalQty").empty();
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
        			let a = result[x].ingredient;
        			let b = result[x].qty;
        			let c = result[x].total;
        			let d = c-b;
        			
        			ingreStr += `<tr>
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
    				        <th>Ingredient</th>
    				        <th>재고 Quantity (g)</th>
    				        <th>Quantity (g)</th>
    				        <th>필요 Quantity (g)</th>
    				        <th>최종 Quantity (g)</th>    				        
    				      </tr>
    				    </thead>
    				    <tbody>
    				 ` + ingreStr + `
    				    </tbody>				
    				`;  
    				
      			$("#itemQty").append(tableBodyIngre);	

			} else {				
				alert("검색 실패했습니다. 다시 시도해 주세요.");
			}
      	})
        .fail(function (jqXHR, textStatus, errorThrown) {
        	console.log('서버오류: '+ textStatus);
        	console.log('서버오류: '+ errorThrown);
       	});		
	});
	
	// 수량 변경시마다 필요량 재계산
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
		<form class="form-horizontal" method="post">
			<div class="row">			
				<h2>제품 생산</h2>
				<div class="col-sm-8">
					<div class="form-group">
						<label for="item" class="col-sm-3 control-label">제품</label>
						<div class="col-sm-7">
							<select id="item" name="item" class="form-control"
								required="required">
								<option value="*"></option>
								<c:forEach items="${itemList}" var="vo">
									<option value="${vo.code}">${vo.name}</option>
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
						  	<table class="table table-bordered" id="itemQty">
	 						</table>
						</div>
					</div>
				</div>
			</div>			
		</form>
	</div>
</body>
</html>