package eljl.lms.commonHS;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import eljl.factory.bean.BoardCreateBeanHS;
import eljl.factory.bean.StuManageBean;
import eljl.factory.util.Encryption;
import eljl.factory.util.ProjectUtils;

@Service
public class MemberClass {

	@Autowired
	SqlSessionTemplate session;

	ModelAndView mav;

	@Autowired
	Encryption enc;

	@Autowired
	Gson gson;

	@Autowired
	ProjectUtils pu;

	public List<BoardCreateBeanHS> getCategoryListCtl(BoardCreateBeanHS bcb) {
		return session.selectList("getCategoryList", bcb);

	}
	
	public boolean convertData(int data) {
		return (data > 0)? true:false;
	}

	public Map<String, String> createEtcCtl(BoardCreateBeanHS bcb) {
		// EtcCode
		bcb.setNumCode(this.makeCode(bcb));
		bcb.setStickerPath(pu.savingFile(bcb.getMbFile())); 
		System.out.println(bcb.getMbId() + ":" + bcb.getCsCode()+ ":" + bcb.getOpCode()+ ":" + bcb.getSsCode()+ ":" + bcb.getNumCode()+ ":" + bcb.getStartDate()+ ":" +bcb.getEndDate()+ ":" +bcb.getTitle()+ ":" +bcb.getContents()+ ":" +bcb.getStickerPath());
		
		//session.insert("insEtc", bcb);
		return null;
	}
	
	public Map<String, String> createTaskCtl(BoardCreateBeanHS bcb) {
		// TaskCode
		bcb.setNumCode(this.makeCode(bcb));
		bcb.setStickerPath(pu.savingFile(bcb.getMbFile())); 
		System.out.println(bcb.getMbId() + ":" + bcb.getCsCode()+ ":" + bcb.getOpCode()+ ":" + bcb.getSsCode()+ ":" + bcb.getNumCode()+ ":" + bcb.getStartDate()+ ":" +bcb.getEndDate()+ ":" +bcb.getTitle()+ ":" +bcb.getContents()+ ":" +bcb.getStickerPath());
		
		//session.insert("insTask", bcb);
		return null;
	}

	
	public Map<String, String> createQuizCtl(BoardCreateBeanHS bcb) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("message", "실패하였습니다.");
		// QuizCode
		bcb.setNumCode(this.makeCode(bcb));
		
		if(convertData(session.insert("insQuiz", bcb))) {
			map.put("message", "퀴즈를 생성하였습니다.");
		}
		return map;
	}
	


	public String makeCode(BoardCreateBeanHS bcb) {
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(day);
		int number = 0;
		if(bcb.getSsCode().substring(0,1).equals("E")) {
			number = session.selectOne("getEtcCode");
		}else if(bcb.getSsCode().substring(0,1).equals("T")) {
			number = session.selectOne("getTaskCode");
		}else if(bcb.getSsCode().substring(0,1).equals("Q")) {
			number = session.selectOne("getQuizCode");
		}
		String code = (number+1)+"";

		for(int i=code.length(); i<3; i++) {
			code = "0"+code;
		}
return date + code;
	}

	public List<BoardCreateBeanHS> allPostListCtl(BoardCreateBeanHS bcb) {
		List<BoardCreateBeanHS> list;
		list = session.selectList("allPostList", bcb);
		return list;
	}
}
