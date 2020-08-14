package com.hotel.app.model.reserve;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.Reservation;

@Repository
public class OracleReservationDAO implements ReservationDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(Reservation reservation) throws DMLException {
		int result = sessionTemplate.insert("OracleReservation.insert", reservation);
		
		if (result != 1) {
			throw new DMLException("등록 실패!");
		}
	}
	
	public List selectAll() {
		return sessionTemplate.selectList("OracleReservation.selectAll");
	}
	
	public List myReserve(int member_id) {
		return sessionTemplate.selectList("OracleReservation.myReserve", member_id);
	}
	
	public Reservation select(int reservation_id) {
		return sessionTemplate.selectOne("OracleReservation.select", reservation_id);
	}
	
	public void delete(int reservation_id) throws DMLException {
		int result = sessionTemplate.delete("OracleReservation.delete", reservation_id);
		
		if (result == 0) {
			throw new DMLException("삭제 실패!");
		}
	}
	
//	public void update(Reservation Reservation) throws DMLException {
//		int result = sessionTemplate.update("OracleReservation.update", Reservation);
//		
//		if (result==0) {
//			throw new DMLException("수정 실패!");
//		}
//	}
}
