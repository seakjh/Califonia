package com.hotel.app.domain;
import lombok.Data;

@Data
public class Room {
	private int room_id;
	private String name;
	private int max_number;
	private int room_size;
	private String filename;
	
}
