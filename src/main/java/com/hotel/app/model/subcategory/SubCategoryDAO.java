package com.hotel.app.model.subcategory;

import java.util.List;

import com.hotel.app.domain.SubCategory;


public interface SubCategoryDAO {
	public List selectAll();
	public List isReserveList();
	public SubCategory select(int subcategory_id);
	public void insert(SubCategory subCategory);
	public void update(SubCategory subCategory);
	public void delete(int subcategory_id);
}
