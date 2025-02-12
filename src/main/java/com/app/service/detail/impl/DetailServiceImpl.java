package com.app.service.detail.impl;

import com.app.dao.detail.DetailDAO;
import com.app.dto.detail.Places;
import com.app.service.detail.DetailService;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailServiceImpl implements DetailService {

    @Autowired
    DetailDAO detailDAO;

    // id로 관광지 상세 정보 조회
    @Override
    public Places getPlaceDetail(int id) {
    	
    	Places places = detailDAO.getPlaceDetail(id);  // id로 장소 상세 정보 조회
    	
        return places;
    }

    // 관광지 이미지 목록 조회
    @Override
    public List<String> getPlaceImages(int id) {
    	
    	List<String> imgList = detailDAO.getPlaceImages(id);  // 이미지 URL 목록 조회
    	
        return imgList;
    }
}
