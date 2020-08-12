package com.hotel.app.model.payment;

import java.util.List;

import com.hotel.app.domain.Payment;

public interface PaymentService {
	public List selectAll();
	public Payment select(int payment_id);
	public void insert(Payment payment);
	public void update(Payment payment);
	public void delete(int payment_id);
}
