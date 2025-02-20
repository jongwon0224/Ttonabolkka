package com.app.service.main.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.main.MainDAO;
import com.app.dto.main.Card;
import com.app.service.main.MainService;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	MainDAO mainDAO;

	@Override
	public List<Card> findPlaceByRegion() {
		
		List<Card> cardList = mainDAO.findPlaceByRegion();
		
		return cardList;
	}

}
