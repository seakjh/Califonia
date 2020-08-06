package com.hotel.app.controller.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	private static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main() {
		logger.info("메인호출했네요");
		return "main";
	}
}
