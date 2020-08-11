package com.hotel.app.model.room;

import java.util.List;

import com.hotel.app.domain.Room;

public interface RoomService {
	public List selectAll();
	public Room select(int room_id);
	public void insert(Room room);
	public void update(Room room);
	public void delete(int room_id);
}
