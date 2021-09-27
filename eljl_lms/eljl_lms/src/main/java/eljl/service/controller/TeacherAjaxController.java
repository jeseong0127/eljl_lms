package eljl.service.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eljl.factory.bean.JunseoBean;
import eljl.factory.bean.StuManageBean;
import eljl.lms.teacher.TeacherStumanage;

@RestController
@RequestMapping("/teacher")
public class TeacherAjaxController {

	@Autowired
	TeacherStumanage ts;
	
	//전체 학생 리스트 불러오기
	@PostMapping("/allStuList")
	public List<JunseoBean> allStuList(@RequestBody StuManageBean smb) {
		return ts.allStuListCtl(smb); 
	}
	@PostMapping("/selectGradeList")
	public List<JunseoBean> selectGradeList(@RequestBody StuManageBean smb) {
		System.out.println("성적:  "+ts.selectGradeListCtl(smb));
		return ts.selectGradeListCtl(smb); 
	}
	
	@PostMapping("/selectSiList")
	public List<JunseoBean> selectSiList(@RequestBody StuManageBean smb) {
		System.out.println("출결:  "+ts.selectSiListCtl(smb));
		return ts.selectSiListCtl(smb); 
	}
	
	@PostMapping("/selectCoList")
	public List<JunseoBean> selectCoList(@RequestBody StuManageBean smb) {
		System.out.println("상담일지:  "+ts.selectCoListCtl(smb));
		return ts.selectCoListCtl(smb); 
	}
	
}
