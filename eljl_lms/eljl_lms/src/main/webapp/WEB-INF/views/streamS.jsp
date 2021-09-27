<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>StreamS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://humy2833.dothome.co.kr/customizing.html#">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function NoticeStOutput(){
		let myTeId = document.getElementsByName("myTeId");
	}
</script>
<style>
a:hover {
	color: black;
}

#test : hover {
	color: black;
}
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	background-color: #375a7f;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #ffffff;
	height: 100%;
}

/* Set black background color, C and some padding */
footer {
	background-color: #555;
	color: blue;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

#classTitle {
	margin-top: 50px;
	height: 100px;
	background-color: #EBF7FF;
	text-align: center;
}

/* 일정글자 */
#scfont{
	font-style: italic;
	margin-left: -5px;
}

.button {
	margin-top: 7px;
	margin-left: 356px;
	background-color: #5AAEFF;
	border-color: transparent; /* 박스 테두리 투명 */
	color: #FFFFFF;
}

/* 일정박스 */
.col-sm-4{
	width: 300px;
	height: 200px;
	margin-right: 60px;
	border-radius: 20px;
	border: 2px solid #C7C6FF;
}

/* 일정박스영역 */
.row{
	margin-top: 30px;
	margin-bottom: 50px;
	margin-left: 55px;
}

/* 공지사항박스 영역 */
.no-outbox {
	position: relative;
	top: -352px;
	left: 490px;
}

/* 공지사항 박스 */
.well {
	background-color: #EBF7FF;
	width: 590px;
	height: 55px;
}

/* 타이틀-도덕 */
h3 {
	position: absolute;
	top: 4%;
	left: 50%;
	width: 10%;
	height: 24px;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, 100%);
	font-family: "Palatino", Arial, Helvetica, sans-serif;
	font-weight: bold;
	text-shadow: -1px -1px 1px #aaa, 3px 3px 4px black;
	font-size: 45px;
	color: #FFFFFF;
}

p {
	font-family: "맑은 고딕";
	font-size: 20px;
}

</style>
<script type="text/javascript" src="resources/js/master.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid" style="display: flex;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#" id="test" style="color: white;">이러닝저러닝</a></li>
				</ul>
			</div>

			<div style="margin: 0 auto;">
				<ul class="nav navbar-nav">
					<li><a href="#" style="color: white;">스트림</a></li>
					<li><a href="#" style="color: white;">수업</a></li>
					<li><a href="#" style="color: white;">출석부</a></li>
					<li><a href="#" style="color: white;">학생관리</a></li>
					<li><a style="color: white;">설정</a></li>
				</ul>
			</div>
			<div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-cog"
							style="color: white;"></span></a></li>
					<li><a style="color: white;"><span
							class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Wrapper for slides -->
	<!-- 학과명 타이틀 -->
	<div id="classTitle">
		<h3>도덕</h3>
	</div>
	<!-- 일정 박스 -->
	<div class="container text-center">
		<div class="row">
				<div class="col-sm-4">
					<span id="scfont">마감 과제 일정</span>
				</div>
				<div class="col-sm-4">
					<span id="scfont">퀴즈 일정</span>
				</div>
				<div class="col-sm-4">
					<span id="scfont">기타 일정</span>
				</div>
		</div>
		<!-- 공지사항 출력 예시 박스 -->
		<div class="no-outbox">
			<div class="well">
			<i class="fas fa-ellipsis-v" style="margin-left: 540px;"></i>
			</div>
			<br> <br>
			<div class="well">
			<i class="fas fa-ellipsis-v" style="margin-left: 540px;"></i>
			</div>
			<br> <br>
			<div class="well">
			<i class="fas fa-ellipsis-v" style="margin-left: 540px;"></i>
			</div>
			<br> <br>
			<div class="well">
			<i class="fas fa-ellipsis-v" style="margin-left: 540px;"></i>
			</div>
		</div>
	</div>
</body>
</html>