package com.app.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.main.Card;
import com.app.service.main.MainService;


@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@GetMapping("/")
	public String root() {
		return "redirect:/main/main";
	}
	
	@GetMapping("/main")
	public String main(Model model) {
		
		List<Card> cardList = mainService.findPlaceByRegion();
		
		model.addAttribute("cardList",cardList);
		
		return "main/main";
	}
	
	

}
