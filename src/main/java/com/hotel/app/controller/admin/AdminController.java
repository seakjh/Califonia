package com.hotel.app.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotel.app.domain.Admin;
import com.hotel.app.model.admin.AdminService;

@Controller
public class AdminController {
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService adminService;
	
	//관리자메인호출
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminMain(HttpServletRequest request) {
		logger.info("관리자메인호출");
		return "admin/main";
	}
	
	//관리자 로그인페이지 호출
	@RequestMapping(value="/admin/signin", method=RequestMethod.GET)
	public String goLogin(HttpServletRequest request) {
		return "admin/login";
	}
	
	//관리자로그인체크
	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)
	public String loginCheck(Admin admin, Model model, HttpServletRequest request) {
		Admin result = adminService.loginCheck(admin);
		String str = "";
		
		if (result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", result);//회원 정보 저장
			//관리자 모드 메인 페이지로
			str = "admin/main";			
		} else {
			model.addAttribute("msg", "로그인 정보가 올바르지 않습니다");
			str = "result/error";
		}
		
		return str;
	}
	
	//관리자 로그아웃
	@RequestMapping(value="/admin/logout", method=RequestMethod.GET)
	public String logout(Model model ,HttpServletRequest request){

		HttpSession session = request.getSession();
		session.invalidate();//현재 클라이언트와 관련된 세션을 무효화
		
		model.addAttribute("msg", "로그아웃 처리되었습니다");
		model.addAttribute("url", "/admin/signin");
		
		return "result/message";
	}
}








