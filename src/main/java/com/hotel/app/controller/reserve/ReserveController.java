package com.hotel.app.controller.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReserveController {
	@RequestMapping(value = "/admin/reserve", method = RequestMethod.GET)
	public String selectAll() {
		return "admin/reserve/index";
	}
}
