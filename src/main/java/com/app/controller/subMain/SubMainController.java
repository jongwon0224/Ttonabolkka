package com.app.controller.subMain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.dto.subMain.Places;


@Controller
public class SubMainController {
	
	@GetMapping("/subMain")
	public String subMain(Model model) {
		List<Places> placesList = new ArrayList<Places>();
		
		Places attraction1 = new Places();
		Places attraction2 = new Places();
		Places attraction3 = new Places();
		Places themepark1 = new Places();
		Places themepark2 = new Places();
		Places themepark3 = new Places();
		Places hotplace1 = new Places();
		Places hotplace2 = new Places();
		Places hotplace3 = new Places();
				
		attraction1.setName("첨성대");
		attraction2.setName("불국사");
		attraction3.setName("석굴암");
		themepark1.setName("경주월드");
		themepark2.setName("캘리포니아 비치");
		themepark3.setName("경주 버드파크");
		hotplace1.setName("황리단길");
		hotplace2.setName("첨성대 핑크뮬리");
		hotplace3.setName("추억의 달동네");
		
		attraction1.setDescription("/img/cheomseongdae.webp");
		attraction2.setDescription("/img/bulguksa.jpg");
		attraction3.setDescription("/img/seokguram.jpg");
		themepark1.setDescription("/img/gyeongjuworld.jpg");
		themepark2.setDescription("/img/californiabeach.jpg");
		themepark3.setDescription("/img/birdpark.jpg");
		hotplace1.setDescription("/img/hwangroad.jpg");
		hotplace2.setDescription("/img/pinkflower.jpg");
		hotplace3.setDescription("/img/slum.jpg");

		placesList.add(attraction1);
		placesList.add(attraction2);
		placesList.add(attraction3);
		placesList.add(themepark1);
		placesList.add(themepark2);
		placesList.add(themepark3);
		placesList.add(hotplace1);
		placesList.add(hotplace2);
		placesList.add(hotplace3);
		
		model.addAttribute("placesList", placesList);
		
		return "subMain/subMain";
	}
	
	
	
}
