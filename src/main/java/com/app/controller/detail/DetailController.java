package com.app.controller.detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.app.dto.detail.TravelLog;
import com.app.dto.subMain.Places;
import com.app.dto.detail.TravelLogImg;
import com.app.dto.detail.TravelLogRequestForm;
import com.app.dto.file.FileInfo;
import com.app.service.detail.DetailService;
import com.app.service.file.FileService;
import com.app.util.FileManager;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class DetailController {

    @Autowired
    DetailService detailService;
    
    @Autowired
	FileService fileService;

    //상세 페이지
    @GetMapping("/main/subMain/detail/{id}")
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

        
        // TravelLog 불러오기
        List<TravelLog> tlList = detailService.findTravelLogListById(id);

        // 각 TravelLog의 파일 정보 조회
        for (TravelLog travelLog : tlList) {
            if (travelLog.getFileName() != null && !travelLog.getFileName().isEmpty()) {
                FileInfo fileInfo = fileService.findFileInfoByFileName(travelLog.getFileName());
                if (fileInfo != null) {
                    travelLog.setFileName("/fileStorage/" + fileInfo.getFileName());
                    System.out.println("이미지 URL: " + travelLog.getFileName()); // 디버깅용 출력
                }
            }
        }

        model.addAttribute("travelLogs", tlList);
        
        return "detail/detail";
    }
    
    //saveTravelLog findFileInfo
    @PostMapping("/main/subMain/detail/{id}")
    public String saveTravelLog(
            @PathVariable("id") int placeId,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam(value = "image", required = false) MultipartFile file) {

        try {
            TravelLog travelLog = new TravelLog();
            travelLog.setPlaceId(placeId);
            travelLog.setUserId(1); // 로그인 기능 추가 전, 임시 userId
            travelLog.setTitle(title);
            travelLog.setContent(content);

            // 파일이 존재하면 저장
            if (file != null && !file.isEmpty()) {
                FileInfo fileInfo = FileManager.storeFile(file);
                fileService.saveFileInfo(fileInfo);
                travelLog.setFileName(fileInfo.getFileName());
            }

            // DB에 저장
            detailService.saveTravelLog(travelLog);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/main/subMain/detail/" + placeId + "?error";
        }

        return "redirect:/main/subMain/detail/" + placeId;
    }



};
