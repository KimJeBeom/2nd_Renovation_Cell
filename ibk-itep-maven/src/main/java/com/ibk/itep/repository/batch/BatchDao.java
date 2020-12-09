package com.ibk.itep.repository.batch;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibk.itep.repository.board.NoticeDao;
import com.ibk.itep.vo.cmm.CluVo;
import com.ibk.itep.vo.cmm.CmbVo;

public class BatchDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	//사용자 등록
	public int upsertUser(CluVo vo) {

		logger.info("[DAO]upsertUser Start");
		int regRst = sqlSession.insert("querybatch.upsertUser",vo);
		logger.info("[DAO]upsertUser End");

		return regRst;
	}
	//기존사용자목록 조회
	public int upsertBranch(CmbVo vo) {

		logger.info("[DAO]upsertBranch Start");
		int regRst = sqlSession.insert("querybatch.upsertBranch",vo);
		logger.info("[DAO]upsertBranch End");

		return regRst;
	}

}
