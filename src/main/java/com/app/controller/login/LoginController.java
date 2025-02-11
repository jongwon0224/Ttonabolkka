package com.app.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

	@GetMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@GetMapping("/login/register")
	public String register() {
		return "login/register";
	}
	
//	@PostMapping("/login/register")
//	public String signupAction(User user) {
//		int result = userService.saveUser(user);
//		
//		System.out.println("회원가입 처리 결과 : " + result);
//		
//		if(result > 0) {
//			return "redirect:/main";
//		} else {
//			return "customer/signup";			
//		}
//	}


}