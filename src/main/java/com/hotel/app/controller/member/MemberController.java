package com.hotel.app.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.aop.exception.DataNotFoundException;
import com.hotel.app.domain.Member;
import com.hotel.app.model.member.MemberService;

@Controller
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/member/loginForm", method = RequestMethod.GET)
	public String goLogin() {
		return "member/loginForm";
	}

	@RequestMapping(value = "/member/registForm", method = RequestMethod.GET)
	public String signup() {
		return "member/registForm";
	}

	@RequestMapping(value = "/admin/member", method = RequestMethod.GET)
	public String goMemberList() {
		return "admin/member/index";
	}

	//관리자에서 회원의 상세정보를 보러가기
	@RequestMapping(value = "/admin/member/detail", method = RequestMethod.GET)
	public String goMemberDetail(Model model, @RequestParam int member_id) {
		Member member = memberService.select(member_id);
		model.addAttribute("member", member);
		return "admin/member/detail";
	}
	
	//사용자가 요청할때 정보를 세션을 체크해서 보여주기
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String goMyInfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		memberService.select(member.getMember_id());
		return "member/myinfo";
	}
	
	@RequestMapping(value="/member/regist", method=RequestMethod.POST)
	public String regist(Model model, Member member) {
		memberService.insert(member);
		model.addAttribute("msg", "회원가입을 축하드려요");
		model.addAttribute("url", "/");
		
		return "result/message";
	}

	@RequestMapping(value="/member/login", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Member loginCheck(Member member, HttpServletRequest request) {
		logger.info(member.getId());
		logger.info(member.getPassword());
		
		Member obj=memberService.loginCheck(member);
		
		HttpSession session = request.getSession();
		session.setAttribute("member", obj);
		
		//VO를 자동으로 json 형식으로 변환해주는 라이브러리가 있음..
		return obj;
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request){

		HttpSession session = request.getSession();
		session.invalidate();//현재 클라이언트와 관련된 세션을 무효화
		
		model.addAttribute("msg", "로그아웃 처리되었습니다");
		model.addAttribute("url", "/");
		
		return "result/message";
	}
	
	@RequestMapping(value="/member/list", method=RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List getList() {
		return memberService.selcetAll();
	}
	
	//관리자가 회원탈퇴시키기
	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public String delete(Model model, @RequestParam int member_id) {
		logger.info("넘어온 고유키"+member_id);
		memberService.delete(member_id);
		model.addAttribute("msg", "회원이 탈퇴시켰습니다");
		model.addAttribute("url", "/admin/member");
		return "result/message";
	}
	
	//관리자가 회원탈퇴시키기
	@RequestMapping(value="/member/secession", method=RequestMethod.GET)
	public String secession(Model model, @RequestParam int member_id, HttpServletRequest request) {
		logger.info("넘어온 고유키"+member_id);
		memberService.delete(member_id);
		model.addAttribute("msg", "탈퇴가 완료되었습니다. 이용해주셔서 감사합니다");
		model.addAttribute("url", "/");
		
		HttpSession session = request.getSession();
		session.invalidate();//탈퇴와 동시에 세션 무효화
		
		return "result/message";
	}

	
	
//	//마이페이지 요청 처리
//	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
//	public String getMyPage(Model model,HttpServletRequest request) {
//		//회원정보 MemberService 
//		HttpSession session = request.getSession();
//		Member member=(Member)session.getAttribute("member");
//		model.addAttribute("member", member);
//		
//		//결제내역 OrderService
//		List orderList=orderService.selectAllByMember(member);
//		model.addAttribute("orderList", orderList);
//		
//		//상담내역 BoardService
//		
//		return "member/mypage";
//	}
	
	
	@ExceptionHandler(DataNotFoundException.class)
	@ResponseBody()
	public String handle(DataNotFoundException e) {
		String data=null;
		
		StringBuilder msg=new StringBuilder();
		msg.append("{");
		msg.append("\"code\":0,");
		msg.append("\"msg\":\""+e.getMessage()+"\"");
		msg.append("}");
		
		return msg.toString();
	}
	
	
	@ExceptionHandler({DMLException.class})
	public ModelAndView handle(DMLException e) {
		ModelAndView mav = new ModelAndView();
		
		//파일 업로드 에러인 경우
		if(e !=null) {
			mav.addObject("e", e);
			mav.addObject("msg", e.getMessage());
		}
		//입력 에러엔 경우 
		mav.setViewName("result/error");
		return mav;
	}

}
