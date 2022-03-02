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
		$("#ori").focus();	  
	};	
});

function formCheck() {
	
	let ori = $("#ori").val();
	if(ori == null || ori =="" || typeof ori == "undefined" || ori >= 20000) ori = 0;
	$("#ori").val(ori);	
	
	let erl = $("#erl").val();
	if(erl == null || erl =="" || typeof erl == "undefined" || erl >= 20000) erl = 0;
	$("#erl").val(erl);	
	
	let stc = $("#stc").val();
	if(stc == null || stc =="" || typeof stc == "undefined" || stc >= 20000) stc = 0;
	$("#stc").val(stc);	
	
	let outputDate = $("#outputDate").val();		
	if( outputDate== null || outputDate ==""  || outputDate.length<10)  {
		alert('생산일을 입력해주세요!');
		$("#outputDate").select();
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
	var url = "../view/outputModify.do?cno="+cno+"&locate=1"+query;
	
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
	<!-- M생산 Start -->
	<!-- 1블럭 Start -->  
 	<div class="col-sm-4">
	   <div class="form-group">
	      <label for="outputDate" class="col-sm-3 control-label">생산일</label>
	      <div class="col-sm-8">
		        <input class="form-control inputDate flatpickr flatpickr-input" id="outputDate" name="outputDate" type="text" 
		        		style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
	      </div>
	    </div>
	   <div class="form-group">
	      <label for="outputDate" class="col-sm-3 control-label">Original</label>
	      <div class="col-sm-8">
	      		<input class="form-control order_item text-right" id="ori" name="ori" type="number" pattern="[0-9]{4}">	      		
	      </div>	      
	    </div>
	   <div class="form-group">
	      <label for="outputDate" class="col-sm-3 control-label">Earlgrey</label>
	      <div class="col-sm-8">
	      		<input class="form-control order_item text-right" id="erl" name="erl" type="number" pattern="[0-9]{4}">	  
	      </div>	      
	    </div>
	   <div class="form-group">
	      <label for="outputDate" class="col-sm-3 control-label">SaltCaramel</label>
	      <div class="col-sm-8">
	      		<input class="form-control order_item text-right" id="stc" name="stc" type="number" pattern="[0-9]{4}">	
	      </div>	      
	    </div>	    
			    			    
	    <div class="form-group">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select">
	            <option value="생산_cafe">생산_cafe</option>
	            <option value="생산_마케팅">생산_마케팅</option>
	            <option value="생산_개발">생산_개발</option>
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
		<button type="button" onclick="location.href='outputAllList.do'" class="btn btn-block"  style="padding-left:3px;">리스트</button>
	  </div>
	  <div class="col-sm-1"></div>
 	</div> 
</div>
</form>
<!-- 	</div> 블럭 End -->

<!-- 	M생산 내역 List -->
<div class="col-md-8">
  <table class="table table-striped">
    <thead>
      <tr>
        <th style="width: 13%">생산일</th>
        <th style="width: 13%">구분</th>
        <th style="width: 7%">ORI</th>
        <th style="width: 7%">ERL</th>
        <th style="width: 7%">STC</th>
        <th style="width: 53%">내역</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${outputList}" var="vo">
      <tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
        <td><fmt:formatDate value="${vo.outputDate}" pattern="yyyy-MM-dd" /></td>
        <td>${vo.gubun}</td>
        <td class="text-right">${vo.ori}</td>
        <td class="text-right">${vo.erl}</td>
        <td class="text-right">${vo.stc}</td>
        <td class="text-left">${vo.comm}</td>
      </tr>
</c:forEach>
    </tbody>
  </table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="output.do" pageObject="${pageObject}" />
	</c:if>
</div>  
</div>
<!-- 	 M생산 내역 List End  -->
</div>
</body>
</html>