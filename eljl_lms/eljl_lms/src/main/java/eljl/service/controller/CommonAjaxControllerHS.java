package eljl.service.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eljl.factory.bean.BoardCreateBeanHS;
import eljl.factory.bean.SubjectBean;
import eljl.lms.commonHS.MemberClass;

@RestController
@RequestMapping("/common")
public class CommonAjaxControllerHS {

	@Autowired
	MemberClass mc;
	
	//수업 게시글 출력
	@PostMapping("/allPostList")
	public List<BoardCreateBeanHS> allPostList(@RequestBody List<BoardCreateBeanHS> bcb) {
		return mc.allPostListCtl(bcb.get(0)); 
	}	
	
	// 개설 항목 가져오기
	@PostMapping("/getCategoryList")
	public List<BoardCreateBeanHS> getCategoryList(@RequestBody List<BoardCreateBeanHS> bcb) {
		return mc.getCategoryListCtl(bcb.get(0));
	
	}
	
	//기타 만들기
		@PostMapping("/createEtc")
		public Map<String, String> createEtc(@RequestBody List<BoardCreateBeanHS> bcb) {
			
			return mc.createEtcCtl(bcb.get(0)); 
		}
	
		
	//과제 만들기
		@PostMapping("/createTask")
		public Map<String, String> createTask(@RequestBody List<BoardCreateBeanHS> bcb) {
			
			return mc.createTaskCtl(bcb.get(0)); 
		}	
		
	//퀴즈 만들기
		@PostMapping("/createQuiz")
		public Map<String, String> createQuiz(@RequestBody List<BoardCreateBeanHS> bcb) {
			
			return mc.createQuizCtl(bcb.get(0)); 
		}	
		
}
	