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
    DetailService detailService;

    // id로 관광지 상세 정보 조회
    @GetMapping("/detail/{id}")
    public String getDetailById(@PathVariable("id") int id, Model model) {
    	
        Places places = detailService.getPlaceDetail(id);
        model.addAttribute("places", places);
        
        List<String> images = detailService.getPlaceImages(id);
        model.addAttribute("images", images);
        
        return "detail/detail";
    }
   
   
}
