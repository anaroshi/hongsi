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
	
	$("#reset").click(function(){
		$("#buyDate").val("");
		$("#gubun").val("");
		$("#item").val("");
	});
});
  
 function fn_view(cno) {	
	
	//alert(cno);
	var w = 1000;
	var h = 470;
	// &buyDate=${param.buyDate}
	let query = "&page=${param.page}&perPageNum=${param.perPageNum}&gubun=${param.gubun}&item=${param.item}&purShop=${param.purShop}&inDate=${param.inDate}";	
	var url = "../view/storageModify.do?cno="+cno+"&locate=2"+query;
	
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
<%-- 	<input type="hidden" name="buyDate" value="${pageObject.buyDate}"> --%>
<%-- 	<input type="hidden" name="gubun" value="${pageObject.gubun}"> --%>
<%-- 	<input type="hidden" name="item" value="${pageObject.item}"> --%>
	<div class="form-group row">
	 	<div class="col-md-3">	 		
			<div class="input-group">			
			    <span class="input-group-addon">입출고일</span>			    
			    <input type="text" name="buyDate" id="buyDate" class="form-control inputDate flatpickr flatpickr-input" 
			    		value="${pageObject.buyDate}" style="background: #FFFFFF; text-align: center;" placeholder="일자를 선택해주세요">
			    		<!-- onchange="if(this.value.indexOf('~') > -1) location.href='hotel.php?category=&amp;date=' + this.value;" > -->
		  	</div>					
		</div>
	  	<div class="col-md-2">
			<div class="input-group">
			    <span class="input-group-addon">구분</span>
				<select id="gubun" name="gubun" class="form-control select">
					<option value=""></option>
		            <option value="출고" <c:if test="${pageObject.gubun=='출고'}">selected</c:if> >출고</option>
		            <option value="출고_office" <c:if test="${pageObject.gubun=='출고_office'}">selected</c:if> >출고_office</option>
		            <option value="출고_cafe" <c:if test="${pageObject.gubun=='출고_cafe'}">selected</c:if> >출고_cafe</option>
		            <option value="입고" <c:if test="${pageObject.gubun=='입고'}">selected</c:if> >입고</option>
		            <option value="입고_office" <c:if test="${pageObject.gubun=='입고_office'}">selected</c:if> >입고_office</option>
		            <option value="입고_cafe" <c:if test="${pageObject.gubun=='입고_cafe'}">selected</c:if> >입고_cafe</option>
		            <option value="손실" <c:if test="${pageObject.gubun=='손실'}">selected</c:if> >손실</option>
				</select>
			</div>
		</div>  	
	  	<div class="col-md-2">
			<div class="input-group">
			    <span class="input-group-addon">재료</span>
			      <select id="item" name="item" class="form-control select">
			      	<option value=""></option>
			      <c:forEach items="${ingreList}" var="vo">
			      	<option value="${vo.code}" <c:if test="${pageObject.item==vo.code}">selected</c:if> >${vo.kname}</option>
			      </c:forEach>
			      </select>	        
	  		</div>
		</div>  	
	  	<div class="col-md-1">			
	    	<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	    	<button class="btn btn-default" id="reset"><i class="glyphicon glyphicon-remove-circle"></i></button>
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
	<c:set var="sumqtySum" value="0"/>
	<c:forEach items="${resultList}" var="vo" varStatus="status">
	 	<tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
	 		<c:if test="${vo.gubun ne '출고' && vo.gubun ne '출고_office' && vo.gubun ne '출고_cafe' && vo.gubun ne '손실'}"><c:set var="sumqtySum" value="${sumqtySum + vo.content}"/></c:if>
	 		<c:if test="${vo.gubun eq '출고' || vo.gubun eq '출고_office' || vo.gubun eq '출고_cafe' || vo.gubun eq '손실'}"><c:set var="sumqtySum" value="${sumqtySum - vo.content}"/></c:if>
	 		<td class="cno" style="display:none">${vo.cno}</td>
	        <td class="buyDate">${vo.buyDate}</td>
	        <td class="gubun">${vo.gubun}</td>
	        <td class="item" style="display:none">${vo.item}</td>
	        <td class="kname">${vo.kname}</td>
	        <td class="content text-right"><fmt:formatNumber value="${vo.content}" /> g</td>
	        <td class="comm">${vo.comm}</td>
	        <td class="buyer">${vo.buyer}</td>
	    </tr>
	</c:forEach>
	</tbody>
    <tfoot>
      	<tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td class="text-right"><fmt:formatNumber value="${sumqtySum}" /> g</td>
	        <td></td>
	        <td></td>
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