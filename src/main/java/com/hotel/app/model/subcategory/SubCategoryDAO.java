package com.hotel.app.model.subcategory;

import java.util.List;

import com.hotel.app.domain.SubCategory;


public interface SubCategoryDAO {
	public List selectAll();
	public List isReserveList();
	public SubCategory select(int subCategory_id);
	public void insert(SubCategory subCategory);
	public void update(SubCategory subCategory);
	public void delete(int subCategory_id);
}
