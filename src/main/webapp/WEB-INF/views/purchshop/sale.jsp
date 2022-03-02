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
.order_item {
 	font-size: 12px;
 	padding: 6px 4px;
 }
 
div.panel-body {
	padding-top: 5px;
	padding-bottom: 0px;
}
</style>
  
<script>
  $( function() {

	  startWith();
	  
	function startWith() {
		// 화면 로드시 커서가 위치하게
		$("#ori_250").focus();	  
	};
	  
  	$("#saleReset").click(function() {  		
  		location = "sale.do";
  	});
  	
  	$(".dataRow").click(function(){
  		let order_cno = $(this).find(".order_cno").text();
  		//alert(order_cno);
  		location = "sale.do?order_cno="+order_cno;
  	});
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
		
		let saleDate = $("#saleDate").val();		
		if( saleDate== null || saleDate ==""  || saleDate.length<10)  {
			alert('판매일을 입력해주세요!');
			$("#saleDate").select();
		      return false;
	    }
		
		let price = $("#price").val();
		if(price == null || price =="" || typeof price == "undefined") {
			alert('금액을 입력해주세요!');
			$("#price").val("0");
			$("#price").select();
		      return false;
		}
		
		return true;	
};

function fn_view(cno) {	
	
	//alert(cno);
	var w = 1000;
	var h = 470;
	
//	let query = "&page=${param.page}&perPageNum=${param.perPageNum}";	
	let query = ${(empty pageObject)?"''":"'&page="+=pageObject.page+="&perPageNum="+=pageObject.perPageNum+="'" };	
	var url = "../view/saleModify.do?cno="+cno+"&locate=1"+query;
	
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

	window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
};
</script>
</head>
<%-- // 	${(empty pageObject)?"''":"'&page="+pageObject.page+"&perPageNum="+pageObject.perPageNum+ --%>
<%-- // 			"&buyDate="+pageObject.buyDate+"&gubun="+pageObject.gubun+"&item="+pageObject.item+"&purShop="+pageObject.purShop+ --%>
<%-- // 			"&notIn="+pageObject.notIn+"&locate="+pageObject.locate+"'" }; --%>

<body>
<div class="container">
<form class="form-horizontal" method="post" onsubmit=" return formCheck()">
	<%-- <input id="order_cno" name="order_cno" type="hidden" value="${vo.cno}"> --%>
  <h4>판매 입력</h4>
  <div class="col-md-2">
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">Original</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4 text-center">
		    <label for="ori_250">250g</label>
		    <input class="form-control order_item text-right" id="ori_250" name="ori_250" type="number" pattern="[0-9]{4}" value="${vo.ori_250}">
		</div>
	    <div class="col-xs-4 text-center">
		    <label for="ori_500">500g</label>
		    <input class="form-control order_item text-right" id="ori_500" name="ori_500" type="number" pattern="[0-9]{4}" value="${vo.ori_500}">
		</div>
		<div class="col-xs-4 text-center">
		    <label for="ori_1000">1,000g</label>
		    <input class="form-control order_item text-right" id="ori_1000" name="ori_1000" type="number" pattern="[0-9]{4}" value="${vo.ori_1000}">
		</div>
  		</div>
  	  </div>
	</div>
    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">Earlgrey</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4 text-center">
		    <label for="erl_250"">250g</label>
		    <input class="form-control order_item text-right" id="erl_250" name="erl_250" type="number" pattern="[0-9]{4}" value="${vo.erl_250}">
		</div>
	    <div class="col-xs-4 text-center">
		    <label for="erl_500">500g</label>
		    <input class="form-control order_item text-right" id="erl_500" name="erl_500" type="number" pattern="[0-9]{4}" value="${vo.erl_500}">
		</div>
		<div class="col-xs-4 text-center">
		    <label for="erl_1000">1,000g</label>
		    <input class="form-control order_item text-right" id="erl_1000" name="erl_1000" type="number" pattern="[0-9]{4}" value="${vo.erl_1000}">
		</div>
  		</div>
  	  </div>
	</div>

    <div class="panel panel-default" style="border: none;">
	  <div class="panel-heading">SaltCaramel</div>
	  <div class="panel-body">
	  	<div class="form-group">
	  	<div class="col-xs-4 text-center">
		    <label for="stc_250">250g</label>
		    <input class="form-control order_item text-right" id="stc_250" name="stc_250" type="number" pattern="[0-9]{4}" value="${vo.stc_250}">
		</div>
	    <div class="col-xs-4 text-center">
		    <label for="stc_500">500g</label>
		    <input class="form-control order_item text-right" id="stc_500" name="stc_500" type="number" pattern="[0-9]{4}" value="${vo.stc_500}">
		</div>
		<div class="col-xs-4 text-center">
		    <label for="stc_1000">1,000g</label>
		    <input class="form-control order_item text-right" id="stc_1000" name="stc_1000" type="number" pattern="[0-9]{4}" value="${vo.stc_1000}">
		</div>
  		</div>
  	  </div>
	</div>
	<div class="form-group">
		<label for="orderDate" class="col-sm-4 control-label">주문일</label>
	    <div class="col-sm-7">
			<input class="form-control inputDate flatpickr flatpickr-input" id="orderDate" name="orderDate" 
					style="background: #FFFFFF;" type="text" value='<fmt:formatDate value="${vo.orderDate}" pattern="yyyy-MM-dd" />' 
					required="required" placeholder="일자를 선택해주세요" data-input>
      	</div>
	</div>
	<div class="form-group">
		<label for="orderer" class="col-sm-4 control-label">주문자</label>
	 	<div class="col-sm-7">
			<input class="form-control" type="text" id="orderer" name="orderer" value="${vo.orderer}">
	 	</div>
	</div>
	<div class="form-group">
      <label for="manager" class="col-sm-4 control-label">담당자</label>
      <div class="col-sm-7">
		<input class="form-control" type="text" id="" name="manager">
      </div>
 	</div>	
  </div> 

	<!-- 	2블럭 Start -->
	<div class="col-sm-3">
	   <div class="form-group">
	      <label for="saleDate" class="col-sm-3 control-label">판매일</label>
	      <div class="col-sm-8">
			<input class="form-control inputDate flatpickr flatpickr-input" id="saleDate" name="saleDate" type="text" 
						style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
	      </div>
	    </div>
	    	    
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select">
	            <option value="판매" ${(vo.gubun=='판매')?"selected":""}>판매</option>
<%-- 	            <option value="교환" ${(vo.gubun=='교환')?"selected":""}>교환</option> --%>
<%-- 	            <option value="반품" ${(vo.gubun=='반품')?"selected":""}>반품</option> --%>
	            <option value="손실" ${(vo.gubun=='손실')?"selected":""}>손실</option>
	            <option value="경비" ${(vo.gubun=='경비')?"selected":""}>경비</option>
			</select>
	      </div>
	    </div>	    
		<div class="form-group"> 
			<label for="price" class="col-sm-3 control-label">금액</label>
		 	<div class="col-sm-8">
				<input class="form-control inputNumber" type="number" id="price" name="price" required="required">
		 	</div>
		</div>
	    <div class="form-group">
	      <label for="paymentPath" class="col-sm-3 control-label">지불방법</label>
	      <div class="col-sm-8">
			<select id="paymentPath" name="paymentPath" class="form-control select">
	            <option value="계좌이체">계좌이체</option>
	            <option value="현금">현금</option>
	            <option value="신용카드">신용카드</option>
	            <option value="경비">경비</option>
			</select>
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="salePath" class="col-sm-3 control-label">주문경로</label>
	      <div class="col-sm-8">
			<select id="salePath" name="salePath" class="form-control select">
	            <option value="개별구매" ${(vo.salePath=='개별구매')?"selected":""}>개별구매</option>
	            <option value="NAVER쇼핑" ${(vo.salePath=='NAVER쇼핑')?"selected":""}>NAVER쇼핑</option>
	            <option value="Homepage" ${(vo.salePath=='Homepage')?"selected":""}>Homepage</option>
	            <option value="Homepage" ${(vo.salePath=='쎈인생블로거')?"selected":""}>쎈인생블로거</option>
			</select>
	      </div>
	    </div>	    
	   	<div class="form-group">
	      <label for="deleveryDate" class="col-sm-3 control-label">수령일</label>
	      <div class="col-sm-8">
			<input class="form-control inputDate flatpickr flatpickr-input" id="deleveryDate" name="deleveryDate" 
					style="background: #FFFFFF;" type="text" placeholder="일자를 선택해주세요" data-input>
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="deleveryPath" class="col-sm-3 control-label">배송방법</label>
	      <div class="col-sm-8">
			<select id="deleveryPath" name="deleveryPath" class="form-control select">
	            <option value="택배">택배</option>
	            <option value="고객수령">고객수령</option>
	            <option value="직접배송">직접배송</option>
			</select>
	      </div>
	    </div>	    

     <div class="form-group">
      <label for="comm" class="col-sm-3 control-label">내역</label>
      <div class="col-sm-8">
      	<textarea class="form-control" rows="5" id="comm" name="comm"></textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-1"></div>
      <div class="col-sm-3">
		<button type="button" class="btn btn-block" id="saleReset">초기화</button>
      </div>      
      <div class="col-sm-4">
      	<button type="submit" class="btn btn-block">저장</button>
      </div>
      <div class="col-sm-3">
	  	<button type="button" onclick="location.href='saleAllList.do'" class="btn btn-block">리스트</button>
	  </div>
      <div class="col-sm-1"></div>
 	</div> 
</div>
</form>
<!-- 	</div> 2블럭 End -->


	<!-- 	</div> 3블럭 Start -->
	<div class="col-md-7">
	<!-- 	주문 List Start -->
	  <table class="table table-striped orderListTable">
	    <thead>
	      <tr>
	        <th  style="width: 15%">주문일</th>
	        <th  style="width: 10%">구분</th>
	        <th  style="width: 15%">주문경로</th>
	        <th style="width: 50%">주문내역 ( 판매 대기 )</th>
	        <th style="width: 10%">주문자</th>
	      </tr>
	    </thead>
	    <tbody>
	<c:forEach items="${orderList}" var="vo">
	      <tr class="dataRow" id="dataRow">
	        <td class="order_cno" style="display:none">${vo.cno}</td>
	        <td><fmt:formatDate value="${vo.orderDate}" pattern="yyyy-MM-dd" /></td>
	        <td>${vo.gubun}</td>
	        <td>${vo.salePath}</td>
	        <td>${vo.ori_250_format}${vo.erl_250_format}${vo.stc_250_format}</td>
	        <td>${vo.orderer}</td>
	      </tr>
	</c:forEach>
	    </tbody>
	  </table>
	
	<!-- 	주문 List End -->

  <table class="table table-striped">
    <thead>
    	<tr>
    		<th colspan="13">판매 List</th>
    	</tr>
      <tr>
        <th  style="width: 17%">판매일</th>
        <th  style="width: 10%">구분</th>
        <th  style="width: 13%">주문경로</th>
        <th style="width: 5%; font-size: 9px">O250</th>
        <th style="width: 5%; font-size: 9px">O500</th>
        <th style="width: 5%; font-size: 9px">O1000</th>
        <th style="width: 5%; font-size: 9px">E250</th>
        <th style="width: 5%; font-size: 9px">E500</th>
        <th style="width: 5%; font-size: 9px">E1000</th>
        <th style="width: 5%; font-size: 9px">S250</th>
        <th style="width: 5%; font-size: 9px">S500</th>
        <th style="width: 5%; font-size: 9px">S1000</th>
        <th style="width: 15%">배송</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${saleList}" var="vo">
      <tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
        <td><fmt:formatDate value="${vo.saleDate}" pattern="yyyy-MM-dd" /></td>
        <td>${vo.gubun}</td>
        <td style="font-size: 11px;">${vo.salePath}</td>
        <td>${vo.ori_250}</td>
        <td>${vo.ori_500}</td>
        <td>${vo.ori_1000}</td>
        <td>${vo.erl_250}</td>
        <td>${vo.erl_500}</td>
        <td>${vo.erl_1000}</td>
        <td>${vo.stc_250}</td>
        <td>${vo.stc_500}</td>
        <td>${vo.stc_1000}</td>
        <td>${vo.deleveryPath}</td>
      </tr>
</c:forEach>
    </tbody>
  </table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="sale.do" pageObject="${pageObject}" />
	</c:if>
</div>  
</div>
<!-- 	</div> 3블럭 End -->
</div>
</body>
</html>