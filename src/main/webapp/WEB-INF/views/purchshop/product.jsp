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
		$("#ori_250").focus();	  
	};	
});

function formCheck() {
	let ori_250 = $("#ori_250").val();
	if(ori_250 == null || ori_250 =="" || typeof ori_250 == "undefined" || ori_250 >= 10000) ori_250 = 0; 
	$("#ori_250").val(ori_250);
	let ori_500 = $("#ori_500").val();
	if(ori_500 == null || ori_500 =="" || typeof ori_500 == "undefined" || ori_500 >= 10000) ori_500 = 0; 
	$("#ori_500").val(ori_500);
	let ori_1000 = $("#ori_1000").val();
	if(ori_1000 == null || ori_1000 =="" || typeof ori_1000 == "undefined" || ori_1000 >= 10000) ori_1000 = 0; 
	$("#ori_1000").val(ori_1000);
	
	let erl_250 = $("#erl_250").val();
	if(erl_250 == null || erl_250 =="" || typeof erl_250 == "undefined" || erl_250 >= 2000) erl_250 = 0; 
	$("#erl_250").val(erl_250);
	let erl_500 = $("#erl_500").val();
	if(erl_500 == null || erl_500 =="" || typeof erl_500 == "undefined" || erl_500 >= 5000) erl_500 = 0; 
	$("#erl_500").val(erl_500);
	let erl_1000 = $("#erl_1000").val();
	if(erl_1000 == null || erl_1000 =="" || typeof erl_1000 == "undefined" || erl_1000 >= 10000) erl_1000 = 0; 
	$("#erl_1000").val(erl_1000);
	
	let stc_250 = $("#stc_250").val();
	if(stc_250 == null || stc_250 =="" || typeof stc_250 == "undefined" || stc_250 >= 2000) stc_250 = 0; 
	$("#stc_250").val(stc_250);
	let stc_500 = $("#stc_500").val();
	if(stc_500 == null || stc_500 =="" || typeof stc_500 == "undefined" || stc_500 >= 5000) stc_500 = 0; 
	$("#stc_500").val(stc_500);
	let stc_1000 = $("#stc_1000").val();
	if(stc_1000 == null || stc_1000 =="" || typeof stc_1000 == "undefined" || stc_1000 >= 10000) stc_1000 = 0; 
	$("#stc_1000").val(stc_1000);

	if((ori_250+ori_500+ori_1000+erl_250+erl_500+erl_1000+stc_250+stc_500+stc_1000)==0) {
	      alert('주문 제품의 수량을 넣어주세요!');
	      $("#ori_250").select();
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
</script>
</head>

<body>
<div class="container">
<form class="form-horizontal" method="post" onsubmit="return formCheck()">
  <h4>생산 입력</h4>
 <!-- 재고량 보이기 Start -->
	<!-- 주 생산량 start -->
<div class="col-md-3">
<table class="table table-condensed">
   <thead>
    <tr>
    	<td colspan="5">${weekDay.toDate}</td>
    </tr> 	
	<tr>
        <th colspan="2" class="text-center">제품명</th>
        <th width="20%">주문량</th>
        <th width="20%">재고량</th>
        <th width="20%" style="font-size: 10px">금주필요</th>
      </tr>
    </thead>
    <tbody>
 	<tr>
        <td rowspan="3" class="text-center">Original</td>
        <td width="20%">250g</td>
        <td class="text-right">${orderSum.ori_250_sum}개</td>
        <td class="text-right">${stockSum.ori_250_sum}개</td>
        <td class="text-right">${stockSum.ori_250_sum - orderSum.ori_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td class="text-right">${orderSum.ori_500_sum}개</td>
        <td class="text-right">${stockSum.ori_500_sum}개</td>
        <td class="text-right">${stockSum.ori_500_sum - orderSum.ori_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td class="text-right">${orderSum.ori_1000_sum}개</td>
        <td class="text-right">${stockSum.ori_1000_sum}개</td>
        <td class="text-right">${stockSum.ori_1000_sum - orderSum.ori_1000_sum}개</td>
    </tr>
	<tr>
        <td rowspan="3" class="text-center">Earlgrey</td>
        <td>250g</td>
        <td class="text-right">${orderSum.erl_250_sum}개</td>
        <td class="text-right">${stockSum.erl_250_sum}개</td>
        <td class="text-right">${stockSum.erl_250_sum - orderSum.erl_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td class="text-right">${orderSum.erl_500_sum}개</td>
        <td class="text-right">${stockSum.erl_500_sum}개</td>
        <td class="text-right">${stockSum.erl_500_sum - orderSum.erl_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td class="text-right">${orderSum.erl_1000_sum}개</td>
        <td class="text-right">${stockSum.erl_1000_sum}개</td>
        <td class="text-right">${stockSum.erl_1000_sum - orderSum.erl_1000_sum}개</td>
    </tr>
    <tr>
        <td rowspan="3" class="text-center">SaltCaramel</td>
        <td>250g</td>
        <td class="text-right">${orderSum.stc_250_sum}개</td>
        <td class="text-right">${stockSum.stc_250_sum}개</td>
        <td class="text-right">${stockSum.stc_250_sum - orderSum.stc_250_sum}개</td>
    </tr>
	<tr>
        <td>500g</td>
        <td class="text-right">${orderSum.stc_500_sum}개</td>
        <td class="text-right">${stockSum.stc_500_sum}개</td>
        <td class="text-right">${stockSum.stc_500_sum - orderSum.stc_500_sum}개</td>
    </tr>
	<tr>        
        <td>1,000g</td>
        <td class="text-right">${orderSum.stc_1000_sum}개</td>
        <td class="text-right">${stockSum.stc_1000_sum}개</td>
        <td class="text-right">${stockSum.stc_1000_sum - orderSum.stc_1000_sum}개</td>
    </tr>
    </tbody>
  	</table>
 	</div>
	<!-- 주 생산량 end -->
	<!-- 재고량 보이기 End -->
	
  <div class="col-md-2">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">Original</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="ori_250">250g</label>
		    <input class="form-control order_item" id="ori_250" name="ori_250" type="number" pattern="[0-9]{4}" >
		</div>
	    <div class="col-xs-4">
		    <label for="ori_500">500g</label>
		    <input class="form-control order_item" id="ori_500" name="ori_500" type="number" pattern="[0-9]{4}">
		</div>
		<div class="col-xs-4">
		    <label for="ori_1000">1,000g</label>
		    <input class="form-control order_item" id="ori_1000" name="ori_1000" type="number" pattern="[0-9]{4}">
		</div>
  		</div>
  	  </div>
	</div>
<!--   </div> -->
<!--   <div class="col-md-4"> -->
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">Earlgrey</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="erl_250">250g</label>
		    <input class="form-control order_item" id="erl_250" name="erl_250" type="number" pattern="[0-9]{4}">
		</div>
	    <div class="col-xs-4">
		    <label for="erl_500">500g</label>
		    <input class="form-control order_item" id="erl_500" name="erl_500" type="number" pattern="[0-9]{4}">
		</div>
		<div class="col-xs-4">
		    <label for="erl_1000">1,000g</label>
		    <input class="form-control order_item" id="erl_1000" name="erl_1000" type="number" pattern="[0-9]{4}">
		</div>
  		</div>
  	  </div>
	</div>
<!--   </div> -->
<!--   <div class="col-md-4"> -->
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">SaltCaramel</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4">
		    <label for="stc_250">250g</label>
		    <input class="form-control order_item" id="stc_250" name="stc_250" type="number" pattern="[0-9]{4}">
		</div>
	    <div class="col-xs-4">
		    <label for="stc_500">500g</label>
		    <input class="form-control order_item" id="stc_500" name="stc_500" type="number" pattern="[0-9]{4}">
		</div>
		<div class="col-xs-4">
		    <label for="stc_1000">1,000g</label>
		    <input class="form-control order_item" id="stc_1000" name="stc_1000" type="number" pattern="[0-9]{4}">
		</div>
  		</div>
  	  </div>
	</div>
  </div> 

	<div class="col-sm-2">
	   <div class="form-group">
	      <label for="productDate" class="col-sm-3 control-label">생산일</label>
	      <div class="col-sm-8">
		        <input class="form-control inputDate flatpickr flatpickr-input" id="productDate" name="productDate" type="text" 
		        		style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
	      </div>
	    </div>
	    
<!-- 	    <input type="text" name="buyDate" id="buyDate" class="form-control inputDate flatpickr flatpickr-input"  -->
<!-- 			    		style="color: #FFFFFF;font-size: 1em;text-align: center;" -->
<!-- 			    		placeholder="일자를 선택해주세요" value="" readonly="readonly"> -->
			    			    
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
      	<textarea class="form-control" rows="6" id="comm" name="comm"></textarea>
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
		<button type="button" onclick="location.href='orderAllList.do'" class="btn btn-block"  style="padding-left:3px;">리스트</button>
	  </div>
	  <div class="col-sm-1"></div>
 	</div> 
</div>
</form>
<!-- 	</div> 2블럭 End -->

<!-- 	생산 내역 List -->
<div class="col-md-5">
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
      <tr class="dataRow">
        <td>${vo.productDate}</td>
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