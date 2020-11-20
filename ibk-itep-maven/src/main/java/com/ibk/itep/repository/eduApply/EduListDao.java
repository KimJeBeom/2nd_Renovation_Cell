package com.ibk.itep.repository.eduApply;

import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.board.NoticeVo;
import com.ibk.itep.vo.eduApply.EduListVo;


@Repository
public class EduListDao {
	@Autowired
	private SqlSession sqlSession;
	
	//query : queryBoard.xml
	private static final Logger logger = LoggerFactory.getLogger(EduListDao.class);
	
	//공지사항 목록 조회를 위한 DAO(query:selectNotice)
	public List<EduListVo> selectEduList(HashMap map) {

		logger.info("[DAO]selectEduList Start");
		List<EduListVo> list = sqlSession.selectList("queryLes.selectEduList",map);
		logger.info("[DAO]selectEduList End");

		return list;
	}
	
	public EduListVo selectEduDetail(EduListVo vo) {
		
		logger.info("[DAO]selectEduDetail Start");
		EduListVo outVo = sqlSession.selectOne("queryLes.selectEduDetail",vo);
		logger.info("[DAO]selectEduDetail End");
		
		return outVo;
	}

	public List<EduListVo> selectInfoCntPop(EduListVo vo) {

		logger.info("[DAO]selectInfoCntPop Start");
		List<EduListVo> list = sqlSession.selectList("queryLes.selectInfoCntPop",vo);
		logger.info("[DAO]selectInfoCntPop End");

		return list;
	}
		
	public boolean insertEduApplyPopApr(EduListVo vo) {
		
		logger.info("[DAO]insertEduApplyPopApr Start");
		System.out.println("%%%getUserId =" + vo.getUserId());
		int modRst = sqlSession.insert("queryLes.insertEduApplyPopApr", vo);
		logger.info("[DAO]insertEduApplyPopApr End");
		
		return modRst == 1;
	}
	
	public boolean insertEduApplyPopNon(EduListVo vo) {
		
		logger.info("[DAO]insertEduApplyPopNon Start");
		System.out.println("%%%getUserId =" + vo.getUserId());
		int modRst = sqlSession.insert("queryLes.insertEduApplyPopNon", vo);
		logger.info("[DAO]insertEduApplyPopNon End");
		
		return modRst == 1;
	}
	
	public String selectEduApprAbleYn(EduListVo vo) {
		
		logger.info("[DAO]selectEduApprAbleYn Start");
		System.out.println("%%%getUserId =" + vo.getUserId());
		String modCode =  sqlSession.selectOne("queryLes.selectEduApprAbleYn", vo);
		logger.info("[DAO] --- modCode : "+ modCode);
		logger.info("[DAO]selectEduApprAbleYn End");
		
		return modCode;
	}
	

	
}
