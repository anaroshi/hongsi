<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 구매 리스트</title>

<style type="text/css">
</style>
  
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
		$("#purShop").val("");
		$("#inDate").val("");
	});
});

function fn_view(cno) {	
	
	//alert(cno);
	var w = 1000;
	var h = 470;

	let query = "&page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};
	query += ${(empty pageObject.buyDate)? 	"''" : "'&buyDate=" +=(pageObject.buyDate).substring(0, 10)+= "'"};
	query += ${(empty pageObject.gubun)? 	"''" : "'&gubun=" +=pageObject.gubun+= "'"};
	query += ${(empty pageObject.item)? 	"''" : "'&item=" +=pageObject.item+= "'"};
	query += ${(empty pageObject.purShop)? 	"''" : "'&purShop=" +=pageObject.purShop+= "'"};
	query += ${(empty pageObject.inDate)? 	"''" : "'&inDate=" +=(pageObject.inDate).substring(0, 10)+= "'"};	
	var url = "../view/buyModify.do?cno="+cno+"&locate=2"+query;

	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

	window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
};  

</script>
</head>
<!-- 	let query = "&page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum}+"&gubun=${param.gubun}&item=${param.item}&purShop=${param.purShop}&inDate=${param.inDate}"; -->

<body>
<div class="container">
<div class="col-md-12">

<form>
	<input type="hidden" name="page" id="page" value="1">
	<input type="hidden" name="perPageNum" id="perPageNum" value="${pageObject.perPageNum}">	
	<div class="form-group row">
	 	<div class="col-md-2">	 		
			<div class="input-group">
			    <span class="input-group-addon">구입일</span>			    
			    <input type="text" name="buyDate" id="buyDate" class="form-control inputDate flatpickr flatpickr-input" value="${pageObject.buyDate}"
			    		style="background: #FFFFFF; text-align: center; font-size:10px; padding-left: 0px; padding-right: 0px;" placeholder="일자를 선택해주세요">
			    		<!-- onchange="if(this.value.indexOf('~') > -1) location.href='hotel.php?category=&amp;date=' + this.value;" > -->
		  	</div>					
		</div>
	  	<div class="col-md-2">
			<div class="input-group">
			    <span class="input-group-addon">구분</span>
				<select id="gubun" name="gubun" class="form-control select">
					<option value=""></option>
		            <option value="구매_office" <c:if test="${pageObject.gubun=='구매_office'}">selected</c:if> >구매_office</option>
		            <option value="구매_cafe" <c:if test="${pageObject.gubun=='구매_cafe'}">selected</c:if> >구매_cafe</option>
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
	  	<div class="col-md-2">
			<div class="input-group">
			    <span class="input-group-addon">거래처</span>
				<select id="purShop" name="purShop" class="form-control select">
					<option value=""></option>
		            <option value="넛츠베리" <c:if test="${pageObject.purShop=='넛츠베리'}">selected</c:if> >넛츠베리</option>
		            <option value="네이버쇼핑" <c:if test="${pageObject.purShop=='네이버쇼핑'}">selected</c:if> >네이버쇼핑</option>
		            <option value="쿠팡" <c:if test="${pageObject.purShop=='쿠팡'}">selected</c:if> >쿠팡</option>
				</select>
			</div>
		</div>  	
	 	<div class="col-md-2">
			<div class="input-group">			
			    <span class="input-group-addon">입고일</span>			    
			    <input type="text" name="inDate" id="inDate" class="form-control inputDate flatpickr flatpickr-input" 
			    		value="${pageObject.inDate}" style="background: #FFFFFF; text-align: center; font-size:10px; padding-left: 0px; padding-right: 0px;" placeholder="일자를 선택해주세요">
			    		<!-- onchange="if(this.value.indexOf('~') > -1) location.href='hotel.php?category=&amp;date=' + this.value;" > -->
		  	</div>					
		</div>
		<div class="col-md-1">
			<div class="checkbox">
				<label class="checkbox-inline" style="font-size:14px;"><input type="checkbox" name="notIn" id="notIn" value="${pageObject.notIn}">미입고</label>
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
		<td colspan="9" class="text-center"><h5>재료 구매 LIST</h5></td>    	
	</tr>
	<tr>
        <th width="10%">주문일</th>
        <th width="10%">구분</th>
        <th width="10%">주문품</th>
        <th width="7%">용량(g)</th>
        <th width="5%">수량(개)</th>
        <th width="8%">총량(g)</th>
        <th width="10%">금액(원)</th>
        <th width="10%">거래처</th>
        <th width="10%">입고일</th>
        <th width="20%">비고</th>
      </tr>
    </thead>
    <tbody>
    	<c:set var="contentSum" value="0"/>
    	<c:set var="qtySum" value="0"/>
    	<c:set var="sumqtySum" value="0"/>
    	<c:set var="priceSum" value="0"/>
<c:forEach items="${resultList}" var="vo" varStatus="status">	
 	<tr class="dataRow" onclick="fn_view(${vo.cno}); return false;"> 		
 		<c:set var="contentSum" value="${contentSum + vo.content}"/>
 		<c:set var="qtySum" value="${qtySum + vo.qty}"/>
 		<c:set var="sumqtySum" value="${sumqtySum + vo.sumQty}"/>
 		<c:set var="priceSum" value="${priceSum + vo.price}"/>
 		<td class="cno" style="display:none">${vo.cno}</td>
        <td>${vo.buyDate}</td>
        <td>${vo.gubun}</td>
        <td>${vo.item}</td>
        <td class="text-right"><fmt:formatNumber value="${vo.content}" /></td>
        <td class="text-right"><fmt:formatNumber value="${vo.qty}" /></td>
        <td class="text-right"><fmt:formatNumber value="${vo.sumQty}" /></td>
        <td class="text-right"><fmt:formatNumber value="${vo.price}" /></td>
        <td>${vo.purShop}</td>
        <td>${vo.inDate}</td>
        <td>${vo.comm}</td>
    </tr>
</c:forEach>
	</tbody>
    <tfoot>    
  	<tr> 		
 		<td class="cno" style="display:none"></td>
        <td></td>
        <td></td>
        <td></td>
        <td class="text-right"><fmt:formatNumber value="${contentSum}" /></td>
        <td class="text-right"><fmt:formatNumber value="${qtySum}" /></td>
        <td class="text-right"><fmt:formatNumber value="${sumqtySum}" /></td>
        <td class="text-right"><fmt:formatNumber value="${priceSum}" /></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tfoot>
</table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="buyAllList.do" pageObject="${pageObject}" />
	</c:if>
</div>
</div>
</div>
</body>
</html>