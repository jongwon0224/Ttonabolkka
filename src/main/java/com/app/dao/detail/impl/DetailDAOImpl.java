package com.app.dao.detail.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.detail.DetailDAO;
import com.app.dto.detail.Places;
import com.app.dto.detail.TravelLog;

@Repository
public class DetailDAOImpl implements DetailDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

    // id로 관광지 상세 정보 조회
    @Override
    public Places getPlaceDetail(int id) {
        // 여러 개의 정보가 아닌 하나의 상세 정보를 조회할 때는 selectOne을 사용
    	Places places = sqlSessionTemplate.selectOne("detail_mapper.getPlaceDetail", id);
        return places;
    }

    // 관광지 이미지 목록 조회
    @Override
    public List<String> getPlaceImages(int id) {
    	
    	List<String> imgList = sqlSessionTemplate.selectList("detail_mapper.getPlaceImages", id);
    	
        return imgList;
    }
    
    // id로 TravelLog 불러오기
    @Override
    public List<TravelLog> findTravelLogListById(int placeId){
    	
    	List<TravelLog> tlList = sqlSessionTemplate.selectList("detail_mapper.findTravelLogListById", placeId);
    	
		return tlList;
	}
    
    //saveTravelLog 
	@Override
	public int saveTravelLog(TravelLog travelLog) {
		int result = sqlSessionTemplate.insert("detail_mapper.saveTravelLog", travelLog);
		return result;
	}
}
