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
import com.ibk.itep.vo.admin.EduRegModExcelVo;
import com.ibk.itep.vo.admin.EduRegModVo;
import com.ibk.itep.vo.admin.EmpAccMngExcelVo;
import com.ibk.itep.vo.admin.EmpAccMngVo;

@Service
public class EduRegModService {
	
	private static final Logger logger = LoggerFactory.getLogger(EduRegModService.class);
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private CmmService cmmService;

	@Autowired
	private ExcelUtil excelUtil;
	
	public List<EduRegModVo> selectEduRegMod(EduRegModVo vo){
		logger.debug("서비스 Start - selectEduRegMod");
		if(vo.getEdctClsfCd() != null) {//부서분류CD가 ALL인 경우 null로 변환후 검색
			if(vo.getEdctClsfCd().equalsIgnoreCase("ALL")) {
				vo.setEdctClsfCd(null);
			}
		}
		cmmService.objFieldTest(vo);
		List<EduRegModVo> ermVoList = adminDao.selectEduRegMod(vo); 
		logger.debug("서비스 End - selectEduRegMod");
		return ermVoList;
	}
	
	public EduRegModVo selectEduRegModDetail(EduRegModVo vo){
		logger.debug("서비스 Start - selectEduRegModDetail");
		cmmService.objFieldTest(vo);
		List<EduRegModVo> ermVoList = adminDao.selectEduRegMod(vo);
		vo = ermVoList.get(0);
		vo.setEdctCon(vo.getEdctCon().replace("\n", "\\n"));
		cmmService.objFieldTest(vo);
		logger.debug("서비스 End - selectEduRegModDetail");
		return vo;
	}
	
	public boolean deleteEduRegMod(EduRegModVo vo) {
		if(vo.getEdctId() != null) {
			return adminDao.deleteEduRegMod(vo);
		}
		return false;		
	}
	
	public boolean insertEduRegMod(EduRegModVo vo) {
			return adminDao.insertEduRegMod(vo);
	}
	
	public boolean updateEduRegMod(EduRegModVo vo) {
		logger.debug("서비스 Start : updateEduRegMod");
		cmmService.objFieldTest(vo);
		boolean result = adminDao.updateEduRegMod(vo);
		logger.debug("서비스 End : updateEduRegMod 결과 : {}", result);
		return result;		
	}
	
	/* 엑셀 다운로드 */
	public void EduRegModExcelDown(HttpServletRequest req, HttpServletResponse res){	
		
        String edctClsfCd = req.getParameter("edctClsfCd");
        String edctNm = req.getParameter("edctNm");
        
		// 입력받은값 Vo에 담기
		EduRegModVo srchVo = new EduRegModVo();
		if(!edctClsfCd.equals("ALL")) 
			srchVo.setEdctClsfCd(edctClsfCd);
		srchVo.setEdctNm(edctNm);
		
		// DB 결과 조회
		List<EduRegModExcelVo> list = adminDao.selectEduRegModExcel(srchVo);
		
		// 엑셀관련 데이터 셋팅
		req.setAttribute("sheetName", "교육정보");
		req.setAttribute("excelName", "ITEP_교육정보");
		String[] colName = {"교육ID","교육분류","교육명","교육내용","교육기관명","결재대상여부","행내교육여부","고용보험적용여부","온라인여부","교육수준"};
		req.setAttribute("colName", colName);
		req.setAttribute("list", list);
		
		// 엑셀 다운로드 실행
		excelUtil.excelDownload(req, res);
	}
}

