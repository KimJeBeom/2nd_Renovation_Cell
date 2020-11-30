package com.ibk.itep.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.HomeNoticeVo;
import com.ibk.itep.vo.HomeEduNowVO;

@Repository
public class MainHomeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public SessionVo selectSessionInfo(String userId) {
		SessionVo vo = sqlSession.selectOne("queryMainHome.selectSessionInfo", userId);
		return vo;
	}
	
	public List<HomeNoticeVo> selectHomeBdnList() {
		List<HomeNoticeVo> list = sqlSession.selectList("queryMainHome.selectHomeBdnList");
		return list;
	}
	
	public List<HomeEduNowVO> selectHomeEduNow(String userId) {
		List<HomeEduNowVO> list = sqlSession.selectList("queryMainHome.selectHomeEduNow", userId);
		return list;
	}
}