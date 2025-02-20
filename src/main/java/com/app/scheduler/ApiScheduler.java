package com.app.scheduler;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.app.dao.api.EatHtpDAO;
import com.app.service.api.EatHtpService;

//@EnableAsync
//@EnableScheduling
public class ApiScheduler {

	
	@Autowired
	EatHtpService eatHtpService;
	
	@Autowired
	EatHtpDAO eatHtpDAO;
	
	@Scheduled(cron = "0/5 * * * * *")
	public void saveEatHtpSchedule() {
		
		System.out.println("스케줄러 실행중");
		try {
			eatHtpDAO.eatHtpDAO();
			eatHtpService.saveEatHtpPlaces();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 비동기 방식은 따로 파일 만들어야되는듯
//	@Async
//	public void asyncMethod() {
//		System.out.println("비동기 실행시작");
//		
//		try {
//			
//			eatHtpDAO.eatHtpDAO();
//			eatHtpService.saveEatHtpPlaces();
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//	}
}
