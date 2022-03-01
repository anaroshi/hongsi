<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 입출고 수정</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" rel="stylesheet">

<!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- flatpickr 날짜 입력 -->
<script type="text/javascript" src="/resources/js/flatpickr.js"></script>

<link rel="stylesheet" href="/resources/css/style.css">

<style type="text/css">
</style>

<script>
function fn_delete(cno, locate) {
	if(confirm("삭제하시겠습니까")) {
		//alert(cno);		
		$.ajax({
			type: "POST",
			url: "storageDelete.do",
			async: false,
			data: "cno="+cno, // json(전송) 타입
			dtatType: "text"				
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+result+" -> xhr: "+xhr);

			let query = "?page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};
			query += ${(empty pageObject.buyDate)? 	"''" : "'&buyDate=" +=(pageObject.buyDate).substring(0, 10)+= "'"};
			query += ${(empty pageObject.gubun)? 	"''" : "'&gubun=" +=pageObject.gubun+= "'"};
			query += ${(empty pageObject.item)? 	"''" : "'&item=" +=pageObject.item+= "'"};
			query += ${(empty pageObject.purShop)? 	"''" : "'&purShop=" +=pageObject.purShop+= "'"};
			query += ${(empty pageObject.inDate)? 	"''" : "'&inDate=" +=(pageObject.inDate).substring(0, 10)+= "'"};	
			
			if(result=="ok") {
	        	alert("삭제완료");
	        	if (locate == 1 ) {
	        			// 부모창 reload	        	
	        		query = "?page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};			 	
					opener.parent.location ="/purchbook/storage.do"+query;
	        	} else if (locate == 2 ) {		        			        	 	
					
	        		opener.parent.location ="/purchbook/storageAllList.do"+query;				
	        	}		        					
	        	self.close();
			}
		})
		.fail(function(data, textStatus, errorThrown) {
			console.log("fail");
			alert("오류발생");
		});
	}	
};

function fn_update() {
	if(confirm("수정하시겠습니까")) {
		
		let formData = $("#frm").serialize();		
		//alert(JSON.stringify(formData));
		
		$.ajax({
			type: "POST",
			url: "storageUpdate.do",
			async: false,
			data: formData, // json(전송) 타입
			dataType: "text"					
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+JSON.stringify(result)+" -> xhr: "+ JSON.stringify(xhr));

			let query = "?page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};
			query += ${(empty pageObject.buyDate)? 	"''" : "'&buyDate=" +=(pageObject.buyDate).substring(0, 10)+= "'"};
			query += ${(empty pageObject.gubun)? 	"''" : "'&gubun=" +=pageObject.gubun+= "'"};
			query += ${(empty pageObject.item)? 	"''" : "'&item=" +=pageObject.item+= "'"};
			query += ${(empty pageObject.purShop)? 	"''" : "'&purShop=" +=pageObject.purShop+= "'"};
			query += ${(empty pageObject.inDate)? 	"''" : "'&inDate=" +=(pageObject.inDate).substring(0, 10)+= "'"};	
			
			if(result=="ok1") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
	        	query = "?page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};	        	
				opener.parent.location ="/purchbook/storage.do"+query; 	
	        	self.close();
			} else if(result=="ok2") {
	        	alert("수정 완료");
	        	 	// 부모창 reload	        		
	        	opener.parent.location ="/purchbook/storageAllList.do"+query;
	        	self.close();
			} else if(result=="ok3") {
	        	alert("수정 완료");
	        	 	// 부모창 reload	        		
//				let query = "?buyDate=${param.buyDate}&gubun=${param.gubun}&item=${param.item}&purShop=${param.purShop}&inDate=${param.inDate}";	
	        	opener.parent.location ="/purchbook/ingAllList.do"+query;
	        	self.close();
			} else {
					alert("수정 실패");	
			}
		})
		.fail(function(data, textStatus, errorThrown) {
			console.log("fail");
			alert("오류발생");
		});
	}	
};
</script>
</head>

