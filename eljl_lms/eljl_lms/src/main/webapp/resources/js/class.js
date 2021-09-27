

let classcount =0;
function count2(index){
	classcount = index-1;
}


//수업페이지 가져오기
function getClassForm () {
	
	let tCode = makeInput("hidden", "tCode", '20210913001T');
	let csCode = makeInput("hidden", "csCode", '0005');
	let opCode = makeInput("hidden", "opCode", '0000003');
	let mbType= makeInput("hidden", "mbType", 'T');

	/*
	let tCode = document.getElementsByName("tCode")[0];
	let csCode = document.getElementsByName("csCode")[0];
	let opCode = document.getElementsByName("opCode")[0];
	let mbType = document.getElementsByName("mbtype")[0];
	 */
	let f = makeForm('memberClass', 'post');
	document.body.appendChild(f);
	
	f.appendChild(tCode);
	f.appendChild(csCode);
	f.appendChild(opCode);
	f.appendChild(mbType);
	
	f.submit();
}
//개설 항목 가져오기
function getCategoryList () {
	let tCode = makeInput("hidden", "tCode", '20210913001T');
	let csCode = makeInput("hidden", "csCode", '0005');
	let opCode = makeInput("hidden", "opCode", '0000015');
	
	let sendJsonData = [];
	sendJsonData.push({mbId:tCode.value, csCode:csCode.value, opCode:opCode.value});
	let clientData = JSON.stringify(sendJsonData);
	
	postAjax('common/getCategoryList',clientData, 'getCategoryListView', 'json');

}

function getCategoryListView(jsonData) {
	let score = document.getElementById("score");
	score.innerHTML="";

	for(i=0; i < jsonData.length; i++) {
		if(jsonData[i].ssCode.substring(0,1) !== 'A') {
			if (jsonData[i].ssCode.substring(0,1)=="E") {
			score.innerHTML += `<div data-toggle="modal" data-target="#createScoreE" onClick="count2(`+i+`)">` + jsonData[i].ssName + `</div>`;
			score.innerHTML += "<input type='hidden' name='ssCode', value='" +jsonData[i].ssCode + "' />";	
			}else if (jsonData[i].ssCode.substring(0,1)=="Q") {
			score.innerHTML += `<div data-toggle="modal" data-target="#createScoreQ" onClick="count2(`+i+`)">` + jsonData[i].ssName + `</div>`;
			score.innerHTML += `<input type='hidden' name='ssCode', value=` +jsonData[i].ssCode +  ` />`;	
			}else if (jsonData[i].ssCode.substring(0,1)=="T") {
			score.innerHTML += `<div data-toggle="modal" data-target="#createScoreT"  onClick="count2(`+i+`)">` + jsonData[i].ssName + `</div>`;
			score.innerHTML += "<input type='hidden' name='ssCode', value='" +jsonData[i].ssCode + "' />";	
			}
		}
	}
}

