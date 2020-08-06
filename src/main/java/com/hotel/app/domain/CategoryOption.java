package com.hotel.app.domain;
import lombok.Data;

@Data
public class CategoryOption {
	private int category_option_id;
	private TopCategory topCategory;
	private BedOption bedOption;
	
}
