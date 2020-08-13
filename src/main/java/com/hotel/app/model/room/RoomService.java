package com.hotel.app.model.room;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hotel.app.domain.Room;
import com.hotel.app.domain.SubCategory;

public interface RoomService {
	public List selectAll();
	public List isReserveList();
	public SubCategory selectJoin(int subcategory_id);
	public Room select(int room_id);
	public void insert(SubCategory subCategory, MultipartFile myFile, String realPath);
	public void update(Room room);
	public void delete(int room_id);
}
