package com.app.service.subMain;

import java.util.List;
import java.util.Map;

import com.app.dto.subMain.Areas;
import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;

public interface SubMainService {

	List<Places> findPlacesList();
	List<Categories> findCategoriesList();
	List<Areas> findAreasList();
	
	List<Places> findPlacesWithFilters(Map<String, Object> params);
	int getTotalPlaces(Map<String, Object> params);
}