package com.hotel.app.model.room;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.domain.Room;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Inject
	@Qualifier("oracleRoomDAO")
	private RoomDAO roomDAO;
	
	@Override
	public List selectAll() {
		return roomDAO.selectAll();
	}

	@Override
	public Room select(int room_id) {
		return roomDAO.select(room_id);
	}

	@Override
	public void insert(Room room) throws DMLException {
		roomDAO.insert(room);
	}

	@Override
	public void update(Room room) throws DMLException {
		roomDAO.update(room);
	}

	@Override
	public void delete(int room_id) throws DMLException {
		roomDAO.delete(room_id);
	}

}
