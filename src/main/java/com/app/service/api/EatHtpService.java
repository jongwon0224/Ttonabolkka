package com.app.service.api;

import java.io.IOException;
import java.util.List;

import com.app.dto.subMain.Places;
import com.app.dto.subMain.PlacesImg;

public interface EatHtpService {
	
	List<Places> saveEatHtpPlaces() throws IOException; // places api 파싱
}
