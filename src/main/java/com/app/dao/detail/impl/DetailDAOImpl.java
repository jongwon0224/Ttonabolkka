package com.app.dao.detail.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.detail.DetailDAO;
import com.app.dto.detail.Places;

@Repository
public class DetailDAOImpl implements DetailDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

    // id로 관광지 상세 정보 조회
    @Override
    public Places getPlaceDetail(int id) {
        // 여러 개의 정보가 아닌 하나의 상세 정보를 조회할 때는 selectOne을 사용
        return sqlSessionTemplate.selectOne("detail_mapper.getPlaceDetail", id);
    }

    // placeName으로 관광지 상세 정보 조회
    @Override
    public List<Places> getPlaceDetailByName(String placeName) {
        // 여러 개의 정보가 아닌 하나의 상세 정보를 조회할 때는 selectOne을 사용
        return sqlSessionTemplate.selectOne("detail_mapper.getPlaceDetailByName", placeName);
    }

    // 관광지 이미지 목록 조회
    @Override
    public List<String> getPlaceImages(int id) {
        return sqlSessionTemplate.selectList("detail_mapper.getPlaceImages", id);
    }
}
