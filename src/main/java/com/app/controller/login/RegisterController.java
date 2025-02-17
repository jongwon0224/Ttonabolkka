package com.app.controller.login;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.user.User;
import com.app.service.user.UserService;

@Controller
public class RegisterController {

	@Autowired
	UserService userService;

	// 회원가입

	@GetMapping("/login/register")
	public String register() {
		return "login/register";
	}

	@PostMapping("/login/register")
	public String registerAction(@Valid @ModelAttribute User user, BindingResult br) {

		// 유효성검증!
		if (br.hasErrors()) {
			List<ObjectError> errorList = br.getAllErrors();
			for (ObjectError er : errorList) {

			}
			return "login/register";
		}
		int result = userService.saveUser(user);
		
		System.out.println(result);

		if (result > 0) {
			
			return "redirect:/login";

		} else {

			return "login/register";
		}
		
		
	}
}
