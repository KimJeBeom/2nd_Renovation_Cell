package com.ibk.itep.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.common.excel.ExcelUtil;
import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduHistoryExcelVo;
import com.ibk.itep.vo.admin.EduHistoryVo;
import com.ibk.itep.vo.admin.EmpAccMngExcelVo;
import com.ibk.itep.vo.admin.EmpAccMngVo;

@Service
public class EduHistoryService {
	private static final Logger logger = LoggerFactory.getLogger(EduHistoryService.class);
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private CmmService cmmService;
	@Autowired
	private ExcelUtil excelUtil;

	public List<EduHistoryVo> selectEduHistory(EduHistoryVo vo){
		logger.debug("서비스 Start - selectEduHistory");
		if(vo.getEdctClsfCd() != null) {//부서분류CD가 ALL인 경우 null로 변환후 검색
			if(vo.getEdctClsfCd().equalsIgnoreCase("ALL")) {
				vo.setEdctClsfCd(null);
			}
		}
		if(vo.getBrnm() != null) {
			if(vo.getBrnm().trim().isEmpty()) {
				vo.setBrnm(null);
			}
		}
		if(vo.getUserNm() != null) {
			if(vo.getUserNm().trim().isEmpty()) {
				vo.setUserNm(null);
			}			
		}
		if(vo.getEdctSttgYmd() != null) {
			if(vo.getEdctSttgYmd().trim().isEmpty()) {
				vo.setEdctSttgYmd(null);
			}
		}
		if(vo.getEdctFnshYmd() != null) {
			if(vo.getEdctFnshYmd().trim().isEmpty()) {
				vo.setEdctFnshYmd(null);
			}
		}
		cmmService.objFieldTest(vo);
		List<EduHistoryVo> eduHistoryVoList = adminDao.selectEduHistory(vo);
		cmmService.objFieldTest(vo);
		
		for(EduHistoryVo resVo : eduHistoryVoList) {
			// 참고 null일 경우 빈칸표시
			if(resVo.getRfrcCon() == null)
				resVo.setRfrcCon("");
			// 예산 천단위 , 표시
			resVo.setEdex(String.format("%,d", Integer.parseInt(resVo.getEdex().replace(",", ""))));
		}
		logger.debug("서비스 End - selectEduHistory");
		return eduHistoryVoList;
	}
	
	public boolean updateEduHistory(EduHistoryVo vo){
		logger.debug("서비스 Start - updateEduHistory");
		cmmService.objFieldTest(vo);
		boolean result = adminDao.updateEduHistory(vo);
		logger.debug("서비스 End - updateEduHistory / result : {}", result);
		return true;
	}
	
	/* 엑셀 다운로드 */
	public void EduHistoryExcelDown(HttpServletRequest req, HttpServletResponse res){	
				
        String edctSttgYmd = req.getParameter("eEdctSttgYmd");
        String edctFnshYmd = req.getParameter("eEdctFnshYmd");
        String edctClsfCd = req.getParameter("eEdctClsfCd");
        String brnm = req.getParameter("eBrnm");
        String userNm = req.getParameter("eUserNm");
        
        EduHistoryVo srchVo = new EduHistoryVo();
		if(!edctClsfCd.equals("ALL")) {//부서분류CD가 ALL인 경우 null로 변환후 검색
			srchVo.setEdctClsfCd(edctClsfCd);
		}
		if(brnm != null && !brnm.equals("")) {
			srchVo.setBrnm(brnm);
		}
		if(userNm != null && !userNm.equals("")) {
			srchVo.setUserNm(userNm);		
		}
		if(edctSttgYmd != null && !edctSttgYmd.equals("")) {
			srchVo.setEdctSttgYmd(edctSttgYmd);
		}
		if(edctFnshYmd != null && !edctFnshYmd.equals("")) {
			srchVo.setEdctFnshYmd(edctFnshYmd);
		}
		
		// DB 결과 조회
		List<EduHistoryExcelVo> list = adminDao.selectEduHistoryExcel(srchVo);
		for(EduHistoryExcelVo resVo : list) {
			// 참고 null일 경우 빈칸표시
			if(resVo.getRfrcCon() == null)
				resVo.setRfrcCon("");
			
			// 예산 천단위 , 표시
			resVo.setEdex(String.format("%,d", Integer.parseInt(resVo.getEdex().replace(",", ""))));
		}
		
		// 엑셀관련 데이터 셋팅
		req.setAttribute("sheetName", "수강 이력");
		req.setAttribute("excelName", "ITEP_수강이력");
		String[] colName = {"이력ID","교육분류","부서명","직원명","직원번호","교육ID","교육명","교육기관","교육시작일자","교육종료일자","예산","참고"};
		req.setAttribute("colName", colName);
		req.setAttribute("list", list);
		
		// 엑셀 다운로드 실행
		excelUtil.excelDownload(req, res);
	}
}
