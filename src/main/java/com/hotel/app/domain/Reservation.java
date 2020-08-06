package com.hotel.app.domain;
import lombok.Data;

@Data
public class Reservation {
	private int reservation_id;
	private Member member;
	private Room room;
	private BedOption bedOption;
	private ServiceOption serviceOption;
	private Payment payment;
	private int total_pay;
	private String reserve_date;
	private String check_in;
	private String check_out;
	
}
