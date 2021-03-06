<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>LMS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
  <script type="text/javascript" src="resources/js/master.js"></script>
  <script type="text/javascript" src="resources/js/main.js"></script>
</head>
<body onload="getList()">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
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
        <li class="active"><a href="#">??????????????????</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <p><span class="glyphicon glyphicon-plus-sign"><span class="caret"></span></span></p> </a>
            <ul class="dropdown-menu">
              <li><a data-toggle="modal" data-target="#createClass1"><span class="glyphicon glyphicon-plus" > Class</span></a></li> 
              
              <li onClick="deleteClassList()"><a data-toggle="modal" data-target="#deleteClass"><span class="glyphicon glyphicon-trash" > Delete</span></a></li>                        
           </ul>
       </li>
        <li><a href="#">Calender</a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-1 text-left"> </div>
    <div class="col-sm-10 text-left"> 
      <h1>??? ????????? ??????</h1>
      <div id="myClass" class="well well-lg">??? ?????????</div>
      <hr>
      <h1>?????? ????????? ??????</h1>
      <div class="well well-lg">?????? ?????????</div>
    </div>
    
    </div>
  </div>
</div>
<!-- ????????? ?????? ????????? ????????? -->
<div class="modal fade" id="createClass1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">????????? ??????(1/2) </h4>
        </div>
        <div class="modal-body">
          <p>????????? ?????????</p>
          	<input type="text" name="title">
           <p>?????? ???</p>
             <input type="text" name="csName">	
           <p>?????? ??????</p>
          	<input type="date" name="startDate">
            <p>?????? ??????</p>
          	<input type="date" name="endDate">
        </div>
        <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#createClass2" onClick="">??????</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" onClick="deleteValue()">??????</button>
        </div>
        
         
      
      </div>
      
    </div>
  </div>
  <!-- ????????? ?????? ????????? ????????? -->
  <div style="overflow:scroll;" class="modal fade" id="createClass2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">????????? ??????(2/2) </h4>
        </div>
        <div class="modal-body" id="modal-body">
          <p>????????? ?????????<a onClick="addCategory()"><span class="glyphicon glyphicon-plus" ></span></a></p>
          
          	<div id="box">
          	<select name="category" onChange="addName(this.options[this.selectedIndex].value,'')">
          		<option value="T">??????</option>
          		<option value="Q">??????</option>
          		<option value="A">??????</option>
          		<option value="E">??????</option>
          	</select>
          	
           	<input type="text" name="addGrade"/>
           		<div id="addName">
           		</div>
        	</div>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#createClass1" >??????</button>
          <button type="button" class="btn btn-default" onClick="createClass()">??????</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" onClick="deleteValue()">??????</button>
        </div>
        
          
        
      </div>
      
    </div>
  </div>
  
 <!-- ?????? ????????? -->
  <div class="modal fade" id="deleteClass" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">????????? ?????? </h4>
        </div>
        <div class="modal-body">
        
          	<table class="table table-striped">
		    <thead>
		      <tr>
		        <th>????????? ????????? ??????</th>
		        <th>??????</th>
		      </tr>
		    </thead>
		    <tbody id="deleteClassBox">
		
		    </tbody>
		    </table>
            
            
        </div>
        <div class="modal-footer">
        
          <button type="button" class="btn btn-default" data-dismiss="modal" onClick="deleteValue()">??????</button>
        </div>
        
         
      
      </div>
      
    </div>
  </div>  
</body>
</html>