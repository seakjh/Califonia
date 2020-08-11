package com.hotel.app.model.service;

import java.util.List;

import com.hotel.app.domain.ServiceOption;

public interface ServiceOptionService {
	public List selectAll();
	public ServiceOption select(int service_option_id);
	public void insert(ServiceOption serviceOption);
	public void update(ServiceOption serviceOption);
	public void delete(int service_option_id);
}
