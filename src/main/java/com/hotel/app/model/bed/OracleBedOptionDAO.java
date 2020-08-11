package com.hotel.app.model.bed;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.BedOption;

@Repository
public class OracleBedOptionDAO implements BedOptionDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(BedOption bedOption) throws DMLException {
		int result = sessionTemplate.insert("OracleBedOption.insert", bedOption);
		
		if (result != 1) {
			throw new DMLException("카테고리 등록 실패!");
		}
	}
	
	public List selectAll() {
		return sessionTemplate.selectList("OracleBedOption.selectAll");
	}

	@Override
	public BedOption select(int bed_option_id) {
		return sessionTemplate.selectOne("OracleBedOption.select", bed_option_id);
	}
	
	public void delete(int bed_option_id) throws DMLException {
		int result = sessionTemplate.delete("OracleBedOption.delete", bed_option_id);
		
		if (result == 0) {
			throw new DMLException("카테고리 삭제 실패!");
		}
	}
	
	public void update(BedOption bedOption) throws DMLException {
		int result = sessionTemplate.update("OracleBedOption.update", bedOption);
		
		if (result==0) {
			throw new DMLException("카테고리 수정 실패!");
		}
	}

}
