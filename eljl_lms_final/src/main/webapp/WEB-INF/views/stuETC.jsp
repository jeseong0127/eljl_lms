<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="java.util.*, java.text.*"%>
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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="resources/css/master.css">
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

#hbox{
	text-align: center;
}

#ETCStuList{
	vertical-align: middle;
}

.hbbox{
	vertical-align: baseline;
	text-decoration: underline;
	font-size: 20px;
}

h1{

   text-align: center;
   font-family: 'Gowun Dodum', sans-serif;
   margin-top: 50px;
   margin-bottom: 40px;
   margin-left: 30px;
   text-shadow: 1px 1px 1px gray;
   font-family: 'Gowun Dodum', sans-serif;
   font-size: 50px;
}

*{
   font-family: 'Gowun Dodum', sans-serif;
}

#bannerBox>ul {
	margin-top: 5px;
}

#bannerBox2>ul {
	margin-top: 5px;
}
</style>
<script type="text/javascript" src="resources/js/master.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/class.js?var=1"></script>
</head>

<nav  class="navbar navbar-inverse navbar-fixed-top">
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
				<li><a href="main" id="test" style="color: white;"><img
						src="resources/images/eljl_LOGO_final.png"
						style="height: 30px; width: 100px;" /></a></li>
			</ul>
		</div>

		<div id= "bannerBox" style="margin: 0 auto;">
			<ul class="nav navbar-nav">
				<li><a style="color: white;" onClick="moveStream()">?????????</a></li>
					<li><a  style="color: white;" onClick="moveClass()">??????</a></li>
					<li class="teItem"><a  style="color: white;" onClick="moveAttend()">?????????</a></li>
					<li class="teItem"><a  style="color: white;" onClick="moveStuManage()">????????????</a></li>
					<li class="stuItem"><a  style="color: white;" onClick="moveMyPage()">???????????????</a></li>
			</ul>
		</div>
		<div id="bannerBox2">
			<ul class="nav navbar-nav navbar-right">
				<li class="teItem"><a onClick="moveSetting()"><span class="glyphicon glyphicon-cog"
						style="color: white;"></span></a></li>
				<li><a style="color: white;" onClick="logOut('${mbId}')"><span
						class="glyphicon glyphicon-log-out"></span> ????????????</a></li>
			</ul>
		</div>
	</div>
</nav>


<header>
	<div class="container" style="padding-top: 60px"></div>
</header>
<body onload="mbTypeCheck('${mbType}'); viewAllETC(); selectStuETC();">
	<input type='hidden' name='mbId' value='${mbId}' />
	<input type='hidden' name='csCode' value='${csCode}' />
	<input type='hidden' name='opCode' value='${opCode}' />
	<input type='hidden' name='ssCode' value='${ssCode}' />
	<input type='hidden' name='numCode' value='${numCode}' />
	<input type='hidden' name='opName' value='${opName}' />
	
	<table  class="table table-hover">
	               	<h1>?????? ?????? ??????</h1>
               <thead>
                  <tr>
                     <th scope="col">??????</th>
                     <th scope="col">??????</th>
                  </tr>
               </thead>
               <tbody id="ETCStuList">
                  
               </tbody>
            </table>

</body>
</html>
