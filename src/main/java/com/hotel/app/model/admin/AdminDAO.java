package com.hotel.app.model.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.app.domain.Admin;

public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public Admin loginCheck(Admin admin) {
		Admin obj=null;
		obj=sessionTemplate.selectOne("Admin.loginCheck", admin);
		return obj;
	}
	
}
