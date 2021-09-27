<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>LMS</title>
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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
</style>

</head>
<body onLoad="getAllStuList()">
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
					<li><a onClick="portal(main)" id="test" style="color: white;"><img
							src="resources/images/ELJL_LOGO2.png"
							style="height: 30px; width: 30px;" /></a></li>
				</ul>
			</div>

			<div style="margin: 0 auto;">
				<ul class="nav navbar-nav">
					<li><a onClick="portal(1)" style="color: white;">스트림</a></li>
					<li><a onClick="portal(2)" style="color: white;">수업</a></li>
					<li><a onClick="portal(3)" style="color: white;">출석부</a></li>
					<li><a onClick="portal(4)" class="active"
						style="color: white;">학생관리</a></li>
					<li><a onClick="portal(5)" style="color: white;">설정</a></li>
				</ul>
			</div>
			<div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-cog"
							style="color: white;"></span></a></li>
					<li><a style="color: white;"><span
							class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 테이블 -->
	<div style="height: 60px;"></div>
	<div id="vue" class="container">
		<div class="row">
			<h2>학생관리</h2>
			<div class="col-lg-2">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">학생리스트</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="name in list">
							<td
								@click="getDetailsList(name.teId , name.csCode , name.opCode , name.stuId)">{{name.stuName}}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-lg-1"></div>
			<div id="displayon" class="col-lg-9" style="display: block;">
				<table v-if="display[0].show" class="table table-hover">
					<thead>
						<tr>
							<th scope="col">순번</th>
							<th scope="col">성적</th>
							<th scope="col">결석 횟수</th>
							<th scope="col">상담일지</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(manages, index) in list">
							<th scope="row">{{index + 1}}</th>
							<td>{{manages.allGrade}}</td>
							<td>{{manages.absence}}</td>
							<td>{{manages.coCount}}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="displayoff" style="display: none;">
				<!-- 성적목록 -->
				<div style="display: none;">
					<table v-if="display[1].show" class="table table-hover">
						<thead>
							<h4>성적 목록</h4>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">과제</th>
								<th scope="col">제출물</th>
								<th scope="col">성적</th>
								<th scope="col">제출날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(grade, index) in gradeList">
								<th scope="row">{{index + 1}}</th>
								<td>{{grade.sjTitle}}</td>
								<td>{{grade.stuTitle}}</td>
								<td>{{grade.allGrade}}</td>
								<td>{{grade.createDate}}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 출결 목록 -->
				<div style="display: none;">
					<table v-if="display[1].show" class="table table-hover">
						<thead>
							<h4>출결 목록</h4>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">날짜</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(sign, index) in siList">
								<th scope="row">{{index + 1}}</th>
								<td>{{sign.createDate}}</td>
								<td>{{sign.status}}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 상담일지 목록 -->
				<div style="display: none;">
					<table v-if="display[1].show" class="table table-hover">
						<thead>
							<h4>상담일지 목록</h4>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">상담일지</th>
								<th scope="col">상담날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(counSeling, index) in coList">
								<th scope="row">{{index + 1}}</th>
								<td>{{counSeling.sjTitle}}</td>
								<td>{{counSeling.createDate}}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/master.js"></script>
	<script type="text/javascript" src="resources/js/stuManage.js"></script>
	<script type="text/javascript" src="resources/vue/vue.js"></script>


</body>

</html>

