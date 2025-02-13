package com.app.service.subMain.api;

import java.io.IOException;
import java.util.List;

import com.app.dto.subMain.Places;

public interface EatHtpService {
	
	List<Places> eatHtpPlacesService() throws IOException; // json타입으로 파싱
}
