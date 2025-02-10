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
	int getTotalPlaces();
	
	/**
	 * @Override
public List<Places> findPlacesWithFilters(Map<String, Object> params) {
    return subMainDAO.findPlacesWithFilters(params);
}

@Override
public int getTotalPlaces(Map<String, Object> params) {
    return subMainDAO.getTotalPlaces(params);
}
	 */
}