package com.hotel.app.model.payment;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Inject
	@Qualifier("oraclePaymentDAO")
	private PaymentDAO paymentDAO;
	
	@Override
	public List selectAll() {
		return paymentDAO.selectAll();
	}

	@Override
	public Payment select(int payment_id) {
		return paymentDAO.select(payment_id);
	}

	@Override
	public void insert(Payment payment) throws DMLException {
		paymentDAO.insert(payment);
	}

	@Override
	public void update(Payment payment) throws DMLException {
		paymentDAO.update(payment);
	}

	@Override
	public void delete(int payment_id) throws DMLException {
		paymentDAO.delete(payment_id);
	}

}
