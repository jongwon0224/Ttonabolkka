package com.app.dto.detail;

import lombok.Data;

@Data
public class TravelLog {
	
	int id;
	int userId;
	int placeId;
	String title;
	String content;
	String createdAt;
		
}