function CreateEtc () {
		let tCode = makeInput("hidden", "tCode", '20210913001T');
		let csCode = makeInput("hidden", "csCode", '0005');
		let opCode = makeInput("hidden", "opCode", '0000015');
		let ssCode = document.getElementsByName("ssCode")[classcount];
		let title = document.getElementsByName("etcTitle")[0];		
		let contents = document.getElementsByName("etcContents")[0];
		let file = document.getElementsByName("etcFile")[0];
		let startDate = document.getElementsByName("etcSDate")[0];
		let endDate = document.getElementsByName("etcEDate")[0];

		let sendJsonData = [];
		if(title.value == ""){
			alert('제목을 입력해주세요');
		}else if(contents.value == ""){
			alert('내용을 입력해주세요');	
		}else if (startDate ==""){
			alert('날짜를 입력해주세요');
		}else if (endDate ==""){
			alert('날짜를 입력해주세요');
		}else {
			sendJsonData.push({mbId:tCode.value, csCode:csCode.value, ssCode:ssCode.value, opCode:opCode.value, title:title.value, contents:contents.value, mbFile:file, startDate:startDate.value, endDate:endDate.value})
			let clientData =JSON.stringify(sendJsonData)
			postAjax('common/createEtc', clientData, 'sendMsg', 'json');
		/* $('#id이름').click(function(){
$.ajax({
      type: "POST",
      url : common/createEtc ,// 서블릿 url 적기 ,
      enctype: 'multipart/form-data',
      processData: false,
        contentType: false,
      data: "mbId=tCode.value",//보내는데이터(formdata 형식으로 ex)"mbId="mbId.value ) ,
      dataType: //받는 데이터 형식 , 
      success: function(result){
         //작업이 성공적으로 발생했을 경우
      },
      error:function(){  
                     //에러가 났을 경우 실행시킬 코드
      }
   });
});
		*/
		}
}
		
		
function CreateTask () {
	let tCode = makeInput("hidden", "tCode", '20210913001T');
	let csCode = makeInput("hidden", "csCode", '0005');
	let opCode = makeInput("hidden", "opCode", '0000015');
	let ssCode = document.getElementsByName("ssCode")[classcount];
	let title = document.getElementsByName("taskTitle")[0];		
	let contents = document.getElementsByName("taskContents")[0];
	let file = document.getElementsByName("taskFile")[0];
	let startDate = document.getElementsByName("taskSDate")[0];
	let endDate = document.getElementsByName("taskEDate")[0];

		let sendJsonData = [];
		if(title.value == ""){
			alert('제목을 입력해주세요');
		}else if(contents.value == ""){
			alert('내용을 입력해주세요');	
		}else if (startDate ==""){
			alert('날짜를 입력해주세요');
		}else if (endDate ==""){
			alert('날짜를 입력해주세요');
		}else {
			sendJsonData.push({mbId:tCode.value, csCode:csCode.value, ssCode:ssCode.value, opCode:opCode.value, title:title.value, contents:contents.value, mbFile:file, startDate:startDate.value, endDate:endDate.value})
			let clientData =JSON.stringify(sendJsonData)
			postAjax('common/createTask', clientData, 'sendMsg', 'json');
		}	
	}
	
	
	function CreateQuiz () {
	let tCode = makeInput("hidden", "tCode", '20210913001T');
	let csCode = makeInput("hidden", "csCode", '0005');
	let opCode = makeInput("hidden", "opCode", '0000015');
	let ssCode = document.getElementsByName("ssCode")[classcount];
	let title = document.getElementsByName("quizTitle")[0];		
	let contents = document.getElementsByName("quizContents")[0];
	let answer = document.getElementsByName("quizAnswer")[0];
	let startDate = document.getElementsByName("quizSDate")[0];
	let endDate = document.getElementsByName("quizEDate")[0];

		let sendJsonData = [];
		if(title.value == ""){
			alert('제목을 입력해주세요');
		}else if(contents.value == ""){
			alert('내용을 입력해주세요');	
		}else if(answer.value =="") {
			alert('정답을 입력해주세요')
		}else if (startDate ==""){
			alert('날짜를 입력해주세요');
		}else if (endDate ==""){
			alert('날짜를 입력해주세요');
		}else {
			sendJsonData.push({mbId:tCode.value, csCode:csCode.value, ssCode:ssCode.value, opCode:opCode.value, title:title.value, contents:contents.value, answer:answer.value, startDate:startDate.value, endDate:endDate.value})
			let clientData =JSON.stringify(sendJsonData)
			postAjax('common/createQuiz', clientData, 'sendMsg', 'json');
		}	
		
		
		
	}

//개설 성적 기준 리스트 가져오기
function allPostList() {
	let mbId = makeInput("hidden", "mbId", '20210913001T');
	let csCode = makeInput("hidden", "csCode", '0005');
	let opCode = makeInput("hidden", "opCode", '0000015');
	let mbType = makeInput("hidden", "mbType", 'T');
	let sendJsonData = [];
	sendJsonData.push({mbId:mbId.value, csCode:csCode.value, opCode:opCode.value, mbType:mbType.value});
	let clientData = JSON.stringify(sendJsonData);
	 
	  postAjax('common/allPostList',clientData,'allPostListView','json');
	
}

