package com.hotel.app.model.topcategory;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.TopCategory;

@Service
public class TopCategoryServiceImpl implements TopCategoryService {
	
	@Inject
	@Qualifier("oracleTopCategoryDAO")
	private TopCategoryDAO topCategoryDAO;
	
	@Override
	public List selectAll() {
		return topCategoryDAO.selectAll();
	}

	@Override
	public TopCategory select(int topCategory_id) {
		return topCategoryDAO.select(topCategory_id);
	}

	@Override
	public void insert(TopCategory topCategory) throws DMLException {
		topCategoryDAO.insert(topCategory);
	}

	@Override
	public void update(TopCategory topCategory) throws DMLException {
		topCategoryDAO.update(topCategory);
	}

	@Override
	public void delete(int topCategory_id) throws DMLException {
		topCategoryDAO.delete(topCategory_id);
	}

}
