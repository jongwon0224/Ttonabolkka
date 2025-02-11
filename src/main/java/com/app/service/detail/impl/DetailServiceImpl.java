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
    private DetailDAO detailDAO;

    // id로 관광지 상세 정보 조회
    @Override
    public List<Places> getPlaceDetail(int id) {
        return detailDAO.getPlaceDetail(id);  // id로 장소 상세 정보 조회
    }

    // placeName으로 관광지 상세 정보 조회
    @Override
    public List<Places> getPlaceDetailByName(String placeName) {
        return detailDAO.getPlaceDetailByName(placeName);  // 이름으로 장소 상세 정보 조회
    }

    // 관광지 이미지 목록 조회
    @Override
    public List<String> getPlaceImages(int id) {
        return detailDAO.getPlaceImages(id);  // 이미지 URL 목록 조회
    }
}
