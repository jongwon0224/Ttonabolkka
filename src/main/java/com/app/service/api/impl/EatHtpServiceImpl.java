package com.app.service.api.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.api.EatHtpDAO;
import com.app.dao.subMain.SubMainDAO;
import com.app.dto.subMain.Places;
import com.app.dto.subMain.PlacesImg;
import com.app.service.api.EatHtpService;

@Repository
public class EatHtpServiceImpl implements EatHtpService {

	@Autowired
	SubMainDAO subMainDAO;

	@Autowired
	EatHtpDAO eatHtpDAO;

	// 장소 저장
	public List<Places> saveEatHtpPlaces() throws IOException {
		// api데이터받아오기

		String jsonText = eatHtpDAO.eatHtpDAO();
		System.out.println(jsonText);

		List<Places> placesList = new ArrayList<>();

		try {

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonText);
			JSONObject response = (JSONObject) jsonObj.get("response");

			// 헤더 파싱
			JSONObject header = (JSONObject) response.get("header");
//			System.out.println(header.get("resultCode"));
//			System.out.println(header.get("resultMsg"));

			// 바디 파싱
			JSONObject body = (JSONObject) response.get("body");
//			System.out.println(body.get("totalCount"));

			// 아이템 파싱
			JSONObject items = (JSONObject) body.get("items");
			JSONArray itemArr = (JSONArray) items.get("item");

			// 아이템 배열
			for (Object obj : itemArr) {
				JSONObject item = (JSONObject) obj;

				Places places = new Places();

				places.setName(convertValueToString(item.get("CON_TITLE")));
				places.setDescription(convertValueToString(item.get("CON_CONTENT")));
				places.setAddress(convertValueToString(item.get("CON_DESC1")));
				places.setLatitude(convertValueToDouble(item.get("CON_LATITUDE")));
				places.setLatitude(convertValueToDouble(item.get("CON_LONGITUDE")));
				places.setCategoryId(3);
				places.setAreaId(1);

				subMainDAO.saveEatHtpPlaces(places);


				PlacesImg placesImg = new PlacesImg();
				placesImg.setId(places.getId());
				placesImg.setImageUrl("https://" + convertValueToString(item.get("CON_IMGFILENAME")));

				subMainDAO.saveEatHtpPlacesImg(placesImg);

//				placesList.add(placesImg);

//				System.out.println(placesList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return placesList;
	}
	
	

	// double값 변환 메서드
	private double convertValueToDouble(Object value) {
		try {
			return value != null ? Double.parseDouble(value.toString()) : 0.0;
		} catch (NumberFormatException e) {
			return 0.0; // 기본값 설정
		}
	}

	// String값 변환 메서드
	private String convertValueToString(Object value) {
		return value != null ? value.toString() : "0";
	}
}
