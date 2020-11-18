package com.ibk.itep.repository;


import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.myClass.EduCompleteVO;
import com.ibk.itep.vo.myClass.EduInfoPopVO;
import com.ibk.itep.vo.myClass.EduMyHistoryVO;
import com.ibk.itep.vo.myClass.EduNewReadyVO;
import com.ibk.itep.vo.myClass.EduNowVO;
import com.ibk.itep.vo.myClass.EduReadyVO;
import com.ibk.itep.vo.myClass.NewEduInfoPopVO;

@Repository
public class MyClassDao {
	@Autowired
	private SqlSession sqlSession;

	public List<EduNowVO> selectEduNow(SessionVo ssnVo) {
		List<EduNowVO> list = sqlSession.selectList("queryMyClass.selectEduNow",ssnVo);
		return list;
	}
	
	public List<EduNewReadyVO> selectNewEduReady(SessionVo ssnVo) {
		List<EduNewReadyVO> list = sqlSession.selectList("queryMyClass.selectNewEduReady",ssnVo);
		return list;
	}
	
	public List<EduReadyVO> selectEduReady(SessionVo ssnVo){
		List<EduReadyVO> list = sqlSession.selectList("queryMyClass.selectEduReady",ssnVo);
		return list;
	}
	
	public List<EduCompleteVO> selectEduComplete(SessionVo ssnVo){
		List<EduCompleteVO> list = sqlSession.selectList("queryMyClass.selectEduComplete",ssnVo);
		return list;
	}
	
	public List<EduMyHistoryVO> selectEduMyHistory(SessionVo ssnVo){
		List<EduMyHistoryVO> list = sqlSession.selectList("queryMyClass.selectEduMyHistory",ssnVo);
		return list;
	}
	
	public EduInfoPopVO selectEduInfoPop(int edctAplcId){
		EduInfoPopVO vo = sqlSession.selectOne("queryMyClass.selectEduInfoPop",edctAplcId);
		return vo;
	}
	
	public NewEduInfoPopVO selectNewEduInfoPop(int aplcId){
		NewEduInfoPopVO vo = sqlSession.selectOne("queryMyClass.selectNewEduInfoPop",aplcId);
		return vo;
	}
	
	public void updateEduReady(int edctAplcId){
		sqlSession.update("queryMyClass.updateEduReady",edctAplcId);
	}
	
	public void updateEduInfoPop(int edctAplcId){
		sqlSession.selectOne("queryMyClass.updateEduInfoPop",edctAplcId);
	}
}