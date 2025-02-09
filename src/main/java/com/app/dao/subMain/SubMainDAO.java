package com.app.dao.subMain;

import java.util.List;
import java.util.Map;

import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;

public interface SubMainDAO {

	
	List<Places> findPlacesList();
	List<Categories> findCategoriesList();
	List<Places> findPlacesByCategoriesId(List<String> categoriesId);
	List<Places> findPlacesByPage(Map<String, Integer> paginationParams);
	Integer getTotalPages();
}
