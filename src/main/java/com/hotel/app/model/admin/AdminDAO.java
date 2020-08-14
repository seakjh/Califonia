package com.hotel.app.model.admin;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.domain.Admin;

@Repository
public class AdminDAO {
	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public Admin loginCheck(Admin admin) {
		return sessionTemplate.selectOne("Admin.loginCheck", admin);
	}
	
}
