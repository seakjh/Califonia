package com.hotel.app.controller.payment;

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
import com.hotel.app.model.service.ServiceOptionService;

@Controller
public class PaymentController {
	private static Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Inject
	private ServiceOptionService serviceOptionService;
	
	@RequestMapping(value = "/admin/payment", method = RequestMethod.GET)
	public String goPayment() {
		return "admin/payment/index";
	}
	
	/*=======================================*/
	
	@RequestMapping(value="/payment/regist", method=RequestMethod.POST)
	@ResponseBody
	public String regist(ServiceOption serviceOption) {
		System.out.println("이름 : "+serviceOption.getName());
		serviceOptionService.insert(serviceOption);
		return "1";
	}
	
	@RequestMapping(value="/payment/list",method=RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List<ServiceOption> selectAll() {
		List<ServiceOption> categoryList = serviceOptionService.selectAll();

		return categoryList;
	}
	
	@RequestMapping(value = "/payment/detail", method = RequestMethod.GET)
	@ResponseBody
	public ServiceOption select(@RequestParam("service_option_id") int service_option_id) {
		return serviceOptionService.select(service_option_id);
	}
	
	@ExceptionHandler(DMLException.class)
	@ResponseBody //페이지를 보여주는게 아닌, 데이터만 전송할경우
	public String handle(DMLException e) {
		e.printStackTrace();
		System.out.println("에러 발견!!");
		return "0";
	}
}
