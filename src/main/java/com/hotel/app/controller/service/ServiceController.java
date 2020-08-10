package com.hotel.app.controller.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.ServiceOption;
import com.hotel.app.model.serviceoption.ServiceOptionService;

@Controller
public class ServiceController {
	private static Logger logger = LoggerFactory.getLogger(ServiceController.class);
	
	@Inject
	private ServiceOptionService serviceOptionService;
	
	@RequestMapping(value = "/admin/service", method = RequestMethod.GET)
	public String goService() {
		return "admin/service/index";
	}
	
	@RequestMapping(value="/service/regist", method=RequestMethod.POST)
	@ResponseBody
	public String regist(ServiceOption serviceOption) {
		System.out.println("이름 : "+serviceOption.getName());
		serviceOptionService.insert(serviceOption);
		return "1";
	}
	
	@RequestMapping(value="/service/list",method=RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List<ServiceOption> selectAll() {
		List<ServiceOption> categoryList = serviceOptionService.selectAll();

		return categoryList;
	}
	
	@RequestMapping(value = "/service/detail", method = RequestMethod.GET)
	@ResponseBody
	public ServiceOption select(@RequestParam("service_option_id") int service_option_id) {
		return serviceOptionService.select(service_option_id);
	}

	@RequestMapping(value = "/service/edit", method = RequestMethod.GET)
	@ResponseBody
	public String update(ServiceOption serviceOption) {
		serviceOptionService.update(serviceOption);
		return "1";
	}
	
	@RequestMapping(value="/service/del",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@RequestParam("service_option_id") int service_option_id) {
		System.out.println(service_option_id);
		serviceOptionService.delete(service_option_id);
		return "1";
	}
	
	@ExceptionHandler(DMLException.class)
	@ResponseBody //페이지를 보여주는게 아닌, 데이터만 전송할경우
	public String handle(DMLException e) {
		e.printStackTrace();
		System.out.println("에러 발견!!");
		return "0";
	}
}
