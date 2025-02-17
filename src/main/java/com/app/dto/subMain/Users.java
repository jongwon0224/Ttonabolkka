package com.app.dto.subMain;

import lombok.Data;

@Data
public class Users {

	int id;
	String username;
	String nickname;
	String email;
	String password;
	int userStatus; //1:회원, 2:관리자, 3:휴먼, 4:정지 etc.
}
