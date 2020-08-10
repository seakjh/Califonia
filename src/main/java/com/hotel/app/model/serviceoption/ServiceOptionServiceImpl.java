package com.hotel.app.model.serviceoption;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.ServiceOption;

@Service
public class ServiceOptionServiceImpl implements ServiceOptionService {
	
	@Inject
	@Qualifier("oracleServiceOptionDAO")
	private ServiceOptionDAO serviceOptionDAO;
	
	@Override
	public List selectAll() {
		return serviceOptionDAO.selectAll();
	}

	@Override
	public ServiceOption select(int service_option_id) {
		return serviceOptionDAO.select(service_option_id);
	}

	@Override
	public void insert(ServiceOption serviceOption) throws DMLException {
		serviceOptionDAO.insert(serviceOption);
	}

	@Override
	public void update(ServiceOption serviceOption) throws DMLException {
		serviceOptionDAO.update(serviceOption);
	}

	@Override
	public void delete(int service_option_id) throws DMLException {
		serviceOptionDAO.delete(service_option_id);
	}

}
