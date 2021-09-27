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

import eljl.factory.bean.BoardCreateBean;
import eljl.factory.bean.CalendarBean;
import eljl.factory.bean.HistoryBean;
import eljl.factory.bean.StuManageBean;
import eljl.factory.bean.SubjectBean;
import eljl.factory.bean.UserInfoBean;
import eljl.lms.dashboard.Calendar;
import eljl.lms.dashboard.MainService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MainService ms;
	
	@Autowired
	Calendar cd;
	
	// 스트림 페이지로 이동
	@RequestMapping(value = "/streamForm", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "stream";
	}
	
	// 마이페이지로 이동
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Locale locale, Model model) {
		return "myPage";
	}
	
	// 마이페이지로 이동
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String setting(Locale locale, Model model) {
		return "setting";
	}
	
	
	// 클래스 삭제
	@PostMapping("/deleteClass")
	@ResponseBody
	public List<StuManageBean> deleteClass(@ModelAttribute SubjectBean sb) {
		return ms.deleteClassCtl(sb);
	}
	
	// 캘린더 From 양식
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendarForm() {
			return "calendar";
	}
	
	//캘린더 일정 가져오기
	@PostMapping("/getScheduleList")
	@ResponseBody
	public List<CalendarBean> getScheduleList(@ModelAttribute StuManageBean smb) {
			return cd.getScheduleListCtl(smb); 
	}
	
}
