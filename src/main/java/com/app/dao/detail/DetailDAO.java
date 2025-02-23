package com.app.dao.detail;


import com.app.dto.detail.TravelLog;
import com.app.dto.subMain.Places;

import java.util.List;

public interface DetailDAO {
	// id로 관광지 상세 정보 조회
    Places getPlaceDetail(int id);

    // 관광지 대표 이미지 조회
    String getMainImageUrl(int id);

    // 관광지 서브 이미지 목록 조회
    List<String> getSubImageUrls(int id);
    
    // id로 TravelLog 불러오기
    List<TravelLog> findTravelLogListById(int placeId);
    
    
    //saveTravelLog 
    int saveTravelLog(TravelLog travelLog);
    
	
}
