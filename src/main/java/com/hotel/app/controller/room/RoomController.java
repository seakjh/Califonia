package com.hotel.app.controller.room;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.hotel.app.common.pager.Pager;
import com.hotel.app.domain.Reservation;
import com.hotel.app.domain.Room;
import com.hotel.app.domain.SubCategory;
import com.hotel.app.model.room.RoomService;

@Controller
public class RoomController {
	private static Logger logger=LoggerFactory.getLogger(RoomController.class);
	
	@Inject
	private RoomService roomService;
	
	@Inject
	private Pager pager;
	
	@RequestMapping(value = "/admin/room", method = RequestMethod.GET)
	public String goRoom() {
		return "admin/room/list";
	}

	@RequestMapping(value = "/admin/room/registRoom", method = RequestMethod.GET)
	public String registRoom() {
		return "admin/room/registRoom";
	}
	
	/*-------------------------------------------------------------------------------------------*/

	@RequestMapping(value = "/admin/room/getList", method = RequestMethod.GET, produces="application/json;charset=utf8")
	@ResponseBody
	public List<SubCategory> getRoomList() {
		return roomService.selectAll();
	}

	@RequestMapping(value = "/admin/room/regist", method = RequestMethod.POST)
	public String regist(Model model, SubCategory subCategory, HttpServletRequest request) {
		Room room = subCategory.getRoom();
//		logger.info("topcate : " + subCategory.getTopcategory_id());
		logger.info("name "+room.getName());
		logger.info("max_number "+room.getMax_number());
		logger.info("room_size "+room.getRoom_size());
		
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath = servletContext.getRealPath("/resources/data/");
		
		logger.info("저장할 이미지 경로는 "+realPath);
		
		roomService.insert(subCategory, room.getMyFile(), realPath);
		
		model.addAttribute("msg", "등록되었습니다");
		model.addAttribute("url", "/admin/room/");
		return "result/message";
	}
	
	//호텔의 모든 방 목록 가져오기 ( 예약 가능한지 여부는 현재 안따짐) 
	@RequestMapping(value="/rest/room", method=RequestMethod.GET)
	@ResponseBody
	public List<SubCategory> getList(HttpServletRequest request, Reservation reservation) {
		logger.info("방들을 호출함");

		String check_in = reservation.getCheck_in();
		String check_out = reservation.getCheck_out();
		
		logger.info("들어옴? "+check_in+","+check_out);
		
		//roomService.isReserveList(); 예약가능한 방 
		Map<String,Date> prop = new HashMap<String, Date>();
		Date in_date =new Date(2020,8,1);
		Date out_date =new Date(2020,8,7);
		
		prop.put("check_in", in_date);
		prop.put("check_out", out_date);
		
		List categoryList = roomService.selectAll(reservation);
		
		
		logger.info("caegoryList is "+categoryList);
		logger.info("caegoryList size "+categoryList.size());
		
		return categoryList;
	}
	
}