<body>
<div class="container">
<form class="form-horizontal" method="post" id="frm" action="storageUpdate.do">
<input name = "cno" 	type="hidden" value="${storageInfo.cno}" />
<input name = "locate" 	type="hidden" value="${locate}" />
<div class="row">
  <h4>재료 입출고 수정</h4>  	
	<!-- 재료 입출고 수정 Start --> 	
	<!-- 1블럭 Start -->
	<div class="col-sm-1"></div>
	<div class="col-sm-5">
		<div class="form-group">
	      <label for="buyDate" class="col-sm-3 control-label">입출고일</label>
	      <div class="col-sm-8">
			<input class="form-control inputDate flatpickr flatpickr-input" id="buyDate" name="buyDate" type="text" 
					style="background: #FFFFFF;" value='<fmt:formatDate value="${storageInfo.buyDate}" pattern="yyyy-MM-dd" />'
					required="required" placeholder="일자를 선택해주세요" data-input>
	      </div>
		</div>
	    <div class="form-group">
	      <label for="item" class="col-sm-3 control-label">재료</label>
	      <div class="col-sm-8">
	      <select id="item" name="item" class="form-control select" required="required">
	      	<option value=""></option>
		      <c:forEach items="${ingreList}" var="vo">
		      	<option value="${vo.code}" ${(storageInfo.item ==vo.code)?"selected":""}>${vo.kname}</option>
		      </c:forEach>
	      </select>	        
	      </div>
		</div>
		<div class="form-group" id="gubunForm">
	      <label for="gubun" class="col-sm-3 control-label">구분</label>
	      <div class="col-sm-8">
			<select id="gubun" name="gubun" class="form-control select" required="required">
	            <option value="출고" ${(storageInfo.gubun =='출고')?"selected":""}>출고</option>
	            <option value="출고_office" ${(storageInfo.gubun=='출고_office')?"selected":""}>출고_office</option>
	            <option value="출고_cafe" ${(storageInfo.gubun=='출고_cafe')?"selected":""}>출고_cafe</option>
	            <option value="입고_office" ${(storageInfo.gubun=='입고_office')?"selected":""}>입고_office</option>
	            <option value="입고_cafe" ${(storageInfo.gubun=='입고_cafe')?"selected":""}>입고_cafe</option>
	            <option value="손실" ${(storageInfo.gubun=='손실')?"selected":""}>손실</option>
			</select>
	      </div>
		</div>	    
			   
	    <div class="form-group">
			<label for="content" class="col-sm-3 control-label">용량</label>
			<div class="col-sm-8">
				<input class="form-control inputNumber" id="content" name="content" type="number" placeholder="content" required="required" value="${storageInfo.content}">		      
			</div>
	    </div>
	</div> 
	<!-- 1블럭 End -->
	
	<!-- 2블럭 Start -->
	<div class="col-sm-5">
		<div class="form-group">
	      <label for="comm" class="col-sm-3 control-label">비고</label>
	      <div class="col-sm-8">
	      	<textarea class="form-control" rows="5" id="comm" name="comm">${storageInfo.comm}</textarea>
	      </div>
	     </div>	     
	     <div class="form-group">
	      <label for="buyer" class="col-sm-3 control-label">담당자</label>
	      <div class="col-sm-8">
	      	<select id="buyer" name="buyer" class="form-control select">
	            <option value="홍동호" ${(storageInfo.buyer=='홍동호')?"selected":""}>홍동호</option>
	            <option value="대행인" ${(storageInfo.buyer=='대행인')?"selected":""}>대행인</option>
			</select>
	      </div>
 		</div>	    
	    <div class="form-group">
    	<div class="col-sm-1"></div>
    	<div class="col-sm-3"><button type="button" class="btn btn-block" id="orderUpdate" onclick="fn_update(); return false;">수정</button></div>
    	<div class="col-sm-3"><button type="button" class="btn btn-block" id="orderDelete" onclick="fn_delete(${storageInfo.cno},${locate}); return false;">삭제</button></div>
    	<div class="col-sm-4"><button type="button" class="btn btn-block" onclick="javascript:self.close();" >닫기</button></div> 
    	</div>

	</div>
	<!-- 2블럭 End -->	
	<!-- 재료주문 End -->
</div>
</form>
</div>
</body>
</html>