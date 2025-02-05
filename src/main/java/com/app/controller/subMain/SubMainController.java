package com.app.controller.subMain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.dto.Places;


@Controller
public class SubMainController {
	
	@GetMapping("/subMain")
	public String subMain(Model model) {
		List<Places> placesList = new ArrayList<Places>();
		
		Places attraction1 = new Places();
		Places attraction2 = new Places();
		Places attraction3 = new Places();
				
		attraction1.setName("첨성대");
		attraction2.setName("불국사");
		attraction3.setName("석굴암");
		
		attraction1.setDescription("/img/cheomseongdae.webp");
		attraction2.setDescription("/img/bulguksa.jpg");
		attraction3.setDescription("/img/seokguram.jpg");
		
		placesList.add(attraction1);
		placesList.add(attraction2);
		placesList.add(attraction3);
		
		model.addAttribute("placesList", placesList);
		
		return "subMain/subMain";
	}
	
	
	
}
