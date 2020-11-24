package com.ibk.itep.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.admin.EduEmpListVo;
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
import com.ibk.itep.vo.admin.EduReadyStatVo;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.admin.EduRndRegModVo;
import com.ibk.itep.vo.admin.EmpAccMngVo;

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
	
	/************************************************************
	 *                         교육신청현황
	 ************************************************************/
	
	/* 수강신청현황 */
	public List<EduReadyStatVo> selectEduReadyStat(EduReadyStatVo vo) {
		List<EduReadyStatVo> list = sqlSession.selectList("queryAdmin.selectEduReadyStat", vo);
		return list;
	}
	
	/* 수강신청현황 > 교육신청직원목록 팝업 */
	public List<EduEmpListVo> selectEduEmpListPop(String edctCntId) {
		List<EduEmpListVo> list = sqlSession.selectList("queryAdmin.selectEduEmpListPop", edctCntId);
		return list;
	}
	
	/* 과정개설신청현황 */
	public List<EduOpenReadyStatVo> selectEduOpenReadyStat(EduOpenReadyStatVo vo) {
		List<EduOpenReadyStatVo> list = sqlSession.selectList("queryAdmin.selectEduOpenReadyStat", vo);
		return list;
	}
	
	/* 과정개설신청현황 상세 팝업*/
	public EduOpenReadyStatVo selectNewEduInfoPop(int aplcId) {
		EduOpenReadyStatVo vo = sqlSession.selectOne("queryAdmin.selectNewEduInfoPop", aplcId);
		return vo;
	}
	
	/* 과정개설신청 확인 처리 */
	public void updateNewEduInfoPop(EduOpenReadyStatVo vo) {
		sqlSession.update("queryAdmin.updateNewEduInfoPop", vo);
	}
	
	/************************************************************
	 *                       사용자 계정관리
	 ************************************************************/
	public List<EmpAccMngVo> selectEmpAccMng(EmpAccMngVo vo) {
		List<EmpAccMngVo> list = sqlSession.selectList("queryAdmin.selectEmpAccMng", vo);
		return list;
	}
	
	/* 사용자 권한변경 */
	public void updateEmpAccMng(EmpAccMngVo vo) {
		sqlSession.update("queryAdmin.updateEmpAccMng", vo);
	}

}
