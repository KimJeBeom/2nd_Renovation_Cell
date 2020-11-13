package com.ibk.itep.repository;


import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.myClass.EduNewReadyVO;
import com.ibk.itep.vo.myClass.EduNowVO;
import com.ibk.itep.vo.myClass.EduReadyVO;

@Repository
public class MyClassDao {
	@Autowired
	private SqlSession sqlSession;

	public List<EduNowVO> selectEduNow(String userId) {
		List<EduNowVO> list = sqlSession.selectList("queryMyClass.selectEduNow",userId);
		return list;
	}
	
	public List<EduNewReadyVO> selectNewEduReady(String userId) {
		List<EduNewReadyVO> list = sqlSession.selectList("queryMyClass.selectNewEduReady",userId);
		return list;
	}
	
	public List<EduReadyVO> selectEduReady(String userId) {
		List<EduReadyVO> list1 = sqlSession.selectList("queryMyClass.selectEduReady",userId);
		return list1;
	}
}