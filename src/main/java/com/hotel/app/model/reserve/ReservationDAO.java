package com.hotel.app.model.reserve;

import java.util.List;

import com.hotel.app.domain.Reservation;



public interface ReservationDAO {
	public List selectAll();
	public Reservation select(int reservation_id);
	public void insert(Reservation reservation);
	//public void update(Reservation reservation);
	public void delete(int reservation_id);
}
