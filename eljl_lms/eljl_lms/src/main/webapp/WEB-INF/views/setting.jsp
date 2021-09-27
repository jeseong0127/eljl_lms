<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://humy2833.dothome.co.kr/customizing.html#">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <style>
   a:hover {
       color:black;
    }
    
    #test : hover{
       color:black;
    }
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color: #375a7f;
     
    }
   
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
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
      .row.content {height:auto;} 
    }
    
    body {
  text-align: center;
  padding: 50px;
}

.button {
  display: inline-block;
  border : 1px solid #aec9f5; 
  background-color: #ffffff;
  text-transform: uppercase;
  color : #757575;
  padding: 20px 30px;
  border-radius: 5px;
  box-shadow: 0px 17px 10px -10px rgba(0, 0, 0, 0.4);
  cursor: pointer;
  -webkit-transition: all ease-in-out 300ms;
  transition: all ease-in-out 300ms;
  width : 300px;
  height : 150px;
  line-height:100px;
  font-weight : bold;
}

.button:hover {
  box-shadow: 0px 37px 20px -20px rgba(0, 0, 0, 0.2);
  -webkit-transform: translate(0px, -10px) scale(1.2);
          transform: translate(0px, -10px) scale(1.2);
    }
  </style>
  <script type="text/javascript" src="resources/js/master.js"></script>
  <script type="text/javascript" src="resources/js/main.js"></script>


	<script type="text/javascript" src="resources/js/master.js"></script>
    
    <script type="text/javascript">
    
    // 개설 강좌 정보 서버에 보내기
    function getSubject(){
    	let mbId = document.getElementsByName("mbId")[0];
    	let csCode = document.getElementsByName("csCode")[0];
    	let opCode = document.getElementsByName("opCode")[0];
    	
    	let sendJsonData = [];
   	  	sendJsonData.push({mbId:mbId.value,csCode:csCode.value,opCode:opCode.value});
   	  	let clientData = JSON.stringify(sendJsonData);
    	postAjax("teacher/getSetting",clientData,"addSubject","json")
    }
    
    // 개설 강좌 이전 내용 불러오기
    function addSubject(jsonData){
    	let csName = document.getElementById("csName");
    	let opName = document.getElementsByName("opName")[0];
    	let startDate = document.getElementsByName("startDate")[0];
    	let endDate = document.getElementsByName("endDate")[0];
    	
    	csName.innerText = jsonData[0].csName;
    	opName.value = jsonData[1].opName;
    	startDate.value = moment(jsonData[1].startDate).format('YYYY-MM-DD');
    	endDate.value = moment(jsonData[1].endDate).format('YYYY-MM-DD');
    }

    // 개설강좌 수정하기
    function updateSubject(){
    	let mbId = document.getElementsByName("mbId")[0];
    	let csCode = document.getElementsByName("csCode")[0];
    	let opCode = document.getElementsByName("opCode")[0];
    	let opName = document.getElementsByName("opName")[0];
    	let startDate = document.getElementsByName("startDate")[0];
    	let endDate = document.getElementsByName("endDate")[0];
    	
    	let sendJsonData = [];
   	  	sendJsonData.push({csCode:csCode.value,opCode:opCode.value,opName:opName.value,startDate:startDate.value,endDate:endDate.value});
   	  	let clientData = JSON.stringify(sendJsonData);
    	postAjax("teacher/updateSubject",clientData,"updateMsg","json")
    	
    }
    
    // 수정 -> 내용 + 알림
    function updateMsg(message){
    	alert(JSON.parse(JSON.stringify(message)).message);
    }
    
    
    // 이전 성적 관리 기준 수정 가져오기
    function getScoreStandard(){
    	let mbId = document.getElementsByName("mbId")[0];
    	let csCode = document.getElementsByName("csCode")[0];
    	let opCode = document.getElementsByName("opCode")[0];
    
    	let sendJsonData = [];
   	  	sendJsonData.push({mbId:mbId.value,csCode:csCode.value,opCode:opCode.value});
   	  	let clientData = JSON.stringify(sendJsonData);
    	postAjax("teacher/getScoreStandard",clientData,"addScoreStandard","json")
    }
    
    // 이전 성적 관리 기준 수정 출력
    function addScoreStandard(jsonData){
    	let div = document.getElementById("modalBox");
    	let text = "";
    	
    	div.innerHTML = "";
  
    	for(i=0; i < jsonData.length; i++){
    		if(jsonData[i].itemName == "과제"){
    			text = "과제";
    		}else if(jsonData[i].itemName == "퀴즈"){
    			text = "퀴즈";
    		}else if(jsonData[i].itemName == "출결"){
    			text = "출결";
    		}else{
    			text = "기타";
    		}
    		div.innerHTML += "<div id='Category'>";
    		div.innerHTML += "<select name ='category' onChange='addName(this.options[this.selectedIndex].value)'>"+"<option value='value='"+jsonData[i].itemCode.substring(0,1)+"'' selected disabled hidden>"+text+"</option>"+"<option value='T'>과제</option>"+"<option value='Q'>퀴즈</option>"+"<option value='A'>출결</option>"+"<option value='E'>기타</option>"+"</select>";
    		div.innerHTML += "<input type='text' name='addGrade' value='"+jsonData[i].itemPercent+"' />";
			if(jsonData[i].itemCode.substring(0,1) == "E"){
				div.innerHTML += "<div id='addName'> 이름 : <input name='nameBox' type='text' value='"+jsonData[i].itemName+"'/></div>";
    		}
    		div.innerHTML += "<input type='button' value='삭제' />";
    		div.innerHTML += "</div>";
    	}
    	
    }
    
    </script>


