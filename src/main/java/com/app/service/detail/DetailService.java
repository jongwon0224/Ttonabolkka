package com.app.service.detail;

import com.app.dto.detail.Places;
import java.util.List;

public interface DetailService {
    // id로 관광지 상세 정보 조회
    Places getPlaceDetail(int id);

    // 관광지 대표 이미지 조회
    String getMainImageUrl(int id);

    // 관광지 서브 이미지 목록 조회
    List<String> getSubImageUrls(int id);
}
