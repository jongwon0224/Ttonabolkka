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

import com.app.dto.detail.Places;
import com.app.dto.detail.TravelLog;
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

        
        // id로 TravelLog 불러오기
        List<TravelLog> tlList = detailService.findTravelLogListById(id);
        model.addAttribute("travelLogs",tlList);
        
        TravelLogImg tli = null;
        
        for (TravelLog travelLog : tlList) {
            int tlId = travelLog.getId(); 
            tli = detailService.findTravelLogImgById(tlId);
        }
        
        if(tli != null) {
			FileInfo fileInfo = fileService.findFileInfoByFileName(tli.getFileName());
			model.addAttribute("fileInfo", fileInfo);
		}
        
        return "detail/detail";
    }
    
    //saveTravelLog findFileInfo
    @PostMapping("/detail/{id}")
    public String getDetailByIdAction(@ModelAttribute TravelLog travelLog, 
    		@ModelAttribute TravelLogRequestForm travelLogRequestForm) {
    	
    	System.out.println("Title: " + travelLog.getTitle());
        System.out.println("Content: " + travelLog.getContent());


        int result = detailService.saveTravelLog(travelLog);
        
        MultipartFile file = travelLogRequestForm.getTravelLogImg();
        
        if (file != null && !file.isEmpty()) {
            try {
                FileInfo fileInfo = FileManager.storeFile(file);
                int result1 = fileService.saveFileInfo(fileInfo);

                if (result1 > 0) {
                    TravelLogImg tli = new TravelLogImg();
                    tli.setId(travelLogRequestForm.getId()); // travelLog id
                    tli.setFileName(fileInfo.getFileName()); // 파일 name

                    int result2 = detailService.saveTravelLogImg(tli);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("파일이 업로드되지 않았습니다.");
        }
        
        return "redirect:/detail/" + travelLog.getPlaceId();
    }


   
   
}