//개설 성적 기준 리스트 출력
function allPostListView(jsonData) {
	let mbType = makeInput("hidden", "mbType", 'T');
	let allPostList = document.getElementById("allPostList");
	allPostList.innerHTML ="";
	for(i=0; i<jsonData.length; i++) {
		console.log(jsonData[i].ssCode)
		if(jsonData[i].ssCode.substring(0,1)=="Q") {
			// mbType 값을 유동적으로 받아서 전달해야함
			if(mbType.value =="T") {
				allPostList.innerHTML += "<div>" + "<div onClick='viewQuizT("+i+") 'data-toggle='modal' data-target='#viewQuizT' style='display:inline-block'>"  + jsonData[i].title + "</div>" + "<span name='postBox' onClick='makePostBox("+i+")' data-toggle='modal' data-target='#viewPostBoxT' style='display:inline-block; float:right;'>" + "퀴즈수정" + "</span>" + "</div>"
				}else {allPostList.innerHTML += "<div onClick='viewQuizS("+i+")' data-toggle='modal' data-target='#viewQuizS' >"  + jsonData[i].title + "</div>"
			}
			
		}else if(jsonData[i].ssCode.substring(0,1)=="T"){
			if(mbType.value =="T") {
				allPostList.innerHTML += "<div>" + "<div onClick='viewTaskT("+i+")'data-toggle='modal' data-target='#viewTaskT' style='display:inline-block' >"+ jsonData[i].title + "</div>" + "<span name='postBox' onClick='makePostBox("+i+")' data-toggle='modal' data-target='#viewPostBoxT' style='display:inline-block; float:right;'>" + "과제수정" + "</span>" + "</div>"
				}else {allPostList.innerHTML += "<div onClick='viewTaskS("+i+")'data-toggle='modal' data-target='#viewTaskS' >"+ jsonData[i].title + "</div>"
			}
			
		}else if(jsonData[i].ssCode.substring(0,1)=="E"){
			if(mbType.value =="T") {
				allPostList.innerHTML += "<div>" + "<div onClick='viewETCT("+i+")'data-toggle='modal' data-target='#viewETCT' style='display:inline-block'>"+ jsonData[i].title + "</div>" + "<span name='postBox' onClick='makePostBox("+i+")' data-toggle='modal' data-target='#viewPostBoxT' style='display:inline-block; float:right;'>" + "기타수정" + "</span>" + "</div>"
				}else {allPostList.innerHTML += "<div onClick='viewETCS("+i+")'data-toggle='modal' data-target='#viewETCS'>"+ jsonData[i].title + "</div>"
			}
		}
		allPostList.innerHTML += "<input type = 'hidden' name = 'numCode' value = '" +jsonData[i].numCode+ "'/>"
		allPostList.innerHTML += "<input type = 'hidden' name = 'ssCode' value = '" + jsonData[i].ssCode + "'/>"
		allPostList.innerHTML += "<input type = 'hidden' name = 'title' value = '" + jsonData[i].title + "'/>"
		allPostList.innerHTML += "<input type = 'hidden' name = 'answer' value = '" + jsonData[i].answer + "'/>"
		allPostList.innerHTML += "<input type = 'hidden' name = 'contents' value = '"+ jsonData[i].contents+"'/>"
		allPostList.innerHTML += "<input type = 'hidden' name = 'startDate' value = '"+ jsonData[i].startDate+"'/>"
		allPostList.innerHTML += "<input type = 'hidden' name = 'endDate' value = '"+ jsonData[i].endDate+"'/>"
	}
}
//선생 퀴즈 보기
function viewQuizT(i) {
	  let title = document.getElementsByName("title")[i];
	  let contents = document.getElementsByName("contents")[i];	
	  let answer = document.getElementsByName("answer")[i];	
	  let startDate = document.getElementsByName("startDate")[i];	
	  let endDate = document.getElementsByName("endDate")[i];	
	  let viewQuizTitleT = document.getElementById("viewQuizTitleT");
	  let viewQuizContentsT = document.getElementById("viewQuizContentsT");
	  let viewQuizAnswerT = document.getElementById("viewQuizAnswerT");
	  let viewQuizStartT = document.getElementById("viewQuizStartT");
	  let viewQuizEndT = document.getElementById("viewQuizEndT");
     
viewQuizTitleT.innerText = title.value;
viewQuizContentsT.innerText = contents.value;
viewQuizAnswerT.innerText = answer.value;
viewQuizStartT.innerText = moment(startDate.value).format('YYYY-MM-DD');
viewQuizEndT.innerText = moment(endDate.value).format('YYYY-MM-DD');
	  
}

