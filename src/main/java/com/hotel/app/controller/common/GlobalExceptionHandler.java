package com.hotel.app.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.hotel.app.aop.exception.AdminAuthException;
import com.hotel.app.aop.exception.MemberAuthException;

@ControllerAdvice
public class GlobalExceptionHandler {
	private static Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
	
	@ExceptionHandler(MemberAuthException.class)
	public String handleException(MemberAuthException e, Model model) {
		logger.info("발생한 예외의 메시지 : "+e.getMessage());
		
		model.addAttribute("url", "/member/loginForm");
		model.addAttribute("msg", e.getMessage());
		
		return "result/message";
	}
	
	@ExceptionHandler(AdminAuthException.class)
	public String handleException(AdminAuthException e, Model model) {
		logger.info("발생한 예외의 메시지 : "+e.getMessage());
		
		model.addAttribute("url", "/admin/signin");
		model.addAttribute("msg", e.getMessage());
		
		return "result/message";
	}
}