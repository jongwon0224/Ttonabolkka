package com.app.dto.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class User {
	String id;

	@NotBlank
	@Size(min = 8, max=12)
	String password;
	
	
	String username;
	String tel;
	
	@NotBlank
	String nickname;
}