//학생 퀴즈 보기
function viewQuizS(i) {
	  let title = document.getElementsByName("title")[i];
	  let contents = document.getElementsByName("contents")[i];	
	  let answer = document.getElementsByName("answer")[i];	
	  let startDate = document.getElementsByName("startDate")[i];	
	  let endDate = document.getElementsByName("endDate")[i];	
	  let viewQuizTitleS = document.getElementById("viewQuizTitleS");
	  let viewQuizContentsS = document.getElementById("viewQuizContentsS");
	  let viewQuizAnswerS = document.getElementById("viewQuizAnswerS");
	  let viewQuizStartS = document.getElementById("viewQuizStartS");
	  let viewQuizEndS = document.getElementById("viewQuizEndS");
     
viewQuizTitleS.innerText = title.value;
viewQuizContentsS.innerText = contents.value;
viewQuizAnswerS.innerText = answer.value;
viewQuizStartS.innerText = moment(startDate.value).format('YYYY-MM-DD');
viewQuizEndS.innerText = moment(endDate.value).format('YYYY-MM-DD');
	  
}

//선생 과제 보기
function viewTaskT(i) {
	  let title = document.getElementsByName("title")[i];
	  let contents = document.getElementsByName("contents")[i];	
	  let answer = document.getElementsByName("answer")[i];	
	  let startDate = document.getElementsByName("startDate")[i];	
	  let endDate = document.getElementsByName("endDate")[i];	
	  let viewTaskTitleT = document.getElementById("viewTaskTitleT");
	  let viewTaskContentsT = document.getElementById("viewTaskContentsT");
	  let viewTaskAnswerT = document.getElementById("viewTaskAnswerT");
	  let viewTaskStartT = document.getElementById("viewTaskStartT");
	  let viewTaskEndT = document.getElementById("viewTaskEndT");
     
viewTaskTitleT.innerText = title.value;
viewTaskContentsT.innerText = contents.value;
viewTaskAnswerT.innerText = answer.value;
viewTaskStartT.innerText = moment(startDate.value).format('YYYY-MM-DD');
viewTaskEndT.innerText = moment(endDate.value).format('YYYY-MM-DD');
	}

//학생 과제 보기
function viewTaskS(i) {
	  let title = document.getElementsByName("title")[i];
	  let contents = document.getElementsByName("contents")[i];	
	  let answer = document.getElementsByName("answer")[i];	
	  let startDate = document.getElementsByName("startDate")[i];	
	  let endDate = document.getElementsByName("endDate")[i];	
	  let viewTaskTitleS = document.getElementById("viewTaskTitleS");
	  let viewTaskContentsS = document.getElementById("viewTaskContentsS");
	  let viewTaskAnswerS = document.getElementById("viewTaskAnswerS");
	  let viewTaskStartS = document.getElementById("viewTaskStartS");
	  let viewTaskEndS = document.getElementById("viewTaskEndS");
     
viewTaskTitleS.innerText = title.value;
viewTaskContentsS.innerText = contents.value;
viewTaskAnswerS.innerText = answer.value;
viewTaskStartS.innerText = moment(startDate.value).format('YYYY-MM-DD');
viewTaskEndS.innerText = moment(endDate.value).format('YYYY-MM-DD');
	}	


