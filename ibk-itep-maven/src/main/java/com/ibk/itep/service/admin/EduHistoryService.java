package com.ibk.itep.service.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduHistoryVo;

@Service
public class EduHistoryService {
	private static final Logger logger = LoggerFactory.getLogger(EduHistoryService.class);
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private CmmService cmmService;

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
}
