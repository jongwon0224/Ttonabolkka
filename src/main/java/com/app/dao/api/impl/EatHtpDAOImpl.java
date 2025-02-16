package com.app.dao.api.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Repository;

import com.app.dao.api.EatHtpDAO;


@Repository
public class EatHtpDAOImpl implements EatHtpDAO{

    public String eatHtpDAO() {
    	
    	StringBuilder sb = new StringBuilder();
    	
        try {
            // API 호출 URL을 생성
            StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/5050000/eatHtpService/getEatHtp");
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=y%2B3b3vFxMiFKCFmlBUDDG2wLWEnAmHnq76K34oWEUyKrUs%2BRkuwO6cTEB180EFdUedxpCjUEsURMCZjPeO4Abg%3D%3D"); // 서비스 키 설정
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=1");  // 첫 번째 페이지
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=20");  // 한 페이지당 10개의 데이터

            // URL 객체 생성
            URI uri = new URI(urlBuilder.toString());
            URL url = uri.toURL();
            

            // API 요청을 위한 HttpURLConnection 설정
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");  // 응답 형식
//    		System.out.println("Response code: " + conn.getResponseCode());

            // 서버 응답 코드 확인
            int responseCode = conn.getResponseCode();
            BufferedReader rd;

            // 응답 코드가 200~300 사이면 정상 응답, 아니면 오류 응답
            if (responseCode >= 200 && responseCode <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            // 서버 응답을 StringBuilder에 저장
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();

            // 응답 결과 출력 (JSON 형태로 출력)
//            System.out.println("API Response: " + sb.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return sb.toString();
    }

	
}
