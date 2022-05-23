<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 구매 &amp; 입출고 리스트</title>

<script>
$( function() {
	
	$(".flatpickr").flatpickr({	
		mode: "range",
		dateFormat: "Y-m-d",
		locale: "ko",
// 		minDate: new Date().fp_incr(-30),
// 		maxDate: new Date().fp_incr(93),		
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

function fn_view(cno, gubun) {	
	//alert(cno);
	var w = 1000;
	var h = 470;

	let query = "&page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};
	query += ${(empty pageObject.buyDate)? 	"''" : "'&buyDate=" +=(pageObject.buyDate).substring(0, 10)+= "'"};
	query += ${(empty pageObject.gubun)? 	"''" : "'&gubun=" +=pageObject.gubun+= "'"};
	query += ${(empty pageObject.item)? 	"''" : "'&item=" +=pageObject.item+= "'"};
	query += ${(empty pageObject.purShop)? 	"''" : "'&purShop=" +=pageObject.purShop+= "'"};
	query += ${(empty pageObject.inDate)? 	"''" : "'&inDate=" +=(pageObject.inDate).substring(0, 10)+= "'"};

	let	url = "../view/storageModify.do?cno="+cno+"&locate=3"+query;	

	if (gubun == "구매" || gubun == "구매_office" || gubun == "구매_cafe") 
		url = "../view/buyModify.do?cno="+cno+"&locate=3"+query;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	xPos += window.screenLeft; // 듀얼 모니터일 때
	var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

	window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
};

function doExcelUploadProcess() {
	
	alert("doExcelUploadProcess");
	let f = new FormData($("#frm"));
	$.ajax({
		url: "uploadExcelFile",
		data: f,
		processData: false,
		contentType: false,
		type:"POST",
		success: function(data){
			console.log(data);
			$("#result").html(JSON.stringify(data));
		}		
	})
}

function doExcelDownloadProcess() {
	let f = $("#frm");	
	$('<input>').attr('type','hidden').attr('name','buyDate').attr('value','${pageObject.buyDate}').appendTo(f);
	$('<input>').attr('type','hidden').attr('name','gubun').attr('value','${pageObject.gubun}').appendTo(f);
	$('<input>').attr('type','hidden').attr('name','item').attr('value','${pageObject.item}').appendTo(f);
	$('<input>').attr('type','hidden').attr('name','purShop').attr('value','${pageObject.purShop}').appendTo(f);
	$('<input>').attr('type','hidden').attr('name','inDate').attr('value','${pageObject.inDate}').appendTo(f);
	f.attr("action", "downloadExcelFile");
	f.submit();
}

</script>
</head>

<body>
<div class="container">
	<div class="col-md-12">
	
	<form>
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="perPageNum" value="${pageObject.perPageNum}">
		<div class="form-group row">
		 	<div class="col-md-2">	 		
				<div class="input-group">			
				    <span class="input-group-addon">일자</span>			    
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
						<option value="구매" ${(pageObject.gubun=='구매')?"selected":""} >구매</option>
			            <option value="구매_office" ${(pageObject.gubun=='구매_office')?"selected":""} >구매_office</option>
			            <option value="구매_cafe" ${(pageObject.gubun=='구매_cafe')?"selected":""} >구매_cafe</option>
			            <option value="출고" ${(pageObject.gubun=='출고')?"selected":""} >출고</option>
			            <option value="출고_office" ${(pageObject.gubun=='출고_office')?"selected":""} >출고_office</option>
			            <option value="출고_cafe" ${(pageObject.gubun=='출고_cafe')?"selected":""} >출고_cafe</option>
			            <option value="입고" ${(pageObject.gubun=='입고')?"selected":""} >입고</option>
			            <option value="입고_office" ${(pageObject.gubun=='입고_office')?"selected":""} >입고_office</option>
			            <option value="입고_cafe" ${(pageObject.gubun=='입고_cafe')?"selected":""} >입고_cafe</option>
			            <option value="손실" ${(pageObject.gubun=='손실')?"selected":""} >손실</option>
			            <option value="office" ${(pageObject.gubun=='office')?"selected":""} >office</option>
			            <option value="cafe" ${(pageObject.gubun=='cafe')?"selected":""} >cafe</option>
					</select>
				</div>
			</div>  	
		  	<div class="col-md-2">
				<div class="input-group">
				    <span class="input-group-addon">재료</span>
				      <select id="item" name="item" class="form-control select">
				      	<option value=""></option>
				      <c:forEach items="${ingreList}" var="vo">
				      	<option value="${vo.code}" ${(pageObject.item==vo.code)?"selected":""} >${vo.kname}</option>
				      </c:forEach>
				      </select>	        
		  		</div>
			</div>  	
		  	<div class="col-md-2">
				<div class="input-group">
				    <span class="input-group-addon">거래처</span>
					<select id="purShop" name="purShop" class="form-control select">
						<option value=""></option>
			            <option value="넛츠베리" ${(pageObject.purShop=='넛츠베리')?"selected":""} >넛츠베리</option>
			            <option value="넛츠피아" ${(pageObject.purShop=='넛츠피아')?"selected":""}>넛츠피아</option>
			            <option value="네이버쇼핑" ${(pageObject.purShop=='네이버쇼핑')?"selected":""} >네이버쇼핑</option>
			            <option value="맘쿠킹" ${(pageObject.purShop=='맘쿠킹')?"selected":""}>맘쿠킹</option>
			            <option value="코스트코구매대행" ${(pageObject.purShop=='코스트코구매대행')?"selected":""}>코스트코구매대행</option>
			            <option value="쿠팡" ${(pageObject.purShop=='쿠팡')?"selected":""} >쿠팡</option>
					</select>
				</div>
			</div>  	
		 	<div class="col-md-2">
				<div class="input-group">			
				    <span class="input-group-addon">입고일</span>			    
				    <input type="text" name="inDate" id="inDate" class="form-control inputDate flatpickr flatpickr-input" 
				    		value="${pageObject.inDate}"
				    		style="background: #FFFFFF; text-align: center; font-size:10px; padding-left: 0px; padding-right: 0px;" placeholder="일자를 선택해주세요">
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
				<td colspan="2"></td>
				<td colspan="2" class="text-center"><h5>재료 구매 &amp; 입출고 LIST</h5></td>
				<td colspan="3" class="text-right">
					<form id="frm" name="frm" method="post" enctype="multipart/form-data" class="form-inline">
						<div class="form-group">
							<input type="file" id="fileInput" name="fileInput">
						</div>	
							<button type="button" onclick="doExcelUploadProcess()" class="btn btn-primary">엑셀업로드</button>
							<button type="button" onclick="doExcelDownloadProcess()" class="btn btn-primary">엑셀다운로드</button>
					</form>
				</td>				    	
			</tr>
			<tr>
		        <th width="10%">일자</th>
		        <th width="10%">구분</th>
		        <th width="10%">재료</th>
		        <th width="7%">용량(g)</th>
		        <th width="10%">거래처</th>
		        <th width="10%">입고일</th>
		        <th width="20%">비고</th>
		      </tr>
	    </thead>
	    <tbody>
	    	<c:set var="sumqtySum" value="0"/>
			<c:forEach items="${resultList}" var="vo" varStatus="status">	
		 	<tr class="dataRow" onclick="fn_view(${vo.cno}, '${vo.gubun}'); return false;">
		 		<c:if test="${vo.gubun ne '출고' && vo.gubun ne '출고_office' && vo.gubun ne '출고_cafe' && vo.gubun ne '손실'}"><c:set var="sumqtySum" value="${sumqtySum + vo.sumQty}"/></c:if>
		 		<c:if test="${vo.gubun eq '출고' || vo.gubun eq '출고_office' || vo.gubun eq '출고_cafe' || vo.gubun eq '손실'}"><c:set var="sumqtySum" value="${sumqtySum - vo.sumQty}"/></c:if>
		 		<td class="cno" style="display:none">${vo.cno}</td>
		        <td><fmt:formatDate value="${vo.buyDate}" pattern="yyyy-MM-dd" /></td>
		        <td>${vo.gubun}</td>
		        <td>${vo.item}</td>
		        <td class="text-right"><fmt:formatNumber value="${vo.sumQty}" /></td>
		        <td>${vo.purShop}</td>
		        <td><fmt:formatDate value="${vo.inDate}" pattern="yyyy-MM-dd" /></td>
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
		        <td class="text-right"><fmt:formatNumber value="${sumqtySum}" /></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>
	    </tfoot>
	</table>
	<div class="text-center">
		<c:if test="${pageObject.totalPage>1}" >		
			<pageObject:pageNav listURI="ingAllList.do" pageObject="${pageObject}" />
		</c:if>
	</div>
	</div>
	<div id="result"></div>
</div>
</body>
</html>