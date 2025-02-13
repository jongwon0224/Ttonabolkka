package com.app.service.subMain.api.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dto.subMain.Places;
import com.app.dto.subMain.PlacesImg;
import com.app.repository.dao.EatHtpDAO;
import com.app.repository.dao.impl.EatHtpDAOImpl;
import com.app.service.subMain.api.EatHtpService;

@Repository
public class EatHtpServiceImpl implements EatHtpService {

	@Autowired
	EatHtpDAO eatHtpDAO;

	public List<Places> eatHtpPlacesService() throws IOException {

		String jsonText = eatHtpDAO.eatHtpDAO();

		List<Places> placesList = new ArrayList<>();

		try {

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonText);
			JSONObject response = (JSONObject) jsonObj.get("response");

			// 헤더 파싱
			JSONObject header = (JSONObject) response.get("header");
			System.out.println(header.get("resultCode"));
			System.out.println(header.get("resultMsg"));

			// 바디 파싱
			JSONObject body = (JSONObject) response.get("body");
			System.out.println(body.get("totalCount"));

			// 아이템 파싱
			JSONObject items = (JSONObject) body.get("items");
			JSONArray itemArr = (JSONArray) items.get("item");

			// 아이템 배열
			for (Object obj : itemArr) {
				JSONObject item = (JSONObject) obj;

				Places p1 = new Places();

				p1.setName(convertValueToString(item.get("CON_TITLE")));
				p1.setDescription(convertValueToString(item.get("CON_CONTENT")));
				p1.setAddress(convertValueToString(item.get("CON_DESC1")));
				p1.setLatitude(convertValueToDouble(item.get("CON_LATITUDE")));
				p1.setLatitude(convertValueToDouble(item.get("CON_LONGITUDE")));

				placesList.add(p1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return placesList;
	}

	
	public PlacesImg eatHtpPlacesImgService() throws IOException {

		String jsonText = eatHtpDAO.eatHtpDAO();
		

		try {

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonText);
			JSONObject response = (JSONObject) jsonObj.get("response");

			// 헤더 파싱
			JSONObject header = (JSONObject) response.get("header");
			System.out.println(header.get("resultCode"));
			System.out.println(header.get("resultMsg"));

			// 바디 파싱
			JSONObject body = (JSONObject) response.get("body");
			System.out.println(body.get("totalCount"));

			// 아이템 파싱
			JSONObject items = (JSONObject) body.get("items");
			JSONArray itemArr = (JSONArray) items.get("item");

			// 아이템 배열
			for (Object obj : itemArr) {
				JSONObject item = (JSONObject) obj;

				PlacesImg placesImg = new PlacesImg();

				placesImg.setImageUrl(convertValueToString(item.get("LINKURL")));

				
				return placesImg;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
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
