package com.hotel.app.model.bed;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.BedOption;
import com.hotel.app.domain.ServiceOption;

@Service
public class BedOptionServiceImpl implements BedOptionService {
	
	@Inject
	@Qualifier("oracleBedOptionDAO")
	private BedOptionDAO bedOptionDAO;
	
	@Override
	public List selectAll() {
		return bedOptionDAO.selectAll();
	}

	@Override
	public BedOption select(int bed_option_id) {
		return bedOptionDAO.select(bed_option_id);
	}

	@Override
	public void insert(BedOption bedOption) throws DMLException {
		bedOptionDAO.insert(bedOption);
	}

	@Override
	public void update(BedOption bedOption) throws DMLException {
		bedOptionDAO.update(bedOption);
	}

	@Override
	public void delete(int bed_option_id) throws DMLException {
		bedOptionDAO.delete(bed_option_id);
	}

}
