package eljl.service.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import eljl.factory.bean.GradeBean;
import eljl.factory.bean.SubjectBean;
import eljl.lms.teacher.TeacherSetting;

@RestController
@RequestMapping("/teacher")
public class TeacherAjaxController {

	@Autowired
	TeacherSetting ts;
	
	//이전 개설 강좌 내용 가져오기
	@PostMapping("/getSetting")
	public List<SubjectBean> getSetting(@RequestBody List<SubjectBean> sb) {
		return ts.getSetting(sb.get(0));
	}
	
	//개설 강좌 내용 수정 하기
	@PostMapping("/updateSubject")
	public Map<String, String> updateSubject(@RequestBody List<SubjectBean> sb) {
		return ts.updateSubject(sb.get(0));
	}
	
	// 이전 성적 관리 기준 내용 가져오기
	@PostMapping("/getScoreStandard")
	public List<GradeBean> getScoreStandard(@RequestBody List<SubjectBean> sb) {
		return ts.getScoreStandard(sb.get(0));
	}
	
	
}
