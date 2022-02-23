<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchBook</title>

<style type="text/css">
div.modal-body {
	height: 90px;
}		
</style>  

<script>
  $( function() {

//		startWith();
		  
// 		function startWith() {
// 			// 화면 로드시 커서가 위치하게
// 			$("#buyDate").focus();	  
// 		};
	
	  // 입력 메세지 처리	
	  //${(empty msg)? "":"alert('"+=msg+="');"};	
	//	<c:if test="${!empty msg}">
	// 		alert("${msg}");
	// 	</c:if>
	  
    // 주문 리스트에서 입고일자 등록하기
	$(".orderRow").click(function(){
		let cno 	= $(this).find(".cno").text();		
		let buyDate = $(this).find(".buyDate").text();		
		let gubun 	= $(this).find(".gubun").text();		
		let item 	= $(this).find(".item").text();		
		let kname 	= $(this).find(".kname").text();		
		let content = $(this).find(".content").text();		
		let qty 	= $(this).find(".qty").text();
		let purShop	= $(this).find(".purShop").text();
		
		$(".cno").val(cno);		
		$(".buyInfo").css("font-size","16px").text(buyDate+"  "+gubun+"  "+kname+"  "+content+"g  "+qty+"개  "+purShop);		
		$("#myModal").modal("show");
	});

});

  // 유효성 검사
