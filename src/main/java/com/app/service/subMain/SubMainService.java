package com.app.service.subMain;

import java.util.List;
import java.util.Map;

import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;

public interface SubMainService {

	List<Places> findPlacesList();
	List<Categories> findCategoriesList();
	List<Places> findPlacesByCategoriesId(List<String> categoriesId);
	List<Places> findPlacesByPage(Map<String, Integer> paginationParams);
	Integer getTotalPages(int pageSize);
}
