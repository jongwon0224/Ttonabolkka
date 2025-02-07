package com.app.controller.subMain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.dto.subMain.Places;
import com.app.service.subMain.SubMainService;


@Controller
public class SubMainController {
	
	
	@Autowired
	SubMainService subMainService;
	
	
	@GetMapping("/subMain")
	public String subMain(Model model) {
		List<Places> placesList = subMainService.findPlacesList();
		System.out.println(placesList);
		model.addAttribute("placesList", placesList);
		
		return "subMain/subMain";
	}
	
	
	
}
