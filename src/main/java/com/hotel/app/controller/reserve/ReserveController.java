package com.hotel.app.controller.reserve;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.app.controller.room.RoomController;
import com.hotel.app.domain.BedOption;
import com.hotel.app.domain.Payment;
import com.hotel.app.domain.Reservation;
import com.hotel.app.domain.Room;
import com.hotel.app.domain.ServiceOption;
import com.hotel.app.domain.SubCategory;
import com.hotel.app.model.bed.BedOptionService;
import com.hotel.app.model.payment.PaymentService;
import com.hotel.app.model.reserve.ReservationService;
import com.hotel.app.model.room.RoomService;
import com.hotel.app.model.service.ServiceOptionService;
import com.hotel.app.model.topcategory.TopCategoryService;

@Controller
public class ReserveController {
	private static Logger logger=LoggerFactory.getLogger(ReserveController.class);
	
	@Inject
	private BedOptionService bedOptionService;
	
	@Inject
	private ServiceOptionService serviceOptionService;
	
	@Inject
	private PaymentService paymentService;
	
	@Inject
	private RoomService roomService;

	@Inject
	private ReservationService reservationService;
	
	@RequestMapping(value = "/admin/reserve", method = RequestMethod.GET)
	public String selectAll() {
		return "admin/reserve/index";
	}
	
	
	//예약 요청처리 
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String insert(Model model, Reservation reservation, @RequestParam("subcategory_id") int subcategory_id) {
		logger.info("Check_in is "+ reservation.getCheck_in());
		logger.info("Check_out is "+ reservation.getCheck_out());
		
		SubCategory subCategory = roomService.selectJoin(subcategory_id);
		List<BedOption> bedList = bedOptionService.selectAll();
		List<ServiceOption> serviceList = serviceOptionService.selectAll();
		List<Payment> payList = paymentService.selectAll();
		
		model.addAttribute("reservation", reservation);
		model.addAttribute("subCategory", subCategory);
		model.addAttribute("bedList", bedList);
		model.addAttribute("serviceList", serviceList);
		model.addAttribute("payList", payList);
		
		return "reserve/main"; //예약 페이지 보여주기 
	}
	
	//결제 요청처리 
	@RequestMapping(value = "/reserve/payment", method = RequestMethod.POST)
	public String payment(Model model, Reservation reservation) {
		logger.info("결제 호출");
		
		reservationService.insert(reservation);
		
		model.addAttribute("msg", "결제가 완료되었습니다");
		model.addAttribute("url", "/");
		
		return "result/message";
	}
}
