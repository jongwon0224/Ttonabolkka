package com.app.controller.detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.app.dto.detail.Places;
import com.app.service.detail.DetailService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class DetailController {

    @Autowired
    DetailService detailService;

    // id로 관광지 상세 정보 조회
    @GetMapping("/detail/{id}")
    public String getDetailById(@PathVariable("id") int id, Model model) throws Exception {
        Places places = detailService.getPlaceDetail(id);
        model.addAttribute("places", places);

        String mainImageUrl = detailService.getMainImageUrl(id);
        model.addAttribute("mainImageUrl", mainImageUrl);

        List<String> subImageUrls = detailService.getSubImageUrls(id);
        model.addAttribute("subImageUrls", subImageUrls);

        // List<String>을 JSON 문자열로 변환하여 subImageUrlsJson 속성으로 추가
        ObjectMapper mapper = new ObjectMapper();
        String subImageUrlsJson = mapper.writeValueAsString(subImageUrls);
        model.addAttribute("subImageUrlsJson", subImageUrlsJson);

        return "detail/detail";
    }
}
