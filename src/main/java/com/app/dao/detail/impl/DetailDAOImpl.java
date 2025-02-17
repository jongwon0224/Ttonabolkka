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
        return sqlSessionTemplate.selectOne("detail_mapper.getPlaceDetail", id);
    }

    // 관광지 대표 이미지 조회 (no = 2)
    @Override
    public String getMainImageUrl(int id) {
        return sqlSessionTemplate.selectOne("detail_mapper.getMainImageUrl", id);
    }

    // 관광지 서브 이미지 목록 조회 (no >= 3)
    @Override
    public List<String> getSubImageUrls(int id) {
        return sqlSessionTemplate.selectList("detail_mapper.getSubImageUrls", id);
    }
}
