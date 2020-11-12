package com.ibk.itep.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibk.itep.vo.cmm.claVo;
import com.ibk.itep.vo.cmm.cldVo;
import com.ibk.itep.vo.cmm.cliVo;
import com.ibk.itep.vo.cmm.clsVo;


public class CmmDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<claVo> selectCla(claVo vo) {
		List<claVo> list = sqlSession.selectList("queryCmm.selectCla", vo);
		return list;
	}

	public List<cldVo> selectCld(cldVo vo) {
		List<cldVo> list = sqlSession.selectList("queryCmm.selectCld", vo);
		return list;
	}
	
	public List<cliVo> selectCli(cliVo vo) {
		List<cliVo> list = sqlSession.selectList("queryCmm.selectCli", vo);
		return list;
	}
	
	public List<clsVo> selectCls(clsVo vo) {
		List<clsVo> list = sqlSession.selectList("queryCmm.selectCls", vo);
		return list;
	}
}
