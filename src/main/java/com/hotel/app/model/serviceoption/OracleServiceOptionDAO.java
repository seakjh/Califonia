package com.hotel.app.model.serviceoption;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.ServiceOption;

@Repository
public class OracleServiceOptionDAO implements ServiceOptionDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(ServiceOption serviceOption) throws DMLException {
		int result = sessionTemplate.insert("OracleServiceOption.insert", serviceOption);
		
		if (result != 1) {
			throw new DMLException("카테고리 등록 실패!");
		}
	}
	
	public List selectAll() {
		return sessionTemplate.selectList("OracleServiceOption.selectAll");
	}
	
	public void delete(int service_option_id) throws DMLException {
		int result = sessionTemplate.delete("OracleServiceOption.delete", service_option_id);
		
		if (result == 0) {
			throw new DMLException("카테고리 삭제 실패!");
		}
	}
	
	public void update(ServiceOption serviceOption) throws DMLException {
		int result = sessionTemplate.update("OracleServiceOption.update", serviceOption);
		
		if (result==0) {
			throw new DMLException("카테고리 수정 실패!");
		}
	}

	@Override
	public ServiceOption select(int service_option_id) {
		return sessionTemplate.selectOne("OracleServiceOption.select", service_option_id);
	}
}
