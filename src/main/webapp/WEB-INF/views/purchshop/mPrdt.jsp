<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchShop</title>

<style type="text/css">
div.panel.panel-default {
	height: 89px;
}

.order_item {
 	font-size: 12px;
 	padding: 6px 4px;
 } 

div.panel-body {
	padding: 5px 15px 0px;
}
</style>
  
<script>
$( function() {

	startWith();
	  
	function startWith() {
		// 화면 로드시 커서가 위치하게
		$("#ori_200").focus();	  
	};	
});

function formCheck() {
	let ori_200 = $("#ori_200").val();
	if(ori_200 == null || ori_200 =="" || typeof ori_200 == "undefined" || ori_200 >= 10000) ori_200 = 0; 
	$("#ori_200").val(ori_200);
	let ori_250 = $("#ori_250").val();
	if(ori_250 == null || ori_250 =="" || typeof ori_250 == "undefined" || ori_250 >= 10000) ori_250 = 0; 
	$("#ori_250").val(ori_250);
	let ori_500 = $("#ori_500").val();
	if(ori_500 == null || ori_500 =="" || typeof ori_500 == "undefined" || ori_500 >= 10000) ori_500 = 0; 
	$("#ori_500").val(ori_500);
	let ori_1000 = $("#ori_1000").val();
	if(ori_1000 == null || ori_1000 =="" || typeof ori_1000 == "undefined" || ori_1000 >= 10000) ori_1000 = 0; 
	$("#ori_1000").val(ori_1000);
	
	let erl_200 = $("#erl_200").val();
	if(erl_200 == null || erl_200 =="" || typeof erl_200 == "undefined" || erl_200 >= 2000) erl_200 = 0; 
	let erl_250 = $("#erl_250").val();
	if(erl_250 == null || erl_250 =="" || typeof erl_250 == "undefined" || erl_250 >= 2000) erl_250 = 0; 
	$("#erl_250").val(erl_250);
	let erl_500 = $("#erl_500").val();
	if(erl_500 == null || erl_500 =="" || typeof erl_500 == "undefined" || erl_500 >= 5000) erl_500 = 0; 
	$("#erl_500").val(erl_500);
	let erl_1000 = $("#erl_1000").val();
	if(erl_1000 == null || erl_1000 =="" || typeof erl_1000 == "undefined" || erl_1000 >= 10000) erl_1000 = 0; 
	$("#erl_1000").val(erl_1000);
	
	let stc_200 = $("#stc_200").val();
	if(stc_200 == null || stc_200 =="" || typeof stc_200 == "undefined" || stc_200 >= 2000) stc_200 = 0; 
	let stc_250 = $("#stc_250").val();
	if(stc_250 == null || stc_250 =="" || typeof stc_250 == "undefined" || stc_250 >= 2000) stc_250 = 0; 
	$("#stc_250").val(stc_250);
	let stc_500 = $("#stc_500").val();
	if(stc_500 == null || stc_500 =="" || typeof stc_500 == "undefined" || stc_500 >= 5000) stc_500 = 0; 
	$("#stc_500").val(stc_500);
	let stc_1000 = $("#stc_1000").val();
	if(stc_1000 == null || stc_1000 =="" || typeof stc_1000 == "undefined" || stc_1000 >= 10000) stc_1000 = 0; 
	$("#stc_1000").val(stc_1000);

	if((ori_200+ori_250+ori_500+ori_1000+erl_200+erl_250+erl_500+erl_1000+stc_200+stc_250+stc_500+stc_1000)==0) {
	      alert('주문 제품의 수량을 넣어주세요!');
	      $("#ori_200").select();
	      return false;
    }
	
	let productDate = $("#productDate").val();		
	if( productDate== null || productDate ==""  || productDate.length<10)  {
		alert('생산일을 입력해주세요!');
		$("#productDate").select();
	      return false;
    }
	
	return true;	
};

