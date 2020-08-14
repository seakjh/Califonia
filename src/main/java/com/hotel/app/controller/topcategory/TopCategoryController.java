package com.hotel.app.controller.topcategory;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.TopCategory;
import com.hotel.app.model.topcategory.TopCategoryService;

@Controller
public class TopCategoryController {
	private static Logger logger = LoggerFactory.getLogger(TopCategoryController.class);
	
	@Inject
	private TopCategoryService topCategoryService;
	
	@RequestMapping(value = "/admin/category", method = RequestMethod.GET)
	public String category() {
		logger.info("관리자모드의 카테고리 호출");
		return "admin/category/index";
	}
	
	@RequestMapping(value="/category/regist", method=RequestMethod.POST)
	@ResponseBody
	public String regist(TopCategory topCategory) {
		logger.info("이름 : "+topCategory.getName());
		topCategoryService.insert(topCategory);
		return "1";
	}
	
	@RequestMapping(value="/category/list",method=RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List<TopCategory> selectAll() {
		List<TopCategory> categoryList = topCategoryService.selectAll();

		return categoryList;
	}
	
	@RequestMapping(value = "/category/detail", method = RequestMethod.GET)
	@ResponseBody
	public TopCategory select(@RequestParam("topcategory_id") int topcategory_id) {
		logger.info("id : "+topcategory_id);
		logger.info("넘어온 고유키 "+topCategoryService.select(topcategory_id));
		return topCategoryService.select(topcategory_id);
	}

	@RequestMapping(value = "/category/edit", method = RequestMethod.POST)
	@ResponseBody
	public String update(TopCategory topCategory) {
		topCategoryService.update(topCategory);
		return "1";
	}
	
	@RequestMapping(value="/category/del",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@RequestParam("topcategory_id") int topcategory_id) {
		logger.info("넘어온 고유키 "+topcategory_id);
		topCategoryService.delete(topcategory_id);
		return "1";
	}
	
	@ExceptionHandler(DMLException.class)
	@ResponseBody //페이지를 보여주는게 아닌, 데이터만 전송할경우
	public String handle(DMLException e) {
		e.printStackTrace();
		logger.info("에러 발견!!");
		return "0";
	}
}	











