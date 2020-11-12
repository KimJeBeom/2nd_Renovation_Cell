package com.ibk.itep.repository;

import java.util.List;
import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.cmm.ClaVo;
import com.ibk.itep.vo.cmm.CldVo;
import com.ibk.itep.vo.cmm.CliVo;
import com.ibk.itep.vo.cmm.ClsVo;

@Repository
public class CmmDao {
	@Autowired
	private SqlSession sqlSession;
	
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
}
