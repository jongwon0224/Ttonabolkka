package com.app.service.subMain.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.subMain.SubMainDAO;
import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;
import com.app.service.subMain.SubMainService;

@Service
public class SubMainServiceImpl implements SubMainService{

	
	@Autowired
	SubMainDAO subMainDAO;
	
	
	@Override
	public List<Places> findPlacesList() {
			
		List<Places> placesList = subMainDAO.findPlacesList();
		
		return placesList;
	}

	@Override
	public List<Categories> findCategoriesList() {
		
		List<Categories> categoriesList = subMainDAO.findCategoriesList();
		return categoriesList;
	}

	
	
	@Override
	public List<Places> findPlacesWithFilters(Map<String, Object> params) {
		List<Places> placesList = subMainDAO.findPlacesWithFilters(params);
		return placesList;
	}

	@Override
	public int getTotalPlaces(Map<String, Object> params) {
		int result = subMainDAO.getTotalPlaces(params);
		return result;
	}

//	@Override
//	public List<Places> findPlacesByCategoriesId(List<String> categoriesId) {
//		
//		List<Places> placesList = subMainDAO.findPlacesByCategoriesId(categoriesId);
//		
//		return placesList;
//	}
//
//	@Override
//	public List<Places> findPlacesByPage(Map<String, Integer> paginationParams) {
//		
//		List<Places> paginationList = subMainDAO.findPlacesByPage(paginationParams);
//		
//		return paginationList;
//	}
//
//	@Override
//	public int getTotalPlaces() {
//		
//		int totalPlaces = subMainDAO.getTotalPlaces();
//		
//		return totalPlaces;
//	}

}