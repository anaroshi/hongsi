<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Excel 업로드 및 다운로드</title>
<script type="text/javascript">

	function excelUploadProcess(){
		let formData = $("#form1").serialize();
		alert(JSON.stringify(formData));
		//alert(JSON.stringify(f));
		$.ajax({
			url: "uploadExcel",
			data: formData,
			processData: false,
			contentType: false,
			type: "POST",
			success: function(data){
				console.log(data);
				document.getElementById('result').innerHTML = JSON.stringify(data);
				//$("#result").html(JSON.stringify(data)); 
			}
		});
	}
    
	function excelDownloadProcess(){
		alert("excelDownloadProcess");
		form1.target = "hide_frame";
		form1.action = "excelDownload";		
		form1.submit();
	}
</script>
</head>
<body>
<form id="form1" name="form1" method="post" enctype="multipart/form-data" onsubmit="return false">
	<input type="file" id="fileInput" name="fileInput">
<!-- 	<a href="javascript:void(0);" onclick="excelUploadProcess()">엑셀업로드</a><br> -->
<!-- 	<a href="javascript:void(0);" onclick="excelDownloadProcess()">엑셀다운로드</a> -->
<!-- 	<a href="excelDownload">엑셀_다운로드</a> -->
</form>

<iframe width=0 height=0 frameborder=0 scrolling=no name="hide_frame" id="hide_frame" style="margin:0"></iframe>
<div id="result"></div>
</body>
</html>