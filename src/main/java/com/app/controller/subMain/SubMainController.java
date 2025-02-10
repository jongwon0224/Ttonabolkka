package com.app.controller.subMain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
						Model model) {

		Map<String, Integer> paginationParams = new HashMap<>();
		paginationParams.put("offset", (page-1) * pageSize); 
		paginationParams.put("limit", pageSize); // 한페이지 출력할 데이터 개수

		List<Places> placesList = subMainService.findPlacesByPage(paginationParams);
		List<Categories> categoriesList = subMainService.findCategoriesList();
		
		int totalPlaces = subMainService.getTotalPlaces(); //전체 데이터 개수
		int totalPages = (int) Math.ceil((double) totalPlaces / pageSize); //전체 페이지수

		model.addAttribute("placesList", placesList);
		model.addAttribute("categoriesList", categoriesList);
		model.addAttribute("currentPage", page); // 현재 페이지
		model.addAttribute("totalPages", totalPages); //총 페이지네이션 번호 : 2

		return "/subMain/subMain";	
	}
	
	
	
	@PostMapping("/subMain")
	public String categoryFilterAction(@RequestParam List<String> categoriesId, Model model) {

		if(categoriesId == null || categoriesId.isEmpty()) {
			categoriesId = new ArrayList<>();
		}
		System.out.println(categoriesId);
		
		List<Places> placesList = subMainService.findPlacesByCategoriesId(categoriesId);
		List<Categories> categoriesList = subMainService.findCategoriesList();
		
		System.out.println("필터시 " + placesList);
		System.out.println("필터시 " + categoriesList);
		
		model.addAttribute("placesList", placesList);
		model.addAttribute("categoriesList", categoriesList);
		
		return "/subMain/subMain";
	}
	
	
	@GetMapping("/subMain/page")
	public String paginationAction(@RequestParam(defaultValue = "1") int page,
									@RequestParam(defaultValue = "5") int pageSize,
									Model model) {
		
		Map<String, Integer> paginationParams = new HashMap<>();
		paginationParams.put("offset", (page-1) * pageSize); 
		paginationParams.put("limit", pageSize); // 한페이지 출력할 데이터 개수
		
		List<Places> placesList = subMainService.findPlacesByPage(paginationParams);
		int totalPlaces = subMainService.getTotalPlaces(); //전체 데이터 개수
		int totalPages = (int) Math.ceil((double) totalPlaces / pageSize); //전체 페이지수
		
		model.addAttribute("placesList", placesList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		
		return "/subMain/subMain";	
	}
	
	/*
	 * @GetMapping("/subMain")
public String subMain(@RequestParam(defaultValue = "1") int page,
                      @RequestParam(defaultValue = "5") int pageSize,
                      @RequestParam(required = false) Integer category,
                      @RequestParam(required = false) String rating,
                      Model model) {
    
    Map<String, Object> params = new HashMap<>();
    params.put("offset", (page - 1) * pageSize);
    params.put("limit", pageSize);
    if (category != null) {
        params.put("category", category);
    }
    if (rating != null) {
        params.put("rating", rating);
    }

    List<Places> placesList = subMainService.findPlacesWithFilters(params);
    int totalPlaces = subMainService.getTotalPlaces(params);
    int totalPages = (int) Math.ceil((double) totalPlaces / pageSize);
    
    model.addAttribute("placesList", placesList);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", totalPages);
    model.addAttribute("category", category);  // 필터 값도 넘겨줌
    model.addAttribute("rating", rating);     // 필터 값도 넘겨줌
    
    return "/subMain/subMain";
}

	 * 
	 * 
	 * 
	 * */
  
}