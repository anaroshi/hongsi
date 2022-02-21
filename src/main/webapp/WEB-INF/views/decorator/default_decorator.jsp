<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : sundor -->
<!-- 작성일 : 2021-01-10 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
System.out.println("default_decorator.do [path] : " + request.getContextPath());
request.setAttribute("path", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SJH::<decorator:title /></title>

<!-- BootStrap 라이브러리 등록 전체적으로 진행을 했다. filter가 적용이 되면 개별적으로 한것은 다 지워야 한다. -->
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<!-- 재료 용량 등록 -->
<!-- <script type="text/javascript" src="/resources/js/item.js"></script> -->

<link rel="stylesheet" href="/resources/css/style.css">
<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: black;
	padding: 25px;
	color: #ddd;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
/* 	#log_image{ */
/*  		display: none;  */
/* 	} */
}

article {
	min-height: 400px;
	margin-top: 80px; /* 메뉴부분만큼의 마진 적용 - 데이터가 메뉴에 가리는 것은 해결 */
	margin-bottom: 100px; /* copyRight 부분의 마진 적용 - 데이터가 copyRight에 가리는 것은 해결 */
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		<c:if test="${!empty msg}">
			// 메시지 출력 - 등록처리, 수정처리, 삭제처리 후 메시지가 세션에 들어 있으면 출력된다.
			// 0.02초 후에 메시지 출력 - 화면에 내용이 나타나고 나서 경고창을 띄워서 하얀 상태의 화면을 피한다.
			setTimeout(function() {
				alert("${msg}");
			}, 20);
		</c:if>
	
		<c:if test="${!empty login}">
			/* - 구현을 다해놓은 주석을 푼다.
			// 로그인이 되어 있으면 새로운 메시지를 3초마다 확인하러가도록 Ajax처리를 한다.
			getMessageCnt();
			var myVar = setInterval(getMessageCnt, 3000);
			function getMessageCnt() {
				//서버에 가서 사용자가 받은 새로운 메시지의 갯수를 가져오는 처리 
			  $("#messageCnt").load("/ajax/getMessageCnt.do",
				function(result, status){
					  // console.log(status);
					  if(status=="error"){
						  // 로그인 정보 오류가 나는 경우의 처리
						  // 실시간으로 실행되고 있는 함수의 시간을 제거해서 멈추게 한다.
						  clearTimeout(myVar);
						  // 경고를 띄운다.
						  alert("세션이 끊겨서 다시 로그인 하셔야 합니다.");
						  // 경고의 확인을 누르면 로그인으로 이동시킨다.
						  location = "/member/login.do";
					  }
			  	}
			  );
			}
			*/
		</c:if>
	});
</script>

<!-- 개별 jsp의 태그안에 있는 css, js를 넣어준다. -->

<decorator:head/>
</head>
<body>
	<header>
<!-- 		<div id="log_image"><img src="/upload/image/dog01.jpg"/></div> -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/main/main.do">Main</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="${path }/purchbook/buy.do">재료구매</a></li>
						<li><a href="${path }/purchbook/storage.do">재료입출고</a></li>
						<li><a href="${path }/purchshop/product.do">생산</a></li>
						<li><a href="${path }/purchshop/order.do">주문</a></li>
						<li><a href="${path }/purchshop/sale.do">판매</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">리스트
							<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${path }/purchbook/ingAllList.do">재료</a></li>
								<li><a href="${path }/purchbook/buyAllList.do">재료구매</a></li>
								<li><a href="${path }/purchbook/storageAllList.do">재료입출고</a></li>
								<li><a href="${path }/purchshop/productAllList.do">생산</a></li>
								<li><a href="${path }/purchshop/orderAllList.do">주문</a></li>
								<li><a href="${path }/purchshop/saleAllList.do">판매</a></li>
							</ul>
						</li>
						<li><a href="${path }/quantity/list.do">재료함량</a></li>
						<li><a href="${path }/purchbook/stockList.do">재료재고</a></li>
						<li><a href="${path }/quantity/product.do">제품생산</a></li>									
						<li><a href="${path }/report/report.do">엑셀출력</a></li>									
						<!-- &amp; - &, &lt; -> <, &gt; -> >, &nbsp; blank -->						
						<c:if test="${!empty login }">
							<!-- 로그인되어 있는 경우의 메뉴 -->
							<li><a href="${path }/message/list.do">메시지</a></li>
						</c:if>
						<!-- 회원관리는 관리자 권한으로 로그인하면 보인다. -->
						<c:if test="${login.gradeNo==9 }">
							<li><a href="${path }/member/list.do">회원관리</a></li>
						</c:if>
					</ul>
					
					<!-- 메인 메뉴 부분의 로그인 사용자 정보 -->
				    <ul class="nav navbar-nav navbar-right">
				      <c:if test="${empty login }">
				      <!-- 로그인이 안되어 있는 경우의 메뉴 -->				      
				      <li><a href="${path }/member/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				      </c:if>
				      <c:if test="${!empty login }">
				      <!-- 로그인이 되어 있는 경우의 메뉴 -->
				      <li>
				      	<a href="">
				      		<span class="glyphicon glyphicon-user"></span> ${login.name }
							<span class="badge" id="messageCnt">0</span>
				      	</a>				      	
				      </li>
				      
				      <li id="welcome">${login.name }[${login.gradeName }]</li>				      
				      <li><a href="${path }/member/logout.do"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				      </c:if>
				    </ul>
				</div>
			</div>
			</div>
		</nav>
	</header>
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-center navbar navbar-inverse navbar-fixed-bottom">
		<p>©2022 ANAROSHI</p>
	</footer>
</body>
</html>