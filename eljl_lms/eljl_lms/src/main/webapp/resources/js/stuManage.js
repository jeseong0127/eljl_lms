const main = new Vue({
  el: '#vue',
  data: {
	display:[{show:false},{show:false}]
    ,list:[] //the declared array
	,gradeList:[]
	,siList:[]
	,coList:[]
  },
	methods:{
		changepage:function(page){
			for(i=0; i<this.display.length; i++){
				this.display[i].show = false;
			}
			this.display[page].show = true;
		},
		getDetailsList:function(teId, csCode, opCode, stuId){
	 	 	let sendJsonData={teId:teId, csCode:csCode, opCode:opCode, stuId:stuId};
		  	let clientData = JSON.stringify(sendJsonData);
		 
	  		postAjax('teacher/selectGradeList',clientData,'getGradeListView','json');
			postAjax('teacher/selectSiList',clientData,'getSiListView','json');
			postAjax('teacher/selectCoList',clientData,'getCoListView','json');
		}
	}
});

function getGradeListView(jsonData){
	alert(jsonData);
	main.gradeList = jsonData;
}

function getSiListView(jsonData){
	alert(jsonData);
	main.siList = jsonData;
}

function getCoListView(jsonData){
	alert(jsonData);
	main.coList = jsonData;
}



function portal(value){
	let teId = document.getElementsByName("teId")[0];
	let csCode = document.getElementsByName("csCode")[0];
	let opCode = document.getElementsByName("opCode")[0];
	let mbType = document.getElementsByName("mbType")[0];		
	let f="";
	
  switch (value){
    case "1":
      f = makeForm('classStream','post');
      break;
    case "2":
      f = makeForm('rollBook','post');
      break;
    case "3":
      f = makeForm('lesson','post');
      break;
	case "4":
      f = makeForm('stuManage','post');
      break;
	case "5":
      f = makeForm('myPage','post');
      break;
    default:
      f = makeForm('main','post');
      break;
  }
	document.body.appendChild(f);
	
	if(mbType[0].checked == true){
		f.appendChild(mbType[0]);
	}else{
		f.appendChild(mbType[1]);
	}
	f.appendChild(teId);
	f.appendChild(csCode);	
	f.appendChild(opCode);
	
	f.submit();

  return answer;
}



function getAllStuList(){
	
	
	  let sendJsonData={teId:"20210913001T", csCode:"0005", opCode:"0000015"};
	  let clientData = JSON.stringify(sendJsonData);
	 
	  postAjax('teacher/allStuList',clientData,'getAllStuListView','json');
}

function getAllStuListView(jsonData){
	main.display[0].show = true;
	main.list = jsonData;
}

