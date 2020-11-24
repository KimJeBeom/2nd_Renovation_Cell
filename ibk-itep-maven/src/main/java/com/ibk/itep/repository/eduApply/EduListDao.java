package com.ibk.itep.repository.eduApply;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.eduApply.EduListVo;

@Repository
public class EduListDao {
	@Autowired
	private SqlSession sqlSession;
	
	//query : queryEduApply.xml
	private static final Logger logger = LoggerFactory.getLogger(EduListDao.class);
	
	//교육목록 조회를 위한 DAO(selectEduList)
	public List<EduListVo> selectEduList(HashMap<?, ?> map) {

		logger.info("[DAO]selectEduList Start");
		List<EduListVo> list = sqlSession.selectList("queryEduApply.selectEduList",map);
		logger.info("[DAO]selectEduList End");

		return list;
	}
	
	//교육상세정보 조회를 위한 DAO(selectEduDetail)
	public EduListVo selectEduDetail(EduListVo vo) {
		
		logger.info("[DAO]selectEduDetail Start");
		EduListVo outVo = sqlSession.selectOne("queryEduApply.selectEduDetail",vo);
		logger.info("[DAO]selectEduDetail End");
		
		return outVo;
	}

	//교육차수목록 조회를 위한 DAO(selectInfoCntPop)
	public List<EduListVo> selectInfoCntPop(EduListVo vo) {

		logger.info("[DAO]selectInfoCntPop Start");
		List<EduListVo> list = sqlSession.selectList("queryEduApply.selectInfoCntPop",vo);
		logger.info("[DAO]selectInfoCntPop End");

		return list;
	}

	//결재대상 교육신청 등록을 위한 DAO(insertEduApplyPopApr)
	public boolean insertEduApplyPopApr(EduListVo vo) {
		
		logger.info("[DAO]insertEduApplyPopApr Start");
		System.out.println("%%%getUserId =" + vo.getUserId());
		int modRst = sqlSession.insert("queryEduApply.insertEduApplyPopApr", vo);
		logger.info("[DAO]insertEduApplyPopApr End");
		
		return modRst == 1;
	}
	
	//비결재 대상 교욱신청 등록을 위한 DAO(insertEduApplyPopNon)
	public boolean insertEduApplyPopNon(EduListVo vo) {
		
		logger.info("[DAO]insertEduApplyPopNon Start");
		System.out.println("%%%getUserId =" + vo.getUserId());
		int modRst = sqlSession.insert("queryEduApply.insertEduApplyPopNon", vo);
		logger.info("[DAO]insertEduApplyPopNon End");
		
		return modRst == 1;
	}
	
	//신청정보의 신청가능여부 확인을 위한 DAO(selectEduApprAbleYn)
	public String selectEduApprAbleYn(EduListVo vo) {
		
		logger.info("[DAO]selectEduApprAbleYn Start");
		System.out.println("%%%getUserId =" + vo.getUserId());
		String modCode =  sqlSession.selectOne("queryEduApply.selectEduApprAbleYn", vo);
		logger.info("[DAO] --- modCode : "+ modCode);
		logger.info("[DAO]selectEduApprAbleYn End");
		
		return modCode;
	}
	

	
}
