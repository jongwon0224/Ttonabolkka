package com.app.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.user.User;
import com.app.service.user.UserService;

@Controller
public class MyPageController {

	@Autowired
	UserService userService;

	@GetMapping("/login/mypage")
	public String mypage() {

		return "login/mypage";
	}

	@PostMapping("/login/mypage")
	public String modifyUserAction(User user) {

		System.out.println(user);

		int result = userService.modifyUser(user);

		if (result > 0) {
			return "redirect:/main";
		} else {
			return "redirect:/login/mypage/";
		}

	}
	
	@PostMapping("/login/mypage/remove")
	public String removeUserAction(User user, Model model) {
		
		System.out.println(user);
		
		User removeUser = userService.checkUserLogin(user);
				
		if (removeUser == null) { // 아이디X? 아이디O&비번X null
			
			model.addAttribute("loginError", "비밀번호가 잘못 되었습니다. 비밀번호를 정확히 입력해 주세요.");
			
			return "login/mypage";
			
		} else { // 아이디&비번이 맞으면 removeUser
			
			//삭제 코드 꼭 넣어라!!!
			userService.removeUser(removeUser);
			
			return "redirect:/main";
		}
	}
	

}
