package com.app.dao.subMain.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.subMain.SubMainDAO;
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
	public List<Places> findPlacesByCategoriesId(List<String> categoriesId) {
		
		List<Places> placesList = sqlSessionTemplate.selectList("subMain_mapper.findPlacesByCategoriesId", categoriesId);
			
		return placesList;
	}


	@Override
	public List<Places> findPlacesByPage(Map<String, Integer> paginationParams) {
		
		List<Places> paginationList = sqlSessionTemplate.selectList("subMain_mapper.findPaginationList", paginationParams);
		
		return paginationList;
	}


	@Override
	public int getTotalPlaces() {
		
		int totalPlaces = sqlSessionTemplate.selectOne("subMain_mapper.getTotalPlaces");
		System.out.println("전체 데이터 개수: " + totalPlaces);
		
		return totalPlaces;
	}

}