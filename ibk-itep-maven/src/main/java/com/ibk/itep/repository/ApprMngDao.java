package com.ibk.itep.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.apprMng.ApprListDetailVo;
import com.ibk.itep.vo.apprMng.ApprListVo;

@Repository
public class ApprMngDao {
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
	
	/*public void updateApprConfirm(List<Integer> edctAplcId, SessionVo ssnVo) {
		//sqlSession.update("queryApprMng.updateApprConfirm", edctAplcId, ssnVo);
	}*/
}