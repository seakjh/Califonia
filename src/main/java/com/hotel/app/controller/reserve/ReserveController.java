package com.hotel.app.controller.reserve;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.app.controller.room.RoomController;
import com.hotel.app.domain.Reservation;

@Controller
public class ReserveController {
	private static Logger logger=LoggerFactory.getLogger(ReserveController.class);
	
	@RequestMapping(value = "/admin/reserve", method = RequestMethod.GET)
	public String selectAll() {
		
		return "admin/reserve/index";
	}
	
	
	//예약 요청처리 
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String insert(Reservation reservation, @RequestParam("room_id") int room_id) {
		logger.info("room_id is "+ room_id);
		logger.info("Check_in is "+ reservation.getCheck_in());
		logger.info("Check_out is "+ reservation.getCheck_out());
		
		return "reserve/main"; //예약 페이지 보여주기 
	}
	
	//결제 요청처리 
	@RequestMapping(value = "/reserve/payment", method = RequestMethod.POST)
	public String payment(Model model) {
		logger.info("결제 호출");
		
		model.addAttribute("msg", "결제가 완료되었습니다");
		model.addAttribute("url", "/");
		
		return "view/message";
	}
}
