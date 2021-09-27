package eljl.lms.teacher;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eljl.factory.bean.GradeBean;
import eljl.factory.bean.SubjectBean;
import eljl.factory.util.ProjectUtils;

@Service
public class TeacherSetting {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	ProjectUtils pu;
	
	// 이전 강좌 개설 내용 불러오기
	public List<SubjectBean> getSetting(SubjectBean sb) {
		
		List<SubjectBean> list;
		ArrayList<SubjectBean> result = new ArrayList<SubjectBean>();
		
		// 학과명
		list = session.selectList("getClass",sb);
		result.addAll(list);
		// 강좌명 , 시작날짜 , 종료날짜
		list = session.selectList("getSubject",sb);
		result.addAll(list);
		
		System.out.println(result);
		
		return result;
	}
	
	// 강좌 내용 수정하기
	public Map<String, String> updateSubject(SubjectBean sb) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("message", "강좌 변경을 실패하였습니다.");
		
		try {
			sb.setMbId((String)pu.getAttribute("mbId"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(this.convertData(session.update("updateSubject",sb))) {
			map.put("message", "강좌 변경을 성공하였습니다.");
		}
		
		return map;
	}
	
	// 이전 성적 관리 기준 내용 가져오기
	public List<GradeBean> getScoreStandard(SubjectBean sb) {
		
		List<GradeBean> list;
		
		list = session.selectList("getScoreStandard",sb);

		return list;
	}
	
	public boolean convertData(int data) {
		return (data > 0)? true:false;
	}

}
