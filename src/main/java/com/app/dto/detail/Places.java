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
}