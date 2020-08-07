package com.hotel.app.model.topcategory;

import java.util.List;

import com.hotel.app.domain.TopCategory;


public interface TopCategoryDAO {
	public List selectAll();
	public TopCategory select(int topCategory_id);
	public void insert(TopCategory topCategory);
	public void update(TopCategory topCategory);
	public void delete(int topCategory_id);
}
