package com.hotel.app.model.member;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.aop.exception.DataNotFoundException;
import com.hotel.app.domain.Member;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(Member member) throws DMLException{
		int result = sessionTemplate.insert("Member.insert", member);
		if(result ==0) {
			throw new DMLException("회원가입에 실패하였습니다\n관리자에 문의하여 주세요");
		}
	}
	
	public Member loginCheck(Member member) throws DataNotFoundException{
		Member obj=sessionTemplate.selectOne("Member.loginCheck", member);
		if(obj==null) {//회원이 없을 경우, 비즈니스적 에러상황으로 보자!!
			throw new DataNotFoundException("로그인 정보가 올바르지 않습니다");
		}
		return obj;
	}
	
	public List selectAll() {
		return sessionTemplate.selectList("Member.selectAll");
	}
	
	public Member select(int member_id) {
		return sessionTemplate.selectOne("Member.select", member_id);
	}
	
	//회원 탈퇴처리
	public void delete(int member_id) {
		sessionTemplate.delete("Member.delete", member_id);
	}
}
