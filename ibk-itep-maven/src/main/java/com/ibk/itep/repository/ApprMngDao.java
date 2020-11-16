package com.ibk.itep.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.apprMng.ApprConfRejVo;
import com.ibk.itep.vo.apprMng.ApprListDetailVo;
import com.ibk.itep.vo.apprMng.ApprListVo;
import com.ibk.itep.vo.apprMng.ApprStatSrchVo;
import com.ibk.itep.vo.apprMng.ApprStatVo;

@Repository
public class ApprMngDao {
	
	private static final Logger logger = LoggerFactory.getLogger(ApprMngDao.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ApprListVo> selectApprList(SessionVo ssnVo) {
		List<ApprListVo> list = sqlSession.selectList("queryApprMng.selectApprList", ssnVo);
		return list;
	}
	
	public ApprListDetailVo selectApprListDetail(int edctAplcId) {
		ApprListDetailVo vo = sqlSession.selectOne("queryApprMng.selectApprListDetail", edctAplcId);
		return vo;
	}
	
	public String selectAplcStgCd(int edctAplcId) {
		String aplcStgCd = sqlSession.selectOne("queryApprMng.selectAplcStgCd", edctAplcId);
		return aplcStgCd;
	}
	
	public void updateApprConf(ApprConfRejVo apprConfRejVo) {
		sqlSession.update("queryApprMng.updateApprConf", apprConfRejVo);
	}
	
	public void updateApprRej(ApprConfRejVo apprConfRejVo) {
		sqlSession.update("queryApprMng.updateApprRej", apprConfRejVo);
	}
	
	public List<ApprStatVo> selectApprStat(ApprStatSrchVo apprStatSrchVo) {
		List<ApprStatVo> list = sqlSession.selectList("queryApprMng.selectApprStat", apprStatSrchVo);
		return list;
	}
}