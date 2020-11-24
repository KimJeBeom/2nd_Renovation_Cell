package com.ibk.itep.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.admin.EduRndRegModVo;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);
	
	public List<EduRegModVo> selectEduRegMod(EduRegModVo vo) {
		List<EduRegModVo> list = sqlSession.selectList("queryAdmin.selectEduRegMod", vo);
		return list;
	}
	
	public boolean deleteEduRegMod(EduRegModVo vo) {
		int count = sqlSession.delete("queryAdmin.deleteEduRegMod", vo);
		return count == 1;
	}

	public boolean insertEduRegMod(EduRegModVo vo) {
		int count = sqlSession.insert("queryAdmin.insertEduRegMod", vo);
		return count == 1;
	}
	
	public List<EduRndRegModVo> selectEduRndRegMod(EduRndRegModVo vo){
		logger.debug("selectEduRndRegMod dao 진입");
		List<EduRndRegModVo> list = sqlSession.selectList("queryAdmin.selectEduRndRegMod", vo);
		logger.debug("selectEduRndRegMod dao 종료 직전 {}", list.get(0).getEdctCntId());	
		return list;
	}
	/*
	public boolean updateAdmin(Integer userId) {
		int count = sqlSession.update("queryAdmin.updateEudRegModUseN", userId);
		return count == 1;
	}*/
	

	/*
	public List<AdminVo> selectAdmList(AdminVo vo) {
		List<AdminVo> list = sqlSession.selectList("queryLes.selectAdmList", vo);
		return list;
	}
	
	public boolean insertAdmin(AdminVo vo) {
		int count = sqlSession.insert("queryLes.insertAdmin", vo);
		return count == 1;
	}
	
	public boolean updateAdmin(AdminVo vo) {
		int count = sqlSession.delete("queryLes.updateAdmin", vo);
		return count == 1;
	}
	
	public boolean deleteAdmin(AdminVo rflbId) {
		int count = sqlSession.delete("queryLes.deleteAdmin", rflbId);
		return count == 1;	
	}*/

}
