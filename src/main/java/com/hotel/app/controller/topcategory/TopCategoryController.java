package com.hotel.app.controller.topcategory;

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
import com.hotel.app.controller.admin.AdminController;
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
		System.out.println("파라미터값:"+topCategory.getName());
		topCategoryService.insert(topCategory);
		return "1";
	}
	
	@RequestMapping(value="/category/list",method=RequestMethod.GET,produces="application/json;charset=utf8")
	@ResponseBody
	public List<TopCategory> selectAll() {
		List<TopCategory> categoryList = topCategoryService.selectAll();

		return categoryList;
	}
	
	@RequestMapping(value = "/category/detail", method = RequestMethod.GET)
	@ResponseBody
	public String select(@RequestParam int topCategory_id) {
		topCategoryService.select(topCategory_id);
		return "1";
	}

	@RequestMapping(value = "/category/edit", method = RequestMethod.GET)
	@ResponseBody
	public String update(TopCategory topCategory) {
		topCategoryService.update(topCategory);
		return "1";
	}
	
	@RequestMapping(value="/category/del",method=RequestMethod.GET)
	@ResponseBody
	public String delete(@RequestParam("category_id") int category_id) {
		System.out.println(category_id);
		topCategoryService.delete(category_id);
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











