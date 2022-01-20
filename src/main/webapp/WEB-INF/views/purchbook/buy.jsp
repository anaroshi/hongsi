<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchBook</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  
<script>
  $( function() {
    $( "#buydate" ).datepicker({
		changeMonth: true,
		changeYear: true,
		minDate: '-50y', 
		nextText: '다음 달', 
		prevText: '이전 달', 
		yearRange: 'c-3:c+3', 
		showButtonPanel: true, 
		currentText: '오늘 날짜', 
		closeText: '닫기', 
		dateFormat: "yy-mm-dd", 
		showAnim: "slide", 
		showMonthAfterYear: true, dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
      
    });
    
    $( "#indate" ).datepicker({
		changeMonth: true,
		changeYear: true,
		minDate: '-50y', 
		nextText: '다음 달', 
		prevText: '이전 달', 
		yearRange: 'c-3:c+3', 
		showButtonPanel: true, 
		currentText: '오늘 날짜', 
		closeText: '닫기', 
		dateFormat: "yy-mm-dd", 
		showAnim: "slide", 
		showMonthAfterYear: true, dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
      
    });
  });
  </script>
</head>
<body>
<div class="container">
  <h2>구매 입력</h2>
  <form class="form-horizontal">
    <div class="form-group">
      <label for="buydate" class="col-sm-2 control-label">구매일자</label>
      <div class="col-sm-5">
        <input class="form-control" id="buydate" type="text">
      </div>
    </div>
    <div class="form-group">
      <label for="item" class="col-sm-2 control-label">구매품</label>
      <div class="col-sm-5">
        <input class="form-control" id="item" type="text" placeholder="item">
      </div>
    </div>
    <div class="form-group">
      <label for="purcode" class="col-sm-2 control-label">구분</label>
      <div class="col-sm-5">
		<select id="purcode" class="form-control">
            <option value="1">구매</option>
            <option value="2">반품</option>
            <option value="3">폐기</option>
		</select>
      </div>
    </div>
    <div class="form-group">
      <label for="purname" class="col-sm-2 control-label">구분명</label>
      <div class="col-sm-5">
        <input class="form-control" id="purname" type="text" placeholder="purname">
      </div>
    </div>
    <div class="form-group">
      <label for="qty" class="col-sm-2 control-label">용량</label>
      <div class="col-sm-5">
        <input class="form-control" id="qty" type="text" placeholder="qty">
      </div>
    </div>
    <div class="form-group">
      <label for="minqty" class="col-sm-2 control-label">수량</label>
      <div class="col-sm-5">
        <input class="form-control" id="minqty" type="text" placeholder="minqty">
      </div>
    </div>
     <div class="form-group">
      <label for="unit" class="col-sm-2 control-label">단위</label>
      <div class="col-sm-5">
		<label class="radio-inline">
	      <input type="radio" name="unit" value="g">g
	    </label>
	    <label class="radio-inline">
	      <input type="radio" name="unit" value="pack">pack
	    </label>
	    <label class="radio-inline">
	      <input type="radio" name="unit" value="box">box
	    </label>
      </div>
    </div>
     <div class="form-group">
      <label for="indate" class="col-sm-2 control-label">입고일자</label>
      <div class="col-sm-5">
       	<input class="form-control" type="text" id="indate">
      </div>
    </div>
     <div class="form-group">
      <label for="comm" class="col-sm-2 control-label">내역</label>
      <div class="col-sm-5">
      	<textarea class="form-control" rows="5" id="comm"></textarea>
      </div>
    </div>
     <div class="form-group">
      <label for="buyer" class="col-sm-2 control-label">구매자</label>
      <div class="col-sm-5">
      	<select id="buyer" class="form-control">
            <option value="1">홍동호</option>
            <option value="2">대행인</option>
		</select>
      </div>
    </div>
    <div class="form-group">
    <div class="col-sm-7">
    	<button type="submit" class="btn btn-primary btn-block">저장</button>
    </div>	
    </div>    
  </form>
</div>
</body>
</html>