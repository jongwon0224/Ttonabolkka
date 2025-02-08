package com.app.service.subMain.impl;

import java.util.List;

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
	public List<Places> findPlacesByCategoriesId(List<String> categoriesIde) {
		
		List<Places> placesList = subMainDAO.findPlacesByCategoriesId(categoriesIde);
		
		return placesList;
	}

}
