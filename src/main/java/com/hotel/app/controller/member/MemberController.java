package com.hotel.app.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@RequestMapping(value = "/admin/member", method = RequestMethod.GET)
	public String selectAll() {
		return "admin/member/index";
	}
}
