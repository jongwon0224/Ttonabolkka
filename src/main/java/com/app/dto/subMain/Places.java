package com.app.dto.subMain;

import java.util.List;

import lombok.Data;

@Data
public class Places {

//	관광지 : 첨성대, 불국사, 석굴암
//	테마파크 : 경주월드, 캘리포니아 비치, 경주 버드파크
//	핫플 : 황리단길, 첨성대 핑크뮬리, 추억의 달동네
	
	int id; //pk값 순번
	String name; //이름 => CON_TITLE
	String description; //설명 => CON_CONTENT
	int areaId; //  //지역ID(FK)
	String address; //주소 => CON_DESC1
	double latitude; //위도 => CON_LATITUDE
	double longitude; //경도 => CON_LONGITUDE
	int categoryId; //관광지 유형(FK)
	String imageUrl; // 대표이미지 URL주소 => LINKURL
	
    String mainImageUrl;  // 대표 사진 URL
	String imageUrls;  // 여러 이미지 URL을 저장할 리스트 필드
	List<String> subImageUrls;  // 서브 사진 URL 리스트

	
}
