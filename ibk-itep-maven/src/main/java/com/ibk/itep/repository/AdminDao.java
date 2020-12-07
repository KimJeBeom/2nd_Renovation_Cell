package com.ibk.itep.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibk.itep.vo.admin.EduEmpListExcelVo;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduEmpListVo;
import com.ibk.itep.vo.admin.EduHistoryExcelVo;
import com.ibk.itep.vo.admin.EduHistoryVo;
import com.ibk.itep.vo.admin.EduOpenReadyStatVo;
import com.ibk.itep.vo.admin.EduReadyStatVo;
import com.ibk.itep.vo.admin.EduRegModExcelVo;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.admin.EduRndRegModVo;
import com.ibk.itep.vo.admin.EmpAccMngExcelVo;
import com.ibk.itep.vo.admin.EmpAccMngVo;
import com.ibk.itep.vo.admin.NewEduInfoVo;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CmmService cmmService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);
	
	public List<EduRegModVo> selectEduRegMod(EduRegModVo vo) {
		logger.debug("DAO Start - selectEduRegMod");
		List<EduRegModVo> list = sqlSession.selectList("queryAdmin.selectEduRegMod", vo);
		logger.debug("DAO End - selectEduRegMod");

		return list;
	}
	
	public List<EduRegModExcelVo> selectEduRegModExcel(EduRegModVo vo) {
		logger.debug("DAO Start - selectEduRegModExcel");
		List<EduRegModExcelVo> list = sqlSession.selectList("queryAdmin.selectEduRegModExcel", vo);
		logger.debug("DAO End - selectEduRegModExcel");

		return list;
	}
	
	public boolean deleteEduRegMod(EduRegModVo vo) {
		logger.debug("DAO Start - deleteEduRegMod");
		cmmService.objFieldTest(vo);
		int count = sqlSession.delete("queryAdmin.deleteEduRegMod", vo);
		logger.debug("DAO End - deleteEduRegMod");
		return count == 1;
	}
	
	public boolean updateEduRegMod(EduRegModVo vo) {
		logger.debug("DAO Start - updateEduRegMod");
		cmmService.objFieldTest(vo);
		//int count =1;
		int count = sqlSession.update("queryAdmin.updateEduRegMod", vo);
		logger.debug("DAO End - updateEduRegMod : result {}", count);
		//return true;
		return count == 1;
	}
	
	public boolean insertEduRegMod(EduRegModVo vo) {
		logger.debug("DAO Start - insertEduRegMod");
		cmmService.objFieldTest(vo);
		int count = sqlSession.insert("queryAdmin.insertEduRegMod", vo);
		logger.debug("DAO End - insertEduRegMod");
		return count == 1;
	}
	
	public boolean insertEduRndRegMod(EduRndRegModVo vo) {
		logger.debug("DAO Start - insertEduRndRegMod");
		cmmService.objFieldTest(vo);
		int count = sqlSession.insert("queryAdmin.insertEduRndRegMod", vo);
		logger.debug("DAO End - insertEduRndRegMod");
		return count == 1;
	}
	public List<EduRndRegModVo> selectEduRndRegMod(EduRndRegModVo vo){
		logger.debug("DAO Start - selectEduRndRegMod");
		cmmService.objFieldTest(vo);
		List<EduRndRegModVo> list = sqlSession.selectList("queryAdmin.selectEduRndRegMod", vo);
		logger.debug("DAO End - selectEduRndRegMod");
		return list;
	}
	public boolean updateEduRndRegMod(EduRndRegModVo vo) {
		logger.debug("DAO Start - updateEduRndRegMod");
		cmmService.objFieldTest(vo);
		int count = sqlSession.update("queryAdmin.updateEduRndRegMod", vo);
		logger.debug("DAO End - updateEduRndRegMod : result {}", count);
		//return true;
		return count == 1;
	}
	public boolean deleteEduRndRegMod(EduRndRegModVo vo) {
		logger.debug("DAO Start - deleteEduRndRegMod");
		cmmService.objFieldTest(vo);
		int count = sqlSession.update("queryAdmin.deleteEduRndRegMod", vo);
		logger.debug("DAO End - deleteEduRndRegMod : result {}");
		//return true;
		return count == 1;
	}
	/************************************************************
	 *                        수강이력
	 ************************************************************/
	public List<EduHistoryVo> selectEduHistory(EduHistoryVo vo){
		logger.debug("DAO Start - selectEduHistory");
		cmmService.objFieldTest(vo);
		List<EduHistoryVo> list = sqlSession.selectList("queryAdmin.selectEduHistory", vo);
		logger.debug("DAO End - selectEduHistory");
		return list;
	}
	public boolean updateEduHistory(EduHistoryVo vo) {
		logger.debug("DAO Start - updateEduHistory");
		cmmService.objFieldTest(vo);
		int count = sqlSession.update("queryAdmin.updateEduHistory", vo);
		logger.debug("DAO Start - updateEduHistory / 결과값 : {}", count);
		return count == 1;
		
	}
	public List<EduHistoryExcelVo> selectEduHistoryExcel(EduHistoryVo vo){
		logger.debug("DAO Start - selectEduHistory");
		cmmService.objFieldTest(vo);
		List<EduHistoryExcelVo> list = sqlSession.selectList("queryAdmin.selectEduHistoryExcel", vo);
		logger.debug("DAO End - selectEduHistory");
		return list;
	}
	/************************************************************
	 *                         교육신청현황
	 ************************************************************/
	
	/* 수강신청현황 */
	public List<EduReadyStatVo> selectEduReadyStat(EduReadyStatVo vo) {
		List<EduReadyStatVo> list = sqlSession.selectList("queryAdmin.selectEduReadyStat", vo);
		return list;
	}
	
	/* 수강신청현황 > 교육신청직원목록 팝업 */
	public List<EduEmpListVo> selectEduEmpListPop(int edctCntId) {
		List<EduEmpListVo> list = sqlSession.selectList("queryAdmin.selectEduEmpListPop", edctCntId);
		return list;
	}
	
	/* 수강신청현황 > 교육신청직원목록 > 수료/미수료 처리 */
	public void updateEduEmpListPopCtcrYn(List<EduEmpListVo> list) {
		sqlSession.update("queryAdmin.updateEduEmpListPopCtcrYn", list);
	}
	
	/* 수강신청현황 > 교육신청직원목록 > 차수완료 */
	public void updateEduEmpListPopFnshY(int edctCntId) {
		sqlSession.selectList("queryAdmin.updateEduEmpListPopFnshY", edctCntId);
	}
	
	/* 엑셀 다운로드 */
	public List<EduEmpListExcelVo> selectEduEmpListExcel(int edctCntId) {
		List<EduEmpListExcelVo> list = sqlSession.selectList("queryAdmin.selectEduEmpListExcel", edctCntId);
		return list;
	}
	
	/* 과정개설신청현황 */
	public List<EduOpenReadyStatVo> selectEduOpenReadyStat(EduOpenReadyStatVo vo) {
		List<EduOpenReadyStatVo> list = sqlSession.selectList("queryAdmin.selectEduOpenReadyStat", vo);
		return list;
	}
	
	/* 과정개설신청현황 상세 팝업*/
	public NewEduInfoVo selectNewEduInfoPop(int aplcId) {
		NewEduInfoVo vo = sqlSession.selectOne("queryAdmin.selectNewEduInfoPop", aplcId);
		return vo;
	}
	
	/* 과정개설신청 확인 처리 */
	public void updateNewEduInfoPop(NewEduInfoVo vo) {
		sqlSession.update("queryAdmin.updateNewEduInfoPop", vo);
	}
	
	/************************************************************
	 *                       사용자 계정관리
	 ************************************************************/
	public List<EmpAccMngVo> selectEmpAccMng(EmpAccMngVo vo) {
		List<EmpAccMngVo> list = sqlSession.selectList("queryAdmin.selectEmpAccMng", vo);
		return list;
	}
	
	/* 엑셀 다운로드 */
	public List<EmpAccMngExcelVo> selectEmpAccMngExcel(EmpAccMngVo vo) {
		List<EmpAccMngExcelVo> list = sqlSession.selectList("queryAdmin.selectEmpAccMngExcel", vo);
		return list;
	}
	
	/* 사용자 권한변경 */
	public void updateEmpAccMng(EmpAccMngVo vo) {
		sqlSession.update("queryAdmin.updateEmpAccMng", vo);
	}

}
