package com.ibk.itep.service.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.service.cmm.CmmService;
import com.ibk.itep.vo.admin.EduRegModVo;

@Service
public class EduRegModService {
	
	private static final Logger logger = LoggerFactory.getLogger(EduRegModService.class);
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private CmmService cmmService;
	
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
	

}

