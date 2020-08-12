package com.hotel.app.model.payment;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.Payment;

@Repository
public class OraclePaymentDAO implements PaymentDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(Payment payment) throws DMLException {
		int result = sessionTemplate.insert("OraclePayment.insert", payment);
		
		if (result != 1) {
			throw new DMLException("등록 실패!");
		}
	}
	
	public List selectAll() {
		return sessionTemplate.selectList("OraclePayment.selectAll");
	}
	
	public Payment select(int payment_id) {
		return sessionTemplate.selectOne("OraclePayment.select", payment_id);
	}
	
	public void delete(int payment_id) throws DMLException {
		int result = sessionTemplate.delete("OraclePayment.delete", payment_id);
		
		if (result == 0) {
			throw new DMLException("삭제 실패!");
		}
	}
	
	public void update(Payment Payment) throws DMLException {
		int result = sessionTemplate.update("OraclePayment.update", Payment);
		
		if (result==0) {
			throw new DMLException("수정 실패!");
		}
	}
}
