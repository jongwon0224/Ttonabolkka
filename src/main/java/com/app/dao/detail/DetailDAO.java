package com.app.dao.detail;

import com.app.dto.detail.Places;
import java.util.List;

public interface DetailDAO {
    // id로 관광지 상세 정보 조회
	List<Places> getPlaceDetail(int id);

    // placeName으로 관광지 상세 정보 조회
    List<Places> getPlaceDetailByName(String placeName);

    // 관광지 이미지 목록 조회
    List<String> getPlaceImages(int id);
}
