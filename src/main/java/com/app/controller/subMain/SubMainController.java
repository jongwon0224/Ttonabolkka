package com.app.controller.subMain;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.taglibs.standard.tag.el.sql.SetDataSourceTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.subMain.Areas;
import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;
import com.app.service.subMain.SubMainService;

@Controller
public class SubMainController {

	@Autowired
	SubMainService subMainService;


	@GetMapping("/subMain")
	public String subMain(@RequestParam(defaultValue = "1") int page,
						@RequestParam(defaultValue = "5") int pageSize,
						@RequestParam(required = false) Integer categoriesId,
						@RequestParam(required = false) Integer areasId,
						Model model) {

		Map<String, Object> params = new HashMap<>();
		params.put("offset", (page - 1) * pageSize);
		params.put("limit", pageSize);
		
		if (categoriesId != null) {
			params.put("categoriesId", categoriesId);
		}
		
		if (areasId != null) {
			params.put("areasId", areasId);
		}

		System.out.println(params);
		
		List<Places> placesList = subMainService.findPlacesWithFilters(params);
		//카테고리 리스트 가져옴
		List<Categories> categoriesList = subMainService.findCategoriesList();
		//지역 리스트 가져옴
		List<Areas> areasList = subMainService.findAreasList();
		
		int totalPlaces = subMainService.getTotalPlaces(params);
		int totalPages = (int) Math.ceil((double) totalPlaces / pageSize);

		System.out.println(placesList);
		System.out.println(categoriesList);
		
		model.addAttribute("placesList", placesList);
		model.addAttribute("categoriesList", categoriesList); //카테고리 리스트 (관광지, 테마파크, 핫플레이스)
		model.addAttribute("areasList", areasList); // 지역 리스트
		model.addAttribute("currentPage", page); // 현재 페이지
		model.addAttribute("totalPages", totalPages); // 페이지 총 개수
		model.addAttribute("categories", categoriesId); // 카테고리 필터에 아이디 넘겨줌

		return "/subMain/subMain";
	}
	
	
	@GetMapping("/prac")
	public String prac() {
		return "/subMain/prac";
	}
	

}