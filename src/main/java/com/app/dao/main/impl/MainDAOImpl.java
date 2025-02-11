package com.app.dao.main.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.main.MainDAO;
import com.app.dto.main.Card;

@Repository
public class MainDAOImpl implements MainDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Card> findPlaceByRegion() {
		
		List<Card> cardList = sqlSessionTemplate.selectList("main_mapper.findPlaceByRegion");
		
		return cardList;
	}

}
