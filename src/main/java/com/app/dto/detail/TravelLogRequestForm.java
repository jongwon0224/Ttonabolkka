package com.app.dto.detail;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TravelLogRequestForm {
	
	String id;
	String name;
	MultipartFile travelLogImg;

}
