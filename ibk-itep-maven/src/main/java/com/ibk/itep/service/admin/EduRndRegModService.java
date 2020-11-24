package com.ibk.itep.service.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.AdminDao;
import com.ibk.itep.vo.admin.EduRndRegModVo;

@Service
public class EduRndRegModService {
	
	@Autowired
	private AdminDao adminDao;
	
	private static final Logger logger = LoggerFactory.getLogger(EduRndRegModService.class);
	
	public List<EduRndRegModVo> selectEduRndRegMod(EduRndRegModVo vo){
		logger.debug("selectEduRndRegMod Service 진입 edct id : {} / edct Cnt Id : {}", vo.getEdctId(), vo.getEdctCntId());
		
		if(vo.getEdctId() != null || vo.getEdctCntId() != null) {
			logger.debug("selectEduRndRegMod Service 리턴1직전");
			return adminDao.selectEduRndRegMod(vo);
		}else {
			return null;
		}
	}
	/*
public List<EduRegModVo> selectEduRegMod(EduRegModVo vo){
		
		if(vo.getEdctClsfCd().equalsIgnoreCase("ALL"))
		{
			vo.setEdctClsfCd(null);
		}
		return adminDao.selectEduRegMod(vo);
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
*/
}
