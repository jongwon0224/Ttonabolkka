package com.app.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@GetMapping("/login/email")
	public String sighUp() {
		return "login/sighUp";
	}
	
	@GetMapping("/register")
	public String register() {
		return "login/register";
	}


}