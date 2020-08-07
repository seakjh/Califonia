package com.hotel.app.model.topcategory;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.TopCategory;

@Repository
public class OracleTopCategoryDAO implements TopCategoryDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(TopCategory topCategory) throws DMLException {
		int result = sessionTemplate.insert("OracleTopCategory.insert", topCategory);
		
		if (result != 1) {
			throw new DMLException("카테고리 등록 실패!");
		}
	}
	
	public List selectAll() {
		return sessionTemplate.selectList("OracleTopCategory.selectAll");
	}
	
	public void delete(int topCategory_id) throws DMLException {
		int result = sessionTemplate.delete("OracleTopCategory.delete", topCategory_id);
		
		if (result == 0) {
			throw new DMLException("카테고리 삭제 실패!");
		}
	}
	
	public void update(TopCategory topCategory) throws DMLException {
		int result = sessionTemplate.update("OracleTopCategory.update", topCategory);
		
		if (result==0) {
			throw new DMLException("카테고리 수정 실패!");
		}
	}

	@Override
	public TopCategory select(int topCategory_id) {
		return sessionTemplate.selectOne("OracleTopCategory.select", topCategory_id);
	}
}