</head>
    
<body>
	
	<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid" style="display:flex;">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#" id="test">이러닝저러닝</a></li>
       </ul>
     </div>
     
     <div style="margin:0 auto;">
     <ul class="nav navbar-nav" >
        <li><a href="#" style="color:white;">스트림</a></li>
        <li><a href="#" style="color:white;">수업</a></li>
        <li><a href="#" style="color:white;">출석부</a></li>
        <li><a href="#" style="color:white;">학생관리</a></li>
        <li><a style="color:white;">설정</a></li>
      </ul>
     </div>
     <div>
      <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-cog" style="color:white;"></span></a></li>
        <li><a style="color:white;"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
      </ul>
    </div>
  </div>
</nav>
	
	<input type='hidden' name='mbId' value='20210911002T' />
	<input type='hidden' name='csCode' value='0011' />
	<input type='hidden' name='opCode' value='0000007' />	
	
	<div style="height:200px;">
	</div>
	
	<div style="magin:0 auto;">
		<div style="display: inline-block; margin-right:100px;">
			<div class="button" data-toggle="modal" data-target="#updateClass1" onClick="getSubject()">개설강좌 수정</div>
		</div>
		<div style="display: inline-block; margin-left:100px;">
		<div class="button" data-toggle="modal" data-target="#updateClass2" onClick="getScoreStandard()">성적 관리 기준 수정</div>
		</div>
	</div>

<%@ page import="java.util.*, java.text.*" %>
<% Date date = new Date(); 
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
String strdate = simpleDate.format(date);
%>

<!-- 클래스 생성 모달창 첫번째 -->
<div class="modal fade" id="updateClass1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" onClick="deleteValue()" >&times;</button>
          <h4 class="modal-title">개설강좌 수정</h4>
        </div>
        <div class="modal-body">
          <p>학과 명</p>
          	<div id="csName"></div><br>
           <p>강좌 명</p>
             <input type="text" name="opName">	
           <p>시작 날짜</p>
          	<input type="date" name="startDate" min="<%=strdate %>" >
            <p>종료 날짜</p>
          	<input type="date" name="endDate"  min="<%=strdate %>" onblur="endDateCheck()">
        </div>
        <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#createClass2" onClick="updateSubject()">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" onClick="deleteValue()">닫기</button>
        </div>
        
         
      
      </div>
      
    </div>
  </div>
  
<!-- 클래스 생성 모달창 두번째 -->
  <div style="overflow:scroll;" class="modal fade" id="updateClass2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">성적 관리 기준 수정</h4>
        </div>
        <div class="modal-body" id="modal-body">
          <p>성적관리<a onClick="addCategory()"><span class="glyphicon glyphicon-plus" ></span></a></p>
          <div id="modalBox">
          </div>
          
          
         
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onClick="createClass()">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" onClick="deleteValue()">닫기</button>
        </div>
        
          
        
      </div>
      
    </div>
  </div>
  
</body>
</html>