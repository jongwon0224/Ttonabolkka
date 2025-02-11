package com.app.dto.detail;

import lombok.Data;
import java.util.List;

@Data
public class Places {
    private int id;
    private String name;
    private String description;
    private String address;
    private List<String> imageUrls;  // 여러 이미지 URL을 저장할 리스트 필드
}