function formCheck() {
	let buyDate = $("#buyDate").val();		
	if( buyDate== null || buyDate ==""  || buyDate.length<10)  {
		alert('주문일을 입력해주세요!');
		$("#buyDate").select();
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
	var url = "../view/buyModify.do?cno="+cno+"&locate=1";
	
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

	window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
};    

// 좌측 재료 리스트에서 재료를 선택하면 주문품이 선택된 재료로 셋팅된다.
function fn_item(kname) {	
	let itemOption = new Array();
//	console.log("--------------------"+kname);
	itemOption.push(`<option value=""></option>`);
	<c:forEach items="${ingreList}" var="vo">
		if('${vo.kname}' == kname) {
			itemOption.push(`<option value="${vo.code}" selected >${vo.kname}</option>`);
		} else {
			itemOption.push(`<option value="${vo.code}" >${vo.kname}</option>`);
		}
  	</c:forEach>
  	
  	$("#item").html(itemOption);
};
</script>

</head>
<body>
<div class="container">
<form class="form-horizontal" method="post" onsubmit="return formCheck()">
<div class="row">
  <h4>재료구매 입력</h4>  

	<!-- 주문 필요량 보이기 Start -->
	<div class="col-md-2">
		<table class="table">
			<thead>
				<tr>
					<th>재료 (g)</th>
					<th>주문필요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="vo" varStatus="status">
						<c:if test="${vo.finalNeed ne '0'}">
					<tr class="dataRow" onclick="fn_item('${vo.kname}'); return false;">
						<td class="text-center">${vo.kname}</td>
						<td class="text-right" id="need_${status.count}"><fmt:formatNumber value="${vo.finalNeed}" /></td>
					</tr>
						</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 재고량 보이기 End -->
	
	<!-- 재료주문 Start -->
	<!-- 1블럭 Start -->
	<div class="col-sm-2">
	   <div class="form-group">
	      <label for="buyDate" class="col-sm-3 control-label">주문일</label>
	      <div class="col-sm-8">
			<input class="form-control inputDate flatpickr flatpickr-input" id="buyDate" name="buyDate" type="text" 
					style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="item" class="col-sm-3 control-label">주문품</label>
	      <div class="col-sm-8">
	      <select id="item" name="item" class="form-control select" required="required">
	      	<option value=""></option>
			<c:forEach items="${ingreList}" var="vo">
				<option value="${vo.code}">${vo.kname}</option>
		 	</c:forEach>
	      </select>	        
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select" required="required">	            
	            <option value="구매_office">구매_office</option>
	            <option value="구매_cafe">구매_cafe</option>
<!-- 	            <option value="교환">교환</option> -->
<!-- 	            <option value="반품">반품</option> -->
<!-- 	            <option value="손실">손실</option> -->
			</select>
	      </div>
	    </div>	    
	    <div class="form-group">
	      <label for="content" class="col-sm-3 control-label">용량</label>
	      <div class="col-sm-8">
	      	<input class="form-control inputNumber" id="content" name="content" type="number" placeholder="용량" required="required"  placeholder="용량을 입력해주세요" >
<!-- 		      <select id="content" name="content" class="form-control select" required="required"> -->
<!-- 				<option value="">수량 1개당 용량</option>	             -->
<!-- 			  </select> -->
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="qty" class="col-sm-3 control-label">수량</label>
	      <div class="col-sm-8">
	        <input class="form-control inputNumber" id="qty" name="qty" type="number" placeholder="qty" required="required">
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label for="price" class="col-sm-3 control-label">금액</label>
	      <div class="col-sm-8"> 
	      <div class="input-group">
	      	<span class="input-group-addon"><i class="fas fa-won-sign"></i></span>
			<input class="form-control" type="text" id="price" name="price" required="required">
		  </div></div>
	    </div>
	</div> <!-- 1블럭 End -->
	
	<div class="col-sm-3">
    <div class="form-group">
      <label for="purShop" class="col-sm-3 control-label">거래처</label>
      <div class="col-sm-8">
		<select id="purShop" name="purShop" class="form-control select" required="required">
			<option value=""> </option>
            <option value="넛츠베리">넛츠베리</option>
            <option value="네이버쇼핑">네이버쇼핑</option>
            <option value="쿠팡">쿠팡</option>
		</select>
      </div>
    </div>
    <div class="form-group">
      <label for="inDate" class="col-sm-3 control-label">입고일자</label>
      <div class="col-sm-8">
		<input class="form-control inputDate flatpickr flatpickr-input" id="inDate" name="inDate" type="text" 
				style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
      </div>
    </div>
     <div class="form-group">
      <label for="comm" class="col-sm-3 control-label">내역</label>
      <div class="col-sm-8">
      	<textarea class="form-control" rows="5" id="comm" name="comm"></textarea>
      </div>
    </div>
     <div class="form-group">
      <label for="buyer" class="col-sm-3 control-label">구매자</label>
      <div class="col-sm-8">
      	<select id="buyer" name="buyer" class="form-control select">
            <option value="홍동호">홍동호</option>
            <option value="대행인">대행인</option>
		</select>
      </div>
    </div>

	<div class="row">
	    <div class="form-group">
		    <div class="col-sm-2"></div>
		    <div class="col-sm-3">
				<button type="reset" class="btn btn-block">초기화</button>
		    </div>  
		    <div class="col-sm-3">
		    	<button type="submit" class="btn btn-block">저장</button>
		    </div>	
		    <div class="col-sm-3">
		    	<button type="button" onclick="location.href='buyAllList.do'" class="btn btn-block">리스트</button>
		    </div>
		    <div class="col-sm-1"></div>
	    </div>
    </div>
	</div> 
	<!-- 2블럭 End -->
	<!-- 재료주문 End -->
	
	<!-- 주문 List Start -->
<div class="col-md-5">
<table class="table table-striped">
   <thead>    
	<tr>        
        <th width="17%">주문일</th>
        <th width="12%">구분</th>
        <th width="20%">주문품</th>
        <th width="22%" style="display:none">주문품</th>
        <th width="9%">용량</th>
        <th width="9%">수량</th>
        <th width="16%">거래처</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${buyList}" var="vo" varStatus="status">
 	<tr class="dataRow orderRow"> 		
 		<td class="cno" style="display:none">${vo.cno}</td>
        <td class="buyDate">${vo.buyDate}</td>
        <td class="gubun" style="font-size: 11px;">${vo.gubun}</td>
        <td class="item" style="display:none">${vo.item}</td>
        <td class="kname">${vo.kname}</td>
        <td class="content text-right"><fmt:formatNumber value="${vo.content}" /></td>
        <td class="qty text-right">${vo.qty}</td>
        <td class="purShop">${vo.purShop}</td>
    </tr>
</c:forEach>
    </tbody>
</table>

<table class="table table-striped">
   <thead>    
	<tr>
        <th width="16%">주문일</th>
        <th width="16%">구분</th>
        <th width="19%">주문품</th>
        <th style="display:none">주문품</th>
        <th width="9%">용량</th>
        <th width="9%">수량</th>
        <th width="15%">거래처</th>
        <th width="16%">입고일</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${buyInList}" var="vo" varStatus="status">
	<tr class="dataRow" onclick="fn_view(${vo.cno}); return false;"> 	
 		<td class="cno" style="display:none">${vo.cno}</td>
        <td class="buyDate" style="font-size: 11px;">${vo.buyDate}</td>
        <td class="gubun" style="font-size: 11px;">${vo.gubun}</td>
        <td class="item" style="display:none">${vo.item}</td>
        <td class="kname">${vo.kname}</td>
        <td class="content text-right"><fmt:formatNumber value="${vo.content}" /></td>
        <td class="qty text-right">${vo.qty}</td>
        <td class="purShop" style="font-size: 11px;">${vo.purShop}</td>
        <td class="purShop" style="font-size: 11px;">${vo.inDate}</td>
    </tr>
</c:forEach>
    </tbody>
</table>

<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="buy.do" pageObject="${pageObject}" />
	</c:if>	
</div>
<!-- 주문 List End  -->

  </div>
</div>
    </form>
</div>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">주문내역</h4>
      </div>
      <form method="post" id="inDateSaveForm"  name="inDateSaveForm" action="/purchbook/inDateSave.do">
      <div class="modal-body">
 		<input style="display:none" class="cno" name="cno"/>
      		<div class="form-group">
	      		<div>
	      			<p class="buyInfo"></p>
	      		</div>
      		</div>
	      	<label for="inDateSave" class="col-sm-3 text-center control-label" style="font-size: 15px">입고일</label>
		      <div class="col-sm-4">
				<input class="form-control inputDate flatpickr flatpickr-input" id="inDateSave" name="inDate" type="text" 
						style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
		      </div>
     </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-default" id="inDateSaveBtn">저장</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
	<!-- 댓글 처리 끝 -->
  </div>
</div>	
</body>
</html>