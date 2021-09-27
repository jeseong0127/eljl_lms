package eljl.service.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import eljl.factory.bean.HistoryBean;
import eljl.factory.bean.NoticeBean;
import eljl.factory.bean.StuManageBean;
import eljl.factory.bean.SubjectBean;
import eljl.factory.bean.UserInfoBean;
import eljl.lms.commonKA.MemberStream;
import eljl.lms.dashboard.MainService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MainService ms;
	
	@Autowired
	MemberStream msm;
	
	@RequestMapping(value = "/streamForm", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "stream";
	}
	
	// 클래스 삭제
	@PostMapping("/deleteClass")
	@ResponseBody
	public List<StuManageBean> deleteClass(@ModelAttribute SubjectBean sb) {
		return ms.deleteClassCtl(sb);
	}
	
	@PostMapping("/NoticeOutput")
	public ModelAndView NoticeOutput(NoticeBean nb) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stream");
		return mav;
	}
	
	@PostMapping("/NoticeStOutput")
	public ModelAndView NoticeStOutput(NoticeBean nb) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("streamS");
		return mav;
	}
	
}
