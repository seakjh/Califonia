package com.hotel.app.model.reserve;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Inject
	@Qualifier("oracleReservationDAO")
	private ReservationDAO reservationDAO;
	
	@Override
	public List selectAll() {
		return reservationDAO.selectAll();
	}

	@Override
	public Reservation select(int reservation_id) {
		return reservationDAO.select(reservation_id);
	}

	@Override
	public void insert(Reservation reservation) throws DMLException {
		reservationDAO.insert(reservation);
	}

//	@Override
//	public void update(Reservation reservation) throws DMLException {
//		reservationDAO.update(Reservation);
//	}

	@Override
	public void delete(int reservation_id) throws DMLException {
		reservationDAO.delete(reservation_id);
	}

}
