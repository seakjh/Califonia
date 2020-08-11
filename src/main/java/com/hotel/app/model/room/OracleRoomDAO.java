package com.hotel.app.model.room;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.Room;

@Repository
public class OracleRoomDAO implements RoomDAO {

	@Inject
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(Room room) throws DMLException {
		int result = sessionTemplate.insert("OracleRoom.insert", room);
		
		if (result != 1) {
			throw new DMLException("카테고리 등록 실패!");
		}
	}
	
	public List selectAll() {
		return sessionTemplate.selectList("OracleRoom.selectAll");
	}

	@Override
	public Room select(int room_id) {
		return sessionTemplate.selectOne("OracleRoom.select", room_id);
	}
	
	public void delete(int room_id) throws DMLException {
		int result = sessionTemplate.delete("OracleRoom.delete", room_id);
		
		if (result == 0) {
			throw new DMLException("카테고리 삭제 실패!");
		}
	}
	
	public void update(Room room) throws DMLException {
		int result = sessionTemplate.update("OracleRoom.update", room);
		
		if (result==0) {
			throw new DMLException("카테고리 수정 실패!");
		}
	}

}
