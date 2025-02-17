package com.app.controller.detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.detail.Places;
import com.app.dto.detail.TravelLog;
import com.app.service.detail.DetailService;
import com.app.service.file.FileService;

@Controller
public class DetailController {

    @Autowired
    DetailService detailService;
    
    @Autowired
	FileService fileService;

    //상세 페이지
    @GetMapping("/detail/{id}")
    public String getDetailById(@PathVariable("id") int id, Model model) {
    	
    	// id로 관광지 상세 정보 조회
        Places places = detailService.getPlaceDetail(id);
        model.addAttribute("places", places);
        
        // id로 관광지 이미지 목록 조회
        List<String> images = detailService.getPlaceImages(id);
        model.addAttribute("images", images);
        
        // id로 TravelLog 불러오기
        List<TravelLog> tlList = detailService.findTravelLogListById(id);
        model.addAttribute("travelLogs",tlList);
        
        return "detail/detail";
    }
    
    //saveTravelLog
    @PostMapping("/detail/{id}")
    public String getDetailByIdAction(@ModelAttribute TravelLog travelLog) {
    	
    	System.out.println("Title: " + travelLog.getTitle());
        System.out.println("Content: " + travelLog.getContent());


        int result = detailService.saveTravelLog(travelLog);
        
        return "redirect:/detail/" + travelLog.getPlaceId();
    }


   
   
}
