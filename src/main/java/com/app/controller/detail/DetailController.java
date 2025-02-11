package com.app.controller.detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.app.dto.detail.Places;
import com.app.service.detail.DetailService;

@Controller
public class DetailController {

    @Autowired
    private DetailService detailService;

    // id로 관광지 상세 정보 조회
    @GetMapping("/detail/{id}")
    public String getDetailById(@PathVariable("id") int id, Model model) {
        List<Places> placesList = detailService.getPlaceDetail(id);
        if (!placesList.isEmpty()) {
            Places place = placesList.get(0);
            model.addAttribute("places", place);
            model.addAttribute("images", detailService.getPlaceImages(id));
        }
        return "detail/detail";
    }

    // 이름으로 관광지 상세 정보 조회
    @GetMapping("/detailByName")
    public String getDetailByName(String placeName, Model model) {
        // 이름으로 관광지 상세 정보 조회
        List<Places> placesList = detailService.getPlaceDetailByName(placeName);
        if (!placesList.isEmpty()) {
            Places place = placesList.get(0);  // 첫 번째 장소만 사용
            model.addAttribute("places", place);
            model.addAttribute("images", detailService.getPlaceImages(place.getId()));  // 이미지 리스트 추가
        }
        return "detail/detail";  // 'detail.jsp' 페이지로 포워딩
    }
}
