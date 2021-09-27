package eljl.lms.teacher;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import eljl.factory.bean.JunseoBean;
import eljl.factory.bean.StuManageBean;
import eljl.factory.bean.SubjectBean;
import eljl.factory.util.Encryption;
import eljl.factory.util.ProjectUtils;

@Service
public class TeacherStumanage {

	@Autowired
	SqlSessionTemplate session;

	ModelAndView mav;

	@Autowired
	Encryption enc;

	@Autowired
	Gson gson;

	@Autowired
	ProjectUtils pu;

	public List<JunseoBean> allStuListCtl(StuManageBean smb) {
		List<JunseoBean> list;
		//전체 학생 리스트, 성적평균, 결석횟수, 상담횟수 select
		list = session.selectList("getAllStudentList", smb);


		return list;
	}
	// 성적 목록 가져오기
	public List<JunseoBean> selectGradeListCtl(StuManageBean smb) {
		//List<JunseoBean> list;
		//ArrayList<JunseoBean> jsbList = new ArrayList<JunseoBean>();
		return session.selectList("getGradeList", smb);
	}
	// 출결 목록 가져오기
	public List<JunseoBean> selectSiListCtl(StuManageBean smb) {	
		return session.selectList("getSignList", smb);
	}
	// 상담일지 목록 가져오기
	public List<JunseoBean> selectCoListCtl(StuManageBean smb) {	
		return session.selectList("getCounselingList", smb);
	}



}
