package com.hotel.app.controller.bed;

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
import com.hotel.app.domain.BedOption;
import com.hotel.app.model.bed.BedOptionService;

@Controller
public class BedController {
	private static Logger logger = LoggerFactory.getLogger(BedController.class);

	@Inject
	private BedOptionService bedOptionService;
	
	@RequestMapping(value = "/admin/bed", method = RequestMethod.GET)
	public String gobed() {
		return "admin/bed/index";
	}
	
	@RequestMapping(value="/bed/regist", method=RequestMethod.POST)
	@ResponseBody
	public String regist(BedOption bedOption) {
		System.out.println("이름 : "+bedOption.getName());
		bedOptionService.insert(bedOption);
		return "1";
	}
	
	@RequestMapping(value="/bed/list",method=RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List<BedOption> selectAll() {
		List<BedOption> bedList = bedOptionService.selectAll();

		return bedList;
	}
	
	@RequestMapping(value = "/bed/detail", method = RequestMethod.GET)
	@ResponseBody
	public BedOption select(@RequestParam("bed_option_id") int bed_option_id) {
		return bedOptionService.select(bed_option_id);
	}

	@RequestMapping(value = "/bed/edit", method = RequestMethod.GET)
	@ResponseBody
	public String update(BedOption bedOption) {
		bedOptionService.update(bedOption);
		return "1";
	}
	
	@RequestMapping(value="/bed/del",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@RequestParam("bed_option_id") int bed_option_id) {
		System.out.println(bed_option_id);
		bedOptionService.delete(bed_option_id);
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
