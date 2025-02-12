package com.app.service.subMain.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.subMain.SubMainDAO;
import com.app.dto.subMain.Areas;
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
	public List<Areas> findAreasList() {
		
		List<Areas> areasList = subMainDAO.findAreasList();
		
		return areasList;
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

	
	
}