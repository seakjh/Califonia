package com.hotel.app.model.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.aop.exception.DataNotFoundException;
import com.hotel.app.domain.Member;

@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	public void insert(Member member) throws DMLException{
		memberDAO.insert(member);
	}
	
	public Member loginCheck(Member member) throws DataNotFoundException{
		Member obj=memberDAO.loginCheck(member);
		return obj;
	}
	
	public List selcetAll() {
		return memberDAO.selectAll();
	}
	
	public Member select(int member_id) {
		return memberDAO.select(member_id);
	}
	
	public void delete(int member_id) {
		memberDAO.delete(member_id);
	}
}
