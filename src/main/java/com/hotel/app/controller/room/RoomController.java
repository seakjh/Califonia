package com.hotel.app.controller.room;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.app.domain.Room;
import com.hotel.app.model.room.RoomService;

@Controller
public class RoomController {
	private static Logger logger=LoggerFactory.getLogger(RoomController.class);
	
	@Inject
	private RoomService roomService;
	
	@RequestMapping(value = "/admin/room", method = RequestMethod.GET)
	public String goRoom() {
		return "admin/room/list";
	}

	@RequestMapping(value = "/admin/room/registRoom", method = RequestMethod.GET)
	public String registRoom() {
		return "admin/room/registRoom";
	}
	
	/*-------------------------------------------------------------------------------------------*/

	@RequestMapping(value = "/admin/room/list", method = RequestMethod.GET)
	public String getRoomList() {
		return "1";
	}

	@RequestMapping(value = "/admin/room/regist", method = RequestMethod.POST)
	public String regist(Model model, Room room, HttpServletRequest request) {
		logger.info("등록 성공?");
		logger.info("name "+room.getName());
		logger.info("max_number "+room.getMax_number());
		logger.info("room_size "+room.getRoom_size());
		
		
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath = servletContext.getRealPath("/resources/data/");
		
		logger.info("저장할 이미지 경로는 "+realPath);
		
		roomService.insert(room, room.getMyFile(), realPath);
		
		model.addAttribute("msg", "등록되었습니다");
		model.addAttribute("url", "/admin/room/list");
		return "result/message";
	}
	
	//호텔의 모든 방 목록 가져오기 ( 예약 가능한지 여부는 현재 안따짐) 
	@RequestMapping(value="/rest/room", method=RequestMethod.GET)
	@ResponseBody
	public String getList() {
		System.out.println("룸을원하시는 군요");
		return "1";
	}
	
}