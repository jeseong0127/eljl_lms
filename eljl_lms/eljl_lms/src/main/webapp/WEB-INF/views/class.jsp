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
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
<script type="text/javascript" src="resources/js/master.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/class.js?var=1"></script>
<%-- <link rel="stylesheet" type=text/css href="resources/css/class.css"> --%>
</head>

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
				<li><a href="#" id="test" style="color: white;"><img
						src="resources/images/ELJL_LOGO2.png"
						style="height: 30px; width: 30px;" /></a></li>
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
						class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
			</ul>
		</div>
	</div>
</nav>


<header>
	<div class="container" style="padding-top: 60px"></div>
</header>
<body onload="allPostList()">
	<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
	%>

	<div class="row content">
		<div class="col-sm-1 text-left"></div>
		<div class="col-sm-10 text-left">
			<h1>
				수업리스트 <a data-toggle="modal" data-target="#scoreList"><span
					class="glyphicon glyphicon-plus" style="float: right"
					onClick="getCategoryList()"></span></a>
			</h1>
			
			<div id="allPostList" class="well well-lg"></div>
			<div>
				<!-- 성적기준 모달창 -->
				<div class="modal fade" id="scoreList" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">성적기준</h4>
							</div>
							<div class="modal-body">

								<div id="score"></div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				


				<!-- 기타 모달창 -->
				<div class="modal fade" id="createScoreE" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">기타</h4>
							</div>
							<div class="modal-body">
								<p>제목</p>
									<input type="text" name="etcTitle" style=width:80%; >
								<p>내용</p>
									<input type="text" name="etcContents" style="width:80%; height:300px;text-align=left; padding-top:5;">
								<p>파일</p>
									<input type="file" name="etcfile">
								<p>시작 날짜</p>
								<input type="date" name="etcSDate" min="<%=strdate%>">
								<p>종료 날짜</p>
								<input type="date" name="etcEDate" min="<%=strdate%>"
									onblur="endDateCheck()">
								<div class="modal-footer">
									<button type="button" class="btn btn-default" onClick="CreateEtc()">생성</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>

						</div>
					</div>
				</div>

				<!-- 퀴즈 모달창 -->
				<div class="modal fade" id="createScoreQ" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">퀴즈</h4>
							</div>
							<div class="modal-body">
								<p>제목</p>
									<input type="text" name="quizTitle">
								<p>질문</p>
									<input type="text" name="quizContents">
								<p>정답</p>
									<input type="text" name="quizAnswer">
								<p>시작 날짜</p>
								<input type="date" name="quizSDate" min="<%=strdate%>">
								<p>종료 날짜</p>
								<input type="date" name="quizEDate" min="<%=strdate%>"
									onblur="endDateCheck()">
								<div class="modal-footer">
									<button type="button" class="btn btn-default" onClick="CreateQuiz()">생성</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>

						</div>
					</div>
				</div>


				<!-- 과제 모달창 -->
				<div class="modal fade" id="createScoreT" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">과제</h4>
							</div>
							<div class="modal-body">
								<p>제목</p>
									<input type="text" name="taskTitle" style=width:80%; >
								<p>내용</p>
									<input type="text" name="taskContents" style="width:80%; height:300px;text-align=left; padding-top:5;">
								<p>파일</p>
									<input type="file" name="taskfile">
								<p>시작 날짜</p>
								<input type="date" name="taskSDate" min="<%=strdate%>">
								<p>종료 날짜</p>
								<input type="date" name="taskEDate" min="<%=strdate%>"
									onblur="endDateCheck()">
								<div class="modal-footer">
									<button type="button" class="btn btn-default" onClick="CreateTask()">생성</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 퀴즈 보기(선생) -->
				<div class="modal fade" id="viewQuizT" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">선생퀴즈</h4>
							</div>					
							<div class="modal-body">
							<div>제목</div>
								<div id="viewQuizTitleT"></div>
							<div>질문</div>
								<div id=viewQuizContentsT></div>
							<div>정답</div>		
								<div id="viewQuizAnswerT"></div>
							<div>기간</div><div>        
								<span id="viewQuizStartT"></span>
								 ~ 
								<span id="viewQuizEndT"></span>	
												</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-default">현황 보기</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 퀴즈 보기(학생) -->
				<div class="modal fade" id="viewQuizS" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">학생퀴즈</h4>
							</div>
							<div class="modal-body">
							<div>제목</div>
								<div id="viewQuizTitleS"></div>
							<div>질문</div>
								<div id=viewQuizContentsS></div>
							<div>정답</div>		
								<input type="text" id="viewQuizAnswerS">
							<div>기간</div><div>        
								<span id="viewQuizStartS"></span>
								 ~ 
								<span id="viewQuizEndS"></span>	
												</div>								
								<div class="modal-footer">
								<button type="button" class="btn btn-default">제출</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<!-- 과제 보기(선생) -->
				<div class="modal fade" id="viewTaskT" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">선생과제</h4>
							</div>
							<div class="modal-body">
							<div>제목</div>
								<div id="viewTaskTitleT"></div>
							<div>질문</div>
								<div id=viewTaskContentsT></div>
							<div>파일</div>		
								<div id="viewTaskAnswerT"></div>
							<div>기간</div><div>        
								<span id="viewTaskStartT"></span>
								 ~ 
								<span id="viewTaskEndT"></span>	
												</div>	
								<div class="modal-footer">
								<button type="button" class="btn btn-default">현황 보기</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 과제 보기(학생) -->
				<div class="modal fade" id="viewTaskS" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">학생과제</h4>
							</div>
							<div class="modal-body">
							<div>제목</div>
								<div id="viewTaskTitleS"></div>
							<div>질문</div>
								<div id=viewTaskContentsS></div>
							<div>파일</div>		
								<div id="viewTaskAnswerS"></div>
							<div>파일 제출</div>		
								<input type ="file" id="viewTaskAnswerS"></div>
							<div>기간</div><div>        
								<span id="viewTaskStartS"></span>
								 ~ 
								<span id="viewTaskEndS"></span>	
												</div>											
								<div class="modal-footer">
								<button type="button" class="btn btn-default">제출</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 기타 보기(선생) -->
				<div class="modal fade" id="viewETCT" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">선생기타</h4>
							</div>
							<div class="modal-body">
							<div>제목</div>
								<div id="viewETCTitleT"></div>
							<div>질문</div>
								<div id=viewETCContentsT></div>
							<div>파일</div>		
								<div id="viewETCAnswerT"></div>
							<div>기간</div><div>        
								<span id="viewETCStartT"></span>
								 ~ 
								<span id="viewETCEndT"></span>	
												</div>		
								<div class="modal-footer">
								<button type="button" class="btn btn-default">현황 보기</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 기타 보기(학생) -->
				<div class="modal fade" id="viewETCS" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">학생기타</h4>
							</div>
							<div class="modal-body">
							<div>제목</div>
								<div id="viewETCTitleS"></div>
							<div>질문</div>
								<div id=viewETCContentsS></div>
							<div>파일</div>		
								<div id="viewETCAnswerS"></div>
							<div>파일 제출</div>		
								<input type ="file" id="viewETCAnswerS"></div>
							<div>기간</div><div>        
								<span id="viewETCStartS"></span>
								 ~ 
								<span id="viewETCEndS"></span>	
												</div>			
								<div class="modal-footer">
								<button type="button" class="btn btn-default">제출</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 수정 삭제 보기(선생) -->
				<div class="modal fade" id="viewPostBoxT" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">수정&삭제</h4>
							</div>
							<div class="modal-body">
								<div id="updatePostBox"></div>
								<div id="deletePostBox"></div>
												</div>			
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 과제 수정 -->
				<div class="modal fade" id="updateTask" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onClick="deleteScoreValue()">&times;</button>
								<h4 class="modal-title">과제수정</h4>
							</div>
							<div class="modal-body">
							<div>제목</div>
								<div id="updateTaskTitle"></div>
							<div>질문</div>
								<div id=updateTaskContents></div>
							<div>파일</div>		
								<div id="updateTaskAnswer"></div>
							<div>기간</div><div>        
								<span id="updateTaskStart"></span>
								 ~ 
								<span id="updateTaskEnd"></span>	
												</div>	
								<div class="modal-footer">
								<button type="button" class="btn btn-default">수정</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onClick="deleteScoreValue()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
			</div>
		</div>
	</div>

</body>
</html>