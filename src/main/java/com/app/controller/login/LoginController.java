package com.app.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.user.User;
import com.app.service.user.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@GetMapping("/login")
	public String login() {
		return "login/login";
	}

	@PostMapping("/login")
	public String loginAction(User user, HttpSession session) {
		
		// user id pw 화면으로부터 전달
		// name userType : null

		// user 로그인 할 수 있게 정보가 들어있는지! 확인!
		User loginUser = userService.checkUserLogin(user);

		if (loginUser == null) { // 아이디X? 아이디O&비번X null
			
			return "login/login";
			
		} else { // 아이디&비번이 맞으면 loginUser
			// 로그인 정보가 맞아서 로그인 성공
//			 session.setAttribute("loginUser", loginUser);
			session.setAttribute("loginUserId", loginUser.getNickname());

			return "redirect:/main";
		}
	}
	
	

}