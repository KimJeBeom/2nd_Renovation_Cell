package com.ibk.itep.repository.batch;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.vo.cmm.CluVo;
import com.ibk.itep.vo.cmm.CmbVo;

@Repository
public class BatchDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	//사용자권한확인
	public String userAthrChk(CluVo vo) {
		logger.info("[DAO]userAthrChk Start");
		/* 
		 * [유저권한 확인 로직]
		 * 1)기존에 부여된권한이 있을경우 = 기존권한 부여
		 * 2)권한은 없지만 상위부서가 IT그룹일경우 = USR권한부여
		 * 3)권한도없고 IT그룹직원이 아닐경우 = 권한미부여
		 */
		String userAthr = sqlSession.selectOne("queryBatch.userAthrChk",vo);
		logger.info("[DAO]userAthrChk End");
		return userAthr;
	}
	//사용자 등록
	public int upsertUser(CluVo vo) {

		logger.info("[DAO]upsertUser Start");
		int regRst = sqlSession.insert("queryBatch.upsertUser",vo);
		logger.info("[DAO]upsertUser End");

		return regRst;
	}
	//부서 등록
	public int upsertBranch(CmbVo vo) {

		logger.info("[DAO]upsertBranch Start");
		int regRst = sqlSession.insert("queryBatch.upsertBranch",vo);
		logger.info("[DAO]upsertBranch End");

		return regRst;
	}
	

}
