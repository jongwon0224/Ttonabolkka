package com.app.dto.detail;

import lombok.Data;
import java.util.List;

@Data
public class Places {
     int id;
    String name;
    String description;
    String address;
    String imageUrls;  // 여러 이미지 URL을 저장할 리스트 필드
    String categoryId;
    String mainImageUrl;  // 대표 사진 URL
    List<String> subImageUrls;  // 서브 사진 URL 리스트
}