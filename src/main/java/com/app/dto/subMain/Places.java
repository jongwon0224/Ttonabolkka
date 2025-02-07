package com.app.dto.subMain;

import lombok.Data;

@Data
public class Places {

	int id, latitude, longtitude, category_id;
	String name, address, description;
	
//	관광지 : 첨성대, 불국사, 석굴암
//	테마파크 : 경주월드, 캘리포니아 비치, 경주 버드파크
//	핫플 : 황리단길, 첨성대 핑크뮬리, 추억의 달동네
}
