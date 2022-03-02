<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M생산 수정</title>

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

div.panel.panel-default {
	height: 89px;
}

.order_item {
	font-size: 12px;
	padding: 6px 4px;
}

div.panel-body {
	padding: 3px 0px 0px;
	height: 60px;
}
</style>
<script>
function fn_delete(cno, locate) {
	
	if(confirm("삭제하시겠습니까")) {
		// alert(cno);		
		$.ajax({
			type: "POST",
			url: "outputDelete.do",
			async: false,
			data: "cno="+cno+"&locate="+locate, // json(전송) 타입
			dtatType: "text"				
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+result+" -> xhr: "+xhr);
			let query = "?page=${param.page}&perPageNum=${param.perPageNum}";
			if(result=="ok1") {
	        	alert("삭제 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/output.do"+query;				
	        	self.close();
			} else if(result=="ok2") {
	        	alert("삭제 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/outputAllList.do"+query;				
	        	self.close();
			} else {
					alert("삭제 실패");	
			}
		})
		.fail(function(data, textStatus, errorThrown) {
			console.log("fail");
			alert("오류발생");
		});
	}	
};  

function fn_update(cno) {

	if(confirm("수정하시겠습니까")) {

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
		
		// alert(cno);
		let formData = $("#frm").serialize();		
		// alert(JSON.stringify(formData));
		
		$.ajax({
			type: "POST",
			url: "outputUpdate.do",
			async: false,
			data: formData, // json(전송) 타입
			dataType: "text"					
		})
		.done(function (result, textStatus, xhr) {
			console.log("result:"+JSON.stringify(result)+" -> xhr: "+ JSON.stringify(xhr));
	        if(result=="ok1") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/output.do";				
	        	self.close();
			} else if(result=="ok2") {
	        	alert("수정 완료");
	        	 	// 부모창 reload
				opener.parent.location ="/purchshop/outputAllList.do";				
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

		<form class="form-horizontal" method="post" id="frm">
		<input name="cno"		type="hidden" 	value="${outputInfo.cno}" />
		<input name="locate"	type="hidden" 	value="${locate}" />
		<div class="row">
			<h4>M생산 수정</h4>
			<!-- M생산 Start -->
			<!-- 1블럭 Start -->
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<div class="form-group">
			    	<label for="outputDate" class="col-sm-3 control-label">생산일</label>
			      	<div class="col-sm-8">
				    	<input class="form-control inputDate flatpickr flatpickr-input" id="outputDate" name="outputDate" type="text"
								value='<fmt:formatDate value="${outputInfo.outputDate}" pattern="yyyy-MM-dd" />'
				        		style="background: #FFFFFF;" required="required" placeholder="일자를 선택해주세요" data-input>
			      	</div>
		    	</div>
		   		<div class="form-group">
		      		<label for="outputDate" class="col-sm-3 control-label">Original</label>
		      		<div class="col-sm-8">
		      			<input class="form-control order_item text-right" id="ori" name="ori" type="number" pattern="[0-9]{4}" value="${outputInfo.ori}">	      		
		      		</div>	      
		    	</div>
		   		<div class="form-group">
		      		<label for="outputDate" class="col-sm-3 control-label">Earlgrey</label>
		      		<div class="col-sm-8">
		      			<input class="form-control order_item text-right" id="erl" name="erl" type="number" pattern="[0-9]{4}" value="${outputInfo.erl}">	  
		      		</div>	      
		    	</div>
		   		<div class="form-group">
		      		<label for="outputDate" class="col-sm-3 control-label">SaltCaramel</label>
		      		<div class="col-sm-8">
		      			<input class="form-control order_item text-right" id="stc" name="stc" type="number" pattern="[0-9]{4}" value="${outputInfo.stc}">	
		      		</div>	      
	    		</div>		    
		    	<div class="form-group">
		      		<label for="gubun" class="col-sm-3 control-label">구분</label>
		      		<div class="col-sm-8">
						<select id="gubun" name="gubun" class="form-control select">
				            <option value="생산_cafe" ${(outputInfo.gubun=='생산_cafe')?"selected":""}>생산_cafe</option>
				            <option value="생산_마케팅" ${(outputInfo.gubun=='생산_마케팅')?"selected":""}>생산_마케팅</option>
				            <option value="생산_개발" ${(outputInfo.gubun=='생산_개발')?"selected":""}>생산_개발</option>
						</select>
		      		</div>
		    	</div>
			</div>
			<!-- 1블럭 End -->

			<!-- 2블럭 Start -->
			<div class="col-sm-5">
     			<div class="form-group">
      				<label for="comm" class="col-sm-3 control-label">내역</label>
      				<div class="col-sm-8">
      					<textarea class="form-control" rows="8" id="comm" name="comm">${outputInfo.comm}</textarea>
      				</div>
    			</div>
    			<div class="form-group">
      				<label for="manager" class="col-sm-3 control-label">담당자</label>
      				<div class="col-sm-8">
						<input class="form-control" type="text" id="" name="manager" value="${outputInfo.manager}">
      				</div>
 				</div> 
				<div class="form-group">
					<div class="col-sm-1"></div>
					<div class="col-sm-3">
						<button type="button" class="btn btn-block" id="orderUpdate"
							onclick="fn_update(${outputInfo.cno}); return false;">수정</button>
					</div>
					<div class="col-sm-3">
						<button type="button" class="btn btn-block" id="orderDelete"
							onclick="fn_delete(${outputInfo.cno},${locate}); return false;">삭제</button>
					</div>
					<div class="col-sm-4">
						<button type="button" class="btn btn-block"
							onclick="javascript:self.close();">닫기</button>
					</div>
				</div>
			</div>
		<!-- 2블럭 End -->
			
		</div>
		</form>
	</div>
</body>
</html>