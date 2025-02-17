package com.app.controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.service.user.UserService;

@Controller
public class MyPageController {

	@Autowired
	UserService userService;

	@GetMapping("/login/mypage")
	public String mypage() {

		return "login/mypage";
	}
}
