package com.app.dao.subMain.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.subMain.SubMainDAO;
import com.app.dto.subMain.Areas;
import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;

@Repository
public class SubMainDAOImpl implements SubMainDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public List<Places> findPlacesList() {
		
		List<Places> placesList = sqlSessionTemplate.selectList("subMain_mapper.findPlacesList");
		
		return placesList;
	}


	@Override
	public List<Categories> findCategoriesList() {
		
		List<Categories> categoriesList = sqlSessionTemplate.selectList("subMain_mapper.findCategoriesList");
		
		return categoriesList;
	}
	
	@Override
	public List<Areas> findAreasList() {
		
		List<Areas> areasList = sqlSessionTemplate.selectList("subMain_mapper.findAreasList");
		
		return areasList;
	}

	@Override
	public List<Places> findPlacesWithFilters(Map<String, Object> params) {
		
		List<Places> placesList = sqlSessionTemplate.selectList("subMain_mapper.findPlacesWithFilters", params);
		
		return placesList;
	}

	@Override
	public int getTotalPlaces(Map<String, Object> params) {
		
		int result = sqlSessionTemplate.selectOne("subMain_mapper.getTotalPlacesWithFilters", params);
		
		return result;
	}


	


}