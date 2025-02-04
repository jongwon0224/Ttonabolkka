package com.app.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class MainController {
	
	
	@GetMapping("/main")
	public String main() {
		return "main/main";
	}
	
	@GetMapping("/")
	public String root() {
		return "redirect:/main/main";
	}

}
