package com.app.controller.subMain;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dao.subMain.SubMainDAO;
import com.app.dto.subMain.Areas;
import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;
import com.app.service.subMain.SubMainService;
import com.app.service.api.EatHtpService;

@Controller
public class SubMainController {

	@Autowired
	SubMainService subMainService;

	@Autowired
	SubMainDAO subMainDAO;
	
	@Autowired
	EatHtpService eatHtpService;

	@GetMapping("/subMain")
	public String subMain(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int pageSize,
			@RequestParam(required = false) Integer categoriesId, @RequestParam(required = false) Integer areasId,
			Model model) throws IOException {

		//api디버깅
		//places 확인
		int countPlaces = eatHtpService.saveEatHtpPlaces().size(); 
		System.out.println(countPlaces + "개 저장성공!!");
		
		
		Map<String, Object> params = new HashMap<>();
		params.put("offset", (page - 1) * pageSize);
		params.put("limit", pageSize);

		if (categoriesId != null) {
			params.put("categoriesId", categoriesId);
		}

		if (areasId != null) {
			params.put("areasId", areasId);
		}

//		System.out.println(params);
		
		// 필터 + 페이지네이션 기능 서비스에 매개변수 전달
		List<Places> placesList = subMainService.findPlacesWithFilters(params);
		
		// api사진 해당 업체에서 업로드가 안되어있어서 임의로 변경. => 정규식뭔데?
		for(Places p : placesList) {
			String description = p.getDescription();
			
			Pattern pattern = Pattern.compile("<ul[^>]*>.*?</ul>", Pattern.DOTALL);
			Matcher matcher = pattern.matcher(description);
			
			description = matcher.replaceAll("");
			p.setDescription(description);
		}

		
		// 카테고리 리스트 가져옴
		List<Categories> categoriesList = subMainService.findCategoriesList();
		// 지역 리스트 가져옴
		List<Areas> areasList = subMainService.findAreasList();

		// totalPage -> 페이지네이션 구현용
		int totalPlaces = subMainService.getTotalPlaces(params);
		int totalPages = (int) Math.ceil((double) totalPlaces / pageSize);

		System.out.println(placesList);
		
		model.addAttribute("placesList", placesList); // 필터 + 페이지네이션 적용된 리스트 넘어감
		model.addAttribute("categoriesList", categoriesList); // 카테고리 리스트 (관광지, 테마파크, 핫플레이스)
		model.addAttribute("areasList", areasList); // 지역 리스트
		model.addAttribute("currentPage", page); // 현재 페이지
		model.addAttribute("totalPages", totalPages); // 페이지 총 개수
		model.addAttribute("categories", categoriesId); // 카테고리 필터에 아이디 넘겨줌

		return "/subMain/subMain";
	}

}