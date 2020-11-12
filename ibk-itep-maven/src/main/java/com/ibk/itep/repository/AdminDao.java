package com.ibk.itep.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.admin.EduRegModVo;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<EduRegModVo> selectEduRegMod(EduRegModVo vo) {
		List<EduRegModVo> list = sqlSession.selectList("queryAdmin.selectEduRegMod", vo);
		return list;
	}
	
	public boolean updateAdmin(Integer userId) {
		int count = sqlSession.update("queryAdmin.updateEudRegModUseN", userId);
		return count == 1;
	}
	
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