function fn_view(cno) {	
	
	//alert(cno);
	var w = 1000;
	var h = 470;
	// &buyDate=${param.buyDate}
	//let query = "&page=${param.page}&perPageNum=${param.perPageNum}";	
	let query = ${(empty pageObject)?"''":"'&page="+=pageObject.page+="&perPageNum="+=pageObject.perPageNum+="'" };	
	var url = "../view/productModify.do?cno="+cno+"&locate=1"+query;
	
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

	window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
};
</script>
</head>

<body>
<div class="container">
<form class="form-horizontal" method="post" onsubmit="return formCheck()">
  <h4>M생산 입력</h4>
 	<div class="col-sm-4">
	   <div class="form-group">
	      <label for="productDate" class="col-sm-3 control-label">생산일</label>
	      <div class="col-sm-8">
		        <input class="form-control inputDate flatpickr flatpickr-input" id="productDate" name="productDate" type="text" 
		        		style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
	      </div>
	    </div>
	   <div class="form-group">
	      <label for="productDate" class="col-sm-3 control-label">Original</label>
	      <div class="col-sm-8">
	      		<input class="form-control order_item text-right" id="ori_200" name="ori_200" type="number" pattern="[0-9]{4}">	      		
	      </div>	      
	    </div>
	   <div class="form-group">
	      <label for="productDate" class="col-sm-3 control-label">Earlgrey</label>
	      <div class="col-sm-8">
	      		<input class="form-control order_item text-right" id="erl_200" name="erl_200" type="number" pattern="[0-9]{4}">	  
	      </div>	      
	    </div>
	   <div class="form-group">
	      <label for="productDate" class="col-sm-3 control-label">SaltCaramel</label>
	      <div class="col-sm-8">
	      		<input class="form-control order_item text-right" id="stc_200" name="stc_200" type="number" pattern="[0-9]{4}">	
	      </div>	      
	    </div>	    
			    			    
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select">
	            <option value="생산">생산</option>
<!-- 	            <option value="교환">교환</option> -->
<!-- 	            <option value="교환">반품</option> -->
<!-- 	            <option value="손실">손실</option> -->
			</select>
	      </div>
	    </div>

     <div class="form-group">
      <label for="comm" class="col-sm-3 control-label">내역</label>
      <div class="col-sm-8">
      	<textarea class="form-control" rows="10" id="comm" name="comm"></textarea>
      </div>
    </div>
    <div class="form-group">
      <label for="manager" class="col-sm-3 control-label">담당자</label>
      <div class="col-sm-8">
		<input class="form-control" type="text" id="" name="manager">
      </div>
 	</div> 
    <div class="form-group">
      <div class="col-sm-1"></div>
      <div class="col-sm-3">
		<button type="reset" class="btn btn-block" style="padding-left:3px;">초기화</button>
      </div>      
      <div class="col-sm-4">
      	<button type="submit" class="btn btn-block">저장</button>
      </div>
      <div class="col-sm-3">
		<button type="button" onclick="location.href='mPrtcAllList.do'" class="btn btn-block"  style="padding-left:3px;">리스트</button>
	  </div>
	  <div class="col-sm-1"></div>
 	</div> 
</div>
</form>
<!-- 	</div> 2블럭 End -->

<!-- 	생산 내역 List -->
<div class="col-md-8">
  <table class="table table-striped">
    <thead>
      <tr>
        <th  style="width: 20%">생산일</th>
        <th style="width: 10%">구분</th>
        <th style="width: 70%">내역</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${productList}" var="vo">
      <tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
        <td><fmt:formatDate value="${vo.productDate}" pattern="yyyy-MM-dd" /></td>
        <td>${vo.gubun}</td>
        <td>${vo.ori_250_format}${vo.erl_250_format}${vo.stc_250_format}</td>
      </tr>
</c:forEach>
    </tbody>
  </table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="product.do" pageObject="${pageObject}" />
	</c:if>
</div>  
</div>
<!-- 	 생산 내역 List End  -->
</div>
</body>
</html>