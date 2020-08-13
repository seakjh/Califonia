package com.hotel.app.model.subcategory;

import java.util.List;
import java.util.Map;

import com.hotel.app.domain.Reservation;
import com.hotel.app.domain.SubCategory;


public interface SubCategoryDAO {
	public List selectAll();
	public List selectAll(Map prop);
	public List selectAll(Reservation reservation);
	public List isReserveList();
	public SubCategory select(int subcategory_id);
	public void insert(SubCategory subCategory);
	public void update(SubCategory subCategory);
	public void delete(int subcategory_id);
}
