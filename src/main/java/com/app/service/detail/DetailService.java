package com.app.service.detail;

import com.app.dto.detail.Places;
import com.app.dto.detail.TravelLog;

import java.util.List;

public interface DetailService {
    // id로 관광지 상세 정보 조회
    Places getPlaceDetail(int id);

    // 관광지 이미지 목록 조회
    List<String> getPlaceImages(int id);
    
    // id로 TravelLog 불러오기
    List<TravelLog> findTravelLogListById(int placeId);
    
    //saveTravelLog 
    int saveTravelLog(TravelLog travelLog);
}
