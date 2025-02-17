package com.app.dao.main;

import java.util.List;

import com.app.dto.main.Card;

public interface MainDAO {
	
	List<Card> findPlaceByRegion();

}
