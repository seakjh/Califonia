package com.hotel.app.domain;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Room {
	private int room_id;
	private String name;
	private int max_number;
	private int room_size;
	private String filename;
	private MultipartFile myFile; //데이터를 받기 위한 변수 
	
}
