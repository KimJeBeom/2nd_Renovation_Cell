package com.ibk.itep.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.board.NoticeVo;
import com.ibk.itep.vo.myClass.EduNowVO;

@Repository
public class MainHomeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public SessionVo selectSessionInfo(String userId) {
		SessionVo vo = sqlSession.selectOne("queryMainHome.selectSessionInfo", userId);
		return vo;
	}
	
	public List<NoticeVo> selectHomeBdnList() {
		List<NoticeVo> list = sqlSession.selectList("queryMainHome.selectHomeBdnList");
		return list;
	}
	
	public List<EduNowVO> selectHomeEduNow(String userId) {
		List<EduNowVO> list = sqlSession.selectList("queryMainHome.selectHomeEduNow", userId);
		return list;
	}
}