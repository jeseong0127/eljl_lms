<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS</title>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, C and some padding */
    footer {
      background-color: #555;
      color: white;
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
  </style>

<link href='/resources/css/calendar.css' rel='stylesheet' />
<script type="text/javascript" src="resources/js/master.js"></script>
<script src='/resources/js/calendar.js'></script>

<script>
	  function getSchedule(){
		  
		  postAjax('getScheduleList',"teId=''",'sample','form');
	  }

	  function sample(jsonData){
		  for(i=0; i < jsonData.length; i++){
			  if(jsonData.length != null){
				  alert(jsonData[i].title + " " +moment(jsonData[i].startDate).format("YYYY-MM-DD") + " " + moment(jsonData[i].endDate).format("YYYY-MM-DD"));
			  }
		  }
	  }
	  	
      document.addEventListener('DOMContentLoaded', function() {

        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        		  
        locale : 'ko',
      
        eventSources: [{
    		events: function(info, successCallback, failureCallback) {
    			$.ajax({
    				url: 'getScheduleList',
    				type: 'POST',
    				dataType: 'json',
    				success: function(data) {
    					successCallback(data);
    				}
    			});
    		}
    	}]
        
        });
        calendar.render();
       
      });
       	  
</script>
<body onload="getSchedule()">

<nav class="navbar navbar-inverse">
  <div class="con	tainer-fluid">
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
        <li class="active"><a href="main">이러닝저러닝</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" onClick="logOut('${mbId}')"><span class="glyphicon glyphicon-log-in" > LogOut</span></a></li>
      </ul>
    </div>
  </div>
</nav>


<div id="calendar"></div>
</body>
</html>