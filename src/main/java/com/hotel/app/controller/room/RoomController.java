package com.hotel.app.controller.room;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RoomController {
	
	@RequestMapping(value = "/admin/room/list", method = RequestMethod.GET)
	public String goRoom() {
		return "admin/room/list";
	}

	@RequestMapping(value = "/room/regist", method = RequestMethod.GET)
	public String registRoom() {
		return "admin/room/registRoom";
	}

	@RequestMapping(value = "/room/list", method = RequestMethod.GET)
	public String roomList() {
		return "admin/room/list";
	}
	
	//호텔의 모든 방 목록 가져오기 ( 예약 가능한지 여부는 현재 안따짐) 
	@RequestMapping(value="/rest/room", method=RequestMethod.GET)
	@ResponseBody
	public String getList() {
		System.out.println("룸을원하시는 군요");
		return "1";
	}
	
}
