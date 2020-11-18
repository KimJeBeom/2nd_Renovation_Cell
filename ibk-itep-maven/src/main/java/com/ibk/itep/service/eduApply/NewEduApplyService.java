package com.ibk.itep.service.eduApply;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibk.itep.repository.eduApply.NewEduApplyDao;
import com.ibk.itep.vo.eduApply.NewEduApplyVo;

@Service
public class NewEduApplyService {
	
	@Autowired private NewEduApplyDao newEduApplyDAO;
	private static final Logger logger = LoggerFactory.getLogger(NewEduApplyService.class);
	
	public boolean addNewEdu(NewEduApplyVo vo){
		
		logger.info("addNewEdu Start");
		//addNewEdu에 따른 DAO제어
		vo.setUserId("40868");
		boolean addYn = newEduApplyDAO.InsertNewEdu(vo);
		
		logger.info("addNewEdu End");

		return addYn;
	}

}
