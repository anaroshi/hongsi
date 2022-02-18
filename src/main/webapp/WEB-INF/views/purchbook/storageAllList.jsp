<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 입출고 리스트</title>
  
<script>
$( function() {
	$(".flatpickr").flatpickr({	
		mode: "range",
		dateFormat: 'Y-m-d',
		locale: 'ko',
		allowInput: false  
	});
});
  
  function fn_view(cno) {	
		
		//alert(cno);
		var w = 1000;
		var h = 470;
		var url = "../view/storageModify.do?cno="+cno;
		
		var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
		xPos += window.screenLeft; // 듀얼 모니터일 때
		var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

		window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
	};   
</script>
</head>

<body>
<div class="container">
<div class="col-md-12">
<form>
	<input type="hidden" name="page" value="1">
	<input type="hidden" name="perPageNum" value="${pageObject.perPageNum}">
	<div class="form-group row">
	 	<div class="col-md-3">	 		
			<div class="input-group">			
			    <span class="input-group-addon">입출고일</span>			    
			    <input type="text" name="buyDate" id="buyDate" class="form-control inputDate flatpickr flatpickr-input" 
			    		style="background: #FFFFFF; text-align: center;" placeholder="일자를 선택해주세요">
			    		<!-- onchange="if(this.value.indexOf('~') > -1) location.href='hotel.php?category=&amp;date=' + this.value;" > -->
		  	</div>					
		</div>
	  	<div class="col-md-2">
			<div class="input-group">
			    <span class="input-group-addon">구분</span>
				<select id="gubun" name="gubun" class="form-control select" required="required">
					<option value=""></option>
		            <option value="출고">출고</option>
		            <option value="출고_office">출고_office</option>
		            <option value="출고_cafe">출고_cafe</option>
		            <option value="입고_office">입고_office</option>
		            <option value="입고_cafe">입고_cafe</option>
		            <option value="손실">손실</option>
				</select>
			</div>
		</div>  	
	  	<div class="col-md-2">
			<div class="input-group">
			    <span class="input-group-addon">재료</span>
			      <select id="item" name="item" class="form-control select" required="required">
			      	<option value=""></option>
			      <c:forEach items="${ingreList}" var="vo">
			      	<option value="${vo.code}">${vo.kname}</option>
			      </c:forEach>
			      </select>	        
	  		</div>
		</div>  	
	  	<div class="col-md-1">			
	    	<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
		</div>	  	
	</div>
</form>		
	
  <table class="table table-striped">
	<thead>    
	 	<tr>
	    	<td colspan="7" class="text-center"><h5>재료 입출고 LIST</h5></td>    	
	    </tr>	    
		<tr>
	        <th width="15%">입출고일</th>
	        <th width="15%">구분</th>
	        <th width="15%">재료</th>
	        <th style="display:none">재료</th>
	        <th width="8%">용량</th>
	        <th width="34%">비고</th>
	        <th width="8%">담당자</th>
	      </tr>
	</thead>
	<tbody>
	<c:forEach items="${resultList}" var="vo" varStatus="status">
	 	<tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
	 		<td class="cno" style="display:none">${vo.cno}</td>
	        <td class="buyDate">${vo.buyDate}</td>
	        <td class="gubun">${vo.gubun}</td>
	        <td class="item" style="display:none">${vo.item}</td>
	        <td class="kname">${vo.kname}</td>
	        <td class="content text-right">${vo.content} g</td>
	        <td class="comm">${vo.comm}</td>
	        <td class="buyer">${vo.buyer}</td>
	    </tr>
	</c:forEach>
	</tbody>
    <tfoot>
      	<tr>
<!-- 	        <td></td> -->
<!-- 	        <td></td> -->
<!-- 	        <td></td> -->
<%-- 	        <th class="text-right">${saleStock.ori_250_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.ori_500_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.ori_1000_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.erl_250_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.erl_500_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.erl_1000_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.stc_250_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.stc_500_sum}</th> --%>
<%-- 	        <th class="text-right">${saleStock.stc_1000_sum}</th> --%>
<!-- 	        <td></td> -->
<!-- 	        <td></td> -->
<!-- 	        <td></td> -->
      	</tr>
    </tfoot>
</table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="storageAllList.do" pageObject="${pageObject}" />
	</c:if>
</div>
</div>
</div>
</body>
</html>