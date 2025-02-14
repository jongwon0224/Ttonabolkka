package com.app.dao.subMain;

import java.util.List;
import java.util.Map;

import com.app.dto.subMain.Areas;
import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;
import com.app.dto.subMain.PlacesImg;

public interface SubMainDAO {

	
	List<Places> findPlacesList();
	List<Categories> findCategoriesList();
	List<Areas> findAreasList();
	
	List<Places> findPlacesWithFilters(Map<String, Object> params);
	int getTotalPlaces(Map<String, Object> params);
	
	int saveEatHtpPlaces(Places places);
	int saveEatHtpPlacesImg(PlacesImg placesImg);
}