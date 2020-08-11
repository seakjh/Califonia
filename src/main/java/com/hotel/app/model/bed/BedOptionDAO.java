package com.hotel.app.model.bed;

import java.util.List;

import com.hotel.app.domain.BedOption;


public interface BedOptionDAO {
	public List selectAll();
	public BedOption select(int bed_option_id);
	public void insert(BedOption bedOption);
	public void update(BedOption bedOption);
	public void delete(int bed_option_id);
}
