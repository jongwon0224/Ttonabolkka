package com.app.dto.detail;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TravelLogRequestForm {
	
	int id;
	String name;
	MultipartFile travelLogImg;

}
