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
import com.hotel.app.domain.Payment;
import com.hotel.app.model.payment.PaymentService;

@Controller
public class PaymentController {
	private static Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Inject
	private PaymentService paymentService;
	
	@RequestMapping(value = "/admin/payment", method = RequestMethod.GET)
	public String goPayment() {
		return "admin/payment/index";
	}
	
	/*=======================================*/
	
	@RequestMapping(value="/payment/regist", method=RequestMethod.POST)
	@ResponseBody
	public String regist(Payment payment) {
		paymentService.insert(payment);
		return "1";
	}
	
	@RequestMapping(value="/payment/list",method=RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List<Payment> selectAll() {
		List<Payment> payList = paymentService.selectAll();

		return payList;
	}
	
	@RequestMapping(value = "/payment/detail", method = RequestMethod.GET)
	@ResponseBody
	public Payment select(@RequestParam("payment_id") int payment_id) {
		return paymentService.select(payment_id);
	}
	
	@ExceptionHandler(DMLException.class)
	@ResponseBody //페이지를 보여주는게 아닌, 데이터만 전송할경우
	public String handle(DMLException e) {
		e.printStackTrace();
		System.out.println("에러 발견!!");
		return "0";
	}
}
