package com.hotel.app.controller.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CSController {
	@RequestMapping(value = "/admin/cs", method = RequestMethod.GET)
	public String selectAll() {
		return "admin/cs/index";
	}
}