//선생 기타 보기
function viewETCT(i) {
	  let title = document.getElementsByName("title")[i];
	  let contents = document.getElementsByName("contents")[i];	
	  let answer = document.getElementsByName("answer")[i];	
	  let startDate = document.getElementsByName("startDate")[i];	
	  let endDate = document.getElementsByName("endDate")[i];	
	  let viewETCTitleT = document.getElementById("viewETCTitleT");
	  let viewETCContentsT = document.getElementById("viewETCContentsT");
	  let viewETCAnswerT = document.getElementById("viewETCAnswerT");
	  let viewETCStartT = document.getElementById("viewETCStartT");
	  let viewETCEndT = document.getElementById("viewETCEndT");
     
viewETCTitleT.innerText = title.value;
viewETCContentsT.innerText = contents.value;
viewETCAnswerT.innerText = answer.value;
viewETCStartT.innerText = moment(startDate.value).format('YYYY-MM-DD');
viewETCEndT.innerText = moment(endDate.value).format('YYYY-MM-DD');
	
	}
	
	
//학생 기타 보기
function viewETCS(i) {
	  let title = document.getElementsByName("title")[i];
	  let contents = document.getElementsByName("contents")[i];	
	  let answer = document.getElementsByName("answer")[i];	
	  let startDate = document.getElementsByName("startDate")[i];	
	  let endDate = document.getElementsByName("endDate")[i];	
	  let viewETCTitleS = document.getElementById("viewETCTitleS");
	  let viewETCContentsS = document.getElementById("viewETCContentsS");
	  let viewETCAnswerS = document.getElementById("viewETCAnswerS");
	  let viewETCStartS = document.getElementById("viewETCStartS");
	  let viewETCEndS = document.getElementById("viewETCEndS");
     
viewETCTitleS.innerText = title.value;
viewETCContentsS.innerText = contents.value;
viewETCAnswerS.innerText = answer.value;
viewETCStartS.innerText = moment(startDate.value).format('YYYY-MM-DD');
viewETCEndS.innerText = moment(endDate.value).format('YYYY-MM-DD');
	
	}
	
function makePostBox (i) {
	let updatePostBox = document.getElementById("updatePostBox");
	let deletePostBox = document.getElementById("deletePostBox");
	
	updatePostBox.innerHTML = "";
	deletePostBox.innerHTML = "";
	updatePostBox.innerHTML += `<div onClick="updateSS(` + i + `)" data-toggle='modal' data-target='#updateTask'>수정</div>`;
	deletePostBox.innerHTML += `<div onClick="deleteSS(` + i + `)">삭제</div>`;

}

function updateSS (i) {
	  let title = document.getElementsByName("title")[i];
	  let contents = document.getElementsByName("contents")[i];	
	  let answer = document.getElementsByName("answer")[i];	
	  let startDate = document.getElementsByName("startDate")[i];
	  let endDate = document.getElementsByName("endDate")[i];	
	  let updateTaskTitle = document.getElementById("updateTaskTitle");
	  let updateTaskContents = document.getElementById("updateTaskContents");
	  let updateTaskAnswer = document.getElementById("updateTaskAnswer");
	  let updateTaskStart = document.getElementById("updateTaskStart");
	  let updateTaskEnd = document.getElementById("updateTaskEnd");
     
updateTaskTitle.innerHTML = `<input type="text" value="${title.value}">`;
updateTaskContents.innerHTML = `<input type="text" value="${contents.value}">`;
updateTaskAnswer.innerHTML = `<input type="text" value="${answer.value}">`;
updateTaskStart.innerHTML = `<input type="text" value="${moment(startDate.value).format('YYYY-MM-DD')}">`;
updateTaskEnd.innerHTML = `<input type="text" value="${moment(endDate.value).format('YYYY-MM-DD')}">`;
	
}