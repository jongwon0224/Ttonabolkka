package com.app.dto.subMain;

import lombok.Data;

@Data
public class Places {

//	관광지 : 첨성대, 불국사, 석굴암
//	테마파크 : 경주월드, 캘리포니아 비치, 경주 버드파크
//	핫플 : 황리단길, 첨성대 핑크뮬리, 추억의 달동네
	
	int id; //pk값 순번
	String name; //이름
	String description; //설명
	int areaId; //  //지역ID(FK)
	String address; //주소
	int latitude; //위도
	int longitude; //경도
	int categoryId; //관광지 유형(FK)
	String imageUrl; // 대표이미지 URL주소
	

	
}
