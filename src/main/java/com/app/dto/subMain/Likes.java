package com.app.dto.subMain;

import lombok.Data;

@Data
public class Likes {

	int id;
	int userId; //user_id는 users테이블의 id값 참조
	int placeId; //place_id는 places테이블 id참조
}
