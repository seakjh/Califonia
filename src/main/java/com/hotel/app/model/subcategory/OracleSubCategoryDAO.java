package com.hotel.app.model.subcategory;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.SubCategory;

@Repository
public class OracleSubCategoryDAO implements SubCategoryDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(SubCategory subCategory) throws DMLException {
		System.out.println(subCategory.getRoom().getRoom_id());
		int result = sessionTemplate.insert("OracleSubCategory.insert", subCategory);
		
		if (result != 1) {
			throw new DMLException("카테고리 등록 실패!");
		}
	}
	
	public List selectAll() {
		return sessionTemplate.selectList("OracleSubCategory.selectAll");
	}
	
	public List isReserveList() {
		return sessionTemplate.selectList("OracleSubCategory.isReserveList");
	}
	
	public void delete(int subCategory_id) throws DMLException {
		int result = sessionTemplate.delete("OracleSubCategory.delete", subCategory_id);
		
		if (result == 0) {
			throw new DMLException("카테고리 삭제 실패!");
		}
	}
	
	public void update(SubCategory subCategory) throws DMLException {
		int result = sessionTemplate.update("OracleSubCategory.update", subCategory);
		
		if (result==0) {
			throw new DMLException("카테고리 수정 실패!");
		}
	}

	@Override
	public SubCategory select(int subCategory_id) {
		return sessionTemplate.selectOne("OracleSubCategory.select", subCategory_id);
	}
}
