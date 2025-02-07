package com.app.dao.subMain.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.subMain.SubMainDAO;
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

}
