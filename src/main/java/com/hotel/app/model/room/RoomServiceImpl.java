package com.hotel.app.model.room;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hotel.app.aop.exception.DMLException;
import com.hotel.app.aop.exception.FileException;
import com.hotel.app.common.file.FileManager;
import com.hotel.app.domain.Room;
import com.hotel.app.domain.SubCategory;
import com.hotel.app.model.subcategory.SubCategoryDAO;
import com.hotel.app.model.topcategory.TopCategoryDAO;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Inject
	@Qualifier("oracleRoomDAO")
	private RoomDAO roomDAO;

	@Inject
	@Qualifier("oracleSubCategoryDAO")
	private SubCategoryDAO subCategoryDAO;
	
	@Inject
	@Qualifier("oracleTopCategoryDAO")
	private TopCategoryDAO topCategoryDAO;
	
	@Autowired(required=false)
	private FileManager fileManager;
	
	
	@Override
	public List selectAll() {
		return subCategoryDAO.selectAll();
	}


	@Override
	public List isReserveList() {
		return subCategoryDAO.isReserveList();
	}

	@Override
	public Room select(int room_id) {
		return roomDAO.select(room_id);
	}

	@Override
	public void insert(SubCategory subCategory, MultipartFile myFile, String realPath) throws DMLException, FileException {
		Room room = subCategory.getRoom();
		
		String filename = FileManager.saveFile(myFile, realPath);
		room.setFilename(filename);
		
		roomDAO.insert(room);
		
		subCategoryDAO.insert(subCategory);
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
