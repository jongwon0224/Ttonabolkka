package com.app.service.detail.impl;

import com.app.dao.detail.DetailDAO;
import com.app.dto.detail.Places;
import com.app.dto.detail.TravelLog;
import com.app.dto.detail.TravelLogImg;
import com.app.service.detail.DetailService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailServiceImpl implements DetailService {

    @Autowired
    DetailDAO detailDAO;

    @Override
    public Places getPlaceDetail(int id) {
        return detailDAO.getPlaceDetail(id);
    }

    @Override
    public String getMainImageUrl(int id) {
        return detailDAO.getMainImageUrl(id);
    }

    @Override
    public List<String> getSubImageUrls(int id) {
        return detailDAO.getSubImageUrls(id);
    }
    
    // id로 TravelLog 불러오기
    @Override
	public List<TravelLog> findTravelLogListById(int placeId) {
    	List<TravelLog> tlList =  detailDAO.findTravelLogListById(placeId);
		return tlList;
	}
    
    //saveTravelLog 
	@Override
	public int saveTravelLog(TravelLog travelLog) {
		
		int result = detailDAO.saveTravelLog(travelLog);
		
		return result;
	}
	
	// TravelLogImg 저장
	@Override
	public int saveTravelLogImg(TravelLogImg travelLogImg) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// id로 TravelLogImg 불러오기
	@Override
	public TravelLogImg findTravelLogImgById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
