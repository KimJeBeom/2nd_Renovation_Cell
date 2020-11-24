package com.ibk.itep.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.SessionVo;
import com.ibk.itep.vo.cmm.ClaVo;
import com.ibk.itep.vo.cmm.CldVo;
import com.ibk.itep.vo.cmm.CliVo;
import com.ibk.itep.vo.cmm.ClsVo;
import com.ibk.itep.vo.cmm.CluVo;

@Repository
public class CmmDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(CmmDao.class);

	
	public List<ClaVo> selectCla(ClaVo vo) {
		List<ClaVo> list = sqlSession.selectList("queryCmm.selectCla", vo);
		return list;
	}

	public List<CldVo> selectCld(CldVo vo) {
		List<CldVo> list = sqlSession.selectList("queryCmm.selectCld", vo);
		return list;
	}
	
	public List<CliVo> selectCli(CliVo vo) {
		List<CliVo> list = sqlSession.selectList("queryCmm.selectCli", vo);
		return list;
	}
	
	public List<ClsVo> selectCls(ClsVo vo) {
		List<ClsVo> list = sqlSession.selectList("queryCmm.selectCls", vo);
		return list;
	}
	public List<CluVo> selectDpm(SessionVo ssnInfo) {
		List<CluVo> list = sqlSession.selectList("queryCmm.selectDpm", ssnInfo);
		return list;
	}
}
