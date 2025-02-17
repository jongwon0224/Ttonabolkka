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
	String fileName; //파일 이름 (FileInfo 파일이름)
		
